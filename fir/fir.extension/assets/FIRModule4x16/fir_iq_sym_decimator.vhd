----------------------------------------------------------------------------------------------------------------------------------
-- Author : Vitaly Lotnik
-- Name : fir_iq_sym_decimator
-- Created : 09/07/2018
-- v. 1.0.0
----------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------
-- libraries
----------------------------------------------------------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

--library common_hdl;
--    use common_hdl.common_hdl_package.all;
--    use common_hdl.general_types.all;

library demodulators;
    use demodulators.pkg_demodulators_types.all;

----------------------------------------------------------------------------------------------------------------------------------
-- entity declaration
----------------------------------------------------------------------------------------------------------------------------------
entity fir_iq_sym_decimator is
    generic(
          g_order                   : integer := 32
    );
    port(
          iCLK                      : in std_logic
        ; iRST                      : in std_logic
        ; iCOEF_V                   : in std_logic
        ; iCOEF                     : in std_logic_vector(15 downto 0)

        ; oCOEF_NUM                 : out std_logic_vector(15 downto 0)
        ; oCOEF_CNT                 : out std_logic_vector(15 downto 0)
        ; oCOEF_RDY                 : out std_logic

        ; iDO                       : in std_logic_vector(3 downto 0)
        ; iIQ_V                     : in std_logic
        ; iIQ                       : in t_iq16

        ; oIQ_V                     : out std_logic
        ; oIQ                       : out t_iq24
    );
end entity;

----------------------------------------------------------------------------------------------------------------------------------
-- architecture declaration
----------------------------------------------------------------------------------------------------------------------------------
architecture behavioral of fir_iq_sym_decimator is
----------------------------------------------------------------------------------------------------------------------------------
-- types declaration
----------------------------------------------------------------------------------------------------------------------------------
    attribute
        keep
            : string;

----------------------------------------------------------------------------------------------------------------------------------
-- functions declaration
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
-- function returns total coefficient number for different decimation orders:
-- 0 - g_order
-- 1 - g_order * 2
-- 2 - g_order * 4
-- 3 - g_order * 8
-- 4 - g_order * 16
-- 5 - g_order * 32
-- 6 - g_order * 64
-- 7 - g_order * 128
-- 8 - g_order * 256
-- 9 - g_order * 512
----------------------------------------------------------------------------------------------------------------------------------
    function f_get_coef_num_array return integer_vector is
        variable v_result : integer_vector(0 to 9);
    begin
        for a in 0 to 9 loop
            v_result(a) := g_order * (2 ** a);
        end loop; -- loop for all iDO
        return v_result;
    end function;

----------------------------------------------------------------------------------------------------------------------------------
-- function returns coef mask for different decimation orders:
-- 0 - "000000000"
-- 1 - "000000001"
-- 2 - "000000011"
-- 3 - "000000111"
-- 4 - "000001111"
-- 5 - "000011111"
-- 6 - "000111111"
-- 7 - "001111111"
-- 8 - "011111111"
-- 9 - "111111111"
----------------------------------------------------------------------------------------------------------------------------------
    function f_get_coef_mask return slv9_array is
        variable v_result : slv9_array(0 to 9) := (others => (others => '0'));
    begin
        for a in 1 to 9 loop
            for b in 0 to a - 1 loop
                v_result(a)(b) := '1';
            end loop;
        end loop; -- loop for all iDO
        return v_result;
    end function;

----------------------------------------------------------------------------------------------------------------------------------
-- function returns data mask for different decimation orders:
-- 0 - not used
-- 1 - not used
-- 2 - "0000000011"     (3)     + 3 = 6     = 2   + [2^2]
-- 3 - "0000001011"     (11)    + 3 = 14    = 6   + [2^3]
-- 4 - "0000011011"     (27)    + 3 = 30    = 14  + [2^4]
-- 5 - "0000111011"     (59)    + 3 = 62    = 30  + [2^5]
-- 6 - "0001111011"     (123)   + 3 = 126   = 62  + [2^6]
-- 7 - "0011111011"     (251)   + 3 = 254   = 126 + [2^7]
-- 8 - "0111111011"     (507)   + 3 = 510   = 254 + [2^8]
-- 9 - "1111111011"     (1019)  + 3 = 1022  = 510 + [2^9]
----------------------------------------------------------------------------------------------------------------------------------
    function f_get_data_mask return slv10_array is
        variable v_result : slv10_array(0 to 9) := (others => (others => '0'));
        variable v_delay  : integer := 2;
    begin
        for a in 2 to 9 loop
            v_delay := v_delay + 2 ** a;
            v_result(a) := conv_std_logic_vector(v_delay - 3, 10);
        end loop; -- loop for all iDO
        return v_result;
    end function;

----------------------------------------------------------------------------------------------------------------------------------
-- constants declaration
----------------------------------------------------------------------------------------------------------------------------------
    constant
        c_coef_num_array
            : integer_vector(0 to 9) := f_get_coef_num_array;
    constant
        c_coef_mask_array
            : slv9_array(0 to 9) := f_get_coef_mask;
    constant
        c_data_mask_array
            : slv10_array(0 to 9) := f_get_data_mask;
    constant
        c_nofc
            : integer := 512;
    constant
        c_srls_length
            : integer := 1024;
    constant
        c_ram_addr_hight_msb
            : integer := log2(g_order);
    constant
        c_dl_accum
            : integer := 9;
    constant
        c_out_lsb
            : integer := log2(g_order) + 2;

----------------------------------------------------------------------------------------------------------------------------------
-- signals declaration
----------------------------------------------------------------------------------------------------------------------------------
    -- input buffers
    subtype signals_ib is std_logic;
        signal
            ib_coef_v,
            ib_iq_v
                : std_logic := '0';
        signal
            ib_do
                : std_logic_vector(3 downto 0) := (others => '0');
        signal
            ib_coef
                : std_logic_vector(15 downto 0) := (others => '0');
        signal
            ib_iq
                : t_iq16 := ((others => '0'), (others => '0'));

    -- current settings
    subtype signals_set is std_logic;
        signal
            set_do
                : std_logic_vector(3 downto 0) := (others => '0');
        signal
            set_do_mux
                : slv4_array(0 to g_order - 1) := (others => (others => '0'));
        signal
            set_coef_mask
                : std_logic_vector(8 downto 0) := (others => '0');
        signal
            set_data_mask
                : std_logic_vector(9 downto 0) := (others => '0');

    -- coefficients write logic
    subtype signals_coef is std_logic;
        signal
            coef_wr_cnt_cell
                : std_logic_vector(8 downto 0) := (others => '0');
        signal
            coef_wr_cnt_ram
                : std_logic_vector(log2(g_order) downto 0) := (others => '0');
        signal
            coef_ram_wr
                : std_logic_vector(0 to g_order - 1) := (others => '0');
        signal
            coef_ram_wr_addr
                : slv9_array(0 to g_order - 1) := (others => (others => '0'));
        signal
            coef_ram_wr_data
                : slv16_array(0 to g_order - 1) := (others => (others => '0'));
        signal
            coef_ram_cnt
                : std_logic_vector(15 downto 0) := (others => '0');

    -- main logic
    subtype signals_main is std_logic;
        signal
            main_c_cnt,                                     -- counter for coefficients
            main_c_cnt_masked                               -- masked counter
                : std_logic_vector(8 downto 0) := (others => '0');
        signal
            main_c_rd_addr_cmn                              -- common coefficient read address
                : std_logic_vector(8 downto 0) := (others => '0');
        signal
            main_c_rd_addr                                  -- massive of coefficient read addresses
                : slv9_array(0 to g_order - 1) := (others => (others => '0'));
        signal
            main_d_cnt,                                     -- counter for data
            main_d_cnt_masked                               -- masked counter
                : std_logic_vector(9 downto 0) := (others => '0');
        signal
            main_d_cnt_rst                                  -- reset for counter
                : std_logic := '0';
        signal
            main_d_addr                                     -- massive of data write/read addresses
                : slv10_array(0 to g_order - 1) := (others => (others => '0'));

    -- signals for RAM for coefficients
    subtype signals_ramc is std_logic;
        signal
            ramc_clk,
            ramc_ce,
            ramc_rd
                : std_logic := '0';
        signal
            ramc_wr
                : std_logic_vector(0 to g_order - 1) := (others => '0');
        signal
            ramc_wr_addr,
            ramc_rd_addr
                : slv9_array(0 to g_order - 1) := (others => (others => '0'));
        signal
            ramc_din,
            ramc_dout
                : slv16_array(0 to g_order - 1) := (others => (others => '0'));

    -- signals for RAM for data
    subtype signals_ramd is std_logic;
        signal
            ramd_clk,
            ramd_ce,
            ramd_wr,
            ramd_rd
                : std_logic := '0';
        signal
            ramd_wr_addr,
            ramd_rd_addr
                : slv10_array(0 to g_order - 1) := (others => (others => '0'));
        signal
            ramd_din,
            ramd_dout
                : t_iq16array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));

    -- signals for RAM for FILO
    subtype signals_ramf is std_logic;
        signal
            ramf_clk,
            ramf_ce,
            ramf_wr,
            ramf_rd
                : std_logic := '0';
        signal
            ramf_wr_addr,
            ramf_rd_addr
                : std_logic_vector(8 downto 0) := (others => '0');
        signal
            ramf_din,
            ramf_dout
                : t_iq16 := ((others => '0'), (others => '0'));

    -- signals for "first in last out" buffer
    subtype signals_filo is std_logic;
        signal
            filo_way
                : std_logic := '0';
        signal
            filo_counter_inc
                : std_logic_vector(8 downto 0) := (others => '1');
        signal
            filo_counter_dec,
            filo_addr_inc,
            filo_addr_dec,
            filo_addr_p,
            filo_addr_p1
                : std_logic_vector(8 downto 0) := (others => '0');
        signal
            fir_dreg
                : t_iq16array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));

    -- signals for multiplier's resetting
    subtype signals_mult_reset is std_logic;
        signal
            mult_reset,
            mult_reset_dsp
                : std_logic_vector(g_order - 1 downto 0) := (others => '0');
        signal
            mult_reset_common,
            mult_reset_common_p,
            mult_reset_common_p1,
            mult_reset_common_p2,
            mult_reset_common_p3
                : std_logic := '0';

    -- signals for dsp_48 connection
    subtype signals_dsp48 is std_logic;
        signal
            dsp48_opmode
                : t_iq7array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_b
                : t_iq18array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_d
                : t_iq25array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_a
                : t_iq30array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_p,
            dsp48_pcin,
            dsp48_pcout
                : t_iq48array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_result
                : t_iq24array(0 to 9) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_srl
                : t_iq16array(0 to g_order * 2 - 1) := (others => ((others => '0'), (others => '0')));
        signal
            dsp48_srl_out_p,
            dsp48_srl_out_p1,
            dsp48_srl_out
                : t_iq16 := ((others => '0'), (others => '0'));

    -- signals for fir implementation
    subtype signals_fir is std_logic;
        signal
            fir_areg1,
            fir_areg2
                : t_iq25array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            fir_adreg
                : t_iq25array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            fir_breg
                : t_iq18array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            fir_mreg
                : t_iq43array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            fir_preg
                : t_iq48array(0 to g_order - 1) := (others => ((others => '0'), (others => '0')));
        signal
            fir_result
                : t_iq24array(0 to 9) := (others => ((others => '0'), (others => '0')));
        -- transparent mode
        signal
            tr_fir_mreg,
            tr_fir_preg,
            tr_fir_result
                : t_iq25 := ((others => '0'), (others => '0'));

    -- output buffers
    subtype signals_ob is std_logic;
        signal
            ob_coef_rdy,
            ob_iq_v
                : std_logic := '0';
        signal
            ob_coef_cnt
                : std_logic_vector(15 downto 0) := (others => '0');
        signal
            ob_iq
                : t_iq24 := ((others => '0'), (others => '0'));

begin
----------------------------------------------------------------------------------------------------------------------------------
-- input
----------------------------------------------------------------------------------------------------------------------------------
    ib_coef_v                       <= iCOEF_V;
    ib_coef                         <= iCOEF;
    ib_do                           <= iDO;
    ib_iq_v                         <= iIQ_V;
    ib_iq                           <= iIQ;

----------------------------------------------------------------------------------------------------------------------------------
-- process, current settings
----------------------------------------------------------------------------------------------------------------------------------
    p_set : process(iCLK)
    begin
        if (rising_edge(iCLK)) then
            if (conv_integer(ib_do) <= 9) then
                set_do <= ib_do;
            else
                set_do <= conv_std_logic_vector(9, 4);
            end if;

            for a in 0 to g_order - 1 loop
                set_do_mux(a) <= set_do;
            end loop;

            -- get current settings
            set_coef_mask <= c_coef_mask_array(conv_integer(set_do));
            set_data_mask <= c_data_mask_array(conv_integer(set_do));
        end if; -- CLK
    end process;

----------------------------------------------------------------------------------------------------------------------------------
-- process, coefficient write logic
----------------------------------------------------------------------------------------------------------------------------------
    p_coef : process(iCLK)
    begin
        if (rising_edge(iCLK)) then
            if (ib_coef_v = '1') then
                if (coef_wr_cnt_cell = set_coef_mask) then
                    coef_wr_cnt_cell <= (others => '0');
                    coef_ram_cnt <= ext(coef_wr_cnt_ram, 16) + '1';
                    if (coef_wr_cnt_ram = 2 * g_order - 1) then
                        coef_wr_cnt_ram <= (others => '0');
                    else
                        coef_wr_cnt_ram <= coef_wr_cnt_ram + '1';
                    end if;
                else
                    coef_wr_cnt_cell <= coef_wr_cnt_cell + '1';
                end if;
            end if; -- WRITE

            for a in 0 to g_order - 1 loop
                if (conv_integer(coef_wr_cnt_ram) = a) then
                    coef_ram_wr(a) <= ib_coef_v;
                    coef_ram_wr_addr(a) <= coef_wr_cnt_cell;
                    coef_ram_wr_data(a) <= ib_coef;
                else
                    coef_ram_wr(a) <= '0';
                    coef_ram_wr_addr(a) <= (others => '0');
                    coef_ram_wr_data(a) <= (others => '0');
                end if;
            end loop;

            if (conv_integer(coef_ram_cnt) = 2 * c_coef_num_array(0)) then
            -- loading is done
                ob_coef_rdy         <= '1';
            else
                ob_coef_rdy         <= '0';
            end if;
        end if; -- CLK
    end process;

    ob_coef_cnt                     <= coef_ram_cnt;

----------------------------------------------------------------------------------------------------------------------------------
-- process, main logic
----------------------------------------------------------------------------------------------------------------------------------
    p_main : process(iCLK)
    begin
        if (rising_edge(iCLK)) then
            if (ib_iq_v = '1') then
                main_c_cnt          <= main_c_cnt - '1';
                main_c_cnt_masked   <= main_c_cnt and set_coef_mask;

                main_c_rd_addr_cmn     <= main_c_cnt_masked;
                for a in 0 to g_order - 1 loop
                    main_c_rd_addr(a) <= main_c_rd_addr_cmn;
                end loop;

                if (main_c_rd_addr_cmn = set_coef_mask) then
                    mult_reset_common <= '1';
                else
                    mult_reset_common <= '0';
                end if;

                -- pipeline for reset
                mult_reset_common_p  <= mult_reset_common;
                mult_reset_common_p1 <= mult_reset_common_p;
                mult_reset_common_p2 <= mult_reset_common_p1;
                mult_reset_common_p3 <= mult_reset_common_p2;

                for a in 0 to g_order - 1 loop
                    mult_reset_dsp(a) <= mult_reset_common_p1;
                end loop;

                if (set_do = X"1") then
                    main_d_cnt_rst <= not main_d_cnt_rst;
                else
                    if (main_d_cnt_masked = 0) then
                        main_d_cnt_rst <= '1';
                    else
                        main_d_cnt_rst <= '0';
                    end if;
                end if;

                if (main_d_cnt_rst = '1') then
                    main_d_cnt <= (others => '0');
                else
                    main_d_cnt <= main_d_cnt + '1';
                end if;
                main_d_cnt_masked <= main_d_cnt xor set_data_mask;

                for a in 0 to g_order - 2 loop
                    main_d_addr(a) <= main_d_cnt;
                end loop;

                filo_counter_dec <= filo_counter_dec - '1';
                filo_counter_inc <= filo_counter_inc + '1';
                filo_addr_inc <= filo_counter_inc and set_coef_mask;
                filo_addr_dec <= filo_counter_dec and set_coef_mask;

                if (filo_way = '0') then
                    filo_addr_p1 <= filo_addr_inc;
                    if (filo_addr_dec = 0) then
                        filo_way <= not filo_way;
                    end if;
                else
                    filo_addr_p1 <= filo_addr_dec;
                    if (filo_addr_inc = set_coef_mask) then
                        filo_way <= not filo_way;
                    end if;
                end if;

                if (set_do = X"0") then
                    filo_addr_p <= (others => '0');
                else
                    filo_addr_p <= filo_addr_p1;
                end if;
            end if;
        end if;
    end process;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    GEN_ramc : for a in 0 to g_order - 1 generate
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    u_ram_coef : entity demodulators.fir_iq_sym_decimator_ram
    generic map(
        g_ram_size                  => c_nofc
    )
    port map(
        CLK                         => ramc_clk,
        CE                          => ramc_ce,
        WR                          => ramc_wr(a),
        WR_ADDR                     => ramc_wr_addr(a),
        DIN                         => ramc_din(a),
        RD                          => ramc_rd,
        RD_ADDR                     => ramc_rd_addr(a),
        DOUT                        => ramc_dout(a)
    );

    ramc_clk                        <= iCLK;
    ramc_ce                         <= '1';
    ramc_wr(a)                      <= coef_ram_wr(a);
    ramc_wr_addr(a)                 <= coef_ram_wr_addr(a);
    ramc_din(a)                     <= coef_ram_wr_data(a);
    ramc_rd                         <= ib_iq_v;
    ramc_rd_addr(a)                 <= main_c_rd_addr(a);
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    end generate GEN_ramc;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    GEN_ramd : for a in 0 to g_order - 1 generate
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    u_ram_srls_i : entity demodulators.fir_iq_sym_decimator_ram
    generic map(
        g_ram_size                  => c_srls_length
    )
    port map(
        CLK                         => ramd_clk,
        CE                          => ramd_ce,
        WR                          => ramd_wr,
        WR_ADDR                     => ramd_wr_addr(a),
        DIN                         => ramd_din(a).i,
        RD                          => ramd_rd,
        RD_ADDR                     => ramd_rd_addr(a),
        DOUT                        => ramd_dout(a).i
    );
----------------------------------------------------------------------------------------------------------------------------------
    u_ram_srls_q : entity demodulators.fir_iq_sym_decimator_ram
    generic map(
        g_ram_size                  => c_srls_length
    )
    port map(
        CLK                         => ramd_clk,
        CE                          => ramd_ce,
        WR                          => ramd_wr,
        WR_ADDR                     => ramd_wr_addr(a),
        DIN                         => ramd_din(a).q,
        RD                          => ramd_rd,
        RD_ADDR                     => ramd_rd_addr(a),
        DOUT                        => ramd_dout(a).q
    );
----------------------------------------------------------------------------------------------------------------------------------
    ramd_clk                        <= iCLK;
    ramd_ce                         <= '1';
    ramd_wr                         <= ib_iq_v;
    ramd_wr_addr(a)                 <= main_d_addr(a);
    ramd_rd                         <= ib_iq_v;
    ramd_rd_addr(a)                 <= main_d_addr(a);

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    end generate GEN_ramd;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    ramd_din(0)                     <= ib_iq;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                        GEN_ramd_input : for a in 1 to g_order - 1 generate
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    ramd_din(a)                     <= ramd_dout(a - 1);

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                        end generate GEN_ramd_input;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------
-- FILO
----------------------------------------------------------------------------------------------------------------------------------
    u_ram_filo_i : entity demodulators.fir_iq_sym_decimator_ram
    generic map(
        g_outreg                    => 1,
        g_ram_size                  => 512
    )
    port map(
        CLK                         => ramf_clk,
        CE                          => ramf_ce,
        WR                          => ramf_wr,
        WR_ADDR                     => ramf_wr_addr,
        DIN                         => ramf_din.i,
        RD                          => ramf_rd,
        RD_ADDR                     => ramf_rd_addr,
        DOUT                        => ramf_dout.i
    );
----------------------------------------------------------------------------------------------------------------------------------
    u_ram_filo_q : entity demodulators.fir_iq_sym_decimator_ram
    generic map(
        g_outreg                    => 1,
        g_ram_size                  => 512
    )
    port map(
        CLK                         => ramf_clk,
        CE                          => ramf_ce,
        WR                          => ramf_wr,
        WR_ADDR                     => ramf_wr_addr,
        DIN                         => ramf_din.q,
        RD                          => ramf_rd,
        RD_ADDR                     => ramf_rd_addr,
        DOUT                        => ramf_dout.q
    );
----------------------------------------------------------------------------------------------------------------------------------
    ramf_clk                        <= iCLK;
    ramf_ce                         <= '1';
    ramf_wr                         <= ib_iq_v;
    ramf_wr_addr                    <= filo_addr_p;
    ramf_din                        <=
        dsp48_srl(g_order * 2 - 3) when set_do = X"0" else
        ramd_dout(g_order - 2);
    ramf_rd                         <= ib_iq_v;
    ramf_rd_addr                    <= filo_addr_p;

----------------------------------------------------------------------------------------------------------------------------------
-- write/read data to FILO
-- SRL for iDO = 0
----------------------------------------------------------------------------------------------------------------------------------
    p_filo : process(iCLK)
    begin
        if (rising_edge(iCLK)) then
            if (ib_iq_v = '1') then
                -- SRL for iDO = 0
                dsp48_srl <= ib_iq & dsp48_srl(0 to g_order * 2 - 2);
                dsp48_srl_out <= dsp48_srl(g_order * 2 - 2);

                -- MUX
                for a in 0 to g_order - 1 loop
--                    if (set_do_mux(a) = X"0") then
--                        fir_dreg(a)  <= dsp48_srl_out;   -- one more trigger
--                    else
                        fir_dreg(a)  <= ramf_dout;       -- get data from FILO
--                    end if;
                end loop;
            end if;
        end if;
    end process;

----------------------------------------------------------------------------------------------------------------------------------
-- DSP, I channel
----------------------------------------------------------------------------------------------------------------------------------
    u_dsp48_i_0 : entity demodulators.fir_iq_sym_decimator_dsp48
    port map(
        CLK                         => iCLK,
        CE                          => ib_iq_v,
        RST                         => '0',
        A                           => dsp48_a(0).i,
        B                           => dsp48_b(0).i,
        D                           => dsp48_d(0).i,
        PCIN                        => dsp48_pcin(0).i,
        PCOUT                       => dsp48_pcout(0).i,
        P                           => dsp48_p(0).i,
        OPMODE                      => dsp48_opmode(0).i(6 downto 4)
    );

    dsp48_a(0).i                    <= sxt(ib_iq.i, 30);
    dsp48_opmode(0).i               <=
        "0000000" when  mult_reset_dsp(0) = '1' else        -- init accumulator
        "0100000";                                          -- accumulate
    dsp48_d(0).i                    <= sxt(fir_dreg(0).i, 25);
    dsp48_B(0).i                    <= sxt(ramc_dout(0), 18);

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    GEN_dsp48_i : for a in 1 to g_order - 1 generate
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    u_dsp48_i : entity demodulators.fir_iq_sym_decimator_dsp48
    port map(
        CLK                         => iCLK,
        CE                          => ib_iq_v,
        RST                         => '0',
        A                           => dsp48_a(a).i,
        B                           => dsp48_b(a).i,
        D                           => dsp48_d(a).i,
        PCIN                        => dsp48_pcin(a).i,
        PCOUT                       => dsp48_pcout(a).i,
        P                           => dsp48_p(a).i,
        OPMODE                      => dsp48_opmode(a).i(6 downto 4)
    );

    dsp48_a(a).i                    <=
        sxt(ramd_dout(a - 1).i, 30) when set_do_mux(a) /= X"0" else
        sxt(dsp48_srl(a * 2 - 1).i, 30);                    -- no decimation
    dsp48_opmode(a).i               <=
        "0010000" when mult_reset_dsp(a) = '1' else         -- init accumulator
        "0100000";                                          -- accumulate
    dsp48_d(a).i                    <= sxt(fir_dreg(a).i, 25);
    dsp48_b(a).i                    <= sxt(ramc_dout(a), 18);
    dsp48_pcin(a).i                 <= dsp48_pcout(a - 1).i;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    end generate GEN_dsp48_i;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------
-- DSP, Q channel
----------------------------------------------------------------------------------------------------------------------------------
    u_dsp48_q_0 : entity demodulators.fir_iq_sym_decimator_dsp48
    port map(
        CLK                         => iCLK,
        CE                          => ib_iq_v,
        RST                         => '0',
        A                           => dsp48_a(0).q,
        B                           => dsp48_b(0).q,
        D                           => dsp48_d(0).q,
        PCIN                        => dsp48_pcin(0).q,
        PCOUT                       => dsp48_pcout(0).q,
        P                           => dsp48_p(0).q,
        OPMODE                      => dsp48_opmode(0).q(6 downto 4)
    );

    dsp48_a(0).q                    <= sxt(ib_iq.q, 30);
    dsp48_opmode(0).q               <=
        "0000000" when  mult_reset_dsp(0) = '1' else        -- init accumulator
        "0100000";                                          -- accumulate
    dsp48_d(0).q                    <= sxt(fir_dreg(0).q, 25);
    dsp48_B(0).q                    <= sxt(ramc_dout(0), 18);

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    GEN_dsp48_q : for a in 1 to g_order - 1 generate
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    u_dsp48_q : entity demodulators.fir_iq_sym_decimator_dsp48
    port map(
        CLK                         => iCLK,
        CE                          => ib_iq_v,
        RST                         => '0',
        A                           => dsp48_a(a).q,
        B                           => dsp48_b(a).q,
        D                           => dsp48_d(a).q,
        PCIN                        => dsp48_pcin(a).q,
        PCOUT                       => dsp48_pcout(a).q,
        P                           => dsp48_p(a).q,
        OPMODE                      => dsp48_opmode(a).q(6 downto 4)
    );

    dsp48_a(a).q                    <=
        sxt(ramd_dout(a - 1).q, 30) when set_do_mux(a) /= X"0" else
        sxt(dsp48_srl(a * 2 - 1).q, 30);                    -- no decimation
    dsp48_opmode(a).q               <=
        "0010000" when mult_reset_dsp(a) = '1' else         -- init accumulator
        "0100000";                                          -- accumulate
    dsp48_d(a).q                    <= sxt(fir_dreg(a).q, 25);
    dsp48_b(a).q                    <= sxt(ramc_dout(a), 18);
    dsp48_pcin(a).q                 <= dsp48_pcout(a - 1).q;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    end generate GEN_dsp48_q;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------
-- alternative calculation
----------------------------------------------------------------------------------------------------------------------------------
    p_fir : process(iCLK)
    begin
        if (rising_edge(iCLK)) then
            if (ib_iq_v = '1') then
                for a in 0 to g_order - 1 loop
                    fir_areg1(a).i <= dsp48_a(a).i(24 downto 0);
                    fir_areg1(a).q <= dsp48_a(a).q(24 downto 0);
                    fir_areg2(a) <= fir_areg1(a);
                    fir_breg(a) <= dsp48_b(a);

                    fir_adreg(a).i <= fir_areg2(a).i + dsp48_d(a).i;
                    fir_adreg(a).q <= fir_areg2(a).q + dsp48_d(a).q;

                    fir_mreg(a).i <= signed(fir_adreg(a).i) * signed(fir_breg(a).i);
                    fir_mreg(a).q <= signed(fir_adreg(a).q) * signed(fir_breg(a).q);

                    mult_reset(a) <= mult_reset_dsp(a);

                    if (a = 0) then
                        if (mult_reset(a) = '1') then
                            fir_preg(a).i <= sxt(fir_mreg(a).i, 48);
                            fir_preg(a).q <= sxt(fir_mreg(a).q, 48);
                        else
                            fir_preg(a).i <= fir_preg(a).i + sxt(fir_mreg(a).i, 48);
                            fir_preg(a).q <= fir_preg(a).q + sxt(fir_mreg(a).q, 48);
                        end if;
                    else
                        if (mult_reset(a) = '1') then
                            fir_preg(a).i <= fir_preg(a - 1).i + sxt(fir_mreg(a).i, 48);
                            fir_preg(a).q <= fir_preg(a - 1).q + sxt(fir_mreg(a).q, 48);
                        else
                            fir_preg(a).i <= fir_preg(a).i + sxt(fir_mreg(a).i, 48);
                            fir_preg(a).q <= fir_preg(a).q + sxt(fir_mreg(a).q, 48);
                        end if;
                    end if;
                end loop;

                for a in 0 to 9 loop
                    fir_result(a).i <= fir_preg(g_order - 1).i(c_out_lsb + a + 23 downto c_out_lsb + a);
                    fir_result(a).q <= fir_preg(g_order - 1).q(c_out_lsb + a + 23 downto c_out_lsb + a);
                end loop;

                -- transparent mode
                tr_fir_mreg.i <= fir_adreg(g_order - 1).i;
                tr_fir_mreg.q <= fir_adreg(g_order - 1).q;
                tr_fir_preg <= tr_fir_mreg;
                tr_fir_result <= tr_fir_preg;
            end if; -- CE
        end if; -- CLK
    end process;

----------------------------------------------------------------------------------------------------------------------------------
-- process, otuput
----------------------------------------------------------------------------------------------------------------------------------
    p_out : process(iCLK)
    begin
        if (rising_edge(iCLK)) then
            if (ib_iq_v = '1') then
                for a in 0 to 9 loop
                    dsp48_result(a).i <= dsp48_p(g_order - 1).i(c_out_lsb + a + 23 downto c_out_lsb + a);
                    dsp48_result(a).q <= dsp48_p(g_order - 1).q(c_out_lsb + a + 23 downto c_out_lsb + a);
                end loop;

                if (mult_reset_common_p3 = '1') then
                    ob_iq_v <= '1';
                else
                    ob_iq_v <= '0';
                end if;
            else
                ob_iq_v <= '0';
            end if;

            if (ob_iq_v = '1') then
                ob_iq               <= dsp48_result(conv_integer(set_do));
            end if; -- new CE
        end if;
    end process;

----------------------------------------------------------------------------------------------------------------------------------
-- output
----------------------------------------------------------------------------------------------------------------------------------
    oCOEF_NUM                       <= conv_std_logic_vector(2 * c_coef_num_array(0), 16);
    oCOEF_CNT                       <= ob_coef_cnt;
    oCOEF_RDY                       <= ob_coef_rdy;
    oIQ_V                           <= ob_iq_v;
    oIQ                             <= ob_iq;

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
end;