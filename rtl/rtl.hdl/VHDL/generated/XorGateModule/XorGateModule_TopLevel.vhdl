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
-- System configuration name is XorGateModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity XorGateModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		I1 : in std_logic;
		I2 : in std_logic;
		O : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of XorGateModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_I1 : std_logic := '0';
	signal Inputs_I2 : std_logic := '0';
	signal XorGateModule_L8F26T47_Expr : std_logic := '0';
	signal XorGateModule_L8F26T47_Expr_1 : std_logic := '0';
	signal XorGateModule_L8F26T47_Expr_2 : std_logic := '0';
begin
	process (XorGateModule_L8F26T47_Expr_1, XorGateModule_L8F26T47_Expr_2)
	begin
		XorGateModule_L8F26T47_Expr <= XorGateModule_L8F26T47_Expr_1 XOR XorGateModule_L8F26T47_Expr_2;
	end process;
	process (I1, I2, Inputs_I1, Inputs_I2, XorGateModule_L8F26T47_Expr)
	begin
		XorGateModule_L8F26T47_Expr_1 <= Inputs_I1;
		XorGateModule_L8F26T47_Expr_2 <= Inputs_I2;
		Inputs_I1 <= I1;
		Inputs_I2 <= I2;
		O <= XorGateModule_L8F26T47_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
