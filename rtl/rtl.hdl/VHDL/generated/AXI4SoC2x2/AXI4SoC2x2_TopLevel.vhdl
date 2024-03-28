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
-- System configuration name is AXI4SoC2x2_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4SoC2x2_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		MasterInputs0_ARADDR : in unsigned (31 downto 0);
		MasterInputs0_AWADDR : in unsigned (31 downto 0);
		MasterInputs0_RE : in std_logic;
		MasterInputs0_WDATA0 : in unsigned (7 downto 0);
		MasterInputs0_WDATA1 : in unsigned (7 downto 0);
		MasterInputs0_WDATA2 : in unsigned (7 downto 0);
		MasterInputs0_WDATA3 : in unsigned (7 downto 0);
		MasterInputs0_WE : in std_logic;
		MasterInputs0_WSTRB : in unsigned (3 downto 0);
		MasterInputs1_ARADDR : in unsigned (31 downto 0);
		MasterInputs1_AWADDR : in unsigned (31 downto 0);
		MasterInputs1_RE : in std_logic;
		MasterInputs1_WDATA0 : in unsigned (7 downto 0);
		MasterInputs1_WDATA1 : in unsigned (7 downto 0);
		MasterInputs1_WDATA2 : in unsigned (7 downto 0);
		MasterInputs1_WDATA3 : in unsigned (7 downto 0);
		MasterInputs1_WE : in std_logic;
		MasterInputs1_WSTRB : in unsigned (3 downto 0);
		RegInputs0_inWDATA0 : in unsigned (7 downto 0);
		RegInputs0_inWDATA1 : in unsigned (7 downto 0);
		RegInputs0_inWDATA2 : in unsigned (7 downto 0);
		RegInputs0_inWDATA3 : in unsigned (7 downto 0);
		RegInputs0_inWE : in std_logic;
		RegInputs1_inWDATA0 : in unsigned (7 downto 0);
		RegInputs1_inWDATA1 : in unsigned (7 downto 0);
		RegInputs1_inWDATA2 : in unsigned (7 downto 0);
		RegInputs1_inWDATA3 : in unsigned (7 downto 0);
		RegInputs1_inWE : in std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4SoC2x2_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant mCount : signed(2 downto 0) := "010";
	constant sCount : signed(2 downto 0) := "010";
	signal masters0_Master : unsigned(101 downto 0) := (others => '0');
	signal masters0_S2M : unsigned(73 downto 0) := (others => '0');
	signal masters0_M2S : unsigned(221 downto 0) := (others => '0');
	signal masters0_RACK : std_logic := '0';
	signal masters0_WACK : std_logic := '0';
	signal masters1_Master : unsigned(101 downto 0) := (others => '0');
	signal masters1_S2M : unsigned(73 downto 0) := (others => '0');
	signal masters1_M2S : unsigned(221 downto 0) := (others => '0');
	signal masters1_RACK : std_logic := '0';
	signal masters1_WACK : std_logic := '0';
	signal registers0_M2S : unsigned(221 downto 0) := (others => '0');
	signal registers0_Reg : unsigned(32 downto 0) := (others => '0');
	signal registers0_outACK : std_logic := '0';
	signal registers0_outWritten : std_logic := '0';
	signal registers0_S2M : unsigned(73 downto 0) := (others => '0');
	signal registers1_M2S : unsigned(221 downto 0) := (others => '0');
	signal registers1_Reg : unsigned(32 downto 0) := (others => '0');
	signal registers1_outACK : std_logic := '0';
	signal registers1_outWritten : std_logic := '0';
	signal registers1_S2M : unsigned(73 downto 0) := (others => '0');
	signal AXI4SoC2x2_L54F13L63T14_0_AXI4SoC2x2_L57F21L61T22_Object : unsigned(175 downto 0) := (others => '0');
	signal AXI4SoC2x2_L54F13L63T14_1_AXI4SoC2x2_L57F21L61T22_Object : unsigned(175 downto 0) := (others => '0');
	signal AXI4SoC2x2_L65F13L74T14_0_AXI4SoC2x2_L68F21L72T22_Object : unsigned(254 downto 0) := (others => '0');
	signal AXI4SoC2x2_L65F13L74T14_1_AXI4SoC2x2_L68F21L72T22_Object : unsigned(254 downto 0) := (others => '0');
	signal AXI4SoC2x2_L77F17L81T18_Object : unsigned(591 downto 0) := (others => '0');
	signal interconnect_iM2S0_interconnect_iM2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_iM2S1_interconnect_iM2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_iS2M0_interconnect_iS2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_iS2M1_interconnect_iS2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_oM2S0_interconnect_oM2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_oM2S1_interconnect_oM2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_oS2M0_interconnect_oS2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal interconnect_oS2M1_interconnect_oS2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters0_Master_masters0_Master_HardLink : unsigned(101 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters0_S2M_masters0_S2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters0_M2S_masters0_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters0_RACK_masters0_RACK_HardLink : std_logic := '0';
	signal masters0_RDATA0_masters0_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters0_RDATA1_masters0_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters0_RDATA2_masters0_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters0_RDATA3_masters0_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters0_WACK_masters0_WACK_HardLink : std_logic := '0';
	signal masters1_Master_masters1_Master_HardLink : unsigned(101 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters1_S2M_masters1_S2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters1_M2S_masters1_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal masters1_RACK_masters1_RACK_HardLink : std_logic := '0';
	signal masters1_RDATA0_masters1_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters1_RDATA1_masters1_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters1_RDATA2_masters1_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters1_RDATA3_masters1_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal masters1_WACK_masters1_WACK_HardLink : std_logic := '0';
	signal registers0_M2S_registers0_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal registers0_Reg_registers0_Reg_HardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal registers0_outACK_registers0_outACK_HardLink : std_logic := '0';
	signal registers0_outData0_registers0_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers0_outData1_registers0_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers0_outData2_registers0_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers0_outData3_registers0_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers0_outWritten_registers0_outWritten_HardLink : std_logic := '0';
	signal registers0_S2M_registers0_S2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal registers1_M2S_registers1_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal registers1_Reg_registers1_Reg_HardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal registers1_outACK_registers1_outACK_HardLink : std_logic := '0';
	signal registers1_outData0_registers1_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers1_outData1_registers1_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers1_outData2_registers1_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers1_outData3_registers1_outData_HardLink : unsigned(7 downto 0) := "00000000";
	signal registers1_outWritten_registers1_outWritten_HardLink : std_logic := '0';
	signal registers1_S2M_registers1_S2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	type Inputs_MasterInputsArray is array (0 to 1) of unsigned (101 downto 0);
	signal Inputs_MasterInputs : Inputs_MasterInputsArray := (others => (others => '0'));
	type Inputs_RegInputsArray is array (0 to 1) of unsigned (32 downto 0);
	signal Inputs_RegInputs : Inputs_RegInputsArray := (others => (others => '0'));
	type interconnect_iM2SArray is array (0 to 1) of unsigned (221 downto 0);
	signal interconnect_iM2S : interconnect_iM2SArray := (others => (others => '0'));
	type interconnect_iS2MArray is array (0 to 1) of unsigned (73 downto 0);
	signal interconnect_iS2M : interconnect_iS2MArray := (others => (others => '0'));
	type interconnect_oM2SArray is array (0 to 1) of unsigned (221 downto 0);
	signal interconnect_oM2S : interconnect_oM2SArray := (others => (others => '0'));
	type interconnect_oS2MArray is array (0 to 1) of unsigned (73 downto 0);
	signal interconnect_oS2M : interconnect_oS2MArray := (others => (others => '0'));
	type masters0_RDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal masters0_RDATA : masters0_RDATAArray := (others => (others => '0'));
	type masters1_RDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal masters1_RDATA : masters1_RDATAArray := (others => (others => '0'));
	type registers0_outDataArray is array (0 to 3) of unsigned (7 downto 0);
	signal registers0_outData : registers0_outDataArray := (others => (others => '0'));
	type registers1_outDataArray is array (0 to 3) of unsigned (7 downto 0);
	signal registers1_outData : registers1_outDataArray := (others => (others => '0'));
	type AXI4SoC2x2_L79F28T64_EnumerableArray is array (0 to 1) of unsigned (221 downto 0);
	signal AXI4SoC2x2_L79F28T64_Enumerable : AXI4SoC2x2_L79F28T64_EnumerableArray := (others => (others => '0'));
	type AXI4SoC2x2_L80F28T66_EnumerableArray is array (0 to 1) of unsigned (73 downto 0);
	signal AXI4SoC2x2_L80F28T66_Enumerable : AXI4SoC2x2_L80F28T66_EnumerableArray := (others => (others => '0'));
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	AXI4SoC2x2_TopLevel_interconnect : entity work.AXI4SoC2x2_TopLevel_interconnect
	port map
	(
		-- [BEGIN USER MAP FOR interconnect]
		-- [END USER MAP FOR interconnect]
		BoardSignals => BoardSignals,
		iM2S0 => interconnect_iM2S0_interconnect_iM2S_HardLink,
		iM2S1 => interconnect_iM2S1_interconnect_iM2S_HardLink,
		iS2M0 => interconnect_iS2M0_interconnect_iS2M_HardLink,
		iS2M1 => interconnect_iS2M1_interconnect_iS2M_HardLink,
		oM2S0 => interconnect_oM2S0_interconnect_oM2S_HardLink,
		oM2S1 => interconnect_oM2S1_interconnect_oM2S_HardLink,
		oS2M0 => interconnect_oS2M0_interconnect_oS2M_HardLink,
		oS2M1 => interconnect_oS2M1_interconnect_oS2M_HardLink
	)
	;
	AXI4SoC2x2_TopLevel_masters0 : entity work.AXI4SoC2x2_TopLevel_masters0
	port map
	(
		-- [BEGIN USER MAP FOR masters0]
		-- [END USER MAP FOR masters0]
		BoardSignals => BoardSignals,
		Master => masters0_Master_masters0_Master_HardLink,
		S2M => masters0_S2M_masters0_S2M_HardLink,
		M2S => masters0_M2S_masters0_M2S_HardLink,
		RACK => masters0_RACK_masters0_RACK_HardLink,
		RDATA0 => masters0_RDATA0_masters0_RDATA_HardLink,
		RDATA1 => masters0_RDATA1_masters0_RDATA_HardLink,
		RDATA2 => masters0_RDATA2_masters0_RDATA_HardLink,
		RDATA3 => masters0_RDATA3_masters0_RDATA_HardLink,
		WACK => masters0_WACK_masters0_WACK_HardLink
	)
	;
	AXI4SoC2x2_TopLevel_masters1 : entity work.AXI4SoC2x2_TopLevel_masters1
	port map
	(
		-- [BEGIN USER MAP FOR masters1]
		-- [END USER MAP FOR masters1]
		BoardSignals => BoardSignals,
		Master => masters1_Master_masters1_Master_HardLink,
		S2M => masters1_S2M_masters1_S2M_HardLink,
		M2S => masters1_M2S_masters1_M2S_HardLink,
		RACK => masters1_RACK_masters1_RACK_HardLink,
		RDATA0 => masters1_RDATA0_masters1_RDATA_HardLink,
		RDATA1 => masters1_RDATA1_masters1_RDATA_HardLink,
		RDATA2 => masters1_RDATA2_masters1_RDATA_HardLink,
		RDATA3 => masters1_RDATA3_masters1_RDATA_HardLink,
		WACK => masters1_WACK_masters1_WACK_HardLink
	)
	;
	AXI4SoC2x2_TopLevel_registers0 : entity work.AXI4SoC2x2_TopLevel_registers0
	port map
	(
		-- [BEGIN USER MAP FOR registers0]
		-- [END USER MAP FOR registers0]
		BoardSignals => BoardSignals,
		M2S => registers0_M2S_registers0_M2S_HardLink,
		Reg => registers0_Reg_registers0_Reg_HardLink,
		outACK => registers0_outACK_registers0_outACK_HardLink,
		outData0 => registers0_outData0_registers0_outData_HardLink,
		outData1 => registers0_outData1_registers0_outData_HardLink,
		outData2 => registers0_outData2_registers0_outData_HardLink,
		outData3 => registers0_outData3_registers0_outData_HardLink,
		outWritten => registers0_outWritten_registers0_outWritten_HardLink,
		S2M => registers0_S2M_registers0_S2M_HardLink
	)
	;
	AXI4SoC2x2_TopLevel_registers1 : entity work.AXI4SoC2x2_TopLevel_registers1
	port map
	(
		-- [BEGIN USER MAP FOR registers1]
		-- [END USER MAP FOR registers1]
		BoardSignals => BoardSignals,
		M2S => registers1_M2S_registers1_M2S_HardLink,
		Reg => registers1_Reg_registers1_Reg_HardLink,
		outACK => registers1_outACK_registers1_outACK_HardLink,
		outData0 => registers1_outData0_registers1_outData_HardLink,
		outData1 => registers1_outData1_registers1_outData_HardLink,
		outData2 => registers1_outData2_registers1_outData_HardLink,
		outData3 => registers1_outData3_registers1_outData_HardLink,
		outWritten => registers1_outWritten_registers1_outWritten_HardLink,
		S2M => registers1_S2M_registers1_S2M_HardLink
	)
	;
	process (AXI4SoC2x2_L54F13L63T14_0_AXI4SoC2x2_L57F21L61T22_Object, AXI4SoC2x2_L54F13L63T14_1_AXI4SoC2x2_L57F21L61T22_Object, AXI4SoC2x2_L65F13L74T14_0_AXI4SoC2x2_L68F21L72T22_Object, AXI4SoC2x2_L65F13L74T14_1_AXI4SoC2x2_L68F21L72T22_Object, AXI4SoC2x2_L77F17L81T18_Object, AXI4SoC2x2_L79F28T64_Enumerable, AXI4SoC2x2_L80F28T66_Enumerable, Inputs_MasterInputs, Inputs_RegInputs, interconnect_iM2S, interconnect_iS2M, interconnect_oM2S, interconnect_oM2S0_interconnect_oM2S_HardLink, interconnect_oM2S1_interconnect_oM2S_HardLink, interconnect_oS2M, interconnect_oS2M0_interconnect_oS2M_HardLink, interconnect_oS2M1_interconnect_oS2M_HardLink, MasterInputs0_ARADDR, MasterInputs0_AWADDR, MasterInputs0_RE, MasterInputs0_WDATA0, MasterInputs0_WDATA1, MasterInputs0_WDATA2, MasterInputs0_WDATA3, MasterInputs0_WE, MasterInputs0_WSTRB, MasterInputs1_ARADDR, MasterInputs1_AWADDR, MasterInputs1_RE, MasterInputs1_WDATA0, MasterInputs1_WDATA1, MasterInputs1_WDATA2, MasterInputs1_WDATA3, MasterInputs1_WE, MasterInputs1_WSTRB, masters0_M2S, masters0_M2S_masters0_M2S_HardLink, masters0_Master, masters0_RACK_masters0_RACK_HardLink, masters0_RDATA0_masters0_RDATA_HardLink, masters0_RDATA1_masters0_RDATA_HardLink, masters0_RDATA2_masters0_RDATA_HardLink, masters0_RDATA3_masters0_RDATA_HardLink, masters0_S2M, masters0_WACK_masters0_WACK_HardLink, masters1_M2S, masters1_M2S_masters1_M2S_HardLink, masters1_Master, masters1_RACK_masters1_RACK_HardLink, masters1_RDATA0_masters1_RDATA_HardLink, masters1_RDATA1_masters1_RDATA_HardLink, masters1_RDATA2_masters1_RDATA_HardLink, masters1_RDATA3_masters1_RDATA_HardLink, masters1_S2M, masters1_WACK_masters1_WACK_HardLink, RegInputs0_inWDATA0, RegInputs0_inWDATA1, RegInputs0_inWDATA2, RegInputs0_inWDATA3, RegInputs0_inWE, RegInputs1_inWDATA0, RegInputs1_inWDATA1, RegInputs1_inWDATA2, RegInputs1_inWDATA3, RegInputs1_inWE, registers0_M2S, registers0_outACK_registers0_outACK_HardLink, registers0_outData0_registers0_outData_HardLink, registers0_outData1_registers0_outData_HardLink, registers0_outData2_registers0_outData_HardLink, registers0_outData3_registers0_outData_HardLink, registers0_outWritten_registers0_outWritten_HardLink, registers0_Reg, registers0_S2M, registers0_S2M_registers0_S2M_HardLink, registers1_M2S, registers1_outACK_registers1_outACK_HardLink, registers1_outData0_registers1_outData_HardLink, registers1_outData1_registers1_outData_HardLink, registers1_outData2_registers1_outData_HardLink, registers1_outData3_registers1_outData_HardLink, registers1_outWritten_registers1_outWritten_HardLink, registers1_Reg, registers1_S2M, registers1_S2M_registers1_S2M_HardLink)
	begin
		Inputs_MasterInputs(0)(101 downto 98) <= MasterInputs0_WSTRB;
		Inputs_MasterInputs(0)(97) <= MasterInputs0_WE;
		Inputs_MasterInputs(0)(96 downto 89) <= MasterInputs0_WDATA3;
		Inputs_MasterInputs(0)(88 downto 81) <= MasterInputs0_WDATA2;
		Inputs_MasterInputs(0)(80 downto 73) <= MasterInputs0_WDATA1;
		Inputs_MasterInputs(0)(72 downto 65) <= MasterInputs0_WDATA0;
		Inputs_MasterInputs(0)(64) <= MasterInputs0_RE;
		Inputs_MasterInputs(0)(63 downto 32) <= MasterInputs0_AWADDR;
		Inputs_MasterInputs(0)(31 downto 0) <= MasterInputs0_ARADDR;
		Inputs_MasterInputs(1)(101 downto 98) <= MasterInputs1_WSTRB;
		Inputs_MasterInputs(1)(97) <= MasterInputs1_WE;
		Inputs_MasterInputs(1)(96 downto 89) <= MasterInputs1_WDATA3;
		Inputs_MasterInputs(1)(88 downto 81) <= MasterInputs1_WDATA2;
		Inputs_MasterInputs(1)(80 downto 73) <= MasterInputs1_WDATA1;
		Inputs_MasterInputs(1)(72 downto 65) <= MasterInputs1_WDATA0;
		Inputs_MasterInputs(1)(64) <= MasterInputs1_RE;
		Inputs_MasterInputs(1)(63 downto 32) <= MasterInputs1_AWADDR;
		Inputs_MasterInputs(1)(31 downto 0) <= MasterInputs1_ARADDR;
		Inputs_RegInputs(0)(32) <= RegInputs0_inWE;
		Inputs_RegInputs(0)(31 downto 24) <= RegInputs0_inWDATA3;
		Inputs_RegInputs(0)(23 downto 16) <= RegInputs0_inWDATA2;
		Inputs_RegInputs(0)(15 downto 8) <= RegInputs0_inWDATA1;
		Inputs_RegInputs(0)(7 downto 0) <= RegInputs0_inWDATA0;
		Inputs_RegInputs(1)(32) <= RegInputs1_inWE;
		Inputs_RegInputs(1)(31 downto 24) <= RegInputs1_inWDATA3;
		Inputs_RegInputs(1)(23 downto 16) <= RegInputs1_inWDATA2;
		Inputs_RegInputs(1)(15 downto 8) <= RegInputs1_inWDATA1;
		Inputs_RegInputs(1)(7 downto 0) <= RegInputs1_inWDATA0;
		AXI4SoC2x2_L54F13L63T14_0_AXI4SoC2x2_L57F21L61T22_Object(101 downto 0) <= Inputs_MasterInputs(0);
		AXI4SoC2x2_L54F13L63T14_0_AXI4SoC2x2_L57F21L61T22_Object(175 downto 102) <= interconnect_oS2M(0);
		masters0_S2M <= AXI4SoC2x2_L54F13L63T14_0_AXI4SoC2x2_L57F21L61T22_Object(175 downto 102);
		masters0_Master <= AXI4SoC2x2_L54F13L63T14_0_AXI4SoC2x2_L57F21L61T22_Object(101 downto 0);
		AXI4SoC2x2_L54F13L63T14_1_AXI4SoC2x2_L57F21L61T22_Object(101 downto 0) <= Inputs_MasterInputs(1);
		AXI4SoC2x2_L54F13L63T14_1_AXI4SoC2x2_L57F21L61T22_Object(175 downto 102) <= interconnect_oS2M(1);
		masters1_S2M <= AXI4SoC2x2_L54F13L63T14_1_AXI4SoC2x2_L57F21L61T22_Object(175 downto 102);
		masters1_Master <= AXI4SoC2x2_L54F13L63T14_1_AXI4SoC2x2_L57F21L61T22_Object(101 downto 0);
		AXI4SoC2x2_L65F13L74T14_0_AXI4SoC2x2_L68F21L72T22_Object(221 downto 0) <= interconnect_oM2S(0);
		AXI4SoC2x2_L65F13L74T14_0_AXI4SoC2x2_L68F21L72T22_Object(254 downto 222) <= Inputs_RegInputs(0);
		registers0_Reg <= AXI4SoC2x2_L65F13L74T14_0_AXI4SoC2x2_L68F21L72T22_Object(254 downto 222);
		registers0_M2S <= AXI4SoC2x2_L65F13L74T14_0_AXI4SoC2x2_L68F21L72T22_Object(221 downto 0);
		AXI4SoC2x2_L65F13L74T14_1_AXI4SoC2x2_L68F21L72T22_Object(221 downto 0) <= interconnect_oM2S(1);
		AXI4SoC2x2_L65F13L74T14_1_AXI4SoC2x2_L68F21L72T22_Object(254 downto 222) <= Inputs_RegInputs(1);
		registers1_Reg <= AXI4SoC2x2_L65F13L74T14_1_AXI4SoC2x2_L68F21L72T22_Object(254 downto 222);
		registers1_M2S <= AXI4SoC2x2_L65F13L74T14_1_AXI4SoC2x2_L68F21L72T22_Object(221 downto 0);
		AXI4SoC2x2_L79F28T64_Enumerable(0) <= masters0_M2S;
		AXI4SoC2x2_L79F28T64_Enumerable(1) <= masters1_M2S;
		AXI4SoC2x2_L77F17L81T18_Object(443 downto 222) <= AXI4SoC2x2_L79F28T64_Enumerable(1);
		AXI4SoC2x2_L77F17L81T18_Object(221 downto 0) <= AXI4SoC2x2_L79F28T64_Enumerable(0);
		AXI4SoC2x2_L80F28T66_Enumerable(0) <= registers0_S2M;
		AXI4SoC2x2_L80F28T66_Enumerable(1) <= registers1_S2M;
		AXI4SoC2x2_L77F17L81T18_Object(591 downto 518) <= AXI4SoC2x2_L80F28T66_Enumerable(1);
		AXI4SoC2x2_L77F17L81T18_Object(517 downto 444) <= AXI4SoC2x2_L80F28T66_Enumerable(0);
		interconnect_iS2M(1) <= AXI4SoC2x2_L77F17L81T18_Object(591 downto 518);
		interconnect_iS2M(0) <= AXI4SoC2x2_L77F17L81T18_Object(517 downto 444);
		interconnect_iM2S(1) <= AXI4SoC2x2_L77F17L81T18_Object(443 downto 222);
		interconnect_iM2S(0) <= AXI4SoC2x2_L77F17L81T18_Object(221 downto 0);
		interconnect_iM2S0_interconnect_iM2S_HardLink <= interconnect_iM2S(0);
		interconnect_iM2S1_interconnect_iM2S_HardLink <= interconnect_iM2S(1);
		interconnect_iS2M0_interconnect_iS2M_HardLink <= interconnect_iS2M(0);
		interconnect_iS2M1_interconnect_iS2M_HardLink <= interconnect_iS2M(1);
		interconnect_oM2S(0) <= interconnect_oM2S0_interconnect_oM2S_HardLink;
		interconnect_oM2S(1) <= interconnect_oM2S1_interconnect_oM2S_HardLink;
		interconnect_oS2M(0) <= interconnect_oS2M0_interconnect_oS2M_HardLink;
		interconnect_oS2M(1) <= interconnect_oS2M1_interconnect_oS2M_HardLink;
		masters0_Master_masters0_Master_HardLink <= masters0_Master;
		masters0_S2M_masters0_S2M_HardLink <= masters0_S2M;
		masters0_M2S <= masters0_M2S_masters0_M2S_HardLink;
		masters0_RACK <= masters0_RACK_masters0_RACK_HardLink;
		masters0_RDATA(0) <= masters0_RDATA0_masters0_RDATA_HardLink;
		masters0_RDATA(1) <= masters0_RDATA1_masters0_RDATA_HardLink;
		masters0_RDATA(2) <= masters0_RDATA2_masters0_RDATA_HardLink;
		masters0_RDATA(3) <= masters0_RDATA3_masters0_RDATA_HardLink;
		masters0_WACK <= masters0_WACK_masters0_WACK_HardLink;
		masters1_Master_masters1_Master_HardLink <= masters1_Master;
		masters1_S2M_masters1_S2M_HardLink <= masters1_S2M;
		masters1_M2S <= masters1_M2S_masters1_M2S_HardLink;
		masters1_RACK <= masters1_RACK_masters1_RACK_HardLink;
		masters1_RDATA(0) <= masters1_RDATA0_masters1_RDATA_HardLink;
		masters1_RDATA(1) <= masters1_RDATA1_masters1_RDATA_HardLink;
		masters1_RDATA(2) <= masters1_RDATA2_masters1_RDATA_HardLink;
		masters1_RDATA(3) <= masters1_RDATA3_masters1_RDATA_HardLink;
		masters1_WACK <= masters1_WACK_masters1_WACK_HardLink;
		registers0_M2S_registers0_M2S_HardLink <= registers0_M2S;
		registers0_Reg_registers0_Reg_HardLink <= registers0_Reg;
		registers0_outACK <= registers0_outACK_registers0_outACK_HardLink;
		registers0_outData(0) <= registers0_outData0_registers0_outData_HardLink;
		registers0_outData(1) <= registers0_outData1_registers0_outData_HardLink;
		registers0_outData(2) <= registers0_outData2_registers0_outData_HardLink;
		registers0_outData(3) <= registers0_outData3_registers0_outData_HardLink;
		registers0_outWritten <= registers0_outWritten_registers0_outWritten_HardLink;
		registers0_S2M <= registers0_S2M_registers0_S2M_HardLink;
		registers1_M2S_registers1_M2S_HardLink <= registers1_M2S;
		registers1_Reg_registers1_Reg_HardLink <= registers1_Reg;
		registers1_outACK <= registers1_outACK_registers1_outACK_HardLink;
		registers1_outData(0) <= registers1_outData0_registers1_outData_HardLink;
		registers1_outData(1) <= registers1_outData1_registers1_outData_HardLink;
		registers1_outData(2) <= registers1_outData2_registers1_outData_HardLink;
		registers1_outData(3) <= registers1_outData3_registers1_outData_HardLink;
		registers1_outWritten <= registers1_outWritten_registers1_outWritten_HardLink;
		registers1_S2M <= registers1_S2M_registers1_S2M_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
