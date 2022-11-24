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
-- System configuration name is GenerateModule4_TopLevel_nested3, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity GenerateModule4_TopLevel_nested3 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iData : in unsigned (3 downto 0);
		iBit : in std_logic;
		oData : out unsigned (4 downto 0);
		oBit : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of GenerateModule4_TopLevel_nested3 is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	constant GenerateModule_L40F53T54_Expr : std_logic := '1';
	signal Inputs_iData : unsigned(3 downto 0) := (others => '0');
	signal Inputs_iBit : std_logic := '0';
	signal inverter_inValue : std_logic := '0';
	signal inverter_outValue : std_logic := '0';
	signal inverterinValueinverter_inValueHardLink : std_logic := '0';
	signal inverteroutValueinverter_outValueHardLink : std_logic := '0';
	signal GenerateModule_L40F37T68_Expr : unsigned(5 downto 0) := "000000";
	signal GenerateModule_L40F37T68_Expr_1 : unsigned(5 downto 0) := "000000";
	signal GenerateModule_L40F37T68_Expr_2 : unsigned(5 downto 0) := "000000";
	signal GenerateModule_L40F37T54_Expr : unsigned(5 downto 0) := "000000";
	signal GenerateModule_L40F37T54_Expr_1 : unsigned(5 downto 0) := "000000";
begin
	process (GenerateModule_L40F37T68_Expr_1, GenerateModule_L40F37T68_Expr_2)
	begin
		GenerateModule_L40F37T68_Expr <= GenerateModule_L40F37T68_Expr_1 OR GenerateModule_L40F37T68_Expr_2;
	end process;
	process (GenerateModule_L40F37T54_Expr_1)
		alias output is GenerateModule_L40F37T54_Expr;
		alias source0 is GenerateModule_L40F37T54_Expr_1;
	begin
		output(0) <= '0';
		output(1) <= source0(0);
		output(2) <= source0(1);
		output(3) <= source0(2);
		output(4) <= source0(3);
		output(5) <= '0';
	end process;
	GenerateModule4_TopLevel_nested3_inverter : entity work.GenerateModule4_TopLevel_nested3_inverter
	port map
	(
		-- [BEGIN USER MAP FOR inverter]
		-- [END USER MAP FOR inverter]
inValue => inverterinValueinverter_inValueHardLink,
outValue => inverteroutValueinverter_outValueHardLink
	);
	process (GenerateModule_L40F37T54_Expr, GenerateModule_L40F37T68_Expr, iBit, iData, Inputs_iBit, Inputs_iData, inverter_inValue, inverter_outValue, inverteroutValueinverter_outValueHardLink)
	begin
		GenerateModule_L40F37T68_Expr_1 <= GenerateModule_L40F37T54_Expr;
		GenerateModule_L40F37T68_Expr_2(5 downto 1) <= (others => '0');
		GenerateModule_L40F37T68_Expr_2(0) <= Inputs_iBit;
		GenerateModule_L40F37T54_Expr_1(5 downto 4) <= (others => '0');
		GenerateModule_L40F37T54_Expr_1(3 downto 0) <= Inputs_iData;
		Inputs_iData <= iData;
		Inputs_iBit <= iBit;
		inverter_inValue <= Inputs_iBit;
		oData <= GenerateModule_L40F37T68_Expr(4 downto 0);
		oBit <= inverter_outValue;
		inverterinValueinverter_inValueHardLink <= inverter_inValue;
		inverter_outValue <= inverteroutValueinverter_outValueHardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;