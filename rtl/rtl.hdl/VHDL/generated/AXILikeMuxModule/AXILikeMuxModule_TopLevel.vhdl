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
-- System configuration name is AXILikeMuxModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXILikeMuxModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		MAddr : in unsigned (2 downto 0);
		MAddrValid : in std_logic;
		MArr0_Addr : in unsigned (1 downto 0);
		MArr0_IsActive : in std_logic;
		MArr0_Payload_Data : in unsigned (7 downto 0);
		MArr0_Payload_DataFlag : in std_logic;
		MArr1_Addr : in unsigned (1 downto 0);
		MArr1_IsActive : in std_logic;
		MArr1_Payload_Data : in unsigned (7 downto 0);
		MArr1_Payload_DataFlag : in std_logic;
		MArr2_Addr : in unsigned (1 downto 0);
		MArr2_IsActive : in std_logic;
		MArr2_Payload_Data : in unsigned (7 downto 0);
		MArr2_Payload_DataFlag : in std_logic;
		MArr3_Addr : in unsigned (1 downto 0);
		MArr3_IsActive : in std_logic;
		MArr3_Payload_Data : in unsigned (7 downto 0);
		MArr3_Payload_DataFlag : in std_logic;
		MArr4_Addr : in unsigned (1 downto 0);
		MArr4_IsActive : in std_logic;
		MArr4_Payload_Data : in unsigned (7 downto 0);
		MArr4_Payload_DataFlag : in std_logic;
		MArr5_Addr : in unsigned (1 downto 0);
		MArr5_IsActive : in std_logic;
		MArr5_Payload_Data : in unsigned (7 downto 0);
		MArr5_Payload_DataFlag : in std_logic;
		MArr6_Addr : in unsigned (1 downto 0);
		MArr6_IsActive : in std_logic;
		MArr6_Payload_Data : in unsigned (7 downto 0);
		MArr6_Payload_DataFlag : in std_logic;
		MArr7_Addr : in unsigned (1 downto 0);
		MArr7_IsActive : in std_logic;
		MArr7_Payload_Data : in unsigned (7 downto 0);
		MArr7_Payload_DataFlag : in std_logic;
		SAddr : in unsigned (1 downto 0);
		SAddrValid : in std_logic;
		SArr0_IsActive : in std_logic;
		SArr0_Payload_Data : in unsigned (7 downto 0);
		SArr0_Payload_DataFlag : in std_logic;
		SArr1_IsActive : in std_logic;
		SArr1_Payload_Data : in unsigned (7 downto 0);
		SArr1_Payload_DataFlag : in std_logic;
		SArr2_IsActive : in std_logic;
		SArr2_Payload_Data : in unsigned (7 downto 0);
		SArr2_Payload_DataFlag : in std_logic;
		SArr3_IsActive : in std_logic;
		SArr3_Payload_Data : in unsigned (7 downto 0);
		SArr3_Payload_DataFlag : in std_logic;
		OutMData0_Addr : out unsigned (1 downto 0);
		OutMData0_IsActive : out std_logic;
		OutMData0_Payload_Data : out unsigned (7 downto 0);
		OutMData0_Payload_DataFlag : out std_logic;
		OutMData1_Addr : out unsigned (1 downto 0);
		OutMData1_IsActive : out std_logic;
		OutMData1_Payload_Data : out unsigned (7 downto 0);
		OutMData1_Payload_DataFlag : out std_logic;
		OutMData2_Addr : out unsigned (1 downto 0);
		OutMData2_IsActive : out std_logic;
		OutMData2_Payload_Data : out unsigned (7 downto 0);
		OutMData2_Payload_DataFlag : out std_logic;
		OutMData3_Addr : out unsigned (1 downto 0);
		OutMData3_IsActive : out std_logic;
		OutMData3_Payload_Data : out unsigned (7 downto 0);
		OutMData3_Payload_DataFlag : out std_logic;
		OutSData0_IsActive : out std_logic;
		OutSData0_Payload_Data : out unsigned (7 downto 0);
		OutSData0_Payload_DataFlag : out std_logic;
		OutSData1_IsActive : out std_logic;
		OutSData1_Payload_Data : out unsigned (7 downto 0);
		OutSData1_Payload_DataFlag : out std_logic;
		OutSData2_IsActive : out std_logic;
		OutSData2_Payload_Data : out unsigned (7 downto 0);
		OutSData2_Payload_DataFlag : out std_logic;
		OutSData3_IsActive : out std_logic;
		OutSData3_Payload_Data : out unsigned (7 downto 0);
		OutSData3_Payload_DataFlag : out std_logic;
		OutSData4_IsActive : out std_logic;
		OutSData4_Payload_Data : out unsigned (7 downto 0);
		OutSData4_Payload_DataFlag : out std_logic;
		OutSData5_IsActive : out std_logic;
		OutSData5_Payload_Data : out unsigned (7 downto 0);
		OutSData5_Payload_DataFlag : out std_logic;
		OutSData6_IsActive : out std_logic;
		OutSData6_Payload_Data : out unsigned (7 downto 0);
		OutSData6_Payload_DataFlag : out std_logic;
		OutSData7_IsActive : out std_logic;
		OutSData7_Payload_Data : out unsigned (7 downto 0);
		OutSData7_Payload_DataFlag : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXILikeMuxModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant mastersCount : signed(4 downto 0) := "01000";
	constant slavesCount : signed(3 downto 0) := "0100";
	signal Inputs_MAddr : unsigned(2 downto 0) := (others => '0');
	signal Inputs_MAddrValid : std_logic := '0';
	signal Inputs_SAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_SAddrValid : std_logic := '0';
	signal fullDuplexMux_iLeftAddr : unsigned(2 downto 0) := (others => '0');
	signal fullDuplexMux_iLeftAddrValid : std_logic := '0';
	signal fullDuplexMux_iRightAddr : unsigned(1 downto 0) := (others => '0');
	signal fullDuplexMux_iRightAddrValid : std_logic := '0';
	signal fullDuplexMux_oMuxLeftData : unsigned(11 downto 0) := (others => '0');
	signal fullDuplexMux_oMuxRightData : unsigned(9 downto 0) := (others => '0');
	signal fullDuplexMux_iLeft0_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft1_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft2_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft3_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft4_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft5_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft6_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeft7_fullDuplexMux_iLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_iLeftAddr_fullDuplexMux_iLeftAddr_HardLink : unsigned(2 downto 0) := "000";
	signal fullDuplexMux_iLeftAddrValid_fullDuplexMux_iLeftAddrValid_HardLink : std_logic := '0';
	signal fullDuplexMux_iRight0_fullDuplexMux_iRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_iRight1_fullDuplexMux_iRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_iRight2_fullDuplexMux_iRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_iRight3_fullDuplexMux_iRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_iRightAddr_fullDuplexMux_iRightAddr_HardLink : unsigned(1 downto 0) := "00";
	signal fullDuplexMux_iRightAddrValid_fullDuplexMux_iRightAddrValid_HardLink : std_logic := '0';
	signal fullDuplexMux_oLeft0_fullDuplexMux_oLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_oLeft1_fullDuplexMux_oLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_oLeft2_fullDuplexMux_oLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_oLeft3_fullDuplexMux_oLeft_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_oMuxLeftData_fullDuplexMux_oMuxLeftData_HardLink : unsigned(11 downto 0) := "000000000000";
	signal fullDuplexMux_oMuxRightData_fullDuplexMux_oMuxRightData_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight0_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight1_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight2_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight3_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight4_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight5_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight6_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	signal fullDuplexMux_oRight7_fullDuplexMux_oRight_HardLink : unsigned(9 downto 0) := "0000000000";
	type Inputs_MArrArray is array (0 to 7) of unsigned (11 downto 0);
	signal Inputs_MArr : Inputs_MArrArray := (others => (others => '0'));
	type Inputs_SArrArray is array (0 to 3) of unsigned (9 downto 0);
	signal Inputs_SArr : Inputs_SArrArray := (others => (others => '0'));
	type fullDuplexMux_iLeftArray is array (0 to 7) of unsigned (11 downto 0);
	signal fullDuplexMux_iLeft : fullDuplexMux_iLeftArray := (others => (others => '0'));
	type fullDuplexMux_iRightArray is array (0 to 3) of unsigned (9 downto 0);
	signal fullDuplexMux_iRight : fullDuplexMux_iRightArray := (others => (others => '0'));
	type fullDuplexMux_oLeftArray is array (0 to 3) of unsigned (11 downto 0);
	signal fullDuplexMux_oLeft : fullDuplexMux_oLeftArray := (others => (others => '0'));
	type fullDuplexMux_oRightArray is array (0 to 7) of unsigned (9 downto 0);
	signal fullDuplexMux_oRight : fullDuplexMux_oRightArray := (others => (others => '0'));
begin
	AXILikeMuxModule_TopLevel_fullDuplexMux : entity work.AXILikeMuxModule_TopLevel_fullDuplexMux
	port map
	(
		-- [BEGIN USER MAP FOR fullDuplexMux]
		-- [END USER MAP FOR fullDuplexMux]
		iLeft0 => fullDuplexMux_iLeft0_fullDuplexMux_iLeft_HardLink,
		iLeft1 => fullDuplexMux_iLeft1_fullDuplexMux_iLeft_HardLink,
		iLeft2 => fullDuplexMux_iLeft2_fullDuplexMux_iLeft_HardLink,
		iLeft3 => fullDuplexMux_iLeft3_fullDuplexMux_iLeft_HardLink,
		iLeft4 => fullDuplexMux_iLeft4_fullDuplexMux_iLeft_HardLink,
		iLeft5 => fullDuplexMux_iLeft5_fullDuplexMux_iLeft_HardLink,
		iLeft6 => fullDuplexMux_iLeft6_fullDuplexMux_iLeft_HardLink,
		iLeft7 => fullDuplexMux_iLeft7_fullDuplexMux_iLeft_HardLink,
		iLeftAddr => fullDuplexMux_iLeftAddr_fullDuplexMux_iLeftAddr_HardLink,
		iLeftAddrValid => fullDuplexMux_iLeftAddrValid_fullDuplexMux_iLeftAddrValid_HardLink,
		iRight0 => fullDuplexMux_iRight0_fullDuplexMux_iRight_HardLink,
		iRight1 => fullDuplexMux_iRight1_fullDuplexMux_iRight_HardLink,
		iRight2 => fullDuplexMux_iRight2_fullDuplexMux_iRight_HardLink,
		iRight3 => fullDuplexMux_iRight3_fullDuplexMux_iRight_HardLink,
		iRightAddr => fullDuplexMux_iRightAddr_fullDuplexMux_iRightAddr_HardLink,
		iRightAddrValid => fullDuplexMux_iRightAddrValid_fullDuplexMux_iRightAddrValid_HardLink,
		oLeft0 => fullDuplexMux_oLeft0_fullDuplexMux_oLeft_HardLink,
		oLeft1 => fullDuplexMux_oLeft1_fullDuplexMux_oLeft_HardLink,
		oLeft2 => fullDuplexMux_oLeft2_fullDuplexMux_oLeft_HardLink,
		oLeft3 => fullDuplexMux_oLeft3_fullDuplexMux_oLeft_HardLink,
		oMuxLeftData => fullDuplexMux_oMuxLeftData_fullDuplexMux_oMuxLeftData_HardLink,
		oMuxRightData => fullDuplexMux_oMuxRightData_fullDuplexMux_oMuxRightData_HardLink,
		oRight0 => fullDuplexMux_oRight0_fullDuplexMux_oRight_HardLink,
		oRight1 => fullDuplexMux_oRight1_fullDuplexMux_oRight_HardLink,
		oRight2 => fullDuplexMux_oRight2_fullDuplexMux_oRight_HardLink,
		oRight3 => fullDuplexMux_oRight3_fullDuplexMux_oRight_HardLink,
		oRight4 => fullDuplexMux_oRight4_fullDuplexMux_oRight_HardLink,
		oRight5 => fullDuplexMux_oRight5_fullDuplexMux_oRight_HardLink,
		oRight6 => fullDuplexMux_oRight6_fullDuplexMux_oRight_HardLink,
		oRight7 => fullDuplexMux_oRight7_fullDuplexMux_oRight_HardLink
	)
	;
	process (fullDuplexMux_iLeft, fullDuplexMux_iLeftAddr, fullDuplexMux_iLeftAddrValid, fullDuplexMux_iRight, fullDuplexMux_iRightAddr, fullDuplexMux_iRightAddrValid, fullDuplexMux_oLeft, fullDuplexMux_oLeft0_fullDuplexMux_oLeft_HardLink, fullDuplexMux_oLeft1_fullDuplexMux_oLeft_HardLink, fullDuplexMux_oLeft2_fullDuplexMux_oLeft_HardLink, fullDuplexMux_oLeft3_fullDuplexMux_oLeft_HardLink, fullDuplexMux_oMuxLeftData_fullDuplexMux_oMuxLeftData_HardLink, fullDuplexMux_oMuxRightData_fullDuplexMux_oMuxRightData_HardLink, fullDuplexMux_oRight, fullDuplexMux_oRight0_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight1_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight2_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight3_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight4_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight5_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight6_fullDuplexMux_oRight_HardLink, fullDuplexMux_oRight7_fullDuplexMux_oRight_HardLink, Inputs_MAddr, Inputs_MAddrValid, Inputs_MArr, Inputs_SAddr, Inputs_SAddrValid, Inputs_SArr, MAddr, MAddrValid, MArr0_Addr, MArr0_IsActive, MArr0_Payload_Data, MArr0_Payload_DataFlag, MArr1_Addr, MArr1_IsActive, MArr1_Payload_Data, MArr1_Payload_DataFlag, MArr2_Addr, MArr2_IsActive, MArr2_Payload_Data, MArr2_Payload_DataFlag, MArr3_Addr, MArr3_IsActive, MArr3_Payload_Data, MArr3_Payload_DataFlag, MArr4_Addr, MArr4_IsActive, MArr4_Payload_Data, MArr4_Payload_DataFlag, MArr5_Addr, MArr5_IsActive, MArr5_Payload_Data, MArr5_Payload_DataFlag, MArr6_Addr, MArr6_IsActive, MArr6_Payload_Data, MArr6_Payload_DataFlag, MArr7_Addr, MArr7_IsActive, MArr7_Payload_Data, MArr7_Payload_DataFlag, SAddr, SAddrValid, SArr0_IsActive, SArr0_Payload_Data, SArr0_Payload_DataFlag, SArr1_IsActive, SArr1_Payload_Data, SArr1_Payload_DataFlag, SArr2_IsActive, SArr2_Payload_Data, SArr2_Payload_DataFlag, SArr3_IsActive, SArr3_Payload_Data, SArr3_Payload_DataFlag)
	begin
		Inputs_MAddr <= MAddr;
		Inputs_MAddrValid <= MAddrValid;
		Inputs_MArr(0)(11) <= MArr0_Payload_DataFlag;
		Inputs_MArr(0)(10 downto 3) <= MArr0_Payload_Data;
		Inputs_MArr(0)(2) <= MArr0_IsActive;
		Inputs_MArr(0)(1 downto 0) <= MArr0_Addr;
		Inputs_MArr(1)(11) <= MArr1_Payload_DataFlag;
		Inputs_MArr(1)(10 downto 3) <= MArr1_Payload_Data;
		Inputs_MArr(1)(2) <= MArr1_IsActive;
		Inputs_MArr(1)(1 downto 0) <= MArr1_Addr;
		Inputs_MArr(2)(11) <= MArr2_Payload_DataFlag;
		Inputs_MArr(2)(10 downto 3) <= MArr2_Payload_Data;
		Inputs_MArr(2)(2) <= MArr2_IsActive;
		Inputs_MArr(2)(1 downto 0) <= MArr2_Addr;
		Inputs_MArr(3)(11) <= MArr3_Payload_DataFlag;
		Inputs_MArr(3)(10 downto 3) <= MArr3_Payload_Data;
		Inputs_MArr(3)(2) <= MArr3_IsActive;
		Inputs_MArr(3)(1 downto 0) <= MArr3_Addr;
		Inputs_MArr(4)(11) <= MArr4_Payload_DataFlag;
		Inputs_MArr(4)(10 downto 3) <= MArr4_Payload_Data;
		Inputs_MArr(4)(2) <= MArr4_IsActive;
		Inputs_MArr(4)(1 downto 0) <= MArr4_Addr;
		Inputs_MArr(5)(11) <= MArr5_Payload_DataFlag;
		Inputs_MArr(5)(10 downto 3) <= MArr5_Payload_Data;
		Inputs_MArr(5)(2) <= MArr5_IsActive;
		Inputs_MArr(5)(1 downto 0) <= MArr5_Addr;
		Inputs_MArr(6)(11) <= MArr6_Payload_DataFlag;
		Inputs_MArr(6)(10 downto 3) <= MArr6_Payload_Data;
		Inputs_MArr(6)(2) <= MArr6_IsActive;
		Inputs_MArr(6)(1 downto 0) <= MArr6_Addr;
		Inputs_MArr(7)(11) <= MArr7_Payload_DataFlag;
		Inputs_MArr(7)(10 downto 3) <= MArr7_Payload_Data;
		Inputs_MArr(7)(2) <= MArr7_IsActive;
		Inputs_MArr(7)(1 downto 0) <= MArr7_Addr;
		Inputs_SAddr <= SAddr;
		Inputs_SAddrValid <= SAddrValid;
		Inputs_SArr(0)(9) <= SArr0_Payload_DataFlag;
		Inputs_SArr(0)(8 downto 1) <= SArr0_Payload_Data;
		Inputs_SArr(0)(0) <= SArr0_IsActive;
		Inputs_SArr(1)(9) <= SArr1_Payload_DataFlag;
		Inputs_SArr(1)(8 downto 1) <= SArr1_Payload_Data;
		Inputs_SArr(1)(0) <= SArr1_IsActive;
		Inputs_SArr(2)(9) <= SArr2_Payload_DataFlag;
		Inputs_SArr(2)(8 downto 1) <= SArr2_Payload_Data;
		Inputs_SArr(2)(0) <= SArr2_IsActive;
		Inputs_SArr(3)(9) <= SArr3_Payload_DataFlag;
		Inputs_SArr(3)(8 downto 1) <= SArr3_Payload_Data;
		Inputs_SArr(3)(0) <= SArr3_IsActive;
		fullDuplexMux_iLeft(0) <= Inputs_MArr(0);
		fullDuplexMux_iLeft(1) <= Inputs_MArr(1);
		fullDuplexMux_iLeft(2) <= Inputs_MArr(2);
		fullDuplexMux_iLeft(3) <= Inputs_MArr(3);
		fullDuplexMux_iLeft(4) <= Inputs_MArr(4);
		fullDuplexMux_iLeft(5) <= Inputs_MArr(5);
		fullDuplexMux_iLeft(6) <= Inputs_MArr(6);
		fullDuplexMux_iLeft(7) <= Inputs_MArr(7);
		fullDuplexMux_iLeftAddr <= Inputs_MAddr;
		fullDuplexMux_iLeftAddrValid <= Inputs_MAddrValid;
		fullDuplexMux_iRight(0) <= Inputs_SArr(0);
		fullDuplexMux_iRight(1) <= Inputs_SArr(1);
		fullDuplexMux_iRight(2) <= Inputs_SArr(2);
		fullDuplexMux_iRight(3) <= Inputs_SArr(3);
		fullDuplexMux_iRightAddr <= Inputs_SAddr;
		fullDuplexMux_iRightAddrValid <= Inputs_SAddrValid;
		OutMData0_Payload_DataFlag <= fullDuplexMux_oLeft(0)(11);
		OutMData0_Payload_Data <= fullDuplexMux_oLeft(0)(10 downto 3);
		OutMData0_IsActive <= fullDuplexMux_oLeft(0)(2);
		OutMData0_Addr <= fullDuplexMux_oLeft(0)(1 downto 0);
		OutMData1_Payload_DataFlag <= fullDuplexMux_oLeft(1)(11);
		OutMData1_Payload_Data <= fullDuplexMux_oLeft(1)(10 downto 3);
		OutMData1_IsActive <= fullDuplexMux_oLeft(1)(2);
		OutMData1_Addr <= fullDuplexMux_oLeft(1)(1 downto 0);
		OutMData2_Payload_DataFlag <= fullDuplexMux_oLeft(2)(11);
		OutMData2_Payload_Data <= fullDuplexMux_oLeft(2)(10 downto 3);
		OutMData2_IsActive <= fullDuplexMux_oLeft(2)(2);
		OutMData2_Addr <= fullDuplexMux_oLeft(2)(1 downto 0);
		OutMData3_Payload_DataFlag <= fullDuplexMux_oLeft(3)(11);
		OutMData3_Payload_Data <= fullDuplexMux_oLeft(3)(10 downto 3);
		OutMData3_IsActive <= fullDuplexMux_oLeft(3)(2);
		OutMData3_Addr <= fullDuplexMux_oLeft(3)(1 downto 0);
		OutSData0_Payload_DataFlag <= fullDuplexMux_oRight(0)(9);
		OutSData0_Payload_Data <= fullDuplexMux_oRight(0)(8 downto 1);
		OutSData0_IsActive <= fullDuplexMux_oRight(0)(0);
		OutSData1_Payload_DataFlag <= fullDuplexMux_oRight(1)(9);
		OutSData1_Payload_Data <= fullDuplexMux_oRight(1)(8 downto 1);
		OutSData1_IsActive <= fullDuplexMux_oRight(1)(0);
		OutSData2_Payload_DataFlag <= fullDuplexMux_oRight(2)(9);
		OutSData2_Payload_Data <= fullDuplexMux_oRight(2)(8 downto 1);
		OutSData2_IsActive <= fullDuplexMux_oRight(2)(0);
		OutSData3_Payload_DataFlag <= fullDuplexMux_oRight(3)(9);
		OutSData3_Payload_Data <= fullDuplexMux_oRight(3)(8 downto 1);
		OutSData3_IsActive <= fullDuplexMux_oRight(3)(0);
		OutSData4_Payload_DataFlag <= fullDuplexMux_oRight(4)(9);
		OutSData4_Payload_Data <= fullDuplexMux_oRight(4)(8 downto 1);
		OutSData4_IsActive <= fullDuplexMux_oRight(4)(0);
		OutSData5_Payload_DataFlag <= fullDuplexMux_oRight(5)(9);
		OutSData5_Payload_Data <= fullDuplexMux_oRight(5)(8 downto 1);
		OutSData5_IsActive <= fullDuplexMux_oRight(5)(0);
		OutSData6_Payload_DataFlag <= fullDuplexMux_oRight(6)(9);
		OutSData6_Payload_Data <= fullDuplexMux_oRight(6)(8 downto 1);
		OutSData6_IsActive <= fullDuplexMux_oRight(6)(0);
		OutSData7_Payload_DataFlag <= fullDuplexMux_oRight(7)(9);
		OutSData7_Payload_Data <= fullDuplexMux_oRight(7)(8 downto 1);
		OutSData7_IsActive <= fullDuplexMux_oRight(7)(0);
		fullDuplexMux_iLeft0_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(0);
		fullDuplexMux_iLeft1_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(1);
		fullDuplexMux_iLeft2_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(2);
		fullDuplexMux_iLeft3_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(3);
		fullDuplexMux_iLeft4_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(4);
		fullDuplexMux_iLeft5_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(5);
		fullDuplexMux_iLeft6_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(6);
		fullDuplexMux_iLeft7_fullDuplexMux_iLeft_HardLink <= fullDuplexMux_iLeft(7);
		fullDuplexMux_iLeftAddr_fullDuplexMux_iLeftAddr_HardLink <= fullDuplexMux_iLeftAddr;
		fullDuplexMux_iLeftAddrValid_fullDuplexMux_iLeftAddrValid_HardLink <= fullDuplexMux_iLeftAddrValid;
		fullDuplexMux_iRight0_fullDuplexMux_iRight_HardLink <= fullDuplexMux_iRight(0);
		fullDuplexMux_iRight1_fullDuplexMux_iRight_HardLink <= fullDuplexMux_iRight(1);
		fullDuplexMux_iRight2_fullDuplexMux_iRight_HardLink <= fullDuplexMux_iRight(2);
		fullDuplexMux_iRight3_fullDuplexMux_iRight_HardLink <= fullDuplexMux_iRight(3);
		fullDuplexMux_iRightAddr_fullDuplexMux_iRightAddr_HardLink <= fullDuplexMux_iRightAddr;
		fullDuplexMux_iRightAddrValid_fullDuplexMux_iRightAddrValid_HardLink <= fullDuplexMux_iRightAddrValid;
		fullDuplexMux_oLeft(0) <= fullDuplexMux_oLeft0_fullDuplexMux_oLeft_HardLink;
		fullDuplexMux_oLeft(1) <= fullDuplexMux_oLeft1_fullDuplexMux_oLeft_HardLink;
		fullDuplexMux_oLeft(2) <= fullDuplexMux_oLeft2_fullDuplexMux_oLeft_HardLink;
		fullDuplexMux_oLeft(3) <= fullDuplexMux_oLeft3_fullDuplexMux_oLeft_HardLink;
		fullDuplexMux_oMuxLeftData <= fullDuplexMux_oMuxLeftData_fullDuplexMux_oMuxLeftData_HardLink;
		fullDuplexMux_oMuxRightData <= fullDuplexMux_oMuxRightData_fullDuplexMux_oMuxRightData_HardLink;
		fullDuplexMux_oRight(0) <= fullDuplexMux_oRight0_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(1) <= fullDuplexMux_oRight1_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(2) <= fullDuplexMux_oRight2_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(3) <= fullDuplexMux_oRight3_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(4) <= fullDuplexMux_oRight4_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(5) <= fullDuplexMux_oRight5_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(6) <= fullDuplexMux_oRight6_fullDuplexMux_oRight_HardLink;
		fullDuplexMux_oRight(7) <= fullDuplexMux_oRight7_fullDuplexMux_oRight_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
