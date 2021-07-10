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
-- System configuration name is VGAAlienArtModule_TopLevel_VGAAlienArtModule_vgaController_VGAController_vSync, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Quokka.all;

entity VGAAlienArtModule_TopLevel_VGAAlienArtModule_vgaController_VGAController_vSync is
    port
    (
-- [BEGIN USER PORTS]
-- [END USER PORTS]

BoardSignals : in  BoardSignalsType;
Enabled : in  std_logic;
OutVisible : out  std_logic;
OutFP : out  std_logic;
OutSP : out  std_logic;
OutBP : out  std_logic;
OutMax : out  std_logic;
OutCounter : out  unsigned(10 downto 1)
    );
end entity;

-- FSM summary
-- Packages
architecture rtl of VGAAlienArtModule_TopLevel_VGAAlienArtModule_vgaController_VGAController_vSync is
-- [BEGIN USER SIGNALS]
-- [END USER SIGNALS]
constant HiSignal : std_logic := '1';
constant LoSignal : std_logic := '0';
constant Zero : std_logic := '0';
constant One : std_logic := '1';
constant true : std_logic := '1';
constant false : std_logic := '0';
constant visible : unsigned(9 downto 0)  := "1001011000";
constant fp : unsigned(9 downto 0)  := "1001011001";
constant sp : unsigned(9 downto 0)  := "1001011101";
constant bp : unsigned(9 downto 0)  := "1001110100";
constant max : unsigned(9 downto 0)  := "1001110011";
constant capacity : unsigned(3 downto 0)  := "1010";
constant VGASyncModule_L64F9L67T10_VGASyncModule_L66F85T86_Expr : std_logic := '0';
constant VGASyncModule_L64F9L67T10_VGASyncModule_L66F106T107_Expr : std_logic := '1';
signal Inputs_Enabled : std_logic := '0';
signal NextState_counter : unsigned(9 downto 0) := (others => '0');
signal internalIsMax : std_logic := '0';
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T108_Source : unsigned(9 downto 0) := (others => '0');
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F69T87_Source : std_logic := '0';
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize : unsigned(9 downto 0) := (others => '0');
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange : unsigned(9 downto 0) := (others => '0');
signal State_counter : unsigned(9 downto 0)  := "0000000000";
constant State_counterDefault : unsigned(9 downto 0)  := "0000000000";
signal VGASyncModule_L57F30T76_Expr : std_logic := '0';
signal VGASyncModule_L57F30T76_Expr_1 : std_logic := '0';
signal VGASyncModule_L57F30T76_Expr_2 : std_logic := '0';
signal VGASyncModule_L58F30T71_Expr : std_logic := '0';
signal VGASyncModule_L58F30T71_Expr_1 : std_logic := '0';
signal VGASyncModule_L58F30T71_Expr_2 : std_logic := '0';
signal VGASyncModule_L59F30T71_Expr : std_logic := '0';
signal VGASyncModule_L59F30T71_Expr_1 : std_logic := '0';
signal VGASyncModule_L59F30T71_Expr_2 : std_logic := '0';
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr : unsigned(11 downto 0)  := "000000000000";
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1 : signed(11 downto 0)  := "000000000000";
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2 : signed(11 downto 0)  := "000000000000";
signal VGASyncModule_L54F31T51_Expr : std_logic := '0';
signal VGASyncModule_L54F31T51_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L54F31T51_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L56F35T58_Expr : std_logic := '0';
signal VGASyncModule_L56F35T58_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L56F35T58_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L57F30T54_Expr : std_logic := '0';
signal VGASyncModule_L57F30T54_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L57F30T54_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L57F58T76_Expr : std_logic := '0';
signal VGASyncModule_L57F58T76_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L57F58T76_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L58F30T49_Expr : std_logic := '0';
signal VGASyncModule_L58F30T49_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L58F30T49_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L58F53T71_Expr : std_logic := '0';
signal VGASyncModule_L58F53T71_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L58F53T71_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L59F30T49_Expr : std_logic := '0';
signal VGASyncModule_L59F30T49_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L59F30T49_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L59F53T71_Expr : std_logic := '0';
signal VGASyncModule_L59F53T71_ExprLhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L59F53T71_ExprRhs : signed(10 downto 0)  := "00000000000";
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup : unsigned(9 downto 0)  := "0000000000";
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress : std_logic := '0';
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1 : unsigned(9 downto 0)  := "0000000000";
signal VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2 : unsigned(9 downto 0)  := "0000000000";
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
    VGASyncModule_L54F31T51_Expr <= '1' when (signed(resize(VGASyncModule_L54F31T51_ExprLhs, VGASyncModule_L54F31T51_ExprLhs'length + 1)) = signed(resize(VGASyncModule_L54F31T51_ExprRhs, VGASyncModule_L54F31T51_ExprRhs'length + 1))) else '0';
    VGASyncModule_L56F35T58_Expr <= '1' when (signed(resize(VGASyncModule_L56F35T58_ExprLhs, VGASyncModule_L56F35T58_ExprLhs'length + 1)) < signed(resize(VGASyncModule_L56F35T58_ExprRhs, VGASyncModule_L56F35T58_ExprRhs'length + 1))) else '0';
    VGASyncModule_L57F30T54_Expr <= '1' when (signed(resize(VGASyncModule_L57F30T54_ExprLhs, VGASyncModule_L57F30T54_ExprLhs'length + 1)) >= signed(resize(VGASyncModule_L57F30T54_ExprRhs, VGASyncModule_L57F30T54_ExprRhs'length + 1))) else '0';
    VGASyncModule_L57F58T76_Expr <= '1' when (signed(resize(VGASyncModule_L57F58T76_ExprLhs, VGASyncModule_L57F58T76_ExprLhs'length + 1)) < signed(resize(VGASyncModule_L57F58T76_ExprRhs, VGASyncModule_L57F58T76_ExprRhs'length + 1))) else '0';
    VGASyncModule_L58F30T49_Expr <= '1' when (signed(resize(VGASyncModule_L58F30T49_ExprLhs, VGASyncModule_L58F30T49_ExprLhs'length + 1)) >= signed(resize(VGASyncModule_L58F30T49_ExprRhs, VGASyncModule_L58F30T49_ExprRhs'length + 1))) else '0';
    VGASyncModule_L58F53T71_Expr <= '1' when (signed(resize(VGASyncModule_L58F53T71_ExprLhs, VGASyncModule_L58F53T71_ExprLhs'length + 1)) < signed(resize(VGASyncModule_L58F53T71_ExprRhs, VGASyncModule_L58F53T71_ExprRhs'length + 1))) else '0';
    VGASyncModule_L59F30T49_Expr <= '1' when (signed(resize(VGASyncModule_L59F30T49_ExprLhs, VGASyncModule_L59F30T49_ExprLhs'length + 1)) >= signed(resize(VGASyncModule_L59F30T49_ExprRhs, VGASyncModule_L59F30T49_ExprRhs'length + 1))) else '0';
    VGASyncModule_L59F53T71_Expr <= '1' when (signed(resize(VGASyncModule_L59F53T71_ExprLhs, VGASyncModule_L59F53T71_ExprLhs'length + 1)) < signed(resize(VGASyncModule_L59F53T71_ExprRhs, VGASyncModule_L59F53T71_ExprRhs'length + 1))) else '0';

process(VGASyncModule_L57F30T76_Expr_1, VGASyncModule_L57F30T76_Expr_2)
begin
VGASyncModule_L57F30T76_Expr <= VGASyncModule_L57F30T76_Expr_1 AND VGASyncModule_L57F30T76_Expr_2;

    end process;

process(VGASyncModule_L58F30T71_Expr_1, VGASyncModule_L58F30T71_Expr_2)
begin
VGASyncModule_L58F30T71_Expr <= VGASyncModule_L58F30T71_Expr_1 AND VGASyncModule_L58F30T71_Expr_2;

    end process;

process(VGASyncModule_L59F30T71_Expr_1, VGASyncModule_L59F30T71_Expr_2)
begin
VGASyncModule_L59F30T71_Expr <= VGASyncModule_L59F30T71_Expr_1 AND VGASyncModule_L59F30T71_Expr_2;

    end process;

process(VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1, VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2)
begin
    VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr <= resize(unsigned(signed(resize(VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1, VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1'length + 1)) + signed(resize(VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2, VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2'length + 1))), VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr'length);

end process;
process(VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1, VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2, VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress)
begin
case VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress is
  when '0' => 
VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1;
  when '1' => 
VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2;
  when others => 
VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup <= "0000000000";
end case;

end process;
process(Inputs_Enabled, State_counter, VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange)
begin
NextState_counter <= State_counter;
if ( Inputs_Enabled = '1' ) then
NextState_counter <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange;
end if;
end process;
process(Enabled, internalIsMax, State_counter, VGASyncModule_L54F31T51_Expr, VGASyncModule_L56F35T58_Expr, VGASyncModule_L57F30T54_Expr, VGASyncModule_L57F30T76_Expr, VGASyncModule_L57F58T76_Expr, VGASyncModule_L58F30T49_Expr, VGASyncModule_L58F30T71_Expr, VGASyncModule_L58F53T71_Expr, VGASyncModule_L59F30T49_Expr, VGASyncModule_L59F30T71_Expr, VGASyncModule_L59F53T71_Expr, VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T108_Source, VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize, VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup, VGASyncModule_L64F9L67T10_VGASyncModule_L66F69T87_Source, VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr)
begin
VGASyncModule_L54F31T51_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L54F31T51_ExprLhs'length));
VGASyncModule_L54F31T51_ExprRhs <= signed(resize(unsigned(max), VGASyncModule_L54F31T51_ExprRhs'length));
VGASyncModule_L56F35T58_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L56F35T58_ExprLhs'length));
VGASyncModule_L56F35T58_ExprRhs <= signed(resize(unsigned(visible), VGASyncModule_L56F35T58_ExprRhs'length));
VGASyncModule_L57F30T54_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L57F30T54_ExprLhs'length));
VGASyncModule_L57F30T54_ExprRhs <= signed(resize(unsigned(visible), VGASyncModule_L57F30T54_ExprRhs'length));
VGASyncModule_L57F58T76_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L57F58T76_ExprLhs'length));
VGASyncModule_L57F58T76_ExprRhs <= signed(resize(unsigned(fp), VGASyncModule_L57F58T76_ExprRhs'length));
VGASyncModule_L58F30T49_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L58F30T49_ExprLhs'length));
VGASyncModule_L58F30T49_ExprRhs <= signed(resize(unsigned(fp), VGASyncModule_L58F30T49_ExprRhs'length));
VGASyncModule_L58F53T71_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L58F53T71_ExprLhs'length));
VGASyncModule_L58F53T71_ExprRhs <= signed(resize(unsigned(sp), VGASyncModule_L58F53T71_ExprRhs'length));
VGASyncModule_L59F30T49_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L59F30T49_ExprLhs'length));
VGASyncModule_L59F30T49_ExprRhs <= signed(resize(unsigned(sp), VGASyncModule_L59F30T49_ExprRhs'length));
VGASyncModule_L59F53T71_ExprLhs <= signed(resize(unsigned(State_counter), VGASyncModule_L59F53T71_ExprLhs'length));
VGASyncModule_L59F53T71_ExprRhs <= signed(resize(unsigned(bp), VGASyncModule_L59F53T71_ExprRhs'length));
VGASyncModule_L57F30T76_Expr_1 <= VGASyncModule_L57F30T54_Expr;
VGASyncModule_L57F30T76_Expr_2 <= VGASyncModule_L57F58T76_Expr;
VGASyncModule_L58F30T71_Expr_1 <= VGASyncModule_L58F30T49_Expr;
VGASyncModule_L58F30T71_Expr_2 <= VGASyncModule_L58F53T71_Expr;
VGASyncModule_L59F30T71_Expr_1 <= VGASyncModule_L59F30T49_Expr;
VGASyncModule_L59F30T71_Expr_2 <= VGASyncModule_L59F53T71_Expr;
VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1 <= signed(resize(unsigned(State_counter), VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1'length));
VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2 <= (0 => VGASyncModule_L64F9L67T10_VGASyncModule_L66F106T107_Expr, others => '0');
Inputs_Enabled <= Enabled;
internalIsMax <= VGASyncModule_L54F31T51_Expr;
VGASyncModule_L64F9L67T10_VGASyncModule_L66F69T87_Source <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F85T86_Expr;
VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T108_Source <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup;
VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T108_Source;
VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize;
OutVisible <= VGASyncModule_L56F35T58_Expr;
OutFP <= VGASyncModule_L57F30T76_Expr;
OutSP <= VGASyncModule_L58F30T71_Expr;
OutBP <= VGASyncModule_L59F30T71_Expr;
OutMax <= internalIsMax;
OutCounter <= State_counter;
VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1 <= VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr(9 downto 0);
VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2 <= (0 => VGASyncModule_L64F9L67T10_VGASyncModule_L66F69T87_Source, others => '0');
VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress <= internalIsMax;
end process;
-- [BEGIN USER ARCHITECTURE]
-- [END USER ARCHITECTURE]
end architecture;
