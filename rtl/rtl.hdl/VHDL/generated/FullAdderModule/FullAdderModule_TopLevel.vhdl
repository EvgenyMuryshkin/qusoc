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
-- System configuration name is FullAdderModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FullAdderModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		A : in std_logic;
		B : in std_logic;
		CIn : in std_logic;
		COut : out std_logic;
		O : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FullAdderModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_A : std_logic := '0';
	signal Inputs_B : std_logic := '0';
	signal Inputs_CIn : std_logic := '0';
	signal P : std_logic := '0';
	signal FullAdder_L14F27T46_Expr : std_logic := '0';
	signal FullAdder_L14F27T46_Expr_1 : std_logic := '0';
	signal FullAdder_L14F27T46_Expr_2 : std_logic := '0';
	signal FullAdder_L17F29T70_Expr : std_logic := '0';
	signal FullAdder_L17F29T70_Expr_1 : std_logic := '0';
	signal FullAdder_L17F29T70_Expr_2 : std_logic := '0';
	signal FullAdder_L17F30T49_Expr : std_logic := '0';
	signal FullAdder_L17F30T49_Expr_1 : std_logic := '0';
	signal FullAdder_L17F30T49_Expr_2 : std_logic := '0';
	signal FullAdder_L17F55T69_Expr : std_logic := '0';
	signal FullAdder_L17F55T69_Expr_1 : std_logic := '0';
	signal FullAdder_L17F55T69_Expr_2 : std_logic := '0';
	signal FullAdder_L16F26T40_Expr : std_logic := '0';
	signal FullAdder_L16F26T40_Expr_1 : std_logic := '0';
	signal FullAdder_L16F26T40_Expr_2 : std_logic := '0';
begin
	process (FullAdder_L14F27T46_Expr_1, FullAdder_L14F27T46_Expr_2)
	begin
		FullAdder_L14F27T46_Expr <= FullAdder_L14F27T46_Expr_1 XOR FullAdder_L14F27T46_Expr_2;
	end process;
	process (FullAdder_L17F29T70_Expr_1, FullAdder_L17F29T70_Expr_2)
	begin
		FullAdder_L17F29T70_Expr <= FullAdder_L17F29T70_Expr_1 OR FullAdder_L17F29T70_Expr_2;
	end process;
	process (FullAdder_L17F30T49_Expr_1, FullAdder_L17F30T49_Expr_2)
	begin
		FullAdder_L17F30T49_Expr <= FullAdder_L17F30T49_Expr_1 AND FullAdder_L17F30T49_Expr_2;
	end process;
	process (FullAdder_L17F55T69_Expr_1, FullAdder_L17F55T69_Expr_2)
	begin
		FullAdder_L17F55T69_Expr <= FullAdder_L17F55T69_Expr_1 AND FullAdder_L17F55T69_Expr_2;
	end process;
	process (FullAdder_L16F26T40_Expr_1, FullAdder_L16F26T40_Expr_2)
	begin
		FullAdder_L16F26T40_Expr <= FullAdder_L16F26T40_Expr_1 XOR FullAdder_L16F26T40_Expr_2;
	end process;
	process (A, B, CIn, FullAdder_L14F27T46_Expr, FullAdder_L16F26T40_Expr, FullAdder_L17F29T70_Expr, FullAdder_L17F30T49_Expr, FullAdder_L17F55T69_Expr, Inputs_A, Inputs_B, Inputs_CIn, P)
	begin
		FullAdder_L14F27T46_Expr_1 <= Inputs_A;
		FullAdder_L14F27T46_Expr_2 <= Inputs_B;
		FullAdder_L17F29T70_Expr_1 <= FullAdder_L17F30T49_Expr;
		FullAdder_L17F29T70_Expr_2 <= FullAdder_L17F55T69_Expr;
		FullAdder_L17F30T49_Expr_1 <= Inputs_A;
		FullAdder_L17F30T49_Expr_2 <= Inputs_B;
		FullAdder_L17F55T69_Expr_1 <= P;
		FullAdder_L17F55T69_Expr_2 <= Inputs_CIn;
		FullAdder_L16F26T40_Expr_1 <= P;
		FullAdder_L16F26T40_Expr_2 <= Inputs_CIn;
		Inputs_A <= A;
		Inputs_B <= B;
		Inputs_CIn <= CIn;
		P <= FullAdder_L14F27T46_Expr;
		COut <= FullAdder_L17F29T70_Expr;
		O <= FullAdder_L16F26T40_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
