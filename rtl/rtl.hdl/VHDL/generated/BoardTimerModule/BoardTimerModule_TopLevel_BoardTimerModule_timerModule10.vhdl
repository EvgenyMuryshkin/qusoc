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
-- System configuration name is BoardTimerModule_TopLevel_BoardTimerModule_timerModule10, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Quokka.all;

entity BoardTimerModule_TopLevel_BoardTimerModule_timerModule10 is
    port
    (
-- [BEGIN USER PORTS]
-- [END USER PORTS]

BoardSignals : in  BoardSignalsType;
Restart : in  std_logic;
OutActive : out  std_logic
    );
end entity;

-- FSM summary
-- Packages
architecture rtl of BoardTimerModule_TopLevel_BoardTimerModule_timerModule10 is
-- [BEGIN USER SIGNALS]
-- [END USER SIGNALS]
constant HiSignal : std_logic := '1';
constant LoSignal : std_logic := '0';
constant Zero : std_logic := '0';
constant One : std_logic := '1';
constant true : std_logic := '1';
constant false : std_logic := '0';
constant countTo : unsigned(3 downto 0)  := "1001";
constant CapacityBits : unsigned(2 downto 0)  := "100";
constant TimerModule_L50F9L52T10_TimerModule_L51F79T80_Expr : std_logic := '0';
constant TimerModule_L50F9L52T10_TimerModule_L51F100T101_Expr : std_logic := '1';
signal Inputs_Restart : std_logic := '0';
signal NextState_counter : unsigned(3 downto 0) := (others => '0');
signal active : std_logic := '0';
signal TimerModule_L50F9L52T10_TimerModule_L51F63T81_Source : std_logic := '0';
signal TimerModule_L50F9L52T10_TimerModule_L51F33T124_Resize : unsigned(3 downto 0) := (others => '0');
signal State_counter : unsigned(3 downto 0)  := "0000";
constant State_counterDefault : unsigned(3 downto 0)  := "0000";
signal TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr : std_logic := '0';
signal TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_1 : std_logic := '0';
signal TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_2 : std_logic := '0';
signal TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr : unsigned(5 downto 0)  := "000000";
signal TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_1 : signed(5 downto 0)  := "000000";
signal TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_2 : signed(5 downto 0)  := "000000";
signal TimerModule_L46F24T48_Expr : std_logic := '0';
signal TimerModule_L46F24T48_ExprLhs : signed(4 downto 0)  := "00000";
signal TimerModule_L46F24T48_ExprRhs : signed(4 downto 0)  := "00000";
signal TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup : unsigned(3 downto 0)  := "0000";
signal TimerModule_L50F9L52T10_TimerModule_L51F34T101_LookupMultiplexerAddress : std_logic := '0';
signal TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup1 : unsigned(3 downto 0)  := "0000";
signal TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup2 : unsigned(3 downto 0)  := "0000";
begin
process (BoardSignals, NextState_counter)
begin
if rising_edge(BoardSignals.Clock) then
if ( BoardSignals.Reset = '1' ) then
State_counter <= State_counterDefault;
else
State_counter <= NextState_counter;
end if;
end if;
end process;
    TimerModule_L46F24T48_Expr <= '1' when (signed(resize(TimerModule_L46F24T48_ExprLhs, TimerModule_L46F24T48_ExprLhs'length + 1)) = signed(resize(TimerModule_L46F24T48_ExprRhs, TimerModule_L46F24T48_ExprRhs'length + 1))) else '0';

process(TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_1, TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_2)
begin
TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr <= TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_1 OR TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_2;

    end process;

process(TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_1, TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_2)
begin
    TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr <= resize(unsigned(signed(resize(TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_1, TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_1'length + 1)) + signed(resize(TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_2, TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_2'length + 1))), TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr'length);

end process;
process(TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup1, TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup2, TimerModule_L50F9L52T10_TimerModule_L51F34T101_LookupMultiplexerAddress)
begin
case TimerModule_L50F9L52T10_TimerModule_L51F34T101_LookupMultiplexerAddress is
  when '0' => 
TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup <= TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup1;
  when '1' => 
TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup <= TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup2;
  when others => 
TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup <= "0000";
end case;

end process;
process(State_counter, TimerModule_L50F9L52T10_TimerModule_L51F33T124_Resize)
begin
NextState_counter <= State_counter;
NextState_counter <= TimerModule_L50F9L52T10_TimerModule_L51F33T124_Resize;
end process;
process(active, Inputs_Restart, Restart, State_counter, TimerModule_L46F24T48_Expr, TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup, TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr, TimerModule_L50F9L52T10_TimerModule_L51F63T81_Source, TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr)
begin
TimerModule_L46F24T48_ExprLhs <= signed(resize(unsigned(State_counter), TimerModule_L46F24T48_ExprLhs'length));
TimerModule_L46F24T48_ExprRhs <= signed(resize(unsigned(countTo), TimerModule_L46F24T48_ExprRhs'length));
TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_1 <= Inputs_Restart;
TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr_2 <= active;
TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_1 <= signed(resize(unsigned(State_counter), TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_1'length));
TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr_2 <= (0 => TimerModule_L50F9L52T10_TimerModule_L51F100T101_Expr, others => '0');
Inputs_Restart <= Restart;
active <= TimerModule_L46F24T48_Expr;
TimerModule_L50F9L52T10_TimerModule_L51F63T81_Source <= TimerModule_L50F9L52T10_TimerModule_L51F79T80_Expr;
TimerModule_L50F9L52T10_TimerModule_L51F33T124_Resize <= TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup;
OutActive <= active;
TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup1 <= TimerModule_L50F9L52T10_TimerModule_L51F84T101_Expr(3 downto 0);
TimerModule_L50F9L52T10_TimerModule_L51F34T101_Lookup2 <= (0 => TimerModule_L50F9L52T10_TimerModule_L51F63T81_Source, others => '0');
TimerModule_L50F9L52T10_TimerModule_L51F34T101_LookupMultiplexerAddress <= TimerModule_L50F9L52T10_TimerModule_L51F35T59_Expr;
end process;
-- [BEGIN USER ARCHITECTURE]
-- [END USER ARCHITECTURE]
end architecture;
