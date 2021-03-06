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
-- System configuration name is CoderModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Quokka.all;

entity CoderModule_TopLevel is
    port
    (
-- [BEGIN USER PORTS]
-- [END USER PORTS]

Clock : in  std_logic;
Reset : in  std_logic;
dec : in  unsigned(15 downto 0);
IN1 : out  signed(1 downto 0);
IN2 : out  signed(1 downto 0)
    );
end entity;

-- FSM summary
-- Packages
architecture rtl of CoderModule_TopLevel is
-- [BEGIN USER SIGNALS]
-- [END USER SIGNALS]
constant HiSignal : std_logic := '1';
constant LoSignal : std_logic := '0';
constant Zero : std_logic := '0';
constant One : std_logic := '1';
constant true : std_logic := '1';
constant false : std_logic := '0';
constant CoderModule_L15F47T48_Expr : std_logic := '0';
constant CoderModule_L19F13L31T14_CoderModule_L20F31T32_Expr : std_logic := '0';
constant CoderModule_L19F13L31T14_CoderModule_L21F38T39_Expr : std_logic := '1';
constant CoderModule_L19F13L31T14_CoderModule_L21F60T61_Expr : unsigned(2 downto 0)  := "101";
constant CoderModule_L19F13L31T14_CoderModule_L22F30T31_Expr : unsigned(1 downto 0)  := "10";
constant CoderModule_L19F13L31T14_CoderModule_L24F38T39_Expr : unsigned(2 downto 0)  := "111";
constant CoderModule_L19F13L31T14_CoderModule_L24F60T62_Expr : unsigned(3 downto 0)  := "1011";
constant CoderModule_L19F13L31T14_CoderModule_L25F30T31_Expr : std_logic := '1';
constant CoderModule_L19F13L31T14_CoderModule_L27F38T41_Expr : unsigned(9 downto 0)  := "1011101111";
constant CoderModule_L19F13L31T14_CoderModule_L27F62T66_Expr : unsigned(11 downto 0)  := "100111000101";
constant CoderModule_L19F13L31T14_CoderModule_L28F30T31_Expr : unsigned(1 downto 0)  := "11";
constant CoderModule_L37F9L39T10_CoderModule_L38F59T64_Expr : unsigned(14 downto 0)  := "110000110101001";
constant CoderModule_L37F9L39T10_CoderModule_L38F67T68_Expr : std_logic := '0';
constant CoderModule_L37F9L39T10_CoderModule_L38F87T88_Expr : std_logic := '1';
constant CoderModule_L33F49T55_Expr : unsigned(15 downto 0)  := "1111111111111110";
constant CoderModule_L34F49T55_Expr : unsigned(15 downto 0)  := "1111111111111101";
signal Inputs_dec : unsigned(15 downto 0) := (others => '0');
signal NextState_counter : unsigned(15 downto 0) := (others => '0');
signal INNone : signed(1 downto 0) := (others => '0');
signal INx : unsigned(1 downto 0) := (others => '0');
signal CoderModule_L15F31T49_Source : std_logic := '0';
signal CoderModule_L15F31T60_Resize : unsigned(1 downto 0) := (others => '0');
signal CoderModule_L19F13L31T14_result : unsigned(7 downto 0)  := "00000000";
signal CoderModule_L19F13L31T14_CoderModule_L30F24T47_Source : unsigned(7 downto 0) := (others => '0');
signal CoderModule_L19F13L31T14_CoderModule_L30F24T53_Index : unsigned(1 downto 0) := (others => '0');
signal CoderModule_L37F9L39T10_CoderModule_L38F33T89_Cast : unsigned(15 downto 0) := (others => '0');
signal State_counter : unsigned(15 downto 0)  := "0000000000000000";
constant State_counterDefault : unsigned(15 downto 0)  := "0000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_1 : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_2 : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_1 : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_2 : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_1 : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_2 : std_logic := '0';
signal CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr : unsigned(17 downto 0)  := "000000000000000000";
signal CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_1 : signed(17 downto 0)  := "000000000000000000";
signal CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_2 : signed(17 downto 0)  := "000000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L21F21T39_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L21F43T61_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L24F21T39_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L24F43T62_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L27F21T41_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L27F45T66_Expr : std_logic := '0';
signal CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L37F9L39T10_CoderModule_L38F42T64_Expr : std_logic := '0';
signal CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L33F35T55_Expr : std_logic := '0';
signal CoderModule_L33F35T55_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L33F35T55_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L34F35T55_Expr : std_logic := '0';
signal CoderModule_L34F35T55_ExprLhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L34F35T55_ExprRhs : signed(16 downto 0)  := "00000000000000000";
signal CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup : unsigned(15 downto 0)  := "0000000000000000";
signal CoderModule_L33F35T70_Lookup : unsigned(1 downto 0)  := "00";
signal CoderModule_L34F35T70_Lookup : unsigned(1 downto 0)  := "00";
signal CoderModule_L37F9L39T10_CoderModule_L38F42T88_LookupMultiplexerAddress : std_logic := '0';
signal CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup1 : unsigned(15 downto 0)  := "0000000000000000";
signal CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup2 : unsigned(15 downto 0)  := "0000000000000000";
signal CoderModule_L33F35T70_LookupMultiplexerAddress : std_logic := '0';
signal CoderModule_L33F35T70_Lookup1 : unsigned(1 downto 0)  := "00";
signal CoderModule_L33F35T70_Lookup2 : unsigned(1 downto 0)  := "00";
signal CoderModule_L34F35T70_LookupMultiplexerAddress : std_logic := '0';
signal CoderModule_L34F35T70_Lookup1 : unsigned(1 downto 0)  := "00";
signal CoderModule_L34F35T70_Lookup2 : unsigned(1 downto 0)  := "00";
begin
process (Clock, NextState_counter, Reset)
begin
if rising_edge(Clock) then
if ( Reset = '1' ) then
State_counter <= State_counterDefault;
else
State_counter <= NextState_counter;
end if;
end if;
end process;
    CoderModule_L19F13L31T14_CoderModule_L21F21T39_Expr <= '1' when (signed(resize(CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprLhs, CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprLhs'length + 1)) >= signed(resize(CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprRhs, CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprRhs'length + 1))) else '0';
    CoderModule_L19F13L31T14_CoderModule_L21F43T61_Expr <= '1' when (signed(resize(CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprLhs, CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprLhs'length + 1)) <= signed(resize(CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprRhs, CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprRhs'length + 1))) else '0';
    CoderModule_L19F13L31T14_CoderModule_L24F21T39_Expr <= '1' when (signed(resize(CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprLhs, CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprLhs'length + 1)) >= signed(resize(CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprRhs, CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprRhs'length + 1))) else '0';
    CoderModule_L19F13L31T14_CoderModule_L24F43T62_Expr <= '1' when (signed(resize(CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprLhs, CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprLhs'length + 1)) <= signed(resize(CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprRhs, CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprRhs'length + 1))) else '0';
    CoderModule_L19F13L31T14_CoderModule_L27F21T41_Expr <= '1' when (signed(resize(CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprLhs, CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprLhs'length + 1)) >= signed(resize(CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprRhs, CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprRhs'length + 1))) else '0';
    CoderModule_L19F13L31T14_CoderModule_L27F45T66_Expr <= '1' when (signed(resize(CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprLhs, CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprLhs'length + 1)) <= signed(resize(CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprRhs, CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprRhs'length + 1))) else '0';
    CoderModule_L37F9L39T10_CoderModule_L38F42T64_Expr <= '1' when (signed(resize(CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprLhs, CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprLhs'length + 1)) = signed(resize(CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprRhs, CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprRhs'length + 1))) else '0';
    CoderModule_L33F35T55_Expr <= '1' when (signed(resize(CoderModule_L33F35T55_ExprLhs, CoderModule_L33F35T55_ExprLhs'length + 1)) = signed(resize(CoderModule_L33F35T55_ExprRhs, CoderModule_L33F35T55_ExprRhs'length + 1))) else '0';
    CoderModule_L34F35T55_Expr <= '1' when (signed(resize(CoderModule_L34F35T55_ExprLhs, CoderModule_L34F35T55_ExprLhs'length + 1)) = signed(resize(CoderModule_L34F35T55_ExprRhs, CoderModule_L34F35T55_ExprRhs'length + 1))) else '0';

process(CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_1, CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_2)
begin
CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr <= CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_1 AND CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_2;

    end process;

process(CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_1, CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_2)
begin
CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr <= CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_1 AND CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_2;

    end process;

process(CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_1, CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_2)
begin
CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr <= CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_1 AND CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_2;

    end process;

process(CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_1, CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_2)
begin
    CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr <= resize(unsigned(signed(resize(CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_1, CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_1'length + 1)) + signed(resize(CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_2, CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_2'length + 1))), CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr'length);

end process;
process(CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup1, CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup2, CoderModule_L37F9L39T10_CoderModule_L38F42T88_LookupMultiplexerAddress)
begin
case CoderModule_L37F9L39T10_CoderModule_L38F42T88_LookupMultiplexerAddress is
  when '0' => 
CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup <= CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup1;
  when '1' => 
CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup <= CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup2;
  when others => 
CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup <= "0000000000000000";
end case;

end process;
process(CoderModule_L33F35T70_Lookup1, CoderModule_L33F35T70_Lookup2, CoderModule_L33F35T70_LookupMultiplexerAddress)
begin
case CoderModule_L33F35T70_LookupMultiplexerAddress is
  when '0' => 
CoderModule_L33F35T70_Lookup <= CoderModule_L33F35T70_Lookup1;
  when '1' => 
CoderModule_L33F35T70_Lookup <= CoderModule_L33F35T70_Lookup2;
  when others => 
CoderModule_L33F35T70_Lookup <= "00";
end case;

end process;
process(CoderModule_L34F35T70_Lookup1, CoderModule_L34F35T70_Lookup2, CoderModule_L34F35T70_LookupMultiplexerAddress)
begin
case CoderModule_L34F35T70_LookupMultiplexerAddress is
  when '0' => 
CoderModule_L34F35T70_Lookup <= CoderModule_L34F35T70_Lookup1;
  when '1' => 
CoderModule_L34F35T70_Lookup <= CoderModule_L34F35T70_Lookup2;
  when others => 
CoderModule_L34F35T70_Lookup <= "00";
end case;

end process;
process(CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr, CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr, CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr)
begin
CoderModule_L19F13L31T14_result <= (0 => CoderModule_L19F13L31T14_CoderModule_L20F31T32_Expr, others => '0');
if ( CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr = '1' ) then
CoderModule_L19F13L31T14_result <= unsigned(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L22F30T31_Expr), CoderModule_L19F13L31T14_result'length));
end if;
if ( CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr = '1' ) then
CoderModule_L19F13L31T14_result <= (0 => CoderModule_L19F13L31T14_CoderModule_L25F30T31_Expr, others => '0');
end if;
if ( CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr = '1' ) then
CoderModule_L19F13L31T14_result <= unsigned(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L28F30T31_Expr), CoderModule_L19F13L31T14_result'length));
end if;
end process;
process(CoderModule_L37F9L39T10_CoderModule_L38F33T89_Cast, State_counter)
begin
NextState_counter <= State_counter;
NextState_counter <= CoderModule_L37F9L39T10_CoderModule_L38F33T89_Cast;
end process;
process(CoderModule_L15F31T49_Source, CoderModule_L15F31T60_Resize, CoderModule_L19F13L31T14_CoderModule_L21F21T39_Expr, CoderModule_L19F13L31T14_CoderModule_L21F43T61_Expr, CoderModule_L19F13L31T14_CoderModule_L24F21T39_Expr, CoderModule_L19F13L31T14_CoderModule_L24F43T62_Expr, CoderModule_L19F13L31T14_CoderModule_L27F21T41_Expr, CoderModule_L19F13L31T14_CoderModule_L27F45T66_Expr, CoderModule_L19F13L31T14_CoderModule_L30F24T47_Source, CoderModule_L19F13L31T14_CoderModule_L30F24T53_Index, CoderModule_L19F13L31T14_result, CoderModule_L33F35T55_Expr, CoderModule_L33F35T70_Lookup, CoderModule_L34F35T55_Expr, CoderModule_L34F35T70_Lookup, CoderModule_L37F9L39T10_CoderModule_L38F42T64_Expr, CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup, CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr, dec, INNone, Inputs_dec, INx, State_counter)
begin
CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprLhs'length));
CoderModule_L19F13L31T14_CoderModule_L21F21T39_ExprRhs <= (0 => CoderModule_L19F13L31T14_CoderModule_L21F38T39_Expr, others => '0');
CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprLhs'length));
CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprRhs <= signed(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L21F60T61_Expr), CoderModule_L19F13L31T14_CoderModule_L21F43T61_ExprRhs'length));
CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprLhs'length));
CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprRhs <= signed(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L24F38T39_Expr), CoderModule_L19F13L31T14_CoderModule_L24F21T39_ExprRhs'length));
CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprLhs'length));
CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprRhs <= signed(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L24F60T62_Expr), CoderModule_L19F13L31T14_CoderModule_L24F43T62_ExprRhs'length));
CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprLhs'length));
CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprRhs <= signed(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L27F38T41_Expr), CoderModule_L19F13L31T14_CoderModule_L27F21T41_ExprRhs'length));
CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprLhs'length));
CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprRhs <= signed(resize(unsigned(CoderModule_L19F13L31T14_CoderModule_L27F62T66_Expr), CoderModule_L19F13L31T14_CoderModule_L27F45T66_ExprRhs'length));
CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprLhs <= signed(resize(unsigned(State_counter), CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprLhs'length));
CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprRhs <= signed(resize(unsigned(CoderModule_L37F9L39T10_CoderModule_L38F59T64_Expr), CoderModule_L37F9L39T10_CoderModule_L38F42T64_ExprRhs'length));
CoderModule_L33F35T55_ExprLhs <= signed(resize(unsigned(Inputs_dec), CoderModule_L33F35T55_ExprLhs'length));
CoderModule_L33F35T55_ExprRhs <= signed(resize(unsigned(CoderModule_L33F49T55_Expr), CoderModule_L33F35T55_ExprRhs'length));
CoderModule_L34F35T55_ExprLhs <= signed(resize(unsigned(Inputs_dec), CoderModule_L34F35T55_ExprLhs'length));
CoderModule_L34F35T55_ExprRhs <= signed(resize(unsigned(CoderModule_L34F49T55_Expr), CoderModule_L34F35T55_ExprRhs'length));
CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_1 <= CoderModule_L19F13L31T14_CoderModule_L21F21T39_Expr;
CoderModule_L19F13L31T14_CoderModule_L21F21T61_Expr_2 <= CoderModule_L19F13L31T14_CoderModule_L21F43T61_Expr;
CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_1 <= CoderModule_L19F13L31T14_CoderModule_L24F21T39_Expr;
CoderModule_L19F13L31T14_CoderModule_L24F21T62_Expr_2 <= CoderModule_L19F13L31T14_CoderModule_L24F43T62_Expr;
CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_1 <= CoderModule_L19F13L31T14_CoderModule_L27F21T41_Expr;
CoderModule_L19F13L31T14_CoderModule_L27F21T66_Expr_2 <= CoderModule_L19F13L31T14_CoderModule_L27F45T66_Expr;
CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_1 <= signed(resize(unsigned(State_counter), CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_1'length));
CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr_2 <= (0 => CoderModule_L37F9L39T10_CoderModule_L38F87T88_Expr, others => '0');
Inputs_dec <= dec;
CoderModule_L15F31T49_Source <= CoderModule_L15F47T48_Expr;
CoderModule_L15F31T60_Resize <= (0 => CoderModule_L15F31T49_Source, others => '0');
INNone <= signed(CoderModule_L15F31T60_Resize);
CoderModule_L19F13L31T14_CoderModule_L30F24T47_Source <= CoderModule_L19F13L31T14_result;
CoderModule_L19F13L31T14_CoderModule_L30F24T53_Index <= CoderModule_L19F13L31T14_CoderModule_L30F24T47_Source(1 downto 0);
INx <= CoderModule_L19F13L31T14_CoderModule_L30F24T53_Index;
CoderModule_L37F9L39T10_CoderModule_L38F33T89_Cast <= CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup;
IN1 <= signed(CoderModule_L33F35T70_Lookup);
IN2 <= signed(CoderModule_L34F35T70_Lookup);
CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup1 <= CoderModule_L37F9L39T10_CoderModule_L38F71T88_Expr(15 downto 0);
CoderModule_L37F9L39T10_CoderModule_L38F42T88_Lookup2 <= (0 => CoderModule_L37F9L39T10_CoderModule_L38F67T68_Expr, others => '0');
CoderModule_L37F9L39T10_CoderModule_L38F42T88_LookupMultiplexerAddress <= CoderModule_L37F9L39T10_CoderModule_L38F42T64_Expr;
CoderModule_L33F35T70_Lookup1 <= unsigned(INNone);
CoderModule_L33F35T70_Lookup2 <= INx;
CoderModule_L33F35T70_LookupMultiplexerAddress <= CoderModule_L33F35T55_Expr;
CoderModule_L34F35T70_Lookup1 <= unsigned(INNone);
CoderModule_L34F35T70_Lookup2 <= INx;
CoderModule_L34F35T70_LookupMultiplexerAddress <= CoderModule_L34F35T55_Expr;
end process;
-- [BEGIN USER ARCHITECTURE]
-- [END USER ARCHITECTURE]
end architecture;
