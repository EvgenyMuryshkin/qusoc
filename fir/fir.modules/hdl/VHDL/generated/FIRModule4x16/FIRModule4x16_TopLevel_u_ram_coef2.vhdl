-- PLEASE READ THIS, IT MAY SAVE YOU SOME TIME AND MONEY, THANK YOU!
-- * This file was generated by Quokka FPGA Toolkit.
-- * Generated code is your property, do whatever you want with it
-- * Place custom code between [BEGIN USER ***] and [END USER ***].
-- * CAUTION: All code outside of [USER] scope is subject to regeneration.
-- * Bad things happen sometimes in developer's life,
--   it is recommended to use source control management software (e.g. git, bzr etc) to keep your custom code safe'n'sound.
-- * Internal structure of code is subject to change.
--   You can use some of signals in custom code, but most likely they will not exist in future (e.g. will get shorter or gone completely)
-- * Please send your feedback, comments, improvement ideas etc. to evmuryshkin@gmail.com
-- * Visit https://github.com/EvgenyMuryshkin/QuokkaEvaluation to access latest version of playground
--
-- DISCLAIMER:
--   Code comes AS-IS, it is your responsibility to make sure it is working as expected
--   no responsibility will be taken for any loss or damage caused by use of Quokka toolkit.
--
-- System configuration name is FIRModule4x16_TopLevel_u_ram_coef2, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRModule4x16_TopLevel_u_ram_coef2 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		CE : in std_logic;
		DIN : in unsigned (15 downto 0);
		RD : in std_logic;
		RD_ADDR : in unsigned (8 downto 0);
		WR : in std_logic;
		WR_ADDR : in unsigned (8 downto 0);
		DOUT : out unsigned (15 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRModule4x16_TopLevel_u_ram_coef2 is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_CE : std_logic := '0';
	signal Inputs_DIN : unsigned(15 downto 0) := (others => '0');
	signal Inputs_RD : std_logic := '0';
	signal Inputs_RD_ADDR : unsigned(8 downto 0) := (others => '0');
	signal Inputs_WR : std_logic := '0';
	signal Inputs_WR_ADDR : unsigned(8 downto 0) := (others => '0');
	signal tmp : std_logic_vector(15 downto 0) := (others => '0');
begin
	u_ram : entity work.fir_iq_sym_decimator_ram
	generic map
	(
		g_outreg => 2,
		g_ram_size => 512,
		g_ram_size_log2 => 9
	)
	port map
	(
		CLK => BoardSignals.Clock,
		CE => CE,
		WR => WR,
		WR_ADDR => std_logic_vector(WR_ADDR),
		DIN => std_logic_vector(DIN),
		RD => RD,
		RD_ADDR => std_logic_vector(RD_ADDR),
		DOUT => tmp
	)
	;
	DOUT <= unsigned(tmp);
end architecture;
