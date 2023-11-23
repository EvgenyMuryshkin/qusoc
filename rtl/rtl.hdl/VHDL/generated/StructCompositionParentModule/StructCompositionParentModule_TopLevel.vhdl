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
-- System configuration name is StructCompositionParentModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity StructCompositionParentModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iValue_intValue : in unsigned (15 downto 0);
		iValue_l1_byteValue : in unsigned (7 downto 0);
		iValue_l1_l2_bitArray : in unsigned (1 downto 0);
		iValue_l1_l2_boolValue0 : in std_logic;
		iValue_l1_l2_boolValue1 : in std_logic;
		iValue_l1_l2Array0_bitArray : in unsigned (1 downto 0);
		iValue_l1_l2Array0_boolValue0 : in std_logic;
		iValue_l1_l2Array0_boolValue1 : in std_logic;
		iValue_l1_l2Array1_bitArray : in unsigned (1 downto 0);
		iValue_l1_l2Array1_boolValue0 : in std_logic;
		iValue_l1_l2Array1_boolValue1 : in std_logic;
		iValue_l1Array0_byteValue : in unsigned (7 downto 0);
		iValue_l1Array0_l2_bitArray : in unsigned (1 downto 0);
		iValue_l1Array0_l2_boolValue0 : in std_logic;
		iValue_l1Array0_l2_boolValue1 : in std_logic;
		iValue_l1Array0_l2Array0_bitArray : in unsigned (1 downto 0);
		iValue_l1Array0_l2Array0_boolValue0 : in std_logic;
		iValue_l1Array0_l2Array0_boolValue1 : in std_logic;
		iValue_l1Array0_l2Array1_bitArray : in unsigned (1 downto 0);
		iValue_l1Array0_l2Array1_boolValue0 : in std_logic;
		iValue_l1Array0_l2Array1_boolValue1 : in std_logic;
		iValue_l1Array1_byteValue : in unsigned (7 downto 0);
		iValue_l1Array1_l2_bitArray : in unsigned (1 downto 0);
		iValue_l1Array1_l2_boolValue0 : in std_logic;
		iValue_l1Array1_l2_boolValue1 : in std_logic;
		iValue_l1Array1_l2Array0_bitArray : in unsigned (1 downto 0);
		iValue_l1Array1_l2Array0_boolValue0 : in std_logic;
		iValue_l1Array1_l2Array0_boolValue1 : in std_logic;
		iValue_l1Array1_l2Array1_bitArray : in unsigned (1 downto 0);
		iValue_l1Array1_l2Array1_boolValue0 : in std_logic;
		iValue_l1Array1_l2Array1_boolValue1 : in std_logic;
		oOutput_iValue_intValue : out unsigned (15 downto 0);
		oOutput_iValue_l1_byteValue : out unsigned (7 downto 0);
		oOutput_iValue_l1_l2_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1_l2_boolValue0 : out std_logic;
		oOutput_iValue_l1_l2_boolValue1 : out std_logic;
		oOutput_iValue_l1_l2Array0_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1_l2Array0_boolValue0 : out std_logic;
		oOutput_iValue_l1_l2Array0_boolValue1 : out std_logic;
		oOutput_iValue_l1_l2Array1_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1_l2Array1_boolValue0 : out std_logic;
		oOutput_iValue_l1_l2Array1_boolValue1 : out std_logic;
		oOutput_iValue_l1Array0_byteValue : out unsigned (7 downto 0);
		oOutput_iValue_l1Array0_l2_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1Array0_l2_boolValue0 : out std_logic;
		oOutput_iValue_l1Array0_l2_boolValue1 : out std_logic;
		oOutput_iValue_l1Array0_l2Array0_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1Array0_l2Array0_boolValue0 : out std_logic;
		oOutput_iValue_l1Array0_l2Array0_boolValue1 : out std_logic;
		oOutput_iValue_l1Array0_l2Array1_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1Array0_l2Array1_boolValue0 : out std_logic;
		oOutput_iValue_l1Array0_l2Array1_boolValue1 : out std_logic;
		oOutput_iValue_l1Array1_byteValue : out unsigned (7 downto 0);
		oOutput_iValue_l1Array1_l2_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1Array1_l2_boolValue0 : out std_logic;
		oOutput_iValue_l1Array1_l2_boolValue1 : out std_logic;
		oOutput_iValue_l1Array1_l2Array0_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1Array1_l2Array0_boolValue0 : out std_logic;
		oOutput_iValue_l1Array1_l2Array0_boolValue1 : out std_logic;
		oOutput_iValue_l1Array1_l2Array1_bitArray : out unsigned (1 downto 0);
		oOutput_iValue_l1Array1_l2Array1_boolValue0 : out std_logic;
		oOutput_iValue_l1Array1_l2Array1_boolValue1 : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of StructCompositionParentModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_iValue_intValue : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iValue_l1_byteValue : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iValue_l1_l2_bitArray : unsigned(1 downto 0) := (others => '0');
	signal child_iValue : unsigned(75 downto 0) := (others => '0');
	signal child_Output : unsigned(75 downto 0) := (others => '0');
	signal child_iValue_child_iValue_HardLink : unsigned(75 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal child_Output_child_Output_HardLink : unsigned(75 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000";
	type Inputs_iValue_l1_l2_boolValueArray is array (0 to 1) of std_logic;
	signal Inputs_iValue_l1_l2_boolValue : Inputs_iValue_l1_l2_boolValueArray := (others => '0');
	type Inputs_iValue_l1_l2ArrayArray is array (0 to 1) of unsigned (3 downto 0);
	signal Inputs_iValue_l1_l2Array : Inputs_iValue_l1_l2ArrayArray := (others => (others => '0'));
	type Inputs_iValue_l1ArrayArray is array (0 to 1) of unsigned (19 downto 0);
	signal Inputs_iValue_l1Array : Inputs_iValue_l1ArrayArray := (others => (others => '0'));
begin
	StructCompositionParentModule_TopLevel_child : entity work.StructCompositionParentModule_TopLevel_child
	port map
	(
		-- [BEGIN USER MAP FOR child]
		-- [END USER MAP FOR child]
		iValue => child_iValue_child_iValue_HardLink,
		Output => child_Output_child_Output_HardLink
	)
	;
	process (child_iValue, child_Output, child_Output_child_Output_HardLink, Inputs_iValue_intValue, Inputs_iValue_l1_byteValue, Inputs_iValue_l1_l2_bitArray, Inputs_iValue_l1_l2_boolValue, Inputs_iValue_l1_l2Array, Inputs_iValue_l1Array, iValue_intValue, iValue_l1_byteValue, iValue_l1_l2_bitArray, iValue_l1_l2_boolValue0, iValue_l1_l2_boolValue1, iValue_l1_l2Array0_bitArray, iValue_l1_l2Array0_boolValue0, iValue_l1_l2Array0_boolValue1, iValue_l1_l2Array1_bitArray, iValue_l1_l2Array1_boolValue0, iValue_l1_l2Array1_boolValue1, iValue_l1Array0_byteValue, iValue_l1Array0_l2_bitArray, iValue_l1Array0_l2_boolValue0, iValue_l1Array0_l2_boolValue1, iValue_l1Array0_l2Array0_bitArray, iValue_l1Array0_l2Array0_boolValue0, iValue_l1Array0_l2Array0_boolValue1, iValue_l1Array0_l2Array1_bitArray, iValue_l1Array0_l2Array1_boolValue0, iValue_l1Array0_l2Array1_boolValue1, iValue_l1Array1_byteValue, iValue_l1Array1_l2_bitArray, iValue_l1Array1_l2_boolValue0, iValue_l1Array1_l2_boolValue1, iValue_l1Array1_l2Array0_bitArray, iValue_l1Array1_l2Array0_boolValue0, iValue_l1Array1_l2Array0_boolValue1, iValue_l1Array1_l2Array1_bitArray, iValue_l1Array1_l2Array1_boolValue0, iValue_l1Array1_l2Array1_boolValue1)
	begin
		Inputs_iValue_intValue <= iValue_intValue;
		Inputs_iValue_l1_byteValue <= iValue_l1_byteValue;
		Inputs_iValue_l1_l2_bitArray <= iValue_l1_l2_bitArray;
		Inputs_iValue_l1_l2_boolValue(0) <= iValue_l1_l2_boolValue0;
		Inputs_iValue_l1_l2_boolValue(1) <= iValue_l1_l2_boolValue1;
		Inputs_iValue_l1_l2Array(0)(3) <= iValue_l1_l2Array0_boolValue1;
		Inputs_iValue_l1_l2Array(0)(2) <= iValue_l1_l2Array0_boolValue0;
		Inputs_iValue_l1_l2Array(0)(1 downto 0) <= iValue_l1_l2Array0_bitArray;
		Inputs_iValue_l1_l2Array(1)(3) <= iValue_l1_l2Array1_boolValue1;
		Inputs_iValue_l1_l2Array(1)(2) <= iValue_l1_l2Array1_boolValue0;
		Inputs_iValue_l1_l2Array(1)(1 downto 0) <= iValue_l1_l2Array1_bitArray;
		Inputs_iValue_l1Array(0)(19) <= iValue_l1Array0_l2Array1_boolValue1;
		Inputs_iValue_l1Array(0)(18) <= iValue_l1Array0_l2Array1_boolValue0;
		Inputs_iValue_l1Array(0)(17 downto 16) <= iValue_l1Array0_l2Array1_bitArray;
		Inputs_iValue_l1Array(0)(15) <= iValue_l1Array0_l2Array0_boolValue1;
		Inputs_iValue_l1Array(0)(14) <= iValue_l1Array0_l2Array0_boolValue0;
		Inputs_iValue_l1Array(0)(13 downto 12) <= iValue_l1Array0_l2Array0_bitArray;
		Inputs_iValue_l1Array(0)(11) <= iValue_l1Array0_l2_boolValue1;
		Inputs_iValue_l1Array(0)(10) <= iValue_l1Array0_l2_boolValue0;
		Inputs_iValue_l1Array(0)(9 downto 8) <= iValue_l1Array0_l2_bitArray;
		Inputs_iValue_l1Array(0)(7 downto 0) <= iValue_l1Array0_byteValue;
		Inputs_iValue_l1Array(1)(19) <= iValue_l1Array1_l2Array1_boolValue1;
		Inputs_iValue_l1Array(1)(18) <= iValue_l1Array1_l2Array1_boolValue0;
		Inputs_iValue_l1Array(1)(17 downto 16) <= iValue_l1Array1_l2Array1_bitArray;
		Inputs_iValue_l1Array(1)(15) <= iValue_l1Array1_l2Array0_boolValue1;
		Inputs_iValue_l1Array(1)(14) <= iValue_l1Array1_l2Array0_boolValue0;
		Inputs_iValue_l1Array(1)(13 downto 12) <= iValue_l1Array1_l2Array0_bitArray;
		Inputs_iValue_l1Array(1)(11) <= iValue_l1Array1_l2_boolValue1;
		Inputs_iValue_l1Array(1)(10) <= iValue_l1Array1_l2_boolValue0;
		Inputs_iValue_l1Array(1)(9 downto 8) <= iValue_l1Array1_l2_bitArray;
		Inputs_iValue_l1Array(1)(7 downto 0) <= iValue_l1Array1_byteValue;
		child_iValue(75 downto 56) <= Inputs_iValue_l1Array(1);
		child_iValue(55 downto 36) <= Inputs_iValue_l1Array(0);
		child_iValue(35 downto 32) <= Inputs_iValue_l1_l2Array(1);
		child_iValue(31 downto 28) <= Inputs_iValue_l1_l2Array(0);
		child_iValue(27) <= Inputs_iValue_l1_l2_boolValue(1);
		child_iValue(26) <= Inputs_iValue_l1_l2_boolValue(0);
		child_iValue(25 downto 24) <= Inputs_iValue_l1_l2_bitArray;
		child_iValue(23 downto 16) <= Inputs_iValue_l1_byteValue;
		child_iValue(15 downto 0) <= Inputs_iValue_intValue;
		oOutput_iValue_l1Array1_l2Array1_boolValue1 <= child_Output(75);
		oOutput_iValue_l1Array1_l2Array1_boolValue0 <= child_Output(74);
		oOutput_iValue_l1Array1_l2Array1_bitArray <= child_Output(73 downto 72);
		oOutput_iValue_l1Array1_l2Array0_boolValue1 <= child_Output(71);
		oOutput_iValue_l1Array1_l2Array0_boolValue0 <= child_Output(70);
		oOutput_iValue_l1Array1_l2Array0_bitArray <= child_Output(69 downto 68);
		oOutput_iValue_l1Array1_l2_boolValue1 <= child_Output(67);
		oOutput_iValue_l1Array1_l2_boolValue0 <= child_Output(66);
		oOutput_iValue_l1Array1_l2_bitArray <= child_Output(65 downto 64);
		oOutput_iValue_l1Array1_byteValue <= child_Output(63 downto 56);
		oOutput_iValue_l1Array0_l2Array1_boolValue1 <= child_Output(55);
		oOutput_iValue_l1Array0_l2Array1_boolValue0 <= child_Output(54);
		oOutput_iValue_l1Array0_l2Array1_bitArray <= child_Output(53 downto 52);
		oOutput_iValue_l1Array0_l2Array0_boolValue1 <= child_Output(51);
		oOutput_iValue_l1Array0_l2Array0_boolValue0 <= child_Output(50);
		oOutput_iValue_l1Array0_l2Array0_bitArray <= child_Output(49 downto 48);
		oOutput_iValue_l1Array0_l2_boolValue1 <= child_Output(47);
		oOutput_iValue_l1Array0_l2_boolValue0 <= child_Output(46);
		oOutput_iValue_l1Array0_l2_bitArray <= child_Output(45 downto 44);
		oOutput_iValue_l1Array0_byteValue <= child_Output(43 downto 36);
		oOutput_iValue_l1_l2Array1_boolValue1 <= child_Output(35);
		oOutput_iValue_l1_l2Array1_boolValue0 <= child_Output(34);
		oOutput_iValue_l1_l2Array1_bitArray <= child_Output(33 downto 32);
		oOutput_iValue_l1_l2Array0_boolValue1 <= child_Output(31);
		oOutput_iValue_l1_l2Array0_boolValue0 <= child_Output(30);
		oOutput_iValue_l1_l2Array0_bitArray <= child_Output(29 downto 28);
		oOutput_iValue_l1_l2_boolValue1 <= child_Output(27);
		oOutput_iValue_l1_l2_boolValue0 <= child_Output(26);
		oOutput_iValue_l1_l2_bitArray <= child_Output(25 downto 24);
		oOutput_iValue_l1_byteValue <= child_Output(23 downto 16);
		oOutput_iValue_intValue <= child_Output(15 downto 0);
		child_iValue_child_iValue_HardLink <= child_iValue;
		child_Output <= child_Output_child_Output_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
