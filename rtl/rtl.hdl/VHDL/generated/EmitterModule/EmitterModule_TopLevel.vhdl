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
-- System configuration name is EmitterModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity EmitterModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		Ack : in std_logic;
		IsEnabled : in std_logic;
		Data : out unsigned (7 downto 0);
		HasData : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of EmitterModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant EmitterModule_L22F9L25T10_EmitterModule_L24F54T55_Expr : std_logic := '1';
	signal Inputs_Ack : std_logic := '0';
	signal Inputs_IsEnabled : std_logic := '0';
	signal NextState_Data : unsigned(7 downto 0) := (others => '0');
	signal EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast : unsigned(7 downto 0) := (others => '0');
	signal State_Data : unsigned(7 downto 0) := "00000000";
	constant State_DataDefault : unsigned(7 downto 0) := "00000000";
	signal EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr : std_logic := '0';
	signal EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1 : std_logic := '0';
	signal EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2 : std_logic := '0';
	signal EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr : unsigned(9 downto 0) := "0000000000";
	signal EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1 : signed(9 downto 0) := "0000000000";
	signal EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2 : signed(9 downto 0) := "0000000000";
begin
	process (Clock, NextState_Data, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_Data <= State_DataDefault;
			else
				State_Data <= NextState_Data;
			end if;
		end if;
	end process;
	process (EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1, EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2)
	begin
		EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr <= EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1 AND EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2;
	end process;
	process (EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1, EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2)
	begin
		EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr <= resize(unsigned(signed(resize(EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1, EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1'length + 1)) + signed(resize(EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2, EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2'length + 1))), EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr'length);
	end process;
	process (EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr, EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast, State_Data)
	begin
		NextState_Data <= State_Data;
		if EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr = '1' then
			NextState_Data <= EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast;
		end if;
	end process;
	process (Ack, EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr, Inputs_Ack, Inputs_IsEnabled, IsEnabled, State_Data)
	begin
		EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1 <= Inputs_IsEnabled;
		EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2 <= Inputs_Ack;
		EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1(9 downto 8) <= (
			others => '0'
		)
		;
		EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1(7 downto 0) <= signed(State_Data);
		EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2(9 downto 1) <= (
			others => '0'
		)
		;
		EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2(0) <= EmitterModule_L22F9L25T10_EmitterModule_L24F54T55_Expr;
		Inputs_Ack <= Ack;
		Inputs_IsEnabled <= IsEnabled;
		EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast <= EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr(7 downto 0);
		Data <= State_Data;
		HasData <= Inputs_IsEnabled;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
