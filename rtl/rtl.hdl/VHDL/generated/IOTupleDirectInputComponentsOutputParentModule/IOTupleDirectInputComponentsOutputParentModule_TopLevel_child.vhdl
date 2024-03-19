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
-- System configuration name is IOTupleDirectInputComponentsOutputParentModule_TopLevel_child, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity IOTupleDirectInputComponentsOutputParentModule_TopLevel_child is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iTuple : in unsigned (59 downto 0);
		iTupleArray0 : in unsigned (53 downto 0);
		iTupleArray1 : in unsigned (53 downto 0);
		Output_iTuple : out unsigned (59 downto 0);
		Output_iTupleArray0 : out unsigned (53 downto 0);
		Output_iTupleArray1 : out unsigned (53 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of IOTupleDirectInputComponentsOutputParentModule_TopLevel_child is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_iTuple_Item1 : std_logic := '0';
	signal Inputs_iTuple_Item2 : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iTuple_Item4_L1Flag : std_logic := '0';
	signal Inputs_iTuple_Item4_L2_L2Flag : std_logic := '0';
	signal Inputs_iTuple_Item4_L2Tuple_Item1 : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag : std_logic := '0';
	signal IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple : unsigned(59 downto 0) := (others => '0');
	type Inputs_iTuple_Item3Array is array (0 to 1) of unsigned (3 downto 0);
	signal Inputs_iTuple_Item3 : Inputs_iTuple_Item3Array := (others => (others => '0'));
	type Inputs_iTuple_Item4_L2_L2ValuesArray is array (0 to 1) of std_logic;
	signal Inputs_iTuple_Item4_L2_L2Values : Inputs_iTuple_Item4_L2_L2ValuesArray := (others => '0');
	type Inputs_iTuple_Item4_L2ArrayArray is array (0 to 1) of unsigned (6 downto 0);
	signal Inputs_iTuple_Item4_L2Array : Inputs_iTuple_Item4_L2ArrayArray := (others => (others => '0'));
	type Inputs_iTuple_Item4_L2Tuple_Item2_L2ValuesArray is array (0 to 1) of std_logic;
	signal Inputs_iTuple_Item4_L2Tuple_Item2_L2Values : Inputs_iTuple_Item4_L2Tuple_Item2_L2ValuesArray := (others => '0');
	type Inputs_iTuple_Item4_L2Tuple_Item3Array is array (0 to 1) of unsigned (6 downto 0);
	signal Inputs_iTuple_Item4_L2Tuple_Item3 : Inputs_iTuple_Item4_L2Tuple_Item3Array := (others => (others => '0'));
	type Inputs_iTupleArrayArray is array (0 to 1) of unsigned (53 downto 0);
	signal Inputs_iTupleArray : Inputs_iTupleArrayArray := (others => (others => '0'));
begin
	process (Inputs_iTuple_Item1, Inputs_iTuple_Item2, Inputs_iTuple_Item3, Inputs_iTuple_Item4_L1Flag, Inputs_iTuple_Item4_L2_L2Flag, Inputs_iTuple_Item4_L2_L2Values, Inputs_iTuple_Item4_L2Array, Inputs_iTuple_Item4_L2Tuple_Item1, Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag, Inputs_iTuple_Item4_L2Tuple_Item2_L2Values, Inputs_iTuple_Item4_L2Tuple_Item3, Inputs_iTupleArray, IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple, iTuple, iTupleArray0, iTupleArray1)
	begin
		Inputs_iTuple_Item1 <= iTuple(59);
		Inputs_iTuple_Item2 <= iTuple(58 downto 51);
		Inputs_iTuple_Item3(1) <= iTuple(50 downto 47);
		Inputs_iTuple_Item3(0) <= iTuple(46 downto 43);
		Inputs_iTuple_Item4_L2Tuple_Item1 <= iTuple(42 downto 35);
		Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(1) <= iTuple(34);
		Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(0) <= iTuple(33);
		Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag <= iTuple(32);
		Inputs_iTuple_Item4_L2Tuple_Item3(1) <= iTuple(31 downto 25);
		Inputs_iTuple_Item4_L2Tuple_Item3(0) <= iTuple(24 downto 18);
		Inputs_iTuple_Item4_L2Array(1) <= iTuple(17 downto 11);
		Inputs_iTuple_Item4_L2Array(0) <= iTuple(10 downto 4);
		Inputs_iTuple_Item4_L2_L2Values(1) <= iTuple(3);
		Inputs_iTuple_Item4_L2_L2Values(0) <= iTuple(2);
		Inputs_iTuple_Item4_L2_L2Flag <= iTuple(1);
		Inputs_iTuple_Item4_L1Flag <= iTuple(0);
		Inputs_iTupleArray(0) <= iTupleArray0;
		Inputs_iTupleArray(1) <= iTupleArray1;
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(59) <= Inputs_iTuple_Item1;
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(58 downto 51) <= Inputs_iTuple_Item2;
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(50 downto 47) <= Inputs_iTuple_Item3(1);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(46 downto 43) <= Inputs_iTuple_Item3(0);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(42 downto 35) <= Inputs_iTuple_Item4_L2Tuple_Item1;
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(34) <= Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(1);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(33) <= Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(0);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(32) <= Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(31 downto 25) <= Inputs_iTuple_Item4_L2Tuple_Item3(1);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(24 downto 18) <= Inputs_iTuple_Item4_L2Tuple_Item3(0);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(17 downto 11) <= Inputs_iTuple_Item4_L2Array(1);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(10 downto 4) <= Inputs_iTuple_Item4_L2Array(0);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(3) <= Inputs_iTuple_Item4_L2_L2Values(1);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(2) <= Inputs_iTuple_Item4_L2_L2Values(0);
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(1) <= Inputs_iTuple_Item4_L2_L2Flag;
		IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple(0) <= Inputs_iTuple_Item4_L1Flag;
		Output_iTuple <= IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple;
		Output_iTupleArray0 <= Inputs_iTupleArray(0);
		Output_iTupleArray1 <= Inputs_iTupleArray(1);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
