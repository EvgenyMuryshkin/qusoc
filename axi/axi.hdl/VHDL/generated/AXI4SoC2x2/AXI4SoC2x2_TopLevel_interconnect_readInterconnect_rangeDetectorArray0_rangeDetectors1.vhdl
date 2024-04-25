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
-- System configuration name is AXI4SoC2x2_TopLevel_interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4SoC2x2_TopLevel_interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Value : in unsigned (31 downto 0);
		IsActive : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4SoC2x2_TopLevel_interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1 is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant rangeFrom : unsigned(2 downto 0) := "100";
	constant rangeTo : unsigned(2 downto 0) := "100";
	signal Inputs_Value : unsigned(31 downto 0) := (others => '0');
	signal RangeDetectorModule_L33F33T85_Expr : std_logic := '0';
	signal RangeDetectorModule_L33F33T85_Expr_1 : std_logic := '0';
	signal RangeDetectorModule_L33F33T85_Expr_2 : std_logic := '0';
	signal RangeDetectorModule_L33F33T58_Expr : std_logic := '0';
	signal RangeDetectorModule_L33F33T58_ExprLhs : signed(32 downto 0) := "000000000000000000000000000000000";
	signal RangeDetectorModule_L33F33T58_ExprRhs : signed(32 downto 0) := "000000000000000000000000000000000";
	signal RangeDetectorModule_L33F62T85_Expr : std_logic := '0';
	signal RangeDetectorModule_L33F62T85_ExprLhs : signed(32 downto 0) := "000000000000000000000000000000000";
	signal RangeDetectorModule_L33F62T85_ExprRhs : signed(32 downto 0) := "000000000000000000000000000000000";
begin
	RangeDetectorModule_L33F33T58_Expr <= '1' when (signed(resize(RangeDetectorModule_L33F33T58_ExprLhs, RangeDetectorModule_L33F33T58_ExprLhs'length + 1)) >= signed(resize(RangeDetectorModule_L33F33T58_ExprRhs, RangeDetectorModule_L33F33T58_ExprRhs'length + 1))) else '0';
	RangeDetectorModule_L33F62T85_Expr <= '1' when (signed(resize(RangeDetectorModule_L33F62T85_ExprLhs, RangeDetectorModule_L33F62T85_ExprLhs'length + 1)) <= signed(resize(RangeDetectorModule_L33F62T85_ExprRhs, RangeDetectorModule_L33F62T85_ExprRhs'length + 1))) else '0';
	process (RangeDetectorModule_L33F33T85_Expr_1, RangeDetectorModule_L33F33T85_Expr_2)
	begin
		RangeDetectorModule_L33F33T85_Expr <= RangeDetectorModule_L33F33T85_Expr_1 AND RangeDetectorModule_L33F33T85_Expr_2;
	end process;
	process (Inputs_Value, RangeDetectorModule_L33F33T58_Expr, RangeDetectorModule_L33F33T85_Expr, RangeDetectorModule_L33F62T85_Expr, Value)
	begin
		RangeDetectorModule_L33F33T58_ExprLhs(32) <= '0';
		RangeDetectorModule_L33F33T58_ExprLhs(31 downto 0) <= signed(Inputs_Value);
		RangeDetectorModule_L33F33T58_ExprRhs(32 downto 3) <= (
			others => '0'
		)
		;
		RangeDetectorModule_L33F33T58_ExprRhs(2 downto 0) <= signed(rangeFrom);
		RangeDetectorModule_L33F62T85_ExprLhs(32) <= '0';
		RangeDetectorModule_L33F62T85_ExprLhs(31 downto 0) <= signed(Inputs_Value);
		RangeDetectorModule_L33F62T85_ExprRhs(32 downto 3) <= (
			others => '0'
		)
		;
		RangeDetectorModule_L33F62T85_ExprRhs(2 downto 0) <= signed(rangeTo);
		RangeDetectorModule_L33F33T85_Expr_1 <= RangeDetectorModule_L33F33T58_Expr;
		RangeDetectorModule_L33F33T85_Expr_2 <= RangeDetectorModule_L33F62T85_Expr;
		Inputs_Value <= Value;
		IsActive <= RangeDetectorModule_L33F33T85_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
