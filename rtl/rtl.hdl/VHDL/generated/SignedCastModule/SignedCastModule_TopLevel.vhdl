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
-- System configuration name is SignedCastModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity SignedCastModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		ShortValue : in signed (15 downto 0);
		ByteValue : out unsigned (7 downto 0);
		IntValue : out signed (31 downto 0);
		SByteValue : out signed (7 downto 0);
		UIntValue : out unsigned (31 downto 0);
		UShortValue : out unsigned (15 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of SignedCastModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_ShortValue : signed(15 downto 0) := (others => '0');
	signal SignedCastModule_L13F34T57_Cast : unsigned(7 downto 0) := (others => '0');
	signal SignedCastModule_L14F36T60_Cast : signed(7 downto 0) := (others => '0');
	signal SignedCastModule_L17F34T57_Cast : unsigned(31 downto 0) := (others => '0');
	signal SignedCastModule_L15F38T63_Cast : unsigned(15 downto 0) := (others => '0');
begin
	process (Inputs_ShortValue, ShortValue, SignedCastModule_L13F34T57_Cast, SignedCastModule_L14F36T60_Cast, SignedCastModule_L15F38T63_Cast, SignedCastModule_L17F34T57_Cast)
	begin
		Inputs_ShortValue <= ShortValue;
		SignedCastModule_L13F34T57_Cast <= unsigned(Inputs_ShortValue(7 downto 0));
		ByteValue <= SignedCastModule_L13F34T57_Cast;
		IntValue(31 downto 16) <= (others => Inputs_ShortValue(15));
		IntValue(15 downto 0) <= Inputs_ShortValue;
		SignedCastModule_L14F36T60_Cast <= Inputs_ShortValue(7 downto 0);
		SByteValue <= SignedCastModule_L14F36T60_Cast;
		SignedCastModule_L17F34T57_Cast(31 downto 16) <= (others => Inputs_ShortValue(15));
		SignedCastModule_L17F34T57_Cast(15 downto 0) <= unsigned(Inputs_ShortValue);
		UIntValue <= SignedCastModule_L17F34T57_Cast;
		SignedCastModule_L15F38T63_Cast <= unsigned(Inputs_ShortValue);
		UShortValue <= SignedCastModule_L15F38T63_Cast;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
