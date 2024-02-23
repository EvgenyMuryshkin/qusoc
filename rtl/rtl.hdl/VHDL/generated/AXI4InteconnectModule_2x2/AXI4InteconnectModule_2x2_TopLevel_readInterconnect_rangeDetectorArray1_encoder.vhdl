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
-- System configuration name is AXI4InteconnectModule_2x2_TopLevel_readInterconnect_rangeDetectorArray1_encoder, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4InteconnectModule_2x2_TopLevel_readInterconnect_rangeDetectorArray1_encoder is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iValues0 : in std_logic;
		iValues1 : in std_logic;
		HasActive : out std_logic;
		MSBIndex : out unsigned (0 downto 0);
		MSBValue : out unsigned (1 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4InteconnectModule_2x2_TopLevel_readInterconnect_rangeDetectorArray1_encoder is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant inputWidth : signed(2 downto 0) := "010";
	constant resultWidth : signed(1 downto 0) := "01";
	constant AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F46T51_Expr : std_logic := '0';
	constant AXI4EncoderModule_L45F13L54T14_AXI4EncoderModule_L46F31T36_Expr : std_logic := '0';
	signal internalEncoded : unsigned(0 downto 0) := (others => '0');
	signal internalHasActive : std_logic := '0';
	signal AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize : unsigned(0 downto 0) := (others => '0');
	signal AXI4EncoderModule_L30F13L39T14_result : unsigned(0 downto 0) := (others => '0');
	signal AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize : unsigned(0 downto 0) := (others => '0');
	signal AXI4EncoderModule_L45F13L54T14_result : std_logic := '0';
	signal AXI4EncoderModule_L59F40T101_ShiftLeft : unsigned(1 downto 0) := (others => '0');
	signal AXI4EncoderModule_L59F40T121_Resize : unsigned(1 downto 0) := (others => '0');
	signal AXI4EncoderModule_L59F40T101_Expr : unsigned(1 downto 0) := "00";
	signal AXI4EncoderModule_L59F40T101_Expr_1 : unsigned(1 downto 0) := "00";
	type Inputs_iValuesArray is array (0 to 1) of std_logic;
	signal Inputs_iValues : Inputs_iValuesArray := (others => '0');
begin
	process (AXI4EncoderModule_L59F40T101_Expr_1, internalEncoded)
	begin
		AXI4EncoderModule_L59F40T101_Expr <= shift_left(AXI4EncoderModule_L59F40T101_Expr_1, to_integer(internalEncoded));
	end process;
	process (AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize, Inputs_iValues)
		variable tmp0 : unsigned(0 downto 0);
	begin
		AXI4EncoderModule_L30F13L39T14_result <= AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize;
		tmp0 := AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize;
		for idx in 2 downto 1 loop
			if Inputs_iValues(idx - 1) = '1' then
				tmp0 := to_unsigned(idx - 1, 1);
			end if;
		end loop;
		AXI4EncoderModule_L30F13L39T14_result <= tmp0;
	end process;
	process (Inputs_iValues)
		variable tmp0 : std_logic;
	begin
		AXI4EncoderModule_L45F13L54T14_result <= AXI4EncoderModule_L45F13L54T14_AXI4EncoderModule_L46F31T36_Expr;
		tmp0 := AXI4EncoderModule_L45F13L54T14_AXI4EncoderModule_L46F31T36_Expr;
		for idx1 in 0 to 1 loop
			if Inputs_iValues(idx1) = '1' then
				tmp0 := tmp0 OR Inputs_iValues(idx1);
			end if;
		end loop;
		AXI4EncoderModule_L45F13L54T14_result <= tmp0;
	end process;
	process (AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize, AXI4EncoderModule_L30F13L39T14_result, AXI4EncoderModule_L45F13L54T14_result, AXI4EncoderModule_L59F40T101_Expr, AXI4EncoderModule_L59F40T101_ShiftLeft, AXI4EncoderModule_L59F40T121_Resize, internalEncoded, internalHasActive, iValues0, iValues1)
	begin
		AXI4EncoderModule_L59F40T101_Expr_1(1) <= '0';
		AXI4EncoderModule_L59F40T101_Expr_1(0) <= internalHasActive;
		Inputs_iValues(0) <= iValues0;
		Inputs_iValues(1) <= iValues1;
		AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize(0) <= AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F46T51_Expr;
		AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize <= AXI4EncoderModule_L30F13L39T14_result;
		internalEncoded <= AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize;
		internalHasActive <= AXI4EncoderModule_L45F13L54T14_result;
		HasActive <= internalHasActive;
		MSBIndex <= internalEncoded;
		AXI4EncoderModule_L59F40T101_ShiftLeft <= AXI4EncoderModule_L59F40T101_Expr;
		AXI4EncoderModule_L59F40T121_Resize <= AXI4EncoderModule_L59F40T101_ShiftLeft;
		MSBValue <= AXI4EncoderModule_L59F40T121_Resize;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
