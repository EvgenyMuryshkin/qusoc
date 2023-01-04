----------------------------------------------------------------------------------------------------------------------------------
-- Author : Vitaly Lotnik
-- Name : fir_iq_sym_decimator_dsp48
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

library unisim;
    use unisim.vcomponents.all;

----------------------------------------------------------------------------------------------------------------------------------
-- entity declaration
----------------------------------------------------------------------------------------------------------------------------------
entity fir_iq_sym_decimator_dsp48 is
    port(
          CLK                       : in std_logic
        ; CE                        : in std_logic
        ; RST                       : in std_logic
        ; A                         : in std_logic_vector(29 downto 0)
        ; B                         : in std_logic_vector(17 downto 0)
        ; D                         : in std_logic_vector(24 downto 0)
        ; PCIN                      : in std_logic_vector(47 downto 0)
        ; PCOUT                     : out std_logic_vector(47 downto 0)
        ; P                         : out std_logic_vector(47 downto 0)
        ; OPMODE                    : in std_logic_vector(2 downto 0)
    );
end entity;

----------------------------------------------------------------------------------------------------------------------------------
-- architecture declaration
----------------------------------------------------------------------------------------------------------------------------------
architecture behavioral of fir_iq_sym_decimator_dsp48 is

begin
----------------------------------------------------------------------------------------------------------------------------------
-- DSP48
----------------------------------------------------------------------------------------------------------------------------------
    u_dsp48e1 : DSP48E1
    generic map (
          A_INPUT                   => "DIRECT"
        , B_INPUT                   => "DIRECT"
        , USE_DPORT                 => TRUE
        , USE_MULT                  => "MULTIPLY"
        , AUTORESET_PATDET          => "NO_RESET"
        , MASK                      => X"3fffffffffff"
        , PATTERN                   => X"000000000000"
        , SEL_MASK                  => "MASK"
        , SEL_PATTERN               => "PATTERN"
        , USE_PATTERN_DETECT        => "NO_PATDET"
        , ACASCREG                  => 2
        , ADREG                     => 1
        , ALUMODEREG                => 0
        , AREG                      => 2
        , BCASCREG                  => 1
        , BREG                      => 1
        , CARRYINREG                => 0
        , CARRYINSELREG             => 0
        , CREG                      => 0
        , DREG                      => 0
        , INMODEREG                 => 0
        , MREG                      => 1
        , OPMODEREG                 => 1
        , PREG                      => 1
        , USE_SIMD                  => "ONE48"
    )
    port map (
          ACOUT                     => open
        , BCOUT                     => open
        , CARRYCASCOUT              => open
        , MULTSIGNOUT               => open
        , PCOUT                     => PCOUT
        , OVERFLOW                  => open
        , PATTERNBDETECT            => open
        , PATTERNDETECT             => open
        , UNDERFLOW                 => open
        , CARRYOUT                  => open
        , P                         => P
        , ACIN                      => (others=>'0')
        , BCIN                      => (others=>'0')
        , CARRYCASCIN               => '0'
        , MULTSIGNIN                => '0'
        , PCIN                      => PCIN
        , ALUMODE                   => (others=>'0')
        , CARRYINSEL                => (others=>'0')
        , CEINMODE                  => CE
        , CLK                       => CLK
        , INMODE                    => "10100"
        , OPMODE(3 downto 0)        => "0101"
        , OPMODE(6 downto 4)        => OPMODE
        , RSTINMODE                 => RST
        , A                         => A
        , B                         => B
        , C                         => (others=>'0')
        , CARRYIN                   => '0'
        , D                         => D
        , CEA1                      => CE
        , CEA2                      => CE
        , CEAD                      => CE
        , CEALUMODE                 => '0'
        , CEB1                      => CE
        , CEB2                      => '0'
        , CEC                       => '0'
        , CECARRYIN                 => '0'
        , CECTRL                    => CE
        , CED                       => CE
        , CEM                       => CE
        , CEP                       => CE
        , RSTA                      => RST
        , RSTALLCARRYIN             => RST
        , RSTALUMODE                => RST
        , RSTB                      => RST
        , RSTC                      => RST
        , RSTCTRL                   => RST
        , RSTD                      => RST
        , RSTM                      => RST
        , RSTP                      => RST
    );

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
end;