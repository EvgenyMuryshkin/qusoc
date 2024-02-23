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
-- System configuration name is AXI4InteconnectModule_2x2_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4InteconnectModule_2x2_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		M2S0_R_AR_ARID : in unsigned (7 downto 0);
		M2S0_R_AR_ARADDR : in unsigned (31 downto 0);
		M2S0_R_AR_ARLEN : in unsigned (7 downto 0);
		M2S0_R_AR_ARSIZE : in unsigned (2 downto 0);
		M2S0_R_AR_ARBURST : in unsigned (1 downto 0);
		M2S0_R_AR_ARLOCK : in unsigned (1 downto 0);
		M2S0_R_AR_ARCACHE : in unsigned (3 downto 0);
		M2S0_R_AR_ARPROT : in unsigned (2 downto 0);
		M2S0_R_AR_ARQOS : in unsigned (3 downto 0);
		M2S0_R_AR_ARREGION : in unsigned (7 downto 0);
		M2S0_R_AR_ARUSER : in unsigned (7 downto 0);
		M2S0_R_AR_ARVALID : in std_logic;
		M2S0_R_R_RREADY : in std_logic;
		M2S0_W_AW_AWID : in unsigned (7 downto 0);
		M2S0_W_AW_AWADDR : in unsigned (31 downto 0);
		M2S0_W_AW_AWLEN : in unsigned (7 downto 0);
		M2S0_W_AW_AWSIZE : in unsigned (2 downto 0);
		M2S0_W_AW_AWBURST : in unsigned (1 downto 0);
		M2S0_W_AW_AWLOCK : in unsigned (1 downto 0);
		M2S0_W_AW_AWCACHE : in unsigned (3 downto 0);
		M2S0_W_AW_AWPROT : in unsigned (2 downto 0);
		M2S0_W_AW_AWQOS : in unsigned (3 downto 0);
		M2S0_W_AW_AWREGION : in unsigned (7 downto 0);
		M2S0_W_AW_AWUSER : in unsigned (7 downto 0);
		M2S0_W_AW_AWVALID : in std_logic;
		M2S0_W_W_WID : in unsigned (7 downto 0);
		M2S0_W_W_WDATA0 : in unsigned (7 downto 0);
		M2S0_W_W_WDATA1 : in unsigned (7 downto 0);
		M2S0_W_W_WDATA2 : in unsigned (7 downto 0);
		M2S0_W_W_WDATA3 : in unsigned (7 downto 0);
		M2S0_W_W_WSTRB : in unsigned (3 downto 0);
		M2S0_W_W_WLAST : in std_logic;
		M2S0_W_W_WUSER : in unsigned (7 downto 0);
		M2S0_W_W_WVALID : in std_logic;
		M2S0_W_B_BREADY : in std_logic;
		M2S1_R_AR_ARID : in unsigned (7 downto 0);
		M2S1_R_AR_ARADDR : in unsigned (31 downto 0);
		M2S1_R_AR_ARLEN : in unsigned (7 downto 0);
		M2S1_R_AR_ARSIZE : in unsigned (2 downto 0);
		M2S1_R_AR_ARBURST : in unsigned (1 downto 0);
		M2S1_R_AR_ARLOCK : in unsigned (1 downto 0);
		M2S1_R_AR_ARCACHE : in unsigned (3 downto 0);
		M2S1_R_AR_ARPROT : in unsigned (2 downto 0);
		M2S1_R_AR_ARQOS : in unsigned (3 downto 0);
		M2S1_R_AR_ARREGION : in unsigned (7 downto 0);
		M2S1_R_AR_ARUSER : in unsigned (7 downto 0);
		M2S1_R_AR_ARVALID : in std_logic;
		M2S1_R_R_RREADY : in std_logic;
		M2S1_W_AW_AWID : in unsigned (7 downto 0);
		M2S1_W_AW_AWADDR : in unsigned (31 downto 0);
		M2S1_W_AW_AWLEN : in unsigned (7 downto 0);
		M2S1_W_AW_AWSIZE : in unsigned (2 downto 0);
		M2S1_W_AW_AWBURST : in unsigned (1 downto 0);
		M2S1_W_AW_AWLOCK : in unsigned (1 downto 0);
		M2S1_W_AW_AWCACHE : in unsigned (3 downto 0);
		M2S1_W_AW_AWPROT : in unsigned (2 downto 0);
		M2S1_W_AW_AWQOS : in unsigned (3 downto 0);
		M2S1_W_AW_AWREGION : in unsigned (7 downto 0);
		M2S1_W_AW_AWUSER : in unsigned (7 downto 0);
		M2S1_W_AW_AWVALID : in std_logic;
		M2S1_W_W_WID : in unsigned (7 downto 0);
		M2S1_W_W_WDATA0 : in unsigned (7 downto 0);
		M2S1_W_W_WDATA1 : in unsigned (7 downto 0);
		M2S1_W_W_WDATA2 : in unsigned (7 downto 0);
		M2S1_W_W_WDATA3 : in unsigned (7 downto 0);
		M2S1_W_W_WSTRB : in unsigned (3 downto 0);
		M2S1_W_W_WLAST : in std_logic;
		M2S1_W_W_WUSER : in unsigned (7 downto 0);
		M2S1_W_W_WVALID : in std_logic;
		M2S1_W_B_BREADY : in std_logic;
		S2M0_R_AR_ARREADY : in std_logic;
		S2M0_R_R_RID : in unsigned (7 downto 0);
		S2M0_R_R_RDATA0 : in unsigned (7 downto 0);
		S2M0_R_R_RDATA1 : in unsigned (7 downto 0);
		S2M0_R_R_RDATA2 : in unsigned (7 downto 0);
		S2M0_R_R_RDATA3 : in unsigned (7 downto 0);
		S2M0_R_R_RRESP : in unsigned (1 downto 0);
		S2M0_R_R_RLAST : in std_logic;
		S2M0_R_R_RUSER : in unsigned (7 downto 0);
		S2M0_R_R_RVALID : in std_logic;
		S2M0_W_AW_AWREADY : in std_logic;
		S2M0_W_B_BID : in unsigned (7 downto 0);
		S2M0_W_B_BRESP : in unsigned (1 downto 0);
		S2M0_W_B_BUSER : in unsigned (7 downto 0);
		S2M0_W_B_BVALID : in std_logic;
		S2M0_W_W_WREADY : in std_logic;
		S2M1_R_AR_ARREADY : in std_logic;
		S2M1_R_R_RID : in unsigned (7 downto 0);
		S2M1_R_R_RDATA0 : in unsigned (7 downto 0);
		S2M1_R_R_RDATA1 : in unsigned (7 downto 0);
		S2M1_R_R_RDATA2 : in unsigned (7 downto 0);
		S2M1_R_R_RDATA3 : in unsigned (7 downto 0);
		S2M1_R_R_RRESP : in unsigned (1 downto 0);
		S2M1_R_R_RLAST : in std_logic;
		S2M1_R_R_RUSER : in unsigned (7 downto 0);
		S2M1_R_R_RVALID : in std_logic;
		S2M1_W_AW_AWREADY : in std_logic;
		S2M1_W_B_BID : in unsigned (7 downto 0);
		S2M1_W_B_BRESP : in unsigned (1 downto 0);
		S2M1_W_B_BUSER : in unsigned (7 downto 0);
		S2M1_W_B_BVALID : in std_logic;
		S2M1_W_W_WREADY : in std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4InteconnectModule_2x2_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal readInterconnect_iLeft0_readInterconnect_iLeft_HardLink : unsigned(83 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal readInterconnect_iLeft1_readInterconnect_iLeft_HardLink : unsigned(83 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal readInterconnect_iRight0_readInterconnect_iRight_HardLink : unsigned(52 downto 0) := "00000000000000000000000000000000000000000000000000000";
	signal readInterconnect_iRight1_readInterconnect_iRight_HardLink : unsigned(52 downto 0) := "00000000000000000000000000000000000000000000000000000";
	signal writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink : unsigned(137 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink : unsigned(137 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal writeInterconnect_iRight0_writeInterconnect_iRight_HardLink : unsigned(20 downto 0) := "000000000000000000000";
	signal writeInterconnect_iRight1_writeInterconnect_iRight_HardLink : unsigned(20 downto 0) := "000000000000000000000";
	type Inputs_M2SArray is array (0 to 1) of unsigned (221 downto 0);
	signal Inputs_M2S : Inputs_M2SArray := (others => (others => '0'));
	type Inputs_S2MArray is array (0 to 1) of unsigned (73 downto 0);
	signal Inputs_S2M : Inputs_S2MArray := (others => (others => '0'));
	type readInterconnect_iLeftArray is array (0 to 1) of unsigned (83 downto 0);
	signal readInterconnect_iLeft : readInterconnect_iLeftArray := (others => (others => '0'));
	type readInterconnect_iRightArray is array (0 to 1) of unsigned (52 downto 0);
	signal readInterconnect_iRight : readInterconnect_iRightArray := (others => (others => '0'));
	type writeInterconnect_iLeftArray is array (0 to 1) of unsigned (137 downto 0);
	signal writeInterconnect_iLeft : writeInterconnect_iLeftArray := (others => (others => '0'));
	type writeInterconnect_iRightArray is array (0 to 1) of unsigned (20 downto 0);
	signal writeInterconnect_iRight : writeInterconnect_iRightArray := (others => (others => '0'));
	type AXI4InteconnectModule_L40F29T66_EnumerableArray is array (0 to 1) of unsigned (83 downto 0);
	signal AXI4InteconnectModule_L40F29T66_Enumerable : AXI4InteconnectModule_L40F29T66_EnumerableArray := (others => (others => '0'));
	type AXI4InteconnectModule_L41F30T67_EnumerableArray is array (0 to 1) of unsigned (52 downto 0);
	signal AXI4InteconnectModule_L41F30T67_Enumerable : AXI4InteconnectModule_L41F30T67_EnumerableArray := (others => (others => '0'));
	type AXI4InteconnectModule_L48F29T66_EnumerableArray is array (0 to 1) of unsigned (137 downto 0);
	signal AXI4InteconnectModule_L48F29T66_Enumerable : AXI4InteconnectModule_L48F29T66_EnumerableArray := (others => (others => '0'));
	type AXI4InteconnectModule_L49F30T67_EnumerableArray is array (0 to 1) of unsigned (20 downto 0);
	signal AXI4InteconnectModule_L49F30T67_Enumerable : AXI4InteconnectModule_L49F30T67_EnumerableArray := (others => (others => '0'));
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	AXI4InteconnectModule_2x2_TopLevel_readInterconnect : entity work.AXI4InteconnectModule_2x2_TopLevel_readInterconnect
	port map
	(
		-- [BEGIN USER MAP FOR readInterconnect]
		-- [END USER MAP FOR readInterconnect]
		BoardSignals => BoardSignals,
		iLeft0 => readInterconnect_iLeft0_readInterconnect_iLeft_HardLink,
		iLeft1 => readInterconnect_iLeft1_readInterconnect_iLeft_HardLink,
		iRight0 => readInterconnect_iRight0_readInterconnect_iRight_HardLink,
		iRight1 => readInterconnect_iRight1_readInterconnect_iRight_HardLink
	)
	;
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect : entity work.AXI4InteconnectModule_2x2_TopLevel_writeInterconnect
	port map
	(
		-- [BEGIN USER MAP FOR writeInterconnect]
		-- [END USER MAP FOR writeInterconnect]
		BoardSignals => BoardSignals,
		iLeft0 => writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink,
		iLeft1 => writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink,
		iRight0 => writeInterconnect_iRight0_writeInterconnect_iRight_HardLink,
		iRight1 => writeInterconnect_iRight1_writeInterconnect_iRight_HardLink
	)
	;
	process (AXI4InteconnectModule_L40F29T66_Enumerable, AXI4InteconnectModule_L41F30T67_Enumerable, AXI4InteconnectModule_L48F29T66_Enumerable, AXI4InteconnectModule_L49F30T67_Enumerable, Inputs_M2S, Inputs_S2M, M2S0_R_AR_ARADDR, M2S0_R_AR_ARBURST, M2S0_R_AR_ARCACHE, M2S0_R_AR_ARID, M2S0_R_AR_ARLEN, M2S0_R_AR_ARLOCK, M2S0_R_AR_ARPROT, M2S0_R_AR_ARQOS, M2S0_R_AR_ARREGION, M2S0_R_AR_ARSIZE, M2S0_R_AR_ARUSER, M2S0_R_AR_ARVALID, M2S0_R_R_RREADY, M2S0_W_AW_AWADDR, M2S0_W_AW_AWBURST, M2S0_W_AW_AWCACHE, M2S0_W_AW_AWID, M2S0_W_AW_AWLEN, M2S0_W_AW_AWLOCK, M2S0_W_AW_AWPROT, M2S0_W_AW_AWQOS, M2S0_W_AW_AWREGION, M2S0_W_AW_AWSIZE, M2S0_W_AW_AWUSER, M2S0_W_AW_AWVALID, M2S0_W_B_BREADY, M2S0_W_W_WDATA0, M2S0_W_W_WDATA1, M2S0_W_W_WDATA2, M2S0_W_W_WDATA3, M2S0_W_W_WID, M2S0_W_W_WLAST, M2S0_W_W_WSTRB, M2S0_W_W_WUSER, M2S0_W_W_WVALID, M2S1_R_AR_ARADDR, M2S1_R_AR_ARBURST, M2S1_R_AR_ARCACHE, M2S1_R_AR_ARID, M2S1_R_AR_ARLEN, M2S1_R_AR_ARLOCK, M2S1_R_AR_ARPROT, M2S1_R_AR_ARQOS, M2S1_R_AR_ARREGION, M2S1_R_AR_ARSIZE, M2S1_R_AR_ARUSER, M2S1_R_AR_ARVALID, M2S1_R_R_RREADY, M2S1_W_AW_AWADDR, M2S1_W_AW_AWBURST, M2S1_W_AW_AWCACHE, M2S1_W_AW_AWID, M2S1_W_AW_AWLEN, M2S1_W_AW_AWLOCK, M2S1_W_AW_AWPROT, M2S1_W_AW_AWQOS, M2S1_W_AW_AWREGION, M2S1_W_AW_AWSIZE, M2S1_W_AW_AWUSER, M2S1_W_AW_AWVALID, M2S1_W_B_BREADY, M2S1_W_W_WDATA0, M2S1_W_W_WDATA1, M2S1_W_W_WDATA2, M2S1_W_W_WDATA3, M2S1_W_W_WID, M2S1_W_W_WLAST, M2S1_W_W_WSTRB, M2S1_W_W_WUSER, M2S1_W_W_WVALID, readInterconnect_iLeft, readInterconnect_iRight, S2M0_R_AR_ARREADY, S2M0_R_R_RDATA0, S2M0_R_R_RDATA1, S2M0_R_R_RDATA2, S2M0_R_R_RDATA3, S2M0_R_R_RID, S2M0_R_R_RLAST, S2M0_R_R_RRESP, S2M0_R_R_RUSER, S2M0_R_R_RVALID, S2M0_W_AW_AWREADY, S2M0_W_B_BID, S2M0_W_B_BRESP, S2M0_W_B_BUSER, S2M0_W_B_BVALID, S2M0_W_W_WREADY, S2M1_R_AR_ARREADY, S2M1_R_R_RDATA0, S2M1_R_R_RDATA1, S2M1_R_R_RDATA2, S2M1_R_R_RDATA3, S2M1_R_R_RID, S2M1_R_R_RLAST, S2M1_R_R_RRESP, S2M1_R_R_RUSER, S2M1_R_R_RVALID, S2M1_W_AW_AWREADY, S2M1_W_B_BID, S2M1_W_B_BRESP, S2M1_W_B_BUSER, S2M1_W_B_BVALID, S2M1_W_W_WREADY, writeInterconnect_iLeft, writeInterconnect_iRight)
	begin
		Inputs_M2S(0)(221) <= M2S0_W_B_BREADY;
		Inputs_M2S(0)(220) <= M2S0_W_W_WVALID;
		Inputs_M2S(0)(219 downto 212) <= M2S0_W_W_WUSER;
		Inputs_M2S(0)(211) <= M2S0_W_W_WLAST;
		Inputs_M2S(0)(210 downto 207) <= M2S0_W_W_WSTRB;
		Inputs_M2S(0)(206 downto 199) <= M2S0_W_W_WDATA3;
		Inputs_M2S(0)(198 downto 191) <= M2S0_W_W_WDATA2;
		Inputs_M2S(0)(190 downto 183) <= M2S0_W_W_WDATA1;
		Inputs_M2S(0)(182 downto 175) <= M2S0_W_W_WDATA0;
		Inputs_M2S(0)(174 downto 167) <= M2S0_W_W_WID;
		Inputs_M2S(0)(166) <= M2S0_W_AW_AWVALID;
		Inputs_M2S(0)(165 downto 158) <= M2S0_W_AW_AWUSER;
		Inputs_M2S(0)(157 downto 150) <= M2S0_W_AW_AWREGION;
		Inputs_M2S(0)(149 downto 146) <= M2S0_W_AW_AWQOS;
		Inputs_M2S(0)(145 downto 143) <= M2S0_W_AW_AWPROT;
		Inputs_M2S(0)(142 downto 139) <= M2S0_W_AW_AWCACHE;
		Inputs_M2S(0)(138 downto 137) <= M2S0_W_AW_AWLOCK;
		Inputs_M2S(0)(136 downto 135) <= M2S0_W_AW_AWBURST;
		Inputs_M2S(0)(134 downto 132) <= M2S0_W_AW_AWSIZE;
		Inputs_M2S(0)(131 downto 124) <= M2S0_W_AW_AWLEN;
		Inputs_M2S(0)(123 downto 92) <= M2S0_W_AW_AWADDR;
		Inputs_M2S(0)(91 downto 84) <= M2S0_W_AW_AWID;
		Inputs_M2S(0)(83) <= M2S0_R_R_RREADY;
		Inputs_M2S(0)(82) <= M2S0_R_AR_ARVALID;
		Inputs_M2S(0)(81 downto 74) <= M2S0_R_AR_ARUSER;
		Inputs_M2S(0)(73 downto 66) <= M2S0_R_AR_ARREGION;
		Inputs_M2S(0)(65 downto 62) <= M2S0_R_AR_ARQOS;
		Inputs_M2S(0)(61 downto 59) <= M2S0_R_AR_ARPROT;
		Inputs_M2S(0)(58 downto 55) <= M2S0_R_AR_ARCACHE;
		Inputs_M2S(0)(54 downto 53) <= M2S0_R_AR_ARLOCK;
		Inputs_M2S(0)(52 downto 51) <= M2S0_R_AR_ARBURST;
		Inputs_M2S(0)(50 downto 48) <= M2S0_R_AR_ARSIZE;
		Inputs_M2S(0)(47 downto 40) <= M2S0_R_AR_ARLEN;
		Inputs_M2S(0)(39 downto 8) <= M2S0_R_AR_ARADDR;
		Inputs_M2S(0)(7 downto 0) <= M2S0_R_AR_ARID;
		Inputs_M2S(1)(221) <= M2S1_W_B_BREADY;
		Inputs_M2S(1)(220) <= M2S1_W_W_WVALID;
		Inputs_M2S(1)(219 downto 212) <= M2S1_W_W_WUSER;
		Inputs_M2S(1)(211) <= M2S1_W_W_WLAST;
		Inputs_M2S(1)(210 downto 207) <= M2S1_W_W_WSTRB;
		Inputs_M2S(1)(206 downto 199) <= M2S1_W_W_WDATA3;
		Inputs_M2S(1)(198 downto 191) <= M2S1_W_W_WDATA2;
		Inputs_M2S(1)(190 downto 183) <= M2S1_W_W_WDATA1;
		Inputs_M2S(1)(182 downto 175) <= M2S1_W_W_WDATA0;
		Inputs_M2S(1)(174 downto 167) <= M2S1_W_W_WID;
		Inputs_M2S(1)(166) <= M2S1_W_AW_AWVALID;
		Inputs_M2S(1)(165 downto 158) <= M2S1_W_AW_AWUSER;
		Inputs_M2S(1)(157 downto 150) <= M2S1_W_AW_AWREGION;
		Inputs_M2S(1)(149 downto 146) <= M2S1_W_AW_AWQOS;
		Inputs_M2S(1)(145 downto 143) <= M2S1_W_AW_AWPROT;
		Inputs_M2S(1)(142 downto 139) <= M2S1_W_AW_AWCACHE;
		Inputs_M2S(1)(138 downto 137) <= M2S1_W_AW_AWLOCK;
		Inputs_M2S(1)(136 downto 135) <= M2S1_W_AW_AWBURST;
		Inputs_M2S(1)(134 downto 132) <= M2S1_W_AW_AWSIZE;
		Inputs_M2S(1)(131 downto 124) <= M2S1_W_AW_AWLEN;
		Inputs_M2S(1)(123 downto 92) <= M2S1_W_AW_AWADDR;
		Inputs_M2S(1)(91 downto 84) <= M2S1_W_AW_AWID;
		Inputs_M2S(1)(83) <= M2S1_R_R_RREADY;
		Inputs_M2S(1)(82) <= M2S1_R_AR_ARVALID;
		Inputs_M2S(1)(81 downto 74) <= M2S1_R_AR_ARUSER;
		Inputs_M2S(1)(73 downto 66) <= M2S1_R_AR_ARREGION;
		Inputs_M2S(1)(65 downto 62) <= M2S1_R_AR_ARQOS;
		Inputs_M2S(1)(61 downto 59) <= M2S1_R_AR_ARPROT;
		Inputs_M2S(1)(58 downto 55) <= M2S1_R_AR_ARCACHE;
		Inputs_M2S(1)(54 downto 53) <= M2S1_R_AR_ARLOCK;
		Inputs_M2S(1)(52 downto 51) <= M2S1_R_AR_ARBURST;
		Inputs_M2S(1)(50 downto 48) <= M2S1_R_AR_ARSIZE;
		Inputs_M2S(1)(47 downto 40) <= M2S1_R_AR_ARLEN;
		Inputs_M2S(1)(39 downto 8) <= M2S1_R_AR_ARADDR;
		Inputs_M2S(1)(7 downto 0) <= M2S1_R_AR_ARID;
		Inputs_S2M(0)(73) <= S2M0_W_W_WREADY;
		Inputs_S2M(0)(72) <= S2M0_W_B_BVALID;
		Inputs_S2M(0)(71 downto 64) <= S2M0_W_B_BUSER;
		Inputs_S2M(0)(63 downto 62) <= S2M0_W_B_BRESP;
		Inputs_S2M(0)(61 downto 54) <= S2M0_W_B_BID;
		Inputs_S2M(0)(53) <= S2M0_W_AW_AWREADY;
		Inputs_S2M(0)(52) <= S2M0_R_R_RVALID;
		Inputs_S2M(0)(51 downto 44) <= S2M0_R_R_RUSER;
		Inputs_S2M(0)(43) <= S2M0_R_R_RLAST;
		Inputs_S2M(0)(42 downto 41) <= S2M0_R_R_RRESP;
		Inputs_S2M(0)(40 downto 33) <= S2M0_R_R_RDATA3;
		Inputs_S2M(0)(32 downto 25) <= S2M0_R_R_RDATA2;
		Inputs_S2M(0)(24 downto 17) <= S2M0_R_R_RDATA1;
		Inputs_S2M(0)(16 downto 9) <= S2M0_R_R_RDATA0;
		Inputs_S2M(0)(8 downto 1) <= S2M0_R_R_RID;
		Inputs_S2M(0)(0) <= S2M0_R_AR_ARREADY;
		Inputs_S2M(1)(73) <= S2M1_W_W_WREADY;
		Inputs_S2M(1)(72) <= S2M1_W_B_BVALID;
		Inputs_S2M(1)(71 downto 64) <= S2M1_W_B_BUSER;
		Inputs_S2M(1)(63 downto 62) <= S2M1_W_B_BRESP;
		Inputs_S2M(1)(61 downto 54) <= S2M1_W_B_BID;
		Inputs_S2M(1)(53) <= S2M1_W_AW_AWREADY;
		Inputs_S2M(1)(52) <= S2M1_R_R_RVALID;
		Inputs_S2M(1)(51 downto 44) <= S2M1_R_R_RUSER;
		Inputs_S2M(1)(43) <= S2M1_R_R_RLAST;
		Inputs_S2M(1)(42 downto 41) <= S2M1_R_R_RRESP;
		Inputs_S2M(1)(40 downto 33) <= S2M1_R_R_RDATA3;
		Inputs_S2M(1)(32 downto 25) <= S2M1_R_R_RDATA2;
		Inputs_S2M(1)(24 downto 17) <= S2M1_R_R_RDATA1;
		Inputs_S2M(1)(16 downto 9) <= S2M1_R_R_RDATA0;
		Inputs_S2M(1)(8 downto 1) <= S2M1_R_R_RID;
		Inputs_S2M(1)(0) <= S2M1_R_AR_ARREADY;
		AXI4InteconnectModule_L40F29T66_Enumerable(0) <= Inputs_M2S(0)(83 downto 0);
		AXI4InteconnectModule_L40F29T66_Enumerable(1) <= Inputs_M2S(1)(83 downto 0);
		AXI4InteconnectModule_L41F30T67_Enumerable(0) <= Inputs_S2M(0)(52 downto 0);
		AXI4InteconnectModule_L41F30T67_Enumerable(1) <= Inputs_S2M(1)(52 downto 0);
		readInterconnect_iLeft(0) <= AXI4InteconnectModule_L40F29T66_Enumerable(0);
		readInterconnect_iLeft(1) <= AXI4InteconnectModule_L40F29T66_Enumerable(1);
		readInterconnect_iRight(0) <= AXI4InteconnectModule_L41F30T67_Enumerable(0);
		readInterconnect_iRight(1) <= AXI4InteconnectModule_L41F30T67_Enumerable(1);
		AXI4InteconnectModule_L48F29T66_Enumerable(0) <= Inputs_M2S(0)(221 downto 84);
		AXI4InteconnectModule_L48F29T66_Enumerable(1) <= Inputs_M2S(1)(221 downto 84);
		AXI4InteconnectModule_L49F30T67_Enumerable(0) <= Inputs_S2M(0)(73 downto 53);
		AXI4InteconnectModule_L49F30T67_Enumerable(1) <= Inputs_S2M(1)(73 downto 53);
		writeInterconnect_iLeft(0) <= AXI4InteconnectModule_L48F29T66_Enumerable(0);
		writeInterconnect_iLeft(1) <= AXI4InteconnectModule_L48F29T66_Enumerable(1);
		writeInterconnect_iRight(0) <= AXI4InteconnectModule_L49F30T67_Enumerable(0);
		writeInterconnect_iRight(1) <= AXI4InteconnectModule_L49F30T67_Enumerable(1);
		readInterconnect_iLeft0_readInterconnect_iLeft_HardLink <= readInterconnect_iLeft(0);
		readInterconnect_iLeft1_readInterconnect_iLeft_HardLink <= readInterconnect_iLeft(1);
		readInterconnect_iRight0_readInterconnect_iRight_HardLink <= readInterconnect_iRight(0);
		readInterconnect_iRight1_readInterconnect_iRight_HardLink <= readInterconnect_iRight(1);
		writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink <= writeInterconnect_iLeft(0);
		writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink <= writeInterconnect_iLeft(1);
		writeInterconnect_iRight0_writeInterconnect_iRight_HardLink <= writeInterconnect_iRight(0);
		writeInterconnect_iRight1_writeInterconnect_iRight_HardLink <= writeInterconnect_iRight(1);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;