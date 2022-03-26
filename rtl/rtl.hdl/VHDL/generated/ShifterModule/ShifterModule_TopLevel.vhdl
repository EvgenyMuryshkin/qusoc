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
-- System configuration name is ShifterModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity ShifterModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Value : in unsigned (7 downto 0);
		ShiftBy : in unsigned (2 downto 0);
		SHLL : out unsigned (7 downto 0);
		SHRL : out unsigned (7 downto 0);
		SHRA : out signed (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of ShifterModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	signal Inputs_Value : unsigned(7 downto 0) := (others => '0');
	signal Inputs_ShiftBy : unsigned(2 downto 0) := (others => '0');
	signal ShifterModule_L14F36T59_SignChange : unsigned(7 downto 0) := (others => '0');
	signal ShifterModule_L15F36T57_SignChange : signed(7 downto 0) := (others => '0');
	signal ShifterModule_L13F36T66_Expr : unsigned(7 downto 0) := "00000000";
	signal ShifterModule_L13F36T66_Expr_1 : unsigned(7 downto 0) := "00000000";
	signal ShifterModule_L14F36T77_Expr : unsigned(7 downto 0) := "00000000";
	signal ShifterModule_L14F36T77_Expr_1 : unsigned(7 downto 0) := "00000000";
	signal ShifterModule_L15F36T75_Expr : signed(7 downto 0) := "00000000";
	signal ShifterModule_L15F36T75_Expr_1 : signed(7 downto 0) := "00000000";
begin
	process (ShifterModule_L13F36T66_Expr_1, Inputs_ShiftBy)
	begin
		ShifterModule_L13F36T66_Expr <= shift_left(ShifterModule_L13F36T66_Expr_1, to_integer(Inputs_ShiftBy));
	end process;
	process (ShifterModule_L14F36T77_Expr_1, Inputs_ShiftBy)
	begin
		ShifterModule_L14F36T77_Expr <= shift_right(unsigned(ShifterModule_L14F36T77_Expr_1), to_integer(Inputs_ShiftBy));
	end process;
	process (ShifterModule_L15F36T75_Expr_1, Inputs_ShiftBy)
	begin
		ShifterModule_L15F36T75_Expr <= shift_right(signed(ShifterModule_L15F36T75_Expr_1), to_integer(Inputs_ShiftBy));
	end process;
	process (Inputs_Value, ShiftBy, ShifterModule_L13F36T66_Expr, ShifterModule_L14F36T59_SignChange, ShifterModule_L14F36T77_Expr, ShifterModule_L15F36T57_SignChange, ShifterModule_L15F36T75_Expr, Value)
	begin
		ShifterModule_L13F36T66_Expr_1 <= Inputs_Value;
		ShifterModule_L14F36T77_Expr_1 <= ShifterModule_L14F36T59_SignChange;
		ShifterModule_L15F36T75_Expr_1 <= ShifterModule_L15F36T57_SignChange;
		Inputs_Value <= Value;
		Inputs_ShiftBy <= ShiftBy;
		SHLL <= ShifterModule_L13F36T66_Expr;
		ShifterModule_L14F36T59_SignChange <= Inputs_Value;
		SHRL <= ShifterModule_L14F36T77_Expr;
		ShifterModule_L15F36T57_SignChange <= signed(Inputs_Value);
		SHRA <= ShifterModule_L15F36T75_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
