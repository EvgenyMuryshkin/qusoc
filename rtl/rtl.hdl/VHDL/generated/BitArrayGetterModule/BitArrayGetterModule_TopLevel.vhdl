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
-- System configuration name is BitArrayGetterModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity BitArrayGetterModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Value : in unsigned (7 downto 0);
		Getter : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of BitArrayGetterModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L17F46T59_Expr : unsigned(7 downto 0) := "11111111";
	constant BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F36T38_Expr : unsigned(5 downto 0) := "110010";
	constant BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F41T44_Expr : unsigned(6 downto 0) := "1100100";
	signal Inputs_Value : unsigned(7 downto 0) := (others => '0');
	signal BitArrayGetterModule_L16F13L25T14_result : unsigned(7 downto 0) := (others => '0');
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L20F30T38_Cast : unsigned(7 downto 0) := "00101010";
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L22F30T70_Resize : unsigned(7 downto 0) := (others => '0');
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_Expr : std_logic := '0';
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprLhs : signed(8 downto 0) := "000000000";
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprRhs : signed(8 downto 0) := "000000000";
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_Expr : std_logic := '0';
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprLhs : signed(8 downto 0) := "000000000";
	signal BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprRhs : signed(8 downto 0) := "000000000";
begin
	BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_Expr <= '1' when (signed(resize(BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprLhs, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprLhs'length + 1)) < signed(resize(BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprRhs, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprRhs'length + 1))) else '0';
	BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_Expr <= '1' when (signed(resize(BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprLhs, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprLhs'length + 1)) < signed(resize(BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprRhs, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprRhs'length + 1))) else '0';
	process (BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_Expr, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L20F30T38_Cast, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_Expr, BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L22F30T70_Resize)
	begin
		BitArrayGetterModule_L16F13L25T14_result <= BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L17F46T59_Expr;
		if BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_Expr = '1' then
			BitArrayGetterModule_L16F13L25T14_result <= BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L20F30T38_Cast;
		elsif BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_Expr = '1' then
			BitArrayGetterModule_L16F13L25T14_result <= BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L22F30T70_Resize;
		end if;
	end process;
	process (BitArrayGetterModule_L16F13L25T14_result, Inputs_Value, Value)
	begin
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprLhs(8) <= '0';
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprLhs(7 downto 0) <= signed(Inputs_Value);
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprRhs(8 downto 6) <= (others => '0');
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F21T38_ExprRhs(5 downto 0) <= signed(BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L19F36T38_Expr);
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprLhs(8) <= '0';
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprLhs(7 downto 0) <= signed(Inputs_Value);
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprRhs(8 downto 7) <= (others => '0');
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F26T44_ExprRhs(6 downto 0) <= signed(BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L21F41T44_Expr);
		Inputs_Value <= Value;
		BitArrayGetterModule_L16F13L25T14_BitArrayGetterModule_L22F30T70_Resize <= Inputs_Value;
		Getter <= BitArrayGetterModule_L16F13L25T14_result;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
