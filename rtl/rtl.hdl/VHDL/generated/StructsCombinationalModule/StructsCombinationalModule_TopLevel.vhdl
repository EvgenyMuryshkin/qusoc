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
-- System configuration name is StructsCombinationalModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity StructsCombinationalModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		In_Op1 : in unsigned (7 downto 0);
		In_Op2 : in unsigned (7 downto 0);
		Op1 : out unsigned (7 downto 0);
		Sum : out unsigned (7 downto 0);
		OutDirect_Op1 : out unsigned (7 downto 0);
		OutDirect_Op2 : out unsigned (7 downto 0);
		OutInternal_Op1 : out unsigned (7 downto 0);
		OutInternal_Op2 : out unsigned (7 downto 0);
		OutSwapped_Op1 : out unsigned (7 downto 0);
		OutSwapped_Op2 : out unsigned (7 downto 0);
		OutMath_Op1 : out unsigned (7 downto 0);
		OutMath_Op2 : out unsigned (7 downto 0);
		Default1_Op1 : out unsigned (7 downto 0);
		Default1_Op2 : out unsigned (7 downto 0);
		Default2_Op1 : out unsigned (7 downto 0);
		Default2_Op2 : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of StructsCombinationalModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	constant StructsModule_L35F52T54_Expr : unsigned(5 downto 0) := "101010";
	constant StructsModule_L11F27T29_Expr : unsigned(4 downto 0) := "10100";
	constant StructsModule_L10F27T29_Expr : unsigned(3 downto 0) := "1010";
	signal Inputs_In_Op1 : unsigned(7 downto 0) := (others => '0');
	signal Inputs_In_Op2 : unsigned(7 downto 0) := (others => '0');
	signal internalDirect_Op1 : unsigned(7 downto 0) := (others => '0');
	signal internalDirect_Op2 : unsigned(7 downto 0) := (others => '0');
	signal internalSum : unsigned(7 downto 0) := (others => '0');
	signal StructsModule_L22F29T66_Cast : unsigned(7 downto 0) := (others => '0');
	signal StructsModule_L31F19T56_Cast : unsigned(7 downto 0) := (others => '0');
	signal StructsModule_L32F19T56_Cast : unsigned(7 downto 0) := (others => '0');
	signal StructsModule_L22F36T65_Expr : unsigned(9 downto 0) := "0000000000";
	signal StructsModule_L22F36T65_Expr_1 : signed(9 downto 0) := "0000000000";
	signal StructsModule_L22F36T65_Expr_2 : signed(9 downto 0) := "0000000000";
	signal StructsModule_L31F26T55_Expr : unsigned(9 downto 0) := "0000000000";
	signal StructsModule_L31F26T55_Expr_1 : signed(9 downto 0) := "0000000000";
	signal StructsModule_L31F26T55_Expr_2 : signed(9 downto 0) := "0000000000";
	signal StructsModule_L32F26T55_Expr : signed(9 downto 0) := "0000000000";
	signal StructsModule_L32F26T55_Expr_1 : signed(9 downto 0) := "0000000000";
	signal StructsModule_L32F26T55_Expr_2 : signed(9 downto 0) := "0000000000";
begin
	process (StructsModule_L22F36T65_Expr_1, StructsModule_L22F36T65_Expr_2)
	begin
		StructsModule_L22F36T65_Expr <= resize(unsigned(signed(resize(StructsModule_L22F36T65_Expr_1, StructsModule_L22F36T65_Expr_1'length + 1)) + signed(resize(StructsModule_L22F36T65_Expr_2, StructsModule_L22F36T65_Expr_2'length + 1))), StructsModule_L22F36T65_Expr'length);
	end process;
	process (StructsModule_L31F26T55_Expr_1, StructsModule_L31F26T55_Expr_2)
	begin
		StructsModule_L31F26T55_Expr <= resize(unsigned(signed(resize(StructsModule_L31F26T55_Expr_1, StructsModule_L31F26T55_Expr_1'length + 1)) + signed(resize(StructsModule_L31F26T55_Expr_2, StructsModule_L31F26T55_Expr_2'length + 1))), StructsModule_L31F26T55_Expr'length);
	end process;
	process (StructsModule_L32F26T55_Expr_1, StructsModule_L32F26T55_Expr_2)
	begin
		StructsModule_L32F26T55_Expr <= resize(signed(signed(resize(StructsModule_L32F26T55_Expr_1, StructsModule_L32F26T55_Expr_1'length + 1)) - signed(resize(StructsModule_L32F26T55_Expr_2, StructsModule_L32F26T55_Expr_2'length + 1))), StructsModule_L32F26T55_Expr'length);
	end process;
	process (In_Op1, In_Op2, Inputs_In_Op1, Inputs_In_Op2, internalDirect_Op1, internalDirect_Op2, internalSum, StructsModule_L22F29T66_Cast, StructsModule_L22F36T65_Expr, StructsModule_L31F19T56_Cast, StructsModule_L31F26T55_Expr, StructsModule_L32F19T56_Cast, StructsModule_L32F26T55_Expr)
	begin
		StructsModule_L22F36T65_Expr_1(9 downto 8) <= (others => '0');
		StructsModule_L22F36T65_Expr_1(7 downto 0) <= signed(Inputs_In_Op1);
		StructsModule_L22F36T65_Expr_2(9 downto 8) <= (others => '0');
		StructsModule_L22F36T65_Expr_2(7 downto 0) <= signed(Inputs_In_Op2);
		StructsModule_L31F26T55_Expr_1(9 downto 8) <= (others => '0');
		StructsModule_L31F26T55_Expr_1(7 downto 0) <= signed(Inputs_In_Op1);
		StructsModule_L31F26T55_Expr_2(9 downto 8) <= (others => '0');
		StructsModule_L31F26T55_Expr_2(7 downto 0) <= signed(Inputs_In_Op2);
		StructsModule_L32F26T55_Expr_1(9 downto 8) <= (others => '0');
		StructsModule_L32F26T55_Expr_1(7 downto 0) <= signed(Inputs_In_Op1);
		StructsModule_L32F26T55_Expr_2(9 downto 8) <= (others => '0');
		StructsModule_L32F26T55_Expr_2(7 downto 0) <= signed(Inputs_In_Op2);
		Inputs_In_Op1 <= In_Op1;
		Inputs_In_Op2 <= In_Op2;
		internalDirect_Op1 <= Inputs_In_Op1;
		internalDirect_Op2 <= Inputs_In_Op2;
		StructsModule_L22F29T66_Cast <= StructsModule_L22F36T65_Expr(7 downto 0);
		internalSum <= StructsModule_L22F29T66_Cast;
		Op1 <= Inputs_In_Op1;
		Sum <= internalSum;
		OutDirect_Op1 <= Inputs_In_Op1;
		OutDirect_Op2 <= Inputs_In_Op2;
		OutInternal_Op1 <= internalDirect_Op1;
		OutInternal_Op2 <= internalDirect_Op2;
		OutSwapped_Op1 <= Inputs_In_Op2;
		OutSwapped_Op2 <= Inputs_In_Op1;
		StructsModule_L31F19T56_Cast <= StructsModule_L31F26T55_Expr(7 downto 0);
		StructsModule_L32F19T56_Cast <= unsigned(StructsModule_L32F26T55_Expr(7 downto 0));
		OutMath_Op1 <= StructsModule_L31F19T56_Cast;
		OutMath_Op2 <= StructsModule_L32F19T56_Cast;
		Default1_Op1(7 downto 6) <= (others => '0');
		Default1_Op1(5 downto 0) <= StructsModule_L35F52T54_Expr;
		Default1_Op2(7 downto 5) <= (others => '0');
		Default1_Op2(4 downto 0) <= StructsModule_L11F27T29_Expr;
		Default2_Op1(7 downto 4) <= (others => '0');
		Default2_Op1(3 downto 0) <= StructsModule_L10F27T29_Expr;
		Default2_Op2(7 downto 5) <= (others => '0');
		Default2_Op2(4 downto 0) <= StructsModule_L11F27T29_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
