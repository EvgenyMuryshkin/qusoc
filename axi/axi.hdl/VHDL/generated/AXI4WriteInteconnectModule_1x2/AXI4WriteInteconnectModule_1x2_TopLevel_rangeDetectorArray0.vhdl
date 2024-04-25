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
-- System configuration name is AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iAddress : in unsigned (31 downto 0);
		oActive : out std_logic;
		oIndex : out unsigned (0 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0 is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant rangeDetectorsCount : signed(2 downto 0) := "010";
	constant RangeDetectorArrayModule_L48F13L54T14_0_idx : std_logic := '0';
	constant RangeDetectorArrayModule_L48F13L54T14_1_idx : std_logic := '1';
	constant RangeDetectorArrayModule_L56F13L59T14_0_idx : std_logic := '0';
	constant RangeDetectorArrayModule_L56F13L59T14_1_idx : std_logic := '1';
	signal Inputs_iAddress : unsigned(31 downto 0) := (others => '0');
	signal encoder_HasActive : std_logic := '0';
	signal encoder_MSBIndex : unsigned(0 downto 0) := (others => '0');
	signal encoder_MSBValue : unsigned(1 downto 0) := (others => '0');
	signal rangeDetectors0_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors0_IsActive : std_logic := '0';
	signal rangeDetectors1_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors1_IsActive : std_logic := '0';
	signal RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object : unsigned(31 downto 0) := (others => '0');
	signal RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object : unsigned(31 downto 0) := (others => '0');
	signal RangeDetectorArrayModule_L36F36L40T14_Object : unsigned(1 downto 0) := (others => '0');
	signal encoder_iValues0_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues1_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_HasActive_encoder_HasActive_HardLink : std_logic := '0';
	signal encoder_MSBIndex_encoder_MSBIndex_HardLink : unsigned(0 downto 0) := "0";
	signal encoder_MSBValue_encoder_MSBValue_HardLink : unsigned(1 downto 0) := "00";
	signal rangeDetectors0_Value_rangeDetectors0_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors1_Value_rangeDetectors1_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink : std_logic := '0';
	type rangeActiveArray is array (0 to 1) of std_logic;
	signal rangeActive : rangeActiveArray := (others => '0');
	type encoder_iValuesArray is array (0 to 1) of std_logic;
	signal encoder_iValues : encoder_iValuesArray := (others => '0');
begin
	AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0_encoder : entity work.AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0_encoder
	port map
	(
		-- [BEGIN USER MAP FOR encoder]
		-- [END USER MAP FOR encoder]
		iValues0 => encoder_iValues0_encoder_iValues_HardLink,
		iValues1 => encoder_iValues1_encoder_iValues_HardLink,
		HasActive => encoder_HasActive_encoder_HasActive_HardLink,
		MSBIndex => encoder_MSBIndex_encoder_MSBIndex_HardLink,
		MSBValue => encoder_MSBValue_encoder_MSBValue_HardLink
	)
	;
	AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0_rangeDetectors0 : entity work.AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0_rangeDetectors0
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors0]
		-- [END USER MAP FOR rangeDetectors0]
		Value => rangeDetectors0_Value_rangeDetectors0_Value_HardLink,
		IsActive => rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink
	)
	;
	AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0_rangeDetectors1 : entity work.AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0_rangeDetectors1
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors1]
		-- [END USER MAP FOR rangeDetectors1]
		Value => rangeDetectors1_Value_rangeDetectors1_Value_HardLink,
		IsActive => rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink
	)
	;
	process (encoder_HasActive, encoder_HasActive_encoder_HasActive_HardLink, encoder_iValues, encoder_MSBIndex, encoder_MSBIndex_encoder_MSBIndex_HardLink, encoder_MSBValue_encoder_MSBValue_HardLink, iAddress, Inputs_iAddress, rangeActive, RangeDetectorArrayModule_L36F36L40T14_Object, RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object, RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object, rangeDetectors0_IsActive, rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink, rangeDetectors0_Value, rangeDetectors1_IsActive, rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink, rangeDetectors1_Value)
	begin
		Inputs_iAddress <= iAddress;
		RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object <= Inputs_iAddress;
		rangeDetectors0_Value <= RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object;
		RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object <= Inputs_iAddress;
		rangeDetectors1_Value <= RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object;
		rangeActive(0) <= rangeDetectors0_IsActive;
		rangeActive(1) <= rangeDetectors1_IsActive;
		RangeDetectorArrayModule_L36F36L40T14_Object(1) <= rangeActive(1);
		RangeDetectorArrayModule_L36F36L40T14_Object(0) <= rangeActive(0);
		encoder_iValues(1) <= RangeDetectorArrayModule_L36F36L40T14_Object(1);
		encoder_iValues(0) <= RangeDetectorArrayModule_L36F36L40T14_Object(0);
		oActive <= encoder_HasActive;
		oIndex <= encoder_MSBIndex;
		encoder_iValues0_encoder_iValues_HardLink <= encoder_iValues(0);
		encoder_iValues1_encoder_iValues_HardLink <= encoder_iValues(1);
		encoder_HasActive <= encoder_HasActive_encoder_HasActive_HardLink;
		encoder_MSBIndex <= encoder_MSBIndex_encoder_MSBIndex_HardLink;
		encoder_MSBValue <= encoder_MSBValue_encoder_MSBValue_HardLink;
		rangeDetectors0_Value_rangeDetectors0_Value_HardLink <= rangeDetectors0_Value;
		rangeDetectors0_IsActive <= rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink;
		rangeDetectors1_Value_rangeDetectors1_Value_HardLink <= rangeDetectors1_Value;
		rangeDetectors1_IsActive <= rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
