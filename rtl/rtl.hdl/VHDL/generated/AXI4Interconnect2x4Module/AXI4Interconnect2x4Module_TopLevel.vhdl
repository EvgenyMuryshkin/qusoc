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
-- System configuration name is AXI4Interconnect2x4Module_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4Interconnect2x4Module_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		M2S0_AR_ARID : in unsigned (7 downto 0);
		M2S0_AR_ARADDR : in unsigned (31 downto 0);
		M2S0_AR_ARLEN : in unsigned (7 downto 0);
		M2S0_AR_ARSIZE : in unsigned (2 downto 0);
		M2S0_AR_ARBURST : in unsigned (1 downto 0);
		M2S0_AR_ARLOCK : in unsigned (1 downto 0);
		M2S0_AR_ARCACHE : in unsigned (3 downto 0);
		M2S0_AR_ARPROT : in unsigned (2 downto 0);
		M2S0_AR_ARQOS : in unsigned (3 downto 0);
		M2S0_AR_ARREGION : in unsigned (7 downto 0);
		M2S0_AR_ARUSER : in unsigned (7 downto 0);
		M2S0_AR_ARVALID : in std_logic;
		M2S0_R_RREADY : in std_logic;
		M2S0_AW_AWID : in unsigned (7 downto 0);
		M2S0_AW_AWADDR : in unsigned (31 downto 0);
		M2S0_AW_AWLEN : in unsigned (7 downto 0);
		M2S0_AW_AWSIZE : in unsigned (2 downto 0);
		M2S0_AW_AWBURST : in unsigned (1 downto 0);
		M2S0_AW_AWLOCK : in unsigned (1 downto 0);
		M2S0_AW_AWCACHE : in unsigned (3 downto 0);
		M2S0_AW_AWPROT : in unsigned (2 downto 0);
		M2S0_AW_AWQOS : in unsigned (3 downto 0);
		M2S0_AW_AWREGION : in unsigned (7 downto 0);
		M2S0_AW_AWUSER : in unsigned (7 downto 0);
		M2S0_AW_AWVALID : in std_logic;
		M2S0_W_WID : in unsigned (7 downto 0);
		M2S0_W_WDATA0 : in unsigned (7 downto 0);
		M2S0_W_WDATA1 : in unsigned (7 downto 0);
		M2S0_W_WDATA2 : in unsigned (7 downto 0);
		M2S0_W_WDATA3 : in unsigned (7 downto 0);
		M2S0_W_WSTRB : in unsigned (3 downto 0);
		M2S0_W_WLAST : in std_logic;
		M2S0_W_WUSER : in unsigned (7 downto 0);
		M2S0_W_WVALID : in std_logic;
		M2S0_B_BREADY : in std_logic;
		M2S1_AR_ARID : in unsigned (7 downto 0);
		M2S1_AR_ARADDR : in unsigned (31 downto 0);
		M2S1_AR_ARLEN : in unsigned (7 downto 0);
		M2S1_AR_ARSIZE : in unsigned (2 downto 0);
		M2S1_AR_ARBURST : in unsigned (1 downto 0);
		M2S1_AR_ARLOCK : in unsigned (1 downto 0);
		M2S1_AR_ARCACHE : in unsigned (3 downto 0);
		M2S1_AR_ARPROT : in unsigned (2 downto 0);
		M2S1_AR_ARQOS : in unsigned (3 downto 0);
		M2S1_AR_ARREGION : in unsigned (7 downto 0);
		M2S1_AR_ARUSER : in unsigned (7 downto 0);
		M2S1_AR_ARVALID : in std_logic;
		M2S1_R_RREADY : in std_logic;
		M2S1_AW_AWID : in unsigned (7 downto 0);
		M2S1_AW_AWADDR : in unsigned (31 downto 0);
		M2S1_AW_AWLEN : in unsigned (7 downto 0);
		M2S1_AW_AWSIZE : in unsigned (2 downto 0);
		M2S1_AW_AWBURST : in unsigned (1 downto 0);
		M2S1_AW_AWLOCK : in unsigned (1 downto 0);
		M2S1_AW_AWCACHE : in unsigned (3 downto 0);
		M2S1_AW_AWPROT : in unsigned (2 downto 0);
		M2S1_AW_AWQOS : in unsigned (3 downto 0);
		M2S1_AW_AWREGION : in unsigned (7 downto 0);
		M2S1_AW_AWUSER : in unsigned (7 downto 0);
		M2S1_AW_AWVALID : in std_logic;
		M2S1_W_WID : in unsigned (7 downto 0);
		M2S1_W_WDATA0 : in unsigned (7 downto 0);
		M2S1_W_WDATA1 : in unsigned (7 downto 0);
		M2S1_W_WDATA2 : in unsigned (7 downto 0);
		M2S1_W_WDATA3 : in unsigned (7 downto 0);
		M2S1_W_WSTRB : in unsigned (3 downto 0);
		M2S1_W_WLAST : in std_logic;
		M2S1_W_WUSER : in unsigned (7 downto 0);
		M2S1_W_WVALID : in std_logic;
		M2S1_B_BREADY : in std_logic;
		S2M0_ADDR_HIGH : in unsigned (31 downto 0);
		S2M0_ADDR_LOW : in unsigned (31 downto 0);
		S2M0_S2M_AR_ARREADY : in std_logic;
		S2M0_S2M_AW_AWREADY : in std_logic;
		S2M0_S2M_B_BID : in unsigned (7 downto 0);
		S2M0_S2M_B_BRESP : in unsigned (1 downto 0);
		S2M0_S2M_B_BUSER : in unsigned (7 downto 0);
		S2M0_S2M_B_BVALID : in std_logic;
		S2M0_S2M_R_RID : in unsigned (7 downto 0);
		S2M0_S2M_R_RDATA0 : in unsigned (7 downto 0);
		S2M0_S2M_R_RDATA1 : in unsigned (7 downto 0);
		S2M0_S2M_R_RDATA2 : in unsigned (7 downto 0);
		S2M0_S2M_R_RDATA3 : in unsigned (7 downto 0);
		S2M0_S2M_R_RRESP : in unsigned (1 downto 0);
		S2M0_S2M_R_RLAST : in std_logic;
		S2M0_S2M_R_RUSER : in unsigned (7 downto 0);
		S2M0_S2M_R_RVALID : in std_logic;
		S2M0_S2M_W_WREADY : in std_logic;
		S2M1_ADDR_HIGH : in unsigned (31 downto 0);
		S2M1_ADDR_LOW : in unsigned (31 downto 0);
		S2M1_S2M_AR_ARREADY : in std_logic;
		S2M1_S2M_AW_AWREADY : in std_logic;
		S2M1_S2M_B_BID : in unsigned (7 downto 0);
		S2M1_S2M_B_BRESP : in unsigned (1 downto 0);
		S2M1_S2M_B_BUSER : in unsigned (7 downto 0);
		S2M1_S2M_B_BVALID : in std_logic;
		S2M1_S2M_R_RID : in unsigned (7 downto 0);
		S2M1_S2M_R_RDATA0 : in unsigned (7 downto 0);
		S2M1_S2M_R_RDATA1 : in unsigned (7 downto 0);
		S2M1_S2M_R_RDATA2 : in unsigned (7 downto 0);
		S2M1_S2M_R_RDATA3 : in unsigned (7 downto 0);
		S2M1_S2M_R_RRESP : in unsigned (1 downto 0);
		S2M1_S2M_R_RLAST : in std_logic;
		S2M1_S2M_R_RUSER : in unsigned (7 downto 0);
		S2M1_S2M_R_RVALID : in std_logic;
		S2M1_S2M_W_WREADY : in std_logic;
		S2M2_ADDR_HIGH : in unsigned (31 downto 0);
		S2M2_ADDR_LOW : in unsigned (31 downto 0);
		S2M2_S2M_AR_ARREADY : in std_logic;
		S2M2_S2M_AW_AWREADY : in std_logic;
		S2M2_S2M_B_BID : in unsigned (7 downto 0);
		S2M2_S2M_B_BRESP : in unsigned (1 downto 0);
		S2M2_S2M_B_BUSER : in unsigned (7 downto 0);
		S2M2_S2M_B_BVALID : in std_logic;
		S2M2_S2M_R_RID : in unsigned (7 downto 0);
		S2M2_S2M_R_RDATA0 : in unsigned (7 downto 0);
		S2M2_S2M_R_RDATA1 : in unsigned (7 downto 0);
		S2M2_S2M_R_RDATA2 : in unsigned (7 downto 0);
		S2M2_S2M_R_RDATA3 : in unsigned (7 downto 0);
		S2M2_S2M_R_RRESP : in unsigned (1 downto 0);
		S2M2_S2M_R_RLAST : in std_logic;
		S2M2_S2M_R_RUSER : in unsigned (7 downto 0);
		S2M2_S2M_R_RVALID : in std_logic;
		S2M2_S2M_W_WREADY : in std_logic;
		S2M3_ADDR_HIGH : in unsigned (31 downto 0);
		S2M3_ADDR_LOW : in unsigned (31 downto 0);
		S2M3_S2M_AR_ARREADY : in std_logic;
		S2M3_S2M_AW_AWREADY : in std_logic;
		S2M3_S2M_B_BID : in unsigned (7 downto 0);
		S2M3_S2M_B_BRESP : in unsigned (1 downto 0);
		S2M3_S2M_B_BUSER : in unsigned (7 downto 0);
		S2M3_S2M_B_BVALID : in std_logic;
		S2M3_S2M_R_RID : in unsigned (7 downto 0);
		S2M3_S2M_R_RDATA0 : in unsigned (7 downto 0);
		S2M3_S2M_R_RDATA1 : in unsigned (7 downto 0);
		S2M3_S2M_R_RDATA2 : in unsigned (7 downto 0);
		S2M3_S2M_R_RDATA3 : in unsigned (7 downto 0);
		S2M3_S2M_R_RRESP : in unsigned (1 downto 0);
		S2M3_S2M_R_RLAST : in std_logic;
		S2M3_S2M_R_RUSER : in unsigned (7 downto 0);
		S2M3_S2M_R_RVALID : in std_logic;
		S2M3_S2M_W_WREADY : in std_logic;
		HasActiveRead : out std_logic;
		HasActiveWrite : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4Interconnect2x4Module_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant mCount : unsigned(1 downto 0) := "10";
	constant sCount : unsigned(2 downto 0) := "100";
	signal masterReadEncoderModule_HasActive : std_logic := '0';
	signal masterReadEncoderModule_MSBIndex : std_logic := '0';
	signal masterReadEncoderModule_MSBValue : unsigned(1 downto 0) := (others => '0');
	signal masterWriteEncoderModule_HasActive : std_logic := '0';
	signal masterWriteEncoderModule_MSBIndex : std_logic := '0';
	signal masterWriteEncoderModule_MSBValue : unsigned(1 downto 0) := (others => '0');
	signal masterReadEncoderModule_iValues0_masterReadEncoderModule_iValues_HardLink : std_logic := '0';
	signal masterReadEncoderModule_iValues1_masterReadEncoderModule_iValues_HardLink : std_logic := '0';
	signal masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink : std_logic := '0';
	signal masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink : std_logic := '0';
	signal masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink : unsigned(1 downto 0) := "00";
	signal masterWriteEncoderModule_iValues0_masterWriteEncoderModule_iValues_HardLink : std_logic := '0';
	signal masterWriteEncoderModule_iValues1_masterWriteEncoderModule_iValues_HardLink : std_logic := '0';
	signal masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink : std_logic := '0';
	signal masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink : std_logic := '0';
	signal masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink : unsigned(1 downto 0) := "00";
	type Inputs_M2SArray is array (0 to 1) of unsigned (221 downto 0);
	signal Inputs_M2S : Inputs_M2SArray := (others => (others => '0'));
	type Inputs_S2MArray is array (0 to 3) of unsigned (137 downto 0);
	signal Inputs_S2M : Inputs_S2MArray := (others => (others => '0'));
	type mARVALIDArray is array (0 to 1) of std_logic;
	signal mARVALID : mARVALIDArray := (others => '0');
	type mAWVALIDArray is array (0 to 1) of std_logic;
	signal mAWVALID : mAWVALIDArray := (others => '0');
	type masterReadEncoderModule_iValuesArray is array (0 to 1) of std_logic;
	signal masterReadEncoderModule_iValues : masterReadEncoderModule_iValuesArray := (others => '0');
	type masterWriteEncoderModule_iValuesArray is array (0 to 1) of std_logic;
	signal masterWriteEncoderModule_iValues : masterWriteEncoderModule_iValuesArray := (others => '0');
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	AXI4Interconnect2x4Module_TopLevel_masterReadEncoderModule : entity work.AXI4Interconnect2x4Module_TopLevel_masterReadEncoderModule
	port map
	(
		-- [BEGIN USER MAP FOR masterReadEncoderModule]
		-- [END USER MAP FOR masterReadEncoderModule]
		iValues0 => masterReadEncoderModule_iValues0_masterReadEncoderModule_iValues_HardLink,
		iValues1 => masterReadEncoderModule_iValues1_masterReadEncoderModule_iValues_HardLink,
		HasActive => masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink,
		MSBIndex => masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink,
		MSBValue => masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink
	)
	;
	AXI4Interconnect2x4Module_TopLevel_masterWriteEncoderModule : entity work.AXI4Interconnect2x4Module_TopLevel_masterWriteEncoderModule
	port map
	(
		-- [BEGIN USER MAP FOR masterWriteEncoderModule]
		-- [END USER MAP FOR masterWriteEncoderModule]
		iValues0 => masterWriteEncoderModule_iValues0_masterWriteEncoderModule_iValues_HardLink,
		iValues1 => masterWriteEncoderModule_iValues1_masterWriteEncoderModule_iValues_HardLink,
		HasActive => masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink,
		MSBIndex => masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink,
		MSBValue => masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink
	)
	;
	process (Inputs_M2S, M2S0_AR_ARADDR, M2S0_AR_ARBURST, M2S0_AR_ARCACHE, M2S0_AR_ARID, M2S0_AR_ARLEN, M2S0_AR_ARLOCK, M2S0_AR_ARPROT, M2S0_AR_ARQOS, M2S0_AR_ARREGION, M2S0_AR_ARSIZE, M2S0_AR_ARUSER, M2S0_AR_ARVALID, M2S0_AW_AWADDR, M2S0_AW_AWBURST, M2S0_AW_AWCACHE, M2S0_AW_AWID, M2S0_AW_AWLEN, M2S0_AW_AWLOCK, M2S0_AW_AWPROT, M2S0_AW_AWQOS, M2S0_AW_AWREGION, M2S0_AW_AWSIZE, M2S0_AW_AWUSER, M2S0_AW_AWVALID, M2S0_B_BREADY, M2S0_R_RREADY, M2S0_W_WDATA0, M2S0_W_WDATA1, M2S0_W_WDATA2, M2S0_W_WDATA3, M2S0_W_WID, M2S0_W_WLAST, M2S0_W_WSTRB, M2S0_W_WUSER, M2S0_W_WVALID, M2S1_AR_ARADDR, M2S1_AR_ARBURST, M2S1_AR_ARCACHE, M2S1_AR_ARID, M2S1_AR_ARLEN, M2S1_AR_ARLOCK, M2S1_AR_ARPROT, M2S1_AR_ARQOS, M2S1_AR_ARREGION, M2S1_AR_ARSIZE, M2S1_AR_ARUSER, M2S1_AR_ARVALID, M2S1_AW_AWADDR, M2S1_AW_AWBURST, M2S1_AW_AWCACHE, M2S1_AW_AWID, M2S1_AW_AWLEN, M2S1_AW_AWLOCK, M2S1_AW_AWPROT, M2S1_AW_AWQOS, M2S1_AW_AWREGION, M2S1_AW_AWSIZE, M2S1_AW_AWUSER, M2S1_AW_AWVALID, M2S1_B_BREADY, M2S1_R_RREADY, M2S1_W_WDATA0, M2S1_W_WDATA1, M2S1_W_WDATA2, M2S1_W_WDATA3, M2S1_W_WID, M2S1_W_WLAST, M2S1_W_WSTRB, M2S1_W_WUSER, M2S1_W_WVALID, mARVALID, masterReadEncoderModule_HasActive, masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink, masterReadEncoderModule_iValues, masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink, masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink, masterWriteEncoderModule_HasActive, masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink, masterWriteEncoderModule_iValues, masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink, masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink, mAWVALID, S2M0_ADDR_HIGH, S2M0_ADDR_LOW, S2M0_S2M_AR_ARREADY, S2M0_S2M_AW_AWREADY, S2M0_S2M_B_BID, S2M0_S2M_B_BRESP, S2M0_S2M_B_BUSER, S2M0_S2M_B_BVALID, S2M0_S2M_R_RDATA0, S2M0_S2M_R_RDATA1, S2M0_S2M_R_RDATA2, S2M0_S2M_R_RDATA3, S2M0_S2M_R_RID, S2M0_S2M_R_RLAST, S2M0_S2M_R_RRESP, S2M0_S2M_R_RUSER, S2M0_S2M_R_RVALID, S2M0_S2M_W_WREADY, S2M1_ADDR_HIGH, S2M1_ADDR_LOW, S2M1_S2M_AR_ARREADY, S2M1_S2M_AW_AWREADY, S2M1_S2M_B_BID, S2M1_S2M_B_BRESP, S2M1_S2M_B_BUSER, S2M1_S2M_B_BVALID, S2M1_S2M_R_RDATA0, S2M1_S2M_R_RDATA1, S2M1_S2M_R_RDATA2, S2M1_S2M_R_RDATA3, S2M1_S2M_R_RID, S2M1_S2M_R_RLAST, S2M1_S2M_R_RRESP, S2M1_S2M_R_RUSER, S2M1_S2M_R_RVALID, S2M1_S2M_W_WREADY, S2M2_ADDR_HIGH, S2M2_ADDR_LOW, S2M2_S2M_AR_ARREADY, S2M2_S2M_AW_AWREADY, S2M2_S2M_B_BID, S2M2_S2M_B_BRESP, S2M2_S2M_B_BUSER, S2M2_S2M_B_BVALID, S2M2_S2M_R_RDATA0, S2M2_S2M_R_RDATA1, S2M2_S2M_R_RDATA2, S2M2_S2M_R_RDATA3, S2M2_S2M_R_RID, S2M2_S2M_R_RLAST, S2M2_S2M_R_RRESP, S2M2_S2M_R_RUSER, S2M2_S2M_R_RVALID, S2M2_S2M_W_WREADY, S2M3_ADDR_HIGH, S2M3_ADDR_LOW, S2M3_S2M_AR_ARREADY, S2M3_S2M_AW_AWREADY, S2M3_S2M_B_BID, S2M3_S2M_B_BRESP, S2M3_S2M_B_BUSER, S2M3_S2M_B_BVALID, S2M3_S2M_R_RDATA0, S2M3_S2M_R_RDATA1, S2M3_S2M_R_RDATA2, S2M3_S2M_R_RDATA3, S2M3_S2M_R_RID, S2M3_S2M_R_RLAST, S2M3_S2M_R_RRESP, S2M3_S2M_R_RUSER, S2M3_S2M_R_RVALID, S2M3_S2M_W_WREADY)
	begin
		Inputs_M2S(0)(221) <= M2S0_B_BREADY;
		Inputs_M2S(0)(220) <= M2S0_W_WVALID;
		Inputs_M2S(0)(219 downto 212) <= M2S0_W_WUSER;
		Inputs_M2S(0)(211) <= M2S0_W_WLAST;
		Inputs_M2S(0)(210 downto 207) <= M2S0_W_WSTRB;
		Inputs_M2S(0)(206 downto 199) <= M2S0_W_WDATA3;
		Inputs_M2S(0)(198 downto 191) <= M2S0_W_WDATA2;
		Inputs_M2S(0)(190 downto 183) <= M2S0_W_WDATA1;
		Inputs_M2S(0)(182 downto 175) <= M2S0_W_WDATA0;
		Inputs_M2S(0)(174 downto 167) <= M2S0_W_WID;
		Inputs_M2S(0)(166) <= M2S0_AW_AWVALID;
		Inputs_M2S(0)(165 downto 158) <= M2S0_AW_AWUSER;
		Inputs_M2S(0)(157 downto 150) <= M2S0_AW_AWREGION;
		Inputs_M2S(0)(149 downto 146) <= M2S0_AW_AWQOS;
		Inputs_M2S(0)(145 downto 143) <= M2S0_AW_AWPROT;
		Inputs_M2S(0)(142 downto 139) <= M2S0_AW_AWCACHE;
		Inputs_M2S(0)(138 downto 137) <= M2S0_AW_AWLOCK;
		Inputs_M2S(0)(136 downto 135) <= M2S0_AW_AWBURST;
		Inputs_M2S(0)(134 downto 132) <= M2S0_AW_AWSIZE;
		Inputs_M2S(0)(131 downto 124) <= M2S0_AW_AWLEN;
		Inputs_M2S(0)(123 downto 92) <= M2S0_AW_AWADDR;
		Inputs_M2S(0)(91 downto 84) <= M2S0_AW_AWID;
		Inputs_M2S(0)(83) <= M2S0_R_RREADY;
		Inputs_M2S(0)(82) <= M2S0_AR_ARVALID;
		Inputs_M2S(0)(81 downto 74) <= M2S0_AR_ARUSER;
		Inputs_M2S(0)(73 downto 66) <= M2S0_AR_ARREGION;
		Inputs_M2S(0)(65 downto 62) <= M2S0_AR_ARQOS;
		Inputs_M2S(0)(61 downto 59) <= M2S0_AR_ARPROT;
		Inputs_M2S(0)(58 downto 55) <= M2S0_AR_ARCACHE;
		Inputs_M2S(0)(54 downto 53) <= M2S0_AR_ARLOCK;
		Inputs_M2S(0)(52 downto 51) <= M2S0_AR_ARBURST;
		Inputs_M2S(0)(50 downto 48) <= M2S0_AR_ARSIZE;
		Inputs_M2S(0)(47 downto 40) <= M2S0_AR_ARLEN;
		Inputs_M2S(0)(39 downto 8) <= M2S0_AR_ARADDR;
		Inputs_M2S(0)(7 downto 0) <= M2S0_AR_ARID;
		Inputs_M2S(1)(221) <= M2S1_B_BREADY;
		Inputs_M2S(1)(220) <= M2S1_W_WVALID;
		Inputs_M2S(1)(219 downto 212) <= M2S1_W_WUSER;
		Inputs_M2S(1)(211) <= M2S1_W_WLAST;
		Inputs_M2S(1)(210 downto 207) <= M2S1_W_WSTRB;
		Inputs_M2S(1)(206 downto 199) <= M2S1_W_WDATA3;
		Inputs_M2S(1)(198 downto 191) <= M2S1_W_WDATA2;
		Inputs_M2S(1)(190 downto 183) <= M2S1_W_WDATA1;
		Inputs_M2S(1)(182 downto 175) <= M2S1_W_WDATA0;
		Inputs_M2S(1)(174 downto 167) <= M2S1_W_WID;
		Inputs_M2S(1)(166) <= M2S1_AW_AWVALID;
		Inputs_M2S(1)(165 downto 158) <= M2S1_AW_AWUSER;
		Inputs_M2S(1)(157 downto 150) <= M2S1_AW_AWREGION;
		Inputs_M2S(1)(149 downto 146) <= M2S1_AW_AWQOS;
		Inputs_M2S(1)(145 downto 143) <= M2S1_AW_AWPROT;
		Inputs_M2S(1)(142 downto 139) <= M2S1_AW_AWCACHE;
		Inputs_M2S(1)(138 downto 137) <= M2S1_AW_AWLOCK;
		Inputs_M2S(1)(136 downto 135) <= M2S1_AW_AWBURST;
		Inputs_M2S(1)(134 downto 132) <= M2S1_AW_AWSIZE;
		Inputs_M2S(1)(131 downto 124) <= M2S1_AW_AWLEN;
		Inputs_M2S(1)(123 downto 92) <= M2S1_AW_AWADDR;
		Inputs_M2S(1)(91 downto 84) <= M2S1_AW_AWID;
		Inputs_M2S(1)(83) <= M2S1_R_RREADY;
		Inputs_M2S(1)(82) <= M2S1_AR_ARVALID;
		Inputs_M2S(1)(81 downto 74) <= M2S1_AR_ARUSER;
		Inputs_M2S(1)(73 downto 66) <= M2S1_AR_ARREGION;
		Inputs_M2S(1)(65 downto 62) <= M2S1_AR_ARQOS;
		Inputs_M2S(1)(61 downto 59) <= M2S1_AR_ARPROT;
		Inputs_M2S(1)(58 downto 55) <= M2S1_AR_ARCACHE;
		Inputs_M2S(1)(54 downto 53) <= M2S1_AR_ARLOCK;
		Inputs_M2S(1)(52 downto 51) <= M2S1_AR_ARBURST;
		Inputs_M2S(1)(50 downto 48) <= M2S1_AR_ARSIZE;
		Inputs_M2S(1)(47 downto 40) <= M2S1_AR_ARLEN;
		Inputs_M2S(1)(39 downto 8) <= M2S1_AR_ARADDR;
		Inputs_M2S(1)(7 downto 0) <= M2S1_AR_ARID;
		Inputs_S2M(0)(137) <= S2M0_S2M_W_WREADY;
		Inputs_S2M(0)(136) <= S2M0_S2M_R_RVALID;
		Inputs_S2M(0)(135 downto 128) <= S2M0_S2M_R_RUSER;
		Inputs_S2M(0)(127) <= S2M0_S2M_R_RLAST;
		Inputs_S2M(0)(126 downto 125) <= S2M0_S2M_R_RRESP;
		Inputs_S2M(0)(124 downto 117) <= S2M0_S2M_R_RDATA3;
		Inputs_S2M(0)(116 downto 109) <= S2M0_S2M_R_RDATA2;
		Inputs_S2M(0)(108 downto 101) <= S2M0_S2M_R_RDATA1;
		Inputs_S2M(0)(100 downto 93) <= S2M0_S2M_R_RDATA0;
		Inputs_S2M(0)(92 downto 85) <= S2M0_S2M_R_RID;
		Inputs_S2M(0)(84) <= S2M0_S2M_B_BVALID;
		Inputs_S2M(0)(83 downto 76) <= S2M0_S2M_B_BUSER;
		Inputs_S2M(0)(75 downto 74) <= S2M0_S2M_B_BRESP;
		Inputs_S2M(0)(73 downto 66) <= S2M0_S2M_B_BID;
		Inputs_S2M(0)(65) <= S2M0_S2M_AW_AWREADY;
		Inputs_S2M(0)(64) <= S2M0_S2M_AR_ARREADY;
		Inputs_S2M(0)(63 downto 32) <= S2M0_ADDR_LOW;
		Inputs_S2M(0)(31 downto 0) <= S2M0_ADDR_HIGH;
		Inputs_S2M(1)(137) <= S2M1_S2M_W_WREADY;
		Inputs_S2M(1)(136) <= S2M1_S2M_R_RVALID;
		Inputs_S2M(1)(135 downto 128) <= S2M1_S2M_R_RUSER;
		Inputs_S2M(1)(127) <= S2M1_S2M_R_RLAST;
		Inputs_S2M(1)(126 downto 125) <= S2M1_S2M_R_RRESP;
		Inputs_S2M(1)(124 downto 117) <= S2M1_S2M_R_RDATA3;
		Inputs_S2M(1)(116 downto 109) <= S2M1_S2M_R_RDATA2;
		Inputs_S2M(1)(108 downto 101) <= S2M1_S2M_R_RDATA1;
		Inputs_S2M(1)(100 downto 93) <= S2M1_S2M_R_RDATA0;
		Inputs_S2M(1)(92 downto 85) <= S2M1_S2M_R_RID;
		Inputs_S2M(1)(84) <= S2M1_S2M_B_BVALID;
		Inputs_S2M(1)(83 downto 76) <= S2M1_S2M_B_BUSER;
		Inputs_S2M(1)(75 downto 74) <= S2M1_S2M_B_BRESP;
		Inputs_S2M(1)(73 downto 66) <= S2M1_S2M_B_BID;
		Inputs_S2M(1)(65) <= S2M1_S2M_AW_AWREADY;
		Inputs_S2M(1)(64) <= S2M1_S2M_AR_ARREADY;
		Inputs_S2M(1)(63 downto 32) <= S2M1_ADDR_LOW;
		Inputs_S2M(1)(31 downto 0) <= S2M1_ADDR_HIGH;
		Inputs_S2M(2)(137) <= S2M2_S2M_W_WREADY;
		Inputs_S2M(2)(136) <= S2M2_S2M_R_RVALID;
		Inputs_S2M(2)(135 downto 128) <= S2M2_S2M_R_RUSER;
		Inputs_S2M(2)(127) <= S2M2_S2M_R_RLAST;
		Inputs_S2M(2)(126 downto 125) <= S2M2_S2M_R_RRESP;
		Inputs_S2M(2)(124 downto 117) <= S2M2_S2M_R_RDATA3;
		Inputs_S2M(2)(116 downto 109) <= S2M2_S2M_R_RDATA2;
		Inputs_S2M(2)(108 downto 101) <= S2M2_S2M_R_RDATA1;
		Inputs_S2M(2)(100 downto 93) <= S2M2_S2M_R_RDATA0;
		Inputs_S2M(2)(92 downto 85) <= S2M2_S2M_R_RID;
		Inputs_S2M(2)(84) <= S2M2_S2M_B_BVALID;
		Inputs_S2M(2)(83 downto 76) <= S2M2_S2M_B_BUSER;
		Inputs_S2M(2)(75 downto 74) <= S2M2_S2M_B_BRESP;
		Inputs_S2M(2)(73 downto 66) <= S2M2_S2M_B_BID;
		Inputs_S2M(2)(65) <= S2M2_S2M_AW_AWREADY;
		Inputs_S2M(2)(64) <= S2M2_S2M_AR_ARREADY;
		Inputs_S2M(2)(63 downto 32) <= S2M2_ADDR_LOW;
		Inputs_S2M(2)(31 downto 0) <= S2M2_ADDR_HIGH;
		Inputs_S2M(3)(137) <= S2M3_S2M_W_WREADY;
		Inputs_S2M(3)(136) <= S2M3_S2M_R_RVALID;
		Inputs_S2M(3)(135 downto 128) <= S2M3_S2M_R_RUSER;
		Inputs_S2M(3)(127) <= S2M3_S2M_R_RLAST;
		Inputs_S2M(3)(126 downto 125) <= S2M3_S2M_R_RRESP;
		Inputs_S2M(3)(124 downto 117) <= S2M3_S2M_R_RDATA3;
		Inputs_S2M(3)(116 downto 109) <= S2M3_S2M_R_RDATA2;
		Inputs_S2M(3)(108 downto 101) <= S2M3_S2M_R_RDATA1;
		Inputs_S2M(3)(100 downto 93) <= S2M3_S2M_R_RDATA0;
		Inputs_S2M(3)(92 downto 85) <= S2M3_S2M_R_RID;
		Inputs_S2M(3)(84) <= S2M3_S2M_B_BVALID;
		Inputs_S2M(3)(83 downto 76) <= S2M3_S2M_B_BUSER;
		Inputs_S2M(3)(75 downto 74) <= S2M3_S2M_B_BRESP;
		Inputs_S2M(3)(73 downto 66) <= S2M3_S2M_B_BID;
		Inputs_S2M(3)(65) <= S2M3_S2M_AW_AWREADY;
		Inputs_S2M(3)(64) <= S2M3_S2M_AR_ARREADY;
		Inputs_S2M(3)(63 downto 32) <= S2M3_ADDR_LOW;
		Inputs_S2M(3)(31 downto 0) <= S2M3_ADDR_HIGH;
		mARVALID(0) <= Inputs_M2S(0)(82);
		mARVALID(1) <= Inputs_M2S(1)(82);
		mAWVALID(0) <= Inputs_M2S(0)(166);
		mAWVALID(1) <= Inputs_M2S(1)(166);
		masterReadEncoderModule_iValues(0) <= mARVALID(0);
		masterReadEncoderModule_iValues(1) <= mARVALID(1);
		masterWriteEncoderModule_iValues(0) <= mAWVALID(0);
		masterWriteEncoderModule_iValues(1) <= mAWVALID(1);
		HasActiveRead <= masterReadEncoderModule_HasActive;
		HasActiveWrite <= masterWriteEncoderModule_HasActive;
		masterReadEncoderModule_iValues0_masterReadEncoderModule_iValues_HardLink <= masterReadEncoderModule_iValues(0);
		masterReadEncoderModule_iValues1_masterReadEncoderModule_iValues_HardLink <= masterReadEncoderModule_iValues(1);
		masterReadEncoderModule_HasActive <= masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink;
		masterReadEncoderModule_MSBIndex <= masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink;
		masterReadEncoderModule_MSBValue <= masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink;
		masterWriteEncoderModule_iValues0_masterWriteEncoderModule_iValues_HardLink <= masterWriteEncoderModule_iValues(0);
		masterWriteEncoderModule_iValues1_masterWriteEncoderModule_iValues_HardLink <= masterWriteEncoderModule_iValues(1);
		masterWriteEncoderModule_HasActive <= masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink;
		masterWriteEncoderModule_MSBIndex <= masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink;
		masterWriteEncoderModule_MSBValue <= masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
