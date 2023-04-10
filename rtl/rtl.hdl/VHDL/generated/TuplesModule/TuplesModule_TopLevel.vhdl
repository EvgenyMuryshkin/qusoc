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
-- System configuration name is TuplesModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity TuplesModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Value1 : in std_logic;
		Value2 : in std_logic;
		Diff : out std_logic;
		Same : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of TuplesModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_Value1 : std_logic := '0';
	signal Inputs_Value2 : std_logic := '0';
	signal Logic_Item1 : std_logic := '0';
	signal Logic_Item2 : std_logic := '0';
	signal TuplesModule_L16F13L21T14_same : std_logic := '0';
	signal TuplesModule_L16F13L21T14_diff : std_logic := '0';
	signal TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_Expr : std_logic := '0';
	signal TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprLhs : signed(1 downto 0) := "00";
	signal TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprRhs : signed(1 downto 0) := "00";
	signal TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_Expr : std_logic := '0';
	signal TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprLhs : signed(1 downto 0) := "00";
	signal TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprRhs : signed(1 downto 0) := "00";
begin
	TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_Expr <= '1' when (signed(resize(TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprLhs, TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprLhs'length + 1)) = signed(resize(TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprRhs, TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprRhs'length + 1))) else '0';
	TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_Expr <= '1' when (signed(resize(TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprLhs, TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprLhs'length + 1)) /= signed(resize(TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprRhs, TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprRhs'length + 1))) else '0';
	process (TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_Expr, TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_Expr)
	begin
		TuplesModule_L16F13L21T14_same <= TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_Expr;
		TuplesModule_L16F13L21T14_diff <= TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_Expr;
	end process;
	process (Inputs_Value1, Inputs_Value2, Logic_Item1, Logic_Item2, TuplesModule_L16F13L21T14_diff, TuplesModule_L16F13L21T14_same, Value1, Value2)
	begin
		TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprLhs(1) <= '0';
		TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprLhs(0) <= Inputs_Value1;
		TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprRhs(1) <= '0';
		TuplesModule_L16F13L21T14_TuplesModule_L17F28T58_ExprRhs(0) <= Inputs_Value2;
		TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprLhs(1) <= '0';
		TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprLhs(0) <= Inputs_Value1;
		TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprRhs(1) <= '0';
		TuplesModule_L16F13L21T14_TuplesModule_L18F28T58_ExprRhs(0) <= Inputs_Value2;
		Inputs_Value1 <= Value1;
		Inputs_Value2 <= Value2;
		Logic_Item1 <= TuplesModule_L16F13L21T14_same;
		Logic_Item2 <= TuplesModule_L16F13L21T14_diff;
		Diff <= Logic_Item2;
		Same <= Logic_Item1;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
