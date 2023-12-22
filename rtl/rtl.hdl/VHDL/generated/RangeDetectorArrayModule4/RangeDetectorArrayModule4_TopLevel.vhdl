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
-- System configuration name is RangeDetectorArrayModule4_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity RangeDetectorArrayModule4_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iAddress : in unsigned (31 downto 0);
		oActive : out std_logic;
		oIndex : out unsigned (2 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of RangeDetectorArrayModule4_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant rangeDetectorsCount : unsigned(2 downto 0) := "111";
	signal Inputs_iAddress : unsigned(31 downto 0) := (others => '0');
	signal encoder_HasActive : std_logic := '0';
	signal encoder_MSBIndex : unsigned(2 downto 0) := (others => '0');
	signal encoder_MSBValue : unsigned(6 downto 0) := (others => '0');
	signal rangeDetectors0_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors0_IsActive : std_logic := '0';
	signal rangeDetectors1_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors1_IsActive : std_logic := '0';
	signal rangeDetectors2_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors2_IsActive : std_logic := '0';
	signal rangeDetectors3_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors3_IsActive : std_logic := '0';
	signal rangeDetectors4_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors4_IsActive : std_logic := '0';
	signal rangeDetectors5_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors5_IsActive : std_logic := '0';
	signal rangeDetectors6_Value : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectors6_IsActive : std_logic := '0';
	signal encoder_iValues0_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues1_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues2_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues3_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues4_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues5_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_iValues6_encoder_iValues_HardLink : std_logic := '0';
	signal encoder_HasActive_encoder_HasActive_HardLink : std_logic := '0';
	signal encoder_MSBIndex_encoder_MSBIndex_HardLink : unsigned(2 downto 0) := "000";
	signal encoder_MSBValue_encoder_MSBValue_HardLink : unsigned(6 downto 0) := "0000000";
	signal rangeDetectors0_Value_rangeDetectors0_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors1_Value_rangeDetectors1_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors2_Value_rangeDetectors2_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors3_Value_rangeDetectors3_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors4_Value_rangeDetectors4_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors5_Value_rangeDetectors5_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink : std_logic := '0';
	signal rangeDetectors6_Value_rangeDetectors6_Value_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink : std_logic := '0';
	type rangeActiveArray is array (0 to 6) of std_logic;
	signal rangeActive : rangeActiveArray := (others => '0');
	type encoder_iValuesArray is array (0 to 6) of std_logic;
	signal encoder_iValues : encoder_iValuesArray := (others => '0');
begin
	RangeDetectorArrayModule4_TopLevel_encoder : entity work.RangeDetectorArrayModule4_TopLevel_encoder
	port map
	(
		-- [BEGIN USER MAP FOR encoder]
		-- [END USER MAP FOR encoder]
		iValues0 => encoder_iValues0_encoder_iValues_HardLink,
		iValues1 => encoder_iValues1_encoder_iValues_HardLink,
		iValues2 => encoder_iValues2_encoder_iValues_HardLink,
		iValues3 => encoder_iValues3_encoder_iValues_HardLink,
		iValues4 => encoder_iValues4_encoder_iValues_HardLink,
		iValues5 => encoder_iValues5_encoder_iValues_HardLink,
		iValues6 => encoder_iValues6_encoder_iValues_HardLink,
		HasActive => encoder_HasActive_encoder_HasActive_HardLink,
		MSBIndex => encoder_MSBIndex_encoder_MSBIndex_HardLink,
		MSBValue => encoder_MSBValue_encoder_MSBValue_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors0 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors0
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors0]
		-- [END USER MAP FOR rangeDetectors0]
		Value => rangeDetectors0_Value_rangeDetectors0_Value_HardLink,
		IsActive => rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors1 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors1
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors1]
		-- [END USER MAP FOR rangeDetectors1]
		Value => rangeDetectors1_Value_rangeDetectors1_Value_HardLink,
		IsActive => rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors2 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors2
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors2]
		-- [END USER MAP FOR rangeDetectors2]
		Value => rangeDetectors2_Value_rangeDetectors2_Value_HardLink,
		IsActive => rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors3 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors3
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors3]
		-- [END USER MAP FOR rangeDetectors3]
		Value => rangeDetectors3_Value_rangeDetectors3_Value_HardLink,
		IsActive => rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors4 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors4
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors4]
		-- [END USER MAP FOR rangeDetectors4]
		Value => rangeDetectors4_Value_rangeDetectors4_Value_HardLink,
		IsActive => rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors5 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors5
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors5]
		-- [END USER MAP FOR rangeDetectors5]
		Value => rangeDetectors5_Value_rangeDetectors5_Value_HardLink,
		IsActive => rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink
	)
	;
	RangeDetectorArrayModule4_TopLevel_rangeDetectors6 : entity work.RangeDetectorArrayModule4_TopLevel_rangeDetectors6
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectors6]
		-- [END USER MAP FOR rangeDetectors6]
		Value => rangeDetectors6_Value_rangeDetectors6_Value_HardLink,
		IsActive => rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink
	)
	;
	process (encoder_HasActive, encoder_HasActive_encoder_HasActive_HardLink, encoder_iValues, encoder_MSBIndex, encoder_MSBIndex_encoder_MSBIndex_HardLink, encoder_MSBValue_encoder_MSBValue_HardLink, iAddress, Inputs_iAddress, rangeActive, rangeDetectors0_IsActive, rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink, rangeDetectors0_Value, rangeDetectors1_IsActive, rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink, rangeDetectors1_Value, rangeDetectors2_IsActive, rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink, rangeDetectors2_Value, rangeDetectors3_IsActive, rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink, rangeDetectors3_Value, rangeDetectors4_IsActive, rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink, rangeDetectors4_Value, rangeDetectors5_IsActive, rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink, rangeDetectors5_Value, rangeDetectors6_IsActive, rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink, rangeDetectors6_Value)
	begin
		Inputs_iAddress <= iAddress;
		rangeDetectors0_Value <= Inputs_iAddress;
		rangeDetectors1_Value <= Inputs_iAddress;
		rangeDetectors2_Value <= Inputs_iAddress;
		rangeDetectors3_Value <= Inputs_iAddress;
		rangeDetectors4_Value <= Inputs_iAddress;
		rangeDetectors5_Value <= Inputs_iAddress;
		rangeDetectors6_Value <= Inputs_iAddress;
		rangeActive(0) <= rangeDetectors0_IsActive;
		rangeActive(1) <= rangeDetectors1_IsActive;
		rangeActive(2) <= rangeDetectors2_IsActive;
		rangeActive(3) <= rangeDetectors3_IsActive;
		rangeActive(4) <= rangeDetectors4_IsActive;
		rangeActive(5) <= rangeDetectors5_IsActive;
		rangeActive(6) <= rangeDetectors6_IsActive;
		encoder_iValues(0) <= rangeActive(0);
		encoder_iValues(1) <= rangeActive(1);
		encoder_iValues(2) <= rangeActive(2);
		encoder_iValues(3) <= rangeActive(3);
		encoder_iValues(4) <= rangeActive(4);
		encoder_iValues(5) <= rangeActive(5);
		encoder_iValues(6) <= rangeActive(6);
		oActive <= encoder_HasActive;
		oIndex <= encoder_MSBIndex;
		encoder_iValues0_encoder_iValues_HardLink <= encoder_iValues(0);
		encoder_iValues1_encoder_iValues_HardLink <= encoder_iValues(1);
		encoder_iValues2_encoder_iValues_HardLink <= encoder_iValues(2);
		encoder_iValues3_encoder_iValues_HardLink <= encoder_iValues(3);
		encoder_iValues4_encoder_iValues_HardLink <= encoder_iValues(4);
		encoder_iValues5_encoder_iValues_HardLink <= encoder_iValues(5);
		encoder_iValues6_encoder_iValues_HardLink <= encoder_iValues(6);
		encoder_HasActive <= encoder_HasActive_encoder_HasActive_HardLink;
		encoder_MSBIndex <= encoder_MSBIndex_encoder_MSBIndex_HardLink;
		encoder_MSBValue <= encoder_MSBValue_encoder_MSBValue_HardLink;
		rangeDetectors0_Value_rangeDetectors0_Value_HardLink <= rangeDetectors0_Value;
		rangeDetectors0_IsActive <= rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink;
		rangeDetectors1_Value_rangeDetectors1_Value_HardLink <= rangeDetectors1_Value;
		rangeDetectors1_IsActive <= rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink;
		rangeDetectors2_Value_rangeDetectors2_Value_HardLink <= rangeDetectors2_Value;
		rangeDetectors2_IsActive <= rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink;
		rangeDetectors3_Value_rangeDetectors3_Value_HardLink <= rangeDetectors3_Value;
		rangeDetectors3_IsActive <= rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink;
		rangeDetectors4_Value_rangeDetectors4_Value_HardLink <= rangeDetectors4_Value;
		rangeDetectors4_IsActive <= rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink;
		rangeDetectors5_Value_rangeDetectors5_Value_HardLink <= rangeDetectors5_Value;
		rangeDetectors5_IsActive <= rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink;
		rangeDetectors6_Value_rangeDetectors6_Value_HardLink <= rangeDetectors6_Value;
		rangeDetectors6_IsActive <= rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
