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
-- System configuration name is IOSingleBitMemoryCompositionModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity IOSingleBitMemoryCompositionModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iValues0 : in std_logic;
		iValues1 : in std_logic;
		oValues0 : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of IOSingleBitMemoryCompositionModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant size : signed(1 downto 0) := "01";
	signal children0_iValue : std_logic := '0';
	signal children0_oValue : std_logic := '0';
	signal children0_iValue_children0_iValue_HardLink : std_logic := '0';
	signal children0_oValue_children0_oValue_HardLink : std_logic := '0';
	type Inputs_iValuesArray is array (0 to 1) of std_logic;
	signal Inputs_iValues : Inputs_iValuesArray := (others => '0');
	type IOSingleBitMemoryCompositionModule_L43F34T74_EnumerableArray is array (0 to 0) of std_logic;
	signal IOSingleBitMemoryCompositionModule_L43F34T74_Enumerable : IOSingleBitMemoryCompositionModule_L43F34T74_EnumerableArray := (others => '0');
begin
	IOSingleBitMemoryCompositionModule_TopLevel_children0 : entity work.IOSingleBitMemoryCompositionModule_TopLevel_children0
	port map
	(
		-- [BEGIN USER MAP FOR children0]
		-- [END USER MAP FOR children0]
		iValue => children0_iValue_children0_iValue_HardLink,
		oValue => children0_oValue_children0_oValue_HardLink
	)
	;
	process (children0_iValue, children0_oValue, children0_oValue_children0_oValue_HardLink, Inputs_iValues, IOSingleBitMemoryCompositionModule_L43F34T74_Enumerable, iValues0, iValues1)
	begin
		Inputs_iValues(0) <= iValues0;
		Inputs_iValues(1) <= iValues1;
		children0_iValue <= Inputs_iValues(0);
		IOSingleBitMemoryCompositionModule_L43F34T74_Enumerable(0) <= children0_oValue;
		oValues0 <= IOSingleBitMemoryCompositionModule_L43F34T74_Enumerable(0);
		children0_iValue_children0_iValue_HardLink <= children0_iValue;
		children0_oValue <= children0_oValue_children0_oValue_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;