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
-- System configuration name is BitArrayModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Quokka.all;

entity BitArrayModule_TopLevel is
    port
    (
-- [BEGIN USER PORTS]
-- [END USER PORTS]

Value : in  unsigned(7 downto 0);
Bit : in  unsigned(2 downto 0);
ValueBit : out  std_logic;
Direct : out  unsigned(7 downto 0);
ReversedByCall : out  unsigned(7 downto 0);
High : out  unsigned(3 downto 0);
Low : out  unsigned(3 downto 0);
Reversed : out  unsigned(7 downto 0);
ReversedHigh : out  unsigned(3 downto 0);
ReversedLow : out  unsigned(3 downto 0);
Picks : out  unsigned(3 downto 0);
FromBits1 : out  unsigned(3 downto 0);
FromBits2 : out  unsigned(3 downto 0)
    );
end entity;

-- FSM summary
-- Packages
architecture rtl of BitArrayModule_TopLevel is
-- [BEGIN USER SIGNALS]
-- [END USER SIGNALS]
constant HiSignal : std_logic := '1';
constant LoSignal : std_logic := '0';
constant Zero : std_logic := '0';
constant One : std_logic := '1';
constant true : std_logic := '1';
constant false : std_logic := '0';
constant BitArrayModule_L24F57T61_Expr : std_logic := '1';
constant BitArrayModule_L24F63T67_Expr : std_logic := '1';
constant BitArrayModule_L24F69T74_Expr : std_logic := '0';
constant BitArrayModule_L24F76T80_Expr : std_logic := '1';
constant BitArrayModule_L25F57T62_Expr : std_logic := '0';
constant BitArrayModule_L25F64T68_Expr : std_logic := '1';
constant BitArrayModule_L25F70T74_Expr : std_logic := '1';
constant BitArrayModule_L25F76T80_Expr : std_logic := '1';
signal Inputs_Value : unsigned(7 downto 0) := (others => '0');
signal Inputs_Bit : unsigned(2 downto 0) := (others => '0');
signal Bits : unsigned(7 downto 0) := (others => '0');
signal BitArrayModule_L15F33T49_Index : std_logic := '0';
signal BitArrayModule_L18F36T46_Index : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L19F35T45_Index : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L20F40T50_Index : unsigned(7 downto 0) := (others => '0');
signal BitArrayModule_L21F44T54_Index : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L22F43T53_Index : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L23F37T74_Source : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L23F53T62_Index : unsigned(1 downto 0) := (others => '0');
signal BitArrayModule_L23F64T73_Index : unsigned(1 downto 0) := (others => '0');
signal BitArrayModule_L24F41T81_Source : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L25F41T81_Source : unsigned(3 downto 0) := (others => '0');
signal BitArrayModule_L17F46T61_Expr : unsigned(7 downto 0)  := "00000000";
signal BitArrayModule_L17F46T61_Expr_1 : unsigned(7 downto 0)  := "00000000";
begin

process(BitArrayModule_L17F46T61_Expr_1)
begin

    for i in 7 downto 0 loop
        BitArrayModule_L17F46T61_Expr(i) <= BitArrayModule_L17F46T61_Expr_1(7 - i); 
    end loop;

end process;
process(Bit, BitArrayModule_L15F33T49_Index, BitArrayModule_L17F46T61_Expr, BitArrayModule_L18F36T46_Index, BitArrayModule_L19F35T45_Index, BitArrayModule_L20F40T50_Index, BitArrayModule_L21F44T54_Index, BitArrayModule_L22F43T53_Index, BitArrayModule_L23F37T74_Source, BitArrayModule_L23F53T62_Index, BitArrayModule_L23F64T73_Index, BitArrayModule_L24F41T81_Source, BitArrayModule_L25F41T81_Source, Bits, Inputs_Value, Value)
begin
BitArrayModule_L17F46T61_Expr_1 <= Bits;
Inputs_Value <= Value;
Inputs_Bit <= Bit;
Bits <= Inputs_Value;
BitArrayModule_L15F33T49_Index <= Bits(TO_INTEGER(Inputs_Bit));
ValueBit <= BitArrayModule_L15F33T49_Index;
Direct <= Bits;
ReversedByCall <= BitArrayModule_L17F46T61_Expr;
BitArrayModule_L18F36T46_Index <= Bits(7 downto 4);
High <= BitArrayModule_L18F36T46_Index;
BitArrayModule_L19F35T45_Index <= Bits(3 downto 0);
Low <= BitArrayModule_L19F35T45_Index;
BitArrayModule_L20F40T50_Index <= (0 => Bits(7), 1 => Bits(6), 2 => Bits(5), 3 => Bits(4), 4 => Bits(3), 5 => Bits(2), 6 => Bits(1), 7 => Bits(0), others => '0');
Reversed <= BitArrayModule_L20F40T50_Index;
BitArrayModule_L21F44T54_Index <= (0 => Bits(7), 1 => Bits(6), 2 => Bits(5), 3 => Bits(4), others => '0');
ReversedHigh <= BitArrayModule_L21F44T54_Index;
BitArrayModule_L22F43T53_Index <= (0 => Bits(3), 1 => Bits(2), 2 => Bits(1), 3 => Bits(0), others => '0');
ReversedLow <= BitArrayModule_L22F43T53_Index;
BitArrayModule_L23F53T62_Index <= Bits(6 downto 5);
BitArrayModule_L23F64T73_Index <= (0 => Bits(1), 1 => Bits(0), others => '0');
BitArrayModule_L23F37T74_Source <= (0 => BitArrayModule_L23F64T73_Index(0), 1 => BitArrayModule_L23F64T73_Index(1), 2 => BitArrayModule_L23F53T62_Index(0), 3 => BitArrayModule_L23F53T62_Index(1), others => '0');
Picks <= BitArrayModule_L23F37T74_Source;
BitArrayModule_L24F41T81_Source <= (0 => BitArrayModule_L24F76T80_Expr, 1 => BitArrayModule_L24F69T74_Expr, 2 => BitArrayModule_L24F63T67_Expr, 3 => BitArrayModule_L24F57T61_Expr, others => '0');
FromBits1 <= BitArrayModule_L24F41T81_Source;
BitArrayModule_L25F41T81_Source <= (0 => BitArrayModule_L25F76T80_Expr, 1 => BitArrayModule_L25F70T74_Expr, 2 => BitArrayModule_L25F64T68_Expr, 3 => BitArrayModule_L25F57T62_Expr, others => '0');
FromBits2 <= BitArrayModule_L25F41T81_Source;
end process;
-- [BEGIN USER ARCHITECTURE]
-- [END USER ARCHITECTURE]
end architecture;
