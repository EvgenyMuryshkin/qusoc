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
-- System configuration name is IOTupleDirectInputL9ComponentsOutputModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity IOTupleDirectInputL9ComponentsOutputModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		iTuple_Item1 : in std_logic;
		iTuple_Item2 : in unsigned (7 downto 0);
		iTuple_Item30 : in unsigned (3 downto 0);
		iTuple_Item31 : in unsigned (3 downto 0);
		iTuple_Item4_L1Flag : in std_logic;
		iTuple_Item4_L2_L2Flag : in std_logic;
		iTuple_Item4_L2_L2Values0 : in std_logic;
		iTuple_Item4_L2_L2Values1 : in std_logic;
		iTuple_Item4_L2Array0_L2Flag : in std_logic;
		iTuple_Item4_L2Array0_L2Values0 : in unsigned (2 downto 0);
		iTuple_Item4_L2Array0_L2Values1 : in unsigned (2 downto 0);
		iTuple_Item4_L2Array1_L2Flag : in std_logic;
		iTuple_Item4_L2Array1_L2Values0 : in unsigned (2 downto 0);
		iTuple_Item4_L2Array1_L2Values1 : in unsigned (2 downto 0);
		iTuple_Item4_L2Tuple_Item1 : in unsigned (7 downto 0);
		iTuple_Item4_L2Tuple_Item2_L2Flag : in std_logic;
		iTuple_Item4_L2Tuple_Item2_L2Values0 : in std_logic;
		iTuple_Item4_L2Tuple_Item2_L2Values1 : in std_logic;
		iTuple_Item4_L2Tuple_Item30_L2Flag : in std_logic;
		iTuple_Item4_L2Tuple_Item30_L2Values0 : in unsigned (2 downto 0);
		iTuple_Item4_L2Tuple_Item30_L2Values1 : in unsigned (2 downto 0);
		iTuple_Item4_L2Tuple_Item31_L2Flag : in std_logic;
		iTuple_Item4_L2Tuple_Item31_L2Values0 : in unsigned (2 downto 0);
		iTuple_Item4_L2Tuple_Item31_L2Values1 : in unsigned (2 downto 0);
		iTupleArray0_Item1 : in std_logic;
		iTupleArray0_Item2 : in unsigned (3 downto 0);
		iTupleArray0_Item3_L1Flag : in std_logic;
		iTupleArray0_Item3_L2_L2Flag : in std_logic;
		iTupleArray0_Item3_L2_L2Values0 : in std_logic;
		iTupleArray0_Item3_L2_L2Values1 : in std_logic;
		iTupleArray0_Item3_L2Array0_L2Flag : in std_logic;
		iTupleArray0_Item3_L2Array0_L2Values0 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Array0_L2Values1 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Array1_L2Flag : in std_logic;
		iTupleArray0_Item3_L2Array1_L2Values0 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Array1_L2Values1 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Tuple_Item1 : in unsigned (7 downto 0);
		iTupleArray0_Item3_L2Tuple_Item2_L2Flag : in std_logic;
		iTupleArray0_Item3_L2Tuple_Item2_L2Values0 : in std_logic;
		iTupleArray0_Item3_L2Tuple_Item2_L2Values1 : in std_logic;
		iTupleArray0_Item3_L2Tuple_Item30_L2Flag : in std_logic;
		iTupleArray0_Item3_L2Tuple_Item30_L2Values0 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Tuple_Item30_L2Values1 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Tuple_Item31_L2Flag : in std_logic;
		iTupleArray0_Item3_L2Tuple_Item31_L2Values0 : in unsigned (2 downto 0);
		iTupleArray0_Item3_L2Tuple_Item31_L2Values1 : in unsigned (2 downto 0);
		iTupleArray0_Item40_L2Flag : in std_logic;
		iTupleArray0_Item40_L2Values0 : in std_logic;
		iTupleArray0_Item40_L2Values1 : in std_logic;
		iTupleArray0_Item41_L2Flag : in std_logic;
		iTupleArray0_Item41_L2Values0 : in std_logic;
		iTupleArray0_Item41_L2Values1 : in std_logic;
		iTupleArray1_Item1 : in std_logic;
		iTupleArray1_Item2 : in unsigned (3 downto 0);
		iTupleArray1_Item3_L1Flag : in std_logic;
		iTupleArray1_Item3_L2_L2Flag : in std_logic;
		iTupleArray1_Item3_L2_L2Values0 : in std_logic;
		iTupleArray1_Item3_L2_L2Values1 : in std_logic;
		iTupleArray1_Item3_L2Array0_L2Flag : in std_logic;
		iTupleArray1_Item3_L2Array0_L2Values0 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Array0_L2Values1 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Array1_L2Flag : in std_logic;
		iTupleArray1_Item3_L2Array1_L2Values0 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Array1_L2Values1 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Tuple_Item1 : in unsigned (7 downto 0);
		iTupleArray1_Item3_L2Tuple_Item2_L2Flag : in std_logic;
		iTupleArray1_Item3_L2Tuple_Item2_L2Values0 : in std_logic;
		iTupleArray1_Item3_L2Tuple_Item2_L2Values1 : in std_logic;
		iTupleArray1_Item3_L2Tuple_Item30_L2Flag : in std_logic;
		iTupleArray1_Item3_L2Tuple_Item30_L2Values0 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Tuple_Item30_L2Values1 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Tuple_Item31_L2Flag : in std_logic;
		iTupleArray1_Item3_L2Tuple_Item31_L2Values0 : in unsigned (2 downto 0);
		iTupleArray1_Item3_L2Tuple_Item31_L2Values1 : in unsigned (2 downto 0);
		iTupleArray1_Item40_L2Flag : in std_logic;
		iTupleArray1_Item40_L2Values0 : in std_logic;
		iTupleArray1_Item40_L2Values1 : in std_logic;
		iTupleArray1_Item41_L2Flag : in std_logic;
		iTupleArray1_Item41_L2Values0 : in std_logic;
		iTupleArray1_Item41_L2Values1 : in std_logic;
		Output_iTuple_Item1 : out std_logic;
		Output_iTuple_Item2 : out unsigned (7 downto 0);
		Output_iTuple_Item30 : out unsigned (3 downto 0);
		Output_iTuple_Item31 : out unsigned (3 downto 0);
		Output_iTuple_Item4_L1Flag : out std_logic;
		Output_iTuple_Item4_L2_L2Flag : out std_logic;
		Output_iTuple_Item4_L2_L2Values0 : out std_logic;
		Output_iTuple_Item4_L2_L2Values1 : out std_logic;
		Output_iTuple_Item4_L2Array0_L2Flag : out std_logic;
		Output_iTuple_Item4_L2Array0_L2Values0 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Array0_L2Values1 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Array1_L2Flag : out std_logic;
		Output_iTuple_Item4_L2Array1_L2Values0 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Array1_L2Values1 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Tuple_Item1 : out unsigned (7 downto 0);
		Output_iTuple_Item4_L2Tuple_Item2_L2Flag : out std_logic;
		Output_iTuple_Item4_L2Tuple_Item2_L2Values0 : out std_logic;
		Output_iTuple_Item4_L2Tuple_Item2_L2Values1 : out std_logic;
		Output_iTuple_Item4_L2Tuple_Item30_L2Flag : out std_logic;
		Output_iTuple_Item4_L2Tuple_Item30_L2Values0 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Tuple_Item30_L2Values1 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Tuple_Item31_L2Flag : out std_logic;
		Output_iTuple_Item4_L2Tuple_Item31_L2Values0 : out unsigned (2 downto 0);
		Output_iTuple_Item4_L2Tuple_Item31_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item1 : out std_logic;
		Output_iTupleArray0_Item2 : out unsigned (3 downto 0);
		Output_iTupleArray0_Item3_L1Flag : out std_logic;
		Output_iTupleArray0_Item3_L2_L2Flag : out std_logic;
		Output_iTupleArray0_Item3_L2_L2Values0 : out std_logic;
		Output_iTupleArray0_Item3_L2_L2Values1 : out std_logic;
		Output_iTupleArray0_Item3_L2Array0_L2Flag : out std_logic;
		Output_iTupleArray0_Item3_L2Array0_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Array0_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Array1_L2Flag : out std_logic;
		Output_iTupleArray0_Item3_L2Array1_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Array1_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Tuple_Item1 : out unsigned (7 downto 0);
		Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag : out std_logic;
		Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values0 : out std_logic;
		Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values1 : out std_logic;
		Output_iTupleArray0_Item3_L2Tuple_Item30_L2Flag : out std_logic;
		Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag : out std_logic;
		Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray0_Item40_L2Flag : out std_logic;
		Output_iTupleArray0_Item40_L2Values0 : out std_logic;
		Output_iTupleArray0_Item40_L2Values1 : out std_logic;
		Output_iTupleArray0_Item41_L2Flag : out std_logic;
		Output_iTupleArray0_Item41_L2Values0 : out std_logic;
		Output_iTupleArray0_Item41_L2Values1 : out std_logic;
		Output_iTupleArray1_Item1 : out std_logic;
		Output_iTupleArray1_Item2 : out unsigned (3 downto 0);
		Output_iTupleArray1_Item3_L1Flag : out std_logic;
		Output_iTupleArray1_Item3_L2_L2Flag : out std_logic;
		Output_iTupleArray1_Item3_L2_L2Values0 : out std_logic;
		Output_iTupleArray1_Item3_L2_L2Values1 : out std_logic;
		Output_iTupleArray1_Item3_L2Array0_L2Flag : out std_logic;
		Output_iTupleArray1_Item3_L2Array0_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Array0_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Array1_L2Flag : out std_logic;
		Output_iTupleArray1_Item3_L2Array1_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Array1_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Tuple_Item1 : out unsigned (7 downto 0);
		Output_iTupleArray1_Item3_L2Tuple_Item2_L2Flag : out std_logic;
		Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values0 : out std_logic;
		Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values1 : out std_logic;
		Output_iTupleArray1_Item3_L2Tuple_Item30_L2Flag : out std_logic;
		Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Tuple_Item31_L2Flag : out std_logic;
		Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values0 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values1 : out unsigned (2 downto 0);
		Output_iTupleArray1_Item40_L2Flag : out std_logic;
		Output_iTupleArray1_Item40_L2Values0 : out std_logic;
		Output_iTupleArray1_Item40_L2Values1 : out std_logic;
		Output_iTupleArray1_Item41_L2Flag : out std_logic;
		Output_iTupleArray1_Item41_L2Values0 : out std_logic;
		Output_iTupleArray1_Item41_L2Values1 : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of IOTupleDirectInputL9ComponentsOutputModule_TopLevel is
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
	process (Inputs_iTuple_Item1, Inputs_iTuple_Item2, Inputs_iTuple_Item3, Inputs_iTuple_Item4_L1Flag, Inputs_iTuple_Item4_L2_L2Flag, Inputs_iTuple_Item4_L2_L2Values, Inputs_iTuple_Item4_L2Array, Inputs_iTuple_Item4_L2Tuple_Item1, Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag, Inputs_iTuple_Item4_L2Tuple_Item2_L2Values, Inputs_iTuple_Item4_L2Tuple_Item3, Inputs_iTupleArray, iTuple_Item1, iTuple_Item2, iTuple_Item30, iTuple_Item31, iTuple_Item4_L1Flag, iTuple_Item4_L2_L2Flag, iTuple_Item4_L2_L2Values0, iTuple_Item4_L2_L2Values1, iTuple_Item4_L2Array0_L2Flag, iTuple_Item4_L2Array0_L2Values0, iTuple_Item4_L2Array0_L2Values1, iTuple_Item4_L2Array1_L2Flag, iTuple_Item4_L2Array1_L2Values0, iTuple_Item4_L2Array1_L2Values1, iTuple_Item4_L2Tuple_Item1, iTuple_Item4_L2Tuple_Item2_L2Flag, iTuple_Item4_L2Tuple_Item2_L2Values0, iTuple_Item4_L2Tuple_Item2_L2Values1, iTuple_Item4_L2Tuple_Item30_L2Flag, iTuple_Item4_L2Tuple_Item30_L2Values0, iTuple_Item4_L2Tuple_Item30_L2Values1, iTuple_Item4_L2Tuple_Item31_L2Flag, iTuple_Item4_L2Tuple_Item31_L2Values0, iTuple_Item4_L2Tuple_Item31_L2Values1, iTupleArray0_Item1, iTupleArray0_Item2, iTupleArray0_Item3_L1Flag, iTupleArray0_Item3_L2_L2Flag, iTupleArray0_Item3_L2_L2Values0, iTupleArray0_Item3_L2_L2Values1, iTupleArray0_Item3_L2Array0_L2Flag, iTupleArray0_Item3_L2Array0_L2Values0, iTupleArray0_Item3_L2Array0_L2Values1, iTupleArray0_Item3_L2Array1_L2Flag, iTupleArray0_Item3_L2Array1_L2Values0, iTupleArray0_Item3_L2Array1_L2Values1, iTupleArray0_Item3_L2Tuple_Item1, iTupleArray0_Item3_L2Tuple_Item2_L2Flag, iTupleArray0_Item3_L2Tuple_Item2_L2Values0, iTupleArray0_Item3_L2Tuple_Item2_L2Values1, iTupleArray0_Item3_L2Tuple_Item30_L2Flag, iTupleArray0_Item3_L2Tuple_Item30_L2Values0, iTupleArray0_Item3_L2Tuple_Item30_L2Values1, iTupleArray0_Item3_L2Tuple_Item31_L2Flag, iTupleArray0_Item3_L2Tuple_Item31_L2Values0, iTupleArray0_Item3_L2Tuple_Item31_L2Values1, iTupleArray0_Item40_L2Flag, iTupleArray0_Item40_L2Values0, iTupleArray0_Item40_L2Values1, iTupleArray0_Item41_L2Flag, iTupleArray0_Item41_L2Values0, iTupleArray0_Item41_L2Values1, iTupleArray1_Item1, iTupleArray1_Item2, iTupleArray1_Item3_L1Flag, iTupleArray1_Item3_L2_L2Flag, iTupleArray1_Item3_L2_L2Values0, iTupleArray1_Item3_L2_L2Values1, iTupleArray1_Item3_L2Array0_L2Flag, iTupleArray1_Item3_L2Array0_L2Values0, iTupleArray1_Item3_L2Array0_L2Values1, iTupleArray1_Item3_L2Array1_L2Flag, iTupleArray1_Item3_L2Array1_L2Values0, iTupleArray1_Item3_L2Array1_L2Values1, iTupleArray1_Item3_L2Tuple_Item1, iTupleArray1_Item3_L2Tuple_Item2_L2Flag, iTupleArray1_Item3_L2Tuple_Item2_L2Values0, iTupleArray1_Item3_L2Tuple_Item2_L2Values1, iTupleArray1_Item3_L2Tuple_Item30_L2Flag, iTupleArray1_Item3_L2Tuple_Item30_L2Values0, iTupleArray1_Item3_L2Tuple_Item30_L2Values1, iTupleArray1_Item3_L2Tuple_Item31_L2Flag, iTupleArray1_Item3_L2Tuple_Item31_L2Values0, iTupleArray1_Item3_L2Tuple_Item31_L2Values1, iTupleArray1_Item40_L2Flag, iTupleArray1_Item40_L2Values0, iTupleArray1_Item40_L2Values1, iTupleArray1_Item41_L2Flag, iTupleArray1_Item41_L2Values0, iTupleArray1_Item41_L2Values1)
	begin
		Inputs_iTuple_Item1 <= iTuple_Item1;
		Inputs_iTuple_Item2 <= iTuple_Item2;
		Inputs_iTuple_Item3(0) <= iTuple_Item30;
		Inputs_iTuple_Item3(1) <= iTuple_Item31;
		Inputs_iTuple_Item4_L1Flag <= iTuple_Item4_L1Flag;
		Inputs_iTuple_Item4_L2_L2Flag <= iTuple_Item4_L2_L2Flag;
		Inputs_iTuple_Item4_L2_L2Values(0) <= iTuple_Item4_L2_L2Values0;
		Inputs_iTuple_Item4_L2_L2Values(1) <= iTuple_Item4_L2_L2Values1;
		Inputs_iTuple_Item4_L2Array(0)(6 downto 4) <= iTuple_Item4_L2Array0_L2Values1;
		Inputs_iTuple_Item4_L2Array(0)(3 downto 1) <= iTuple_Item4_L2Array0_L2Values0;
		Inputs_iTuple_Item4_L2Array(0)(0) <= iTuple_Item4_L2Array0_L2Flag;
		Inputs_iTuple_Item4_L2Array(1)(6 downto 4) <= iTuple_Item4_L2Array1_L2Values1;
		Inputs_iTuple_Item4_L2Array(1)(3 downto 1) <= iTuple_Item4_L2Array1_L2Values0;
		Inputs_iTuple_Item4_L2Array(1)(0) <= iTuple_Item4_L2Array1_L2Flag;
		Inputs_iTuple_Item4_L2Tuple_Item1 <= iTuple_Item4_L2Tuple_Item1;
		Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag <= iTuple_Item4_L2Tuple_Item2_L2Flag;
		Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(0) <= iTuple_Item4_L2Tuple_Item2_L2Values0;
		Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(1) <= iTuple_Item4_L2Tuple_Item2_L2Values1;
		Inputs_iTuple_Item4_L2Tuple_Item3(0)(6 downto 4) <= iTuple_Item4_L2Tuple_Item30_L2Values1;
		Inputs_iTuple_Item4_L2Tuple_Item3(0)(3 downto 1) <= iTuple_Item4_L2Tuple_Item30_L2Values0;
		Inputs_iTuple_Item4_L2Tuple_Item3(0)(0) <= iTuple_Item4_L2Tuple_Item30_L2Flag;
		Inputs_iTuple_Item4_L2Tuple_Item3(1)(6 downto 4) <= iTuple_Item4_L2Tuple_Item31_L2Values1;
		Inputs_iTuple_Item4_L2Tuple_Item3(1)(3 downto 1) <= iTuple_Item4_L2Tuple_Item31_L2Values0;
		Inputs_iTuple_Item4_L2Tuple_Item3(1)(0) <= iTuple_Item4_L2Tuple_Item31_L2Flag;
		Inputs_iTupleArray(0)(53) <= iTupleArray0_Item1;
		Inputs_iTupleArray(0)(52 downto 49) <= iTupleArray0_Item2;
		Inputs_iTupleArray(0)(48 downto 41) <= iTupleArray0_Item3_L2Tuple_Item1;
		Inputs_iTupleArray(0)(40) <= iTupleArray0_Item3_L2Tuple_Item2_L2Values1;
		Inputs_iTupleArray(0)(39) <= iTupleArray0_Item3_L2Tuple_Item2_L2Values0;
		Inputs_iTupleArray(0)(38) <= iTupleArray0_Item3_L2Tuple_Item2_L2Flag;
		Inputs_iTupleArray(0)(37 downto 35) <= iTupleArray0_Item3_L2Tuple_Item31_L2Values1;
		Inputs_iTupleArray(0)(34 downto 32) <= iTupleArray0_Item3_L2Tuple_Item31_L2Values0;
		Inputs_iTupleArray(0)(31) <= iTupleArray0_Item3_L2Tuple_Item31_L2Flag;
		Inputs_iTupleArray(0)(30 downto 28) <= iTupleArray0_Item3_L2Tuple_Item30_L2Values1;
		Inputs_iTupleArray(0)(27 downto 25) <= iTupleArray0_Item3_L2Tuple_Item30_L2Values0;
		Inputs_iTupleArray(0)(24) <= iTupleArray0_Item3_L2Tuple_Item30_L2Flag;
		Inputs_iTupleArray(0)(23 downto 21) <= iTupleArray0_Item3_L2Array1_L2Values1;
		Inputs_iTupleArray(0)(20 downto 18) <= iTupleArray0_Item3_L2Array1_L2Values0;
		Inputs_iTupleArray(0)(17) <= iTupleArray0_Item3_L2Array1_L2Flag;
		Inputs_iTupleArray(0)(16 downto 14) <= iTupleArray0_Item3_L2Array0_L2Values1;
		Inputs_iTupleArray(0)(13 downto 11) <= iTupleArray0_Item3_L2Array0_L2Values0;
		Inputs_iTupleArray(0)(10) <= iTupleArray0_Item3_L2Array0_L2Flag;
		Inputs_iTupleArray(0)(9) <= iTupleArray0_Item3_L2_L2Values1;
		Inputs_iTupleArray(0)(8) <= iTupleArray0_Item3_L2_L2Values0;
		Inputs_iTupleArray(0)(7) <= iTupleArray0_Item3_L2_L2Flag;
		Inputs_iTupleArray(0)(6) <= iTupleArray0_Item3_L1Flag;
		Inputs_iTupleArray(0)(5) <= iTupleArray0_Item41_L2Values1;
		Inputs_iTupleArray(0)(4) <= iTupleArray0_Item41_L2Values0;
		Inputs_iTupleArray(0)(3) <= iTupleArray0_Item41_L2Flag;
		Inputs_iTupleArray(0)(2) <= iTupleArray0_Item40_L2Values1;
		Inputs_iTupleArray(0)(1) <= iTupleArray0_Item40_L2Values0;
		Inputs_iTupleArray(0)(0) <= iTupleArray0_Item40_L2Flag;
		Inputs_iTupleArray(1)(53) <= iTupleArray1_Item1;
		Inputs_iTupleArray(1)(52 downto 49) <= iTupleArray1_Item2;
		Inputs_iTupleArray(1)(48 downto 41) <= iTupleArray1_Item3_L2Tuple_Item1;
		Inputs_iTupleArray(1)(40) <= iTupleArray1_Item3_L2Tuple_Item2_L2Values1;
		Inputs_iTupleArray(1)(39) <= iTupleArray1_Item3_L2Tuple_Item2_L2Values0;
		Inputs_iTupleArray(1)(38) <= iTupleArray1_Item3_L2Tuple_Item2_L2Flag;
		Inputs_iTupleArray(1)(37 downto 35) <= iTupleArray1_Item3_L2Tuple_Item31_L2Values1;
		Inputs_iTupleArray(1)(34 downto 32) <= iTupleArray1_Item3_L2Tuple_Item31_L2Values0;
		Inputs_iTupleArray(1)(31) <= iTupleArray1_Item3_L2Tuple_Item31_L2Flag;
		Inputs_iTupleArray(1)(30 downto 28) <= iTupleArray1_Item3_L2Tuple_Item30_L2Values1;
		Inputs_iTupleArray(1)(27 downto 25) <= iTupleArray1_Item3_L2Tuple_Item30_L2Values0;
		Inputs_iTupleArray(1)(24) <= iTupleArray1_Item3_L2Tuple_Item30_L2Flag;
		Inputs_iTupleArray(1)(23 downto 21) <= iTupleArray1_Item3_L2Array1_L2Values1;
		Inputs_iTupleArray(1)(20 downto 18) <= iTupleArray1_Item3_L2Array1_L2Values0;
		Inputs_iTupleArray(1)(17) <= iTupleArray1_Item3_L2Array1_L2Flag;
		Inputs_iTupleArray(1)(16 downto 14) <= iTupleArray1_Item3_L2Array0_L2Values1;
		Inputs_iTupleArray(1)(13 downto 11) <= iTupleArray1_Item3_L2Array0_L2Values0;
		Inputs_iTupleArray(1)(10) <= iTupleArray1_Item3_L2Array0_L2Flag;
		Inputs_iTupleArray(1)(9) <= iTupleArray1_Item3_L2_L2Values1;
		Inputs_iTupleArray(1)(8) <= iTupleArray1_Item3_L2_L2Values0;
		Inputs_iTupleArray(1)(7) <= iTupleArray1_Item3_L2_L2Flag;
		Inputs_iTupleArray(1)(6) <= iTupleArray1_Item3_L1Flag;
		Inputs_iTupleArray(1)(5) <= iTupleArray1_Item41_L2Values1;
		Inputs_iTupleArray(1)(4) <= iTupleArray1_Item41_L2Values0;
		Inputs_iTupleArray(1)(3) <= iTupleArray1_Item41_L2Flag;
		Inputs_iTupleArray(1)(2) <= iTupleArray1_Item40_L2Values1;
		Inputs_iTupleArray(1)(1) <= iTupleArray1_Item40_L2Values0;
		Inputs_iTupleArray(1)(0) <= iTupleArray1_Item40_L2Flag;
		Output_iTuple_Item1 <= Inputs_iTuple_Item1;
		Output_iTuple_Item2 <= Inputs_iTuple_Item2;
		Output_iTuple_Item30 <= Inputs_iTuple_Item3(0);
		Output_iTuple_Item31 <= Inputs_iTuple_Item3(1);
		Output_iTuple_Item4_L1Flag <= Inputs_iTuple_Item4_L1Flag;
		Output_iTuple_Item4_L2_L2Flag <= Inputs_iTuple_Item4_L2_L2Flag;
		Output_iTuple_Item4_L2_L2Values0 <= Inputs_iTuple_Item4_L2_L2Values(0);
		Output_iTuple_Item4_L2_L2Values1 <= Inputs_iTuple_Item4_L2_L2Values(1);
		Output_iTuple_Item4_L2Array0_L2Flag <= Inputs_iTuple_Item4_L2Array(0)(0);
		Output_iTuple_Item4_L2Array0_L2Values0 <= Inputs_iTuple_Item4_L2Array(0)(3 downto 1);
		Output_iTuple_Item4_L2Array0_L2Values1 <= Inputs_iTuple_Item4_L2Array(0)(6 downto 4);
		Output_iTuple_Item4_L2Array1_L2Flag <= Inputs_iTuple_Item4_L2Array(1)(0);
		Output_iTuple_Item4_L2Array1_L2Values0 <= Inputs_iTuple_Item4_L2Array(1)(3 downto 1);
		Output_iTuple_Item4_L2Array1_L2Values1 <= Inputs_iTuple_Item4_L2Array(1)(6 downto 4);
		Output_iTuple_Item4_L2Tuple_Item1 <= Inputs_iTuple_Item4_L2Tuple_Item1;
		Output_iTuple_Item4_L2Tuple_Item2_L2Flag <= Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
		Output_iTuple_Item4_L2Tuple_Item2_L2Values0 <= Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(0);
		Output_iTuple_Item4_L2Tuple_Item2_L2Values1 <= Inputs_iTuple_Item4_L2Tuple_Item2_L2Values(1);
		Output_iTuple_Item4_L2Tuple_Item30_L2Flag <= Inputs_iTuple_Item4_L2Tuple_Item3(0)(0);
		Output_iTuple_Item4_L2Tuple_Item30_L2Values0 <= Inputs_iTuple_Item4_L2Tuple_Item3(0)(3 downto 1);
		Output_iTuple_Item4_L2Tuple_Item30_L2Values1 <= Inputs_iTuple_Item4_L2Tuple_Item3(0)(6 downto 4);
		Output_iTuple_Item4_L2Tuple_Item31_L2Flag <= Inputs_iTuple_Item4_L2Tuple_Item3(1)(0);
		Output_iTuple_Item4_L2Tuple_Item31_L2Values0 <= Inputs_iTuple_Item4_L2Tuple_Item3(1)(3 downto 1);
		Output_iTuple_Item4_L2Tuple_Item31_L2Values1 <= Inputs_iTuple_Item4_L2Tuple_Item3(1)(6 downto 4);
		Output_iTupleArray0_Item1 <= Inputs_iTupleArray(0)(53);
		Output_iTupleArray0_Item2 <= Inputs_iTupleArray(0)(52 downto 49);
		Output_iTupleArray0_Item3_L1Flag <= Inputs_iTupleArray(0)(6);
		Output_iTupleArray0_Item3_L2_L2Flag <= Inputs_iTupleArray(0)(7);
		Output_iTupleArray0_Item3_L2_L2Values0 <= Inputs_iTupleArray(0)(8);
		Output_iTupleArray0_Item3_L2_L2Values1 <= Inputs_iTupleArray(0)(9);
		Output_iTupleArray0_Item3_L2Array0_L2Flag <= Inputs_iTupleArray(0)(10);
		Output_iTupleArray0_Item3_L2Array0_L2Values0 <= Inputs_iTupleArray(0)(13 downto 11);
		Output_iTupleArray0_Item3_L2Array0_L2Values1 <= Inputs_iTupleArray(0)(16 downto 14);
		Output_iTupleArray0_Item3_L2Array1_L2Flag <= Inputs_iTupleArray(0)(17);
		Output_iTupleArray0_Item3_L2Array1_L2Values0 <= Inputs_iTupleArray(0)(20 downto 18);
		Output_iTupleArray0_Item3_L2Array1_L2Values1 <= Inputs_iTupleArray(0)(23 downto 21);
		Output_iTupleArray0_Item3_L2Tuple_Item1 <= Inputs_iTupleArray(0)(48 downto 41);
		Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag <= Inputs_iTupleArray(0)(38);
		Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values0 <= Inputs_iTupleArray(0)(39);
		Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values1 <= Inputs_iTupleArray(0)(40);
		Output_iTupleArray0_Item3_L2Tuple_Item30_L2Flag <= Inputs_iTupleArray(0)(24);
		Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values0 <= Inputs_iTupleArray(0)(27 downto 25);
		Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values1 <= Inputs_iTupleArray(0)(30 downto 28);
		Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag <= Inputs_iTupleArray(0)(31);
		Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values0 <= Inputs_iTupleArray(0)(34 downto 32);
		Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values1 <= Inputs_iTupleArray(0)(37 downto 35);
		Output_iTupleArray0_Item40_L2Flag <= Inputs_iTupleArray(0)(0);
		Output_iTupleArray0_Item40_L2Values0 <= Inputs_iTupleArray(0)(1);
		Output_iTupleArray0_Item40_L2Values1 <= Inputs_iTupleArray(0)(2);
		Output_iTupleArray0_Item41_L2Flag <= Inputs_iTupleArray(0)(3);
		Output_iTupleArray0_Item41_L2Values0 <= Inputs_iTupleArray(0)(4);
		Output_iTupleArray0_Item41_L2Values1 <= Inputs_iTupleArray(0)(5);
		Output_iTupleArray1_Item1 <= Inputs_iTupleArray(1)(53);
		Output_iTupleArray1_Item2 <= Inputs_iTupleArray(1)(52 downto 49);
		Output_iTupleArray1_Item3_L1Flag <= Inputs_iTupleArray(1)(6);
		Output_iTupleArray1_Item3_L2_L2Flag <= Inputs_iTupleArray(1)(7);
		Output_iTupleArray1_Item3_L2_L2Values0 <= Inputs_iTupleArray(1)(8);
		Output_iTupleArray1_Item3_L2_L2Values1 <= Inputs_iTupleArray(1)(9);
		Output_iTupleArray1_Item3_L2Array0_L2Flag <= Inputs_iTupleArray(1)(10);
		Output_iTupleArray1_Item3_L2Array0_L2Values1 <= Inputs_iTupleArray(1)(16 downto 14);
		Output_iTupleArray1_Item3_L2Array0_L2Values0 <= Inputs_iTupleArray(1)(13 downto 11);
		Output_iTupleArray1_Item3_L2Array1_L2Flag <= Inputs_iTupleArray(1)(17);
		Output_iTupleArray1_Item3_L2Array1_L2Values0 <= Inputs_iTupleArray(1)(20 downto 18);
		Output_iTupleArray1_Item3_L2Array1_L2Values1 <= Inputs_iTupleArray(1)(23 downto 21);
		Output_iTupleArray1_Item3_L2Tuple_Item1 <= Inputs_iTupleArray(1)(48 downto 41);
		Output_iTupleArray1_Item3_L2Tuple_Item2_L2Flag <= Inputs_iTupleArray(1)(38);
		Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values0 <= Inputs_iTupleArray(1)(39);
		Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values1 <= Inputs_iTupleArray(1)(40);
		Output_iTupleArray1_Item3_L2Tuple_Item30_L2Flag <= Inputs_iTupleArray(1)(24);
		Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values1 <= Inputs_iTupleArray(1)(30 downto 28);
		Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values0 <= Inputs_iTupleArray(1)(27 downto 25);
		Output_iTupleArray1_Item3_L2Tuple_Item31_L2Flag <= Inputs_iTupleArray(1)(31);
		Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values0 <= Inputs_iTupleArray(1)(34 downto 32);
		Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values1 <= Inputs_iTupleArray(1)(37 downto 35);
		Output_iTupleArray1_Item40_L2Flag <= Inputs_iTupleArray(1)(0);
		Output_iTupleArray1_Item40_L2Values0 <= Inputs_iTupleArray(1)(1);
		Output_iTupleArray1_Item40_L2Values1 <= Inputs_iTupleArray(1)(2);
		Output_iTupleArray1_Item41_L2Flag <= Inputs_iTupleArray(1)(3);
		Output_iTupleArray1_Item41_L2Values0 <= Inputs_iTupleArray(1)(4);
		Output_iTupleArray1_Item41_L2Values1 <= Inputs_iTupleArray(1)(5);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
