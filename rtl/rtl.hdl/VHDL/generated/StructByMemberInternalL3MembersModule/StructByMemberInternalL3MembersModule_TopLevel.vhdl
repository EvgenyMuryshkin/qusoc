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
-- System configuration name is StructByMemberInternalL3MembersModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity StructByMemberInternalL3MembersModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iL1_L1OptionalValue : in unsigned (0 downto 0);
		iL1_L1RequiredValue : in std_logic;
		iL1_L20_L2OptionalValue : in unsigned (1 downto 0);
		iL1_L20_L3_L3OptionalValue : in std_logic;
		iL1_L20_L3_L3RequiredValue : in signed (15 downto 0);
		iL1_L20_L3Tuple_Item1 : in std_logic;
		iL1_L20_L3Tuple_Item2_L3OptionalValue : in std_logic;
		iL1_L20_L3Tuple_Item2_L3RequiredValue : in signed (15 downto 0);
		iL1_L21_L2OptionalValue : in unsigned (1 downto 0);
		iL1_L21_L3_L3OptionalValue : in std_logic;
		iL1_L21_L3_L3RequiredValue : in signed (15 downto 0);
		iL1_L21_L3Tuple_Item1 : in std_logic;
		iL1_L21_L3Tuple_Item2_L3OptionalValue : in std_logic;
		iL1_L21_L3Tuple_Item2_L3RequiredValue : in signed (15 downto 0);
		oL1_L1OptionalValue : out unsigned (0 downto 0);
		oL1_L1RequiredValue : out std_logic;
		oL1_L20_L2OptionalValue : out unsigned (1 downto 0);
		oL1_L20_L3_L3OptionalValue : out std_logic;
		oL1_L20_L3_L3RequiredValue : out signed (15 downto 0);
		oL1_L20_L3Tuple_Item1 : out std_logic;
		oL1_L20_L3Tuple_Item2_L3OptionalValue : out std_logic;
		oL1_L20_L3Tuple_Item2_L3RequiredValue : out signed (15 downto 0);
		oL1_L21_L2OptionalValue : out unsigned (1 downto 0);
		oL1_L21_L3_L3OptionalValue : out std_logic;
		oL1_L21_L3_L3RequiredValue : out signed (15 downto 0);
		oL1_L21_L3Tuple_Item1 : out std_logic;
		oL1_L21_L3Tuple_Item2_L3OptionalValue : out std_logic;
		oL1_L21_L3Tuple_Item2_L3RequiredValue : out signed (15 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of StructByMemberInternalL3MembersModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_iL1_L1OptionalValue : unsigned(0 downto 0) := (others => '0');
	signal Inputs_iL1_L1RequiredValue : std_logic := '0';
	signal internalL1_L1OptionalValue : unsigned(0 downto 0) := (others => '0');
	signal internalL1_L1RequiredValue : std_logic := '0';
	signal StructByMemberInternalModule_L76F17L93T18_Object : unsigned(36 downto 0) := (others => '0');
	signal StructByMemberInternalModule_L87F25L91T26_Object : unsigned(16 downto 0) := (others => '0');
	signal StructByMemberInternalModule_L85F21L92T22_Tuple : unsigned(17 downto 0) := (others => '0');
	type Inputs_iL1_L2Array is array (0 to 1) of unsigned (36 downto 0);
	signal Inputs_iL1_L2 : Inputs_iL1_L2Array := (others => (others => '0'));
	type internalL1_L2Array is array (0 to 1) of unsigned (36 downto 0);
	signal internalL1_L2 : internalL1_L2Array := (others => (others => '0'));
	type StructByMemberInternalModule_L73F18L94T14_EnumerableArray is array (0 to 1) of unsigned (36 downto 0);
	signal StructByMemberInternalModule_L73F18L94T14_Enumerable : StructByMemberInternalModule_L73F18L94T14_EnumerableArray := (others => (others => '0'));
begin
	process (iL1_L1OptionalValue, iL1_L1RequiredValue, iL1_L20_L2OptionalValue, iL1_L20_L3_L3OptionalValue, iL1_L20_L3_L3RequiredValue, iL1_L20_L3Tuple_Item1, iL1_L20_L3Tuple_Item2_L3OptionalValue, iL1_L20_L3Tuple_Item2_L3RequiredValue, iL1_L21_L2OptionalValue, iL1_L21_L3_L3OptionalValue, iL1_L21_L3_L3RequiredValue, iL1_L21_L3Tuple_Item1, iL1_L21_L3Tuple_Item2_L3OptionalValue, iL1_L21_L3Tuple_Item2_L3RequiredValue, Inputs_iL1_L1OptionalValue, Inputs_iL1_L1RequiredValue, Inputs_iL1_L2, internalL1_L1OptionalValue, internalL1_L1RequiredValue, internalL1_L2, StructByMemberInternalModule_L73F18L94T14_Enumerable, StructByMemberInternalModule_L76F17L93T18_Object, StructByMemberInternalModule_L85F21L92T22_Tuple, StructByMemberInternalModule_L87F25L91T26_Object)
	begin
		Inputs_iL1_L1OptionalValue <= iL1_L1OptionalValue;
		Inputs_iL1_L1RequiredValue <= iL1_L1RequiredValue;
		Inputs_iL1_L2(0)(36) <= iL1_L20_L3Tuple_Item1;
		Inputs_iL1_L2(0)(35 downto 20) <= unsigned(iL1_L20_L3Tuple_Item2_L3RequiredValue);
		Inputs_iL1_L2(0)(19) <= iL1_L20_L3Tuple_Item2_L3OptionalValue;
		Inputs_iL1_L2(0)(18 downto 3) <= unsigned(iL1_L20_L3_L3RequiredValue);
		Inputs_iL1_L2(0)(2) <= iL1_L20_L3_L3OptionalValue;
		Inputs_iL1_L2(0)(1 downto 0) <= iL1_L20_L2OptionalValue;
		Inputs_iL1_L2(1)(36) <= iL1_L21_L3Tuple_Item1;
		Inputs_iL1_L2(1)(35 downto 20) <= unsigned(iL1_L21_L3Tuple_Item2_L3RequiredValue);
		Inputs_iL1_L2(1)(19) <= iL1_L21_L3Tuple_Item2_L3OptionalValue;
		Inputs_iL1_L2(1)(18 downto 3) <= unsigned(iL1_L21_L3_L3RequiredValue);
		Inputs_iL1_L2(1)(2) <= iL1_L21_L3_L3OptionalValue;
		Inputs_iL1_L2(1)(1 downto 0) <= iL1_L21_L2OptionalValue;
		internalL1_L1OptionalValue <= Inputs_iL1_L1OptionalValue;
		internalL1_L1RequiredValue <= Inputs_iL1_L1RequiredValue;
		internalL1_L2(0) <= Inputs_iL1_L2(0);
		internalL1_L2(1) <= Inputs_iL1_L2(1);
		StructByMemberInternalModule_L76F17L93T18_Object(1 downto 0) <= internalL1_L2(1)(1 downto 0);
		StructByMemberInternalModule_L76F17L93T18_Object(2) <= internalL1_L2(1)(2);
		StructByMemberInternalModule_L76F17L93T18_Object(18 downto 3) <= internalL1_L2(1)(18 downto 3);
		StructByMemberInternalModule_L87F25L91T26_Object(0) <= internalL1_L2(1)(19);
		StructByMemberInternalModule_L87F25L91T26_Object(16 downto 1) <= internalL1_L2(1)(35 downto 20);
		StructByMemberInternalModule_L85F21L92T22_Tuple(17) <= internalL1_L2(1)(36);
		StructByMemberInternalModule_L85F21L92T22_Tuple(16 downto 0) <= StructByMemberInternalModule_L87F25L91T26_Object;
		StructByMemberInternalModule_L76F17L93T18_Object(36 downto 19) <= StructByMemberInternalModule_L85F21L92T22_Tuple;
		StructByMemberInternalModule_L73F18L94T14_Enumerable(0) <= internalL1_L2(0);
		StructByMemberInternalModule_L73F18L94T14_Enumerable(1) <= StructByMemberInternalModule_L76F17L93T18_Object;
		oL1_L1OptionalValue <= internalL1_L1OptionalValue;
		oL1_L1RequiredValue <= internalL1_L1RequiredValue;
		oL1_L20_L3Tuple_Item1 <= StructByMemberInternalModule_L73F18L94T14_Enumerable(0)(36);
		oL1_L20_L3Tuple_Item2_L3RequiredValue <= signed(StructByMemberInternalModule_L73F18L94T14_Enumerable(0)(35 downto 20));
		oL1_L20_L3Tuple_Item2_L3OptionalValue <= StructByMemberInternalModule_L73F18L94T14_Enumerable(0)(19);
		oL1_L20_L3_L3RequiredValue <= signed(StructByMemberInternalModule_L73F18L94T14_Enumerable(0)(18 downto 3));
		oL1_L20_L3_L3OptionalValue <= StructByMemberInternalModule_L73F18L94T14_Enumerable(0)(2);
		oL1_L20_L2OptionalValue <= StructByMemberInternalModule_L73F18L94T14_Enumerable(0)(1 downto 0);
		oL1_L21_L3Tuple_Item1 <= StructByMemberInternalModule_L73F18L94T14_Enumerable(1)(36);
		oL1_L21_L3Tuple_Item2_L3RequiredValue <= signed(StructByMemberInternalModule_L73F18L94T14_Enumerable(1)(35 downto 20));
		oL1_L21_L3Tuple_Item2_L3OptionalValue <= StructByMemberInternalModule_L73F18L94T14_Enumerable(1)(19);
		oL1_L21_L3_L3RequiredValue <= signed(StructByMemberInternalModule_L73F18L94T14_Enumerable(1)(18 downto 3));
		oL1_L21_L3_L3OptionalValue <= StructByMemberInternalModule_L73F18L94T14_Enumerable(1)(2);
		oL1_L21_L2OptionalValue <= StructByMemberInternalModule_L73F18L94T14_Enumerable(1)(1 downto 0);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;