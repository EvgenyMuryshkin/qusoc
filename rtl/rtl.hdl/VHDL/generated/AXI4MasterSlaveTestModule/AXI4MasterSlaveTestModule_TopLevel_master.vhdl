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
-- System configuration name is AXI4MasterSlaveTestModule_TopLevel_master, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4MasterSlaveTestModule_TopLevel_master is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		ARADDR : in unsigned (31 downto 0);
		AWADDR : in unsigned (31 downto 0);
		RE : in std_logic;
		S2M : in unsigned (73 downto 0);
		WDATA0 : in unsigned (7 downto 0);
		WDATA1 : in unsigned (7 downto 0);
		WDATA2 : in unsigned (7 downto 0);
		WDATA3 : in unsigned (7 downto 0);
		WE : in std_logic;
		WSTRB : in unsigned (3 downto 0);
		M2S : out unsigned (221 downto 0);
		RACK : out std_logic;
		RDATA0 : out unsigned (7 downto 0);
		RDATA1 : out unsigned (7 downto 0);
		RDATA2 : out unsigned (7 downto 0);
		RDATA3 : out unsigned (7 downto 0);
		WACK : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4MasterSlaveTestModule_TopLevel_master is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant size : unsigned(1 downto 0) := "10";
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F22T44_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L111F21T32_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L95F33T54_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L111F21T32_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L96F36T41_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F22T43_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L115F21L118T22_AXI4MasterModule_L116F45T64_Expr : unsigned(1 downto 0) := "10";
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F22T41_Expr : unsigned(1 downto 0) := "10";
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L122F21L124T22_AXI4MasterModule_L123F48T52_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L127F21L129T22_AXI4MasterModule_L128F25T36_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L95F33T54_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L127F21L129T22_AXI4MasterModule_L128F25T36_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L96F36T41_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F22T45_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L137F21T33_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L101F34T56_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L137F21T33_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L102F36T41_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L137F21T33_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L103F35T40_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F22T44_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L141F21L145T22_AXI4MasterModule_L142F46T66_Expr : unsigned(1 downto 0) := "10";
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F22T42_Expr : unsigned(1 downto 0) := "10";
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L149F21L151T22_AXI4MasterModule_L150F48T52_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L154F21L156T22_AXI4MasterModule_L155F47T51_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L159F21L161T22_AXI4MasterModule_L160F25T37_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L101F34T56_Expr : std_logic := '1';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L159F21L161T22_AXI4MasterModule_L160F25T37_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L102F36T41_Expr : std_logic := '0';
	constant AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L159F21L161T22_AXI4MasterModule_L160F25T37_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L103F35T40_Expr : std_logic := '0';
	constant AXI4_M_AR_L18F28T29_Expr : std_logic := '0';
	constant AXI4_M_AR_L24F29T30_Expr : std_logic := '1';
	constant AXI4_M_AR_L27F33T43_Expr : unsigned(1 downto 0) := "10";
	constant AXI4_M_AR_L30F35T48_Expr : std_logic := '1';
	constant AXI4_M_AR_L33F33T47_Expr : std_logic := '0';
	constant AXI4_M_AR_L36F35T63_Expr : std_logic := '0';
	constant AXI4_M_AR_L39F33T66_Expr : unsigned(1 downto 0) := "10";
	constant AXI4_M_AR_L42F31T44_Expr : std_logic := '0';
	constant AXI4_M_AR_L45F32T33_Expr : std_logic := '0';
	constant AXI4_M_AR_L48F30T31_Expr : std_logic := '0';
	constant AXI4MasterModule_L73F26T30_Expr : std_logic := '1';
	constant AXI4_M_AW_L17F28T29_Expr : std_logic := '0';
	constant AXI4_M_AW_L23F29T30_Expr : std_logic := '1';
	constant AXI4_M_AW_L26F33T43_Expr : unsigned(1 downto 0) := "10";
	constant AXI4_M_AW_L29F35T48_Expr : std_logic := '1';
	constant AXI4_M_AW_L32F33T47_Expr : std_logic := '0';
	constant AXI4_M_AW_L35F35T63_Expr : std_logic := '0';
	constant AXI4_M_AW_L38F33T66_Expr : unsigned(1 downto 0) := "10";
	constant AXI4_M_AW_L41F31T44_Expr : std_logic := '0';
	constant AXI4_M_AW_L44F32T33_Expr : std_logic := '0';
	constant AXI4_M_AW_L47F30T31_Expr : std_logic := '0';
	constant AXI4MasterModule_L82F23T24_Expr : std_logic := '0';
	constant AXI4_M_W_L24F29T33_Expr : std_logic := '1';
	constant AXI4_M_W_L27F29T30_Expr : std_logic := '0';
	constant AXI4MasterModule_L89F26T30_Expr : std_logic := '1';
	constant AXI4MasterModule_L59F46T65_Expr : unsigned(1 downto 0) := "10";
	constant AXI4MasterModule_L62F47T67_Expr : unsigned(1 downto 0) := "10";
	signal Inputs_ARADDR : unsigned(31 downto 0) := (others => '0');
	signal Inputs_AWADDR : unsigned(31 downto 0) := (others => '0');
	signal Inputs_RE : std_logic := '0';
	signal Inputs_S2M_AR_ARREADY : std_logic := '0';
	signal Inputs_S2M_AW_AWREADY : std_logic := '0';
	signal Inputs_S2M_B_BID : unsigned(7 downto 0) := (others => '0');
	signal Inputs_S2M_B_BRESP : unsigned(1 downto 0) := (others => '0');
	signal Inputs_S2M_B_BUSER : unsigned(7 downto 0) := (others => '0');
	signal Inputs_S2M_B_BVALID : std_logic := '0';
	signal Inputs_S2M_R_RID : unsigned(7 downto 0) := (others => '0');
	signal Inputs_S2M_R_RRESP : unsigned(1 downto 0) := (others => '0');
	signal Inputs_S2M_R_RLAST : std_logic := '0';
	signal Inputs_S2M_R_RUSER : unsigned(7 downto 0) := (others => '0');
	signal Inputs_S2M_R_RVALID : std_logic := '0';
	signal Inputs_S2M_W_WREADY : std_logic := '0';
	signal Inputs_WE : std_logic := '0';
	signal Inputs_WSTRB : unsigned(3 downto 0) := (others => '0');
	signal NextState_ARREADYACK : std_logic := '0';
	signal NextState_AWREADYACK : std_logic := '0';
	signal NextState_readFSM : unsigned(1 downto 0) := (others => '0');
	signal NextState_WREADYACK : std_logic := '0';
	signal NextState_writeFSM : unsigned(1 downto 0) := (others => '0');
	signal readAck : std_logic := '0';
	signal writeAck : std_logic := '0';
	signal State_ARREADYACK : std_logic := '0';
	constant State_ARREADYACKDefault : std_logic := '0';
	signal State_AWREADYACK : std_logic := '0';
	constant State_AWREADYACKDefault : std_logic := '0';
	signal State_readFSM : unsigned(1 downto 0) := "00";
	constant State_readFSMDefault : unsigned(1 downto 0) := "00";
	signal State_WREADYACK : std_logic := '0';
	constant State_WREADYACKDefault : std_logic := '0';
	signal State_writeFSM : unsigned(1 downto 0) := "00";
	constant State_writeFSMDefault : unsigned(1 downto 0) := "00";
	signal AXI4MasterModule_L56F25T64_Expr : std_logic := '0';
	signal AXI4MasterModule_L56F25T64_Expr_1 : std_logic := '0';
	signal AXI4MasterModule_L56F25T64_Expr_2 : std_logic := '0';
	signal AXI4MasterModule_L57F26T84_Expr : std_logic := '0';
	signal AXI4MasterModule_L57F26T84_Expr_1 : std_logic := '0';
	signal AXI4MasterModule_L57F26T84_Expr_2 : std_logic := '0';
	signal AXI4MasterModule_L57F26T61_Expr : std_logic := '0';
	signal AXI4MasterModule_L57F26T61_Expr_1 : std_logic := '0';
	signal AXI4MasterModule_L57F26T61_Expr_2 : std_logic := '0';
	signal AXI4MasterModule_L59F29T76_Expr : std_logic := '0';
	signal AXI4MasterModule_L59F29T76_Expr_1 : std_logic := '0';
	signal AXI4MasterModule_L59F29T76_Expr_2 : std_logic := '0';
	signal AXI4MasterModule_L62F29T79_Expr : std_logic := '0';
	signal AXI4MasterModule_L62F29T79_Expr_1 : std_logic := '0';
	signal AXI4MasterModule_L62F29T79_Expr_2 : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_Case : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_Case : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_Case : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_Case : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_Case : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_Case : std_logic := '0';
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L59F29T65_Expr : std_logic := '0';
	signal AXI4MasterModule_L59F29T65_ExprLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L59F29T65_ExprRhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L62F29T67_Expr : std_logic := '0';
	signal AXI4MasterModule_L62F29T67_ExprLhs : signed(2 downto 0) := "000";
	signal AXI4MasterModule_L62F29T67_ExprRhs : signed(2 downto 0) := "000";
	type Inputs_S2M_R_RDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal Inputs_S2M_R_RDATA : Inputs_S2M_R_RDATAArray := (others => (others => '0'));
	type Inputs_WDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal Inputs_WDATA : Inputs_WDATAArray := (others => (others => '0'));
begin
	process (BoardSignals, NextState_ARREADYACK, NextState_AWREADYACK, NextState_readFSM, NextState_WREADYACK, NextState_writeFSM)
	begin
		if rising_edge(BoardSignals.Clock) then
			if BoardSignals.Reset = '1' then
				State_ARREADYACK <= State_ARREADYACKDefault;
				State_AWREADYACK <= State_AWREADYACKDefault;
				State_readFSM <= State_readFSMDefault;
				State_WREADYACK <= State_WREADYACKDefault;
				State_writeFSM <= State_writeFSMDefault;
			else
				State_ARREADYACK <= NextState_ARREADYACK;
				State_AWREADYACK <= NextState_AWREADYACK;
				State_readFSM <= NextState_readFSM;
				State_WREADYACK <= NextState_WREADYACK;
				State_writeFSM <= NextState_writeFSM;
			end if;
		end if;
	end process;
	AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_Case <= '1' when (signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseLhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseLhs'length + 1)) = signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseRhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseRhs'length + 1))) else '0';
	AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_Case <= '1' when (signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseLhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseLhs'length + 1)) = signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseRhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseRhs'length + 1))) else '0';
	AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_Case <= '1' when (signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseLhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseLhs'length + 1)) = signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseRhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseRhs'length + 1))) else '0';
	AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_Case <= '1' when (signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseLhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseLhs'length + 1)) = signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseRhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseRhs'length + 1))) else '0';
	AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_Case <= '1' when (signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseLhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseLhs'length + 1)) = signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseRhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseRhs'length + 1))) else '0';
	AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_Case <= '1' when (signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseLhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseLhs'length + 1)) = signed(resize(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseRhs, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseRhs'length + 1))) else '0';
	AXI4MasterModule_L59F29T65_Expr <= '1' when (signed(resize(AXI4MasterModule_L59F29T65_ExprLhs, AXI4MasterModule_L59F29T65_ExprLhs'length + 1)) = signed(resize(AXI4MasterModule_L59F29T65_ExprRhs, AXI4MasterModule_L59F29T65_ExprRhs'length + 1))) else '0';
	AXI4MasterModule_L62F29T67_Expr <= '1' when (signed(resize(AXI4MasterModule_L62F29T67_ExprLhs, AXI4MasterModule_L62F29T67_ExprLhs'length + 1)) = signed(resize(AXI4MasterModule_L62F29T67_ExprRhs, AXI4MasterModule_L62F29T67_ExprRhs'length + 1))) else '0';
	process (AXI4MasterModule_L56F25T64_Expr_1, AXI4MasterModule_L56F25T64_Expr_2)
	begin
		AXI4MasterModule_L56F25T64_Expr <= AXI4MasterModule_L56F25T64_Expr_1 AND AXI4MasterModule_L56F25T64_Expr_2;
	end process;
	process (AXI4MasterModule_L57F26T84_Expr_1, AXI4MasterModule_L57F26T84_Expr_2)
	begin
		AXI4MasterModule_L57F26T84_Expr <= AXI4MasterModule_L57F26T84_Expr_1 AND AXI4MasterModule_L57F26T84_Expr_2;
	end process;
	process (AXI4MasterModule_L57F26T61_Expr_1, AXI4MasterModule_L57F26T61_Expr_2)
	begin
		AXI4MasterModule_L57F26T61_Expr <= AXI4MasterModule_L57F26T61_Expr_1 AND AXI4MasterModule_L57F26T61_Expr_2;
	end process;
	process (AXI4MasterModule_L59F29T76_Expr_1, AXI4MasterModule_L59F29T76_Expr_2)
	begin
		AXI4MasterModule_L59F29T76_Expr <= AXI4MasterModule_L59F29T76_Expr_1 AND AXI4MasterModule_L59F29T76_Expr_2;
	end process;
	process (AXI4MasterModule_L62F29T79_Expr_1, AXI4MasterModule_L62F29T79_Expr_2)
	begin
		AXI4MasterModule_L62F29T79_Expr <= AXI4MasterModule_L62F29T79_Expr_1 AND AXI4MasterModule_L62F29T79_Expr_2;
	end process;
	process (AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_Case, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_Case, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_Case, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_Case, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_Case, AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_Case, Inputs_RE, Inputs_S2M_AR_ARREADY, Inputs_S2M_AW_AWREADY, Inputs_S2M_W_WREADY, Inputs_WE, readAck, State_ARREADYACK, State_AWREADYACK, State_readFSM, State_WREADYACK, State_writeFSM, writeAck)
	begin
		NextState_ARREADYACK <= State_ARREADYACK;
		NextState_AWREADYACK <= State_AWREADYACK;
		NextState_readFSM <= State_readFSM;
		NextState_WREADYACK <= State_WREADYACK;
		NextState_writeFSM <= State_writeFSM;
		if AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_Case = '1' then
			NextState_readFSM(1) <= '0';
			NextState_readFSM(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L111F21T32_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L95F33T54_Expr;
			NextState_ARREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L111F21T32_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L96F36T41_Expr;
		elsif AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_Case = '1' then
			if Inputs_RE = '1' then
				NextState_readFSM <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L115F21L118T22_AXI4MasterModule_L116F45T64_Expr;
				NextState_ARREADYACK <= Inputs_S2M_AR_ARREADY;
			end if;
		elsif AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_Case = '1' then
			if Inputs_S2M_AR_ARREADY = '1' then
				NextState_ARREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L122F21L124T22_AXI4MasterModule_L123F48T52_Expr;
			end if;
			if readAck = '1' then
				NextState_readFSM(1) <= '0';
				NextState_readFSM(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L127F21L129T22_AXI4MasterModule_L128F25T36_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L95F33T54_Expr;
				NextState_ARREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L127F21L129T22_AXI4MasterModule_L128F25T36_AXI4MasterModule_L94F9L97T10_AXI4MasterModule_L96F36T41_Expr;
			end if;
		end if;
		if AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_Case = '1' then
			NextState_writeFSM(1) <= '0';
			NextState_writeFSM(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L137F21T33_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L101F34T56_Expr;
			NextState_AWREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L137F21T33_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L102F36T41_Expr;
			NextState_WREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L137F21T33_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L103F35T40_Expr;
		elsif AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_Case = '1' then
			if Inputs_WE = '1' then
				NextState_writeFSM <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L141F21L145T22_AXI4MasterModule_L142F46T66_Expr;
				NextState_AWREADYACK <= Inputs_S2M_AW_AWREADY;
				NextState_WREADYACK <= Inputs_S2M_W_WREADY;
			end if;
		elsif AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_Case = '1' then
			if Inputs_S2M_AW_AWREADY = '1' then
				NextState_AWREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L149F21L151T22_AXI4MasterModule_L150F48T52_Expr;
			end if;
			if Inputs_S2M_W_WREADY = '1' then
				NextState_WREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L154F21L156T22_AXI4MasterModule_L155F47T51_Expr;
			end if;
			if writeAck = '1' then
				NextState_writeFSM(1) <= '0';
				NextState_writeFSM(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L159F21L161T22_AXI4MasterModule_L160F25T37_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L101F34T56_Expr;
				NextState_AWREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L159F21L161T22_AXI4MasterModule_L160F25T37_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L102F36T41_Expr;
				NextState_WREADYACK <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L159F21L161T22_AXI4MasterModule_L160F25T37_AXI4MasterModule_L100F9L104T10_AXI4MasterModule_L103F35T40_Expr;
			end if;
		end if;
	end process;
	process (ARADDR, AWADDR, AXI4MasterModule_L56F25T64_Expr, AXI4MasterModule_L57F26T61_Expr, AXI4MasterModule_L57F26T84_Expr, AXI4MasterModule_L59F29T65_Expr, AXI4MasterModule_L59F29T76_Expr, AXI4MasterModule_L62F29T67_Expr, AXI4MasterModule_L62F29T79_Expr, Inputs_ARADDR, Inputs_AWADDR, Inputs_RE, Inputs_S2M_B_BVALID, Inputs_S2M_R_RDATA, Inputs_S2M_R_RVALID, Inputs_WDATA, Inputs_WE, Inputs_WSTRB, RE, readAck, S2M, State_ARREADYACK, State_AWREADYACK, State_readFSM, State_WREADYACK, State_writeFSM, WDATA0, WDATA1, WDATA2, WDATA3, WE, writeAck, WSTRB)
	begin
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseLhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseLhs(1 downto 0) <= signed(State_readFSM);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseRhs(2 downto 1) <= (others => '0');
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F17L112T27_CaseRhs(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L110F22T44_Expr;
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseLhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseLhs(1 downto 0) <= signed(State_readFSM);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseRhs(2 downto 1) <= (others => '0');
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F17L119T27_CaseRhs(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L113F22T43_Expr;
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseLhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseLhs(1 downto 0) <= signed(State_readFSM);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseRhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F17L131T27_CaseRhs(1 downto 0) <= signed(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L108F13L132T14_AXI4MasterModule_L120F22T41_Expr);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseLhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseLhs(1 downto 0) <= signed(State_writeFSM);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseRhs(2 downto 1) <= (others => '0');
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F17L138T27_CaseRhs(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L136F22T45_Expr;
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseLhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseLhs(1 downto 0) <= signed(State_writeFSM);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseRhs(2 downto 1) <= (others => '0');
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F17L146T27_CaseRhs(0) <= AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L139F22T44_Expr;
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseLhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseLhs(1 downto 0) <= signed(State_writeFSM);
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseRhs(2) <= '0';
		AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F17L162T27_CaseRhs(1 downto 0) <= signed(AXI4MasterModule_L107F9L164T10_AXI4MasterModule_L134F13L163T14_AXI4MasterModule_L147F22T42_Expr);
		AXI4MasterModule_L59F29T65_ExprLhs(2) <= '0';
		AXI4MasterModule_L59F29T65_ExprLhs(1 downto 0) <= signed(State_readFSM);
		AXI4MasterModule_L59F29T65_ExprRhs(2) <= '0';
		AXI4MasterModule_L59F29T65_ExprRhs(1 downto 0) <= signed(AXI4MasterModule_L59F46T65_Expr);
		AXI4MasterModule_L62F29T67_ExprLhs(2) <= '0';
		AXI4MasterModule_L62F29T67_ExprLhs(1 downto 0) <= signed(State_writeFSM);
		AXI4MasterModule_L62F29T67_ExprRhs(2) <= '0';
		AXI4MasterModule_L62F29T67_ExprRhs(1 downto 0) <= signed(AXI4MasterModule_L62F47T67_Expr);
		AXI4MasterModule_L56F25T64_Expr_1 <= State_ARREADYACK;
		AXI4MasterModule_L56F25T64_Expr_2 <= Inputs_S2M_R_RVALID;
		AXI4MasterModule_L57F26T84_Expr_1 <= AXI4MasterModule_L57F26T61_Expr;
		AXI4MasterModule_L57F26T84_Expr_2 <= Inputs_S2M_B_BVALID;
		AXI4MasterModule_L57F26T61_Expr_1 <= State_AWREADYACK;
		AXI4MasterModule_L57F26T61_Expr_2 <= State_WREADYACK;
		AXI4MasterModule_L59F29T76_Expr_1 <= AXI4MasterModule_L59F29T65_Expr;
		AXI4MasterModule_L59F29T76_Expr_2 <= readAck;
		AXI4MasterModule_L62F29T79_Expr_1 <= AXI4MasterModule_L62F29T67_Expr;
		AXI4MasterModule_L62F29T79_Expr_2 <= writeAck;
		Inputs_ARADDR <= ARADDR;
		Inputs_AWADDR <= AWADDR;
		Inputs_RE <= RE;
		Inputs_S2M_W_WREADY <= S2M(73);
		Inputs_S2M_R_RVALID <= S2M(72);
		Inputs_S2M_R_RUSER <= S2M(71 downto 64);
		Inputs_S2M_R_RLAST <= S2M(63);
		Inputs_S2M_R_RRESP <= S2M(62 downto 61);
		Inputs_S2M_R_RDATA(3) <= S2M(60 downto 53);
		Inputs_S2M_R_RDATA(2) <= S2M(52 downto 45);
		Inputs_S2M_R_RDATA(1) <= S2M(44 downto 37);
		Inputs_S2M_R_RDATA(0) <= S2M(36 downto 29);
		Inputs_S2M_R_RID <= S2M(28 downto 21);
		Inputs_S2M_B_BVALID <= S2M(20);
		Inputs_S2M_B_BUSER <= S2M(19 downto 12);
		Inputs_S2M_B_BRESP <= S2M(11 downto 10);
		Inputs_S2M_B_BID <= S2M(9 downto 2);
		Inputs_S2M_AW_AWREADY <= S2M(1);
		Inputs_S2M_AR_ARREADY <= S2M(0);
		Inputs_WDATA(0) <= WDATA0;
		Inputs_WDATA(1) <= WDATA1;
		Inputs_WDATA(2) <= WDATA2;
		Inputs_WDATA(3) <= WDATA3;
		Inputs_WE <= WE;
		Inputs_WSTRB <= WSTRB;
		readAck <= AXI4MasterModule_L56F25T64_Expr;
		writeAck <= AXI4MasterModule_L57F26T84_Expr;
		M2S(221) <= AXI4MasterModule_L89F26T30_Expr;
		M2S(220) <= Inputs_WE;
		M2S(219 downto 213) <= (others => '0');
		M2S(212) <= AXI4_M_W_L27F29T30_Expr;
		M2S(211) <= AXI4_M_W_L24F29T33_Expr;
		M2S(210 downto 207) <= Inputs_WSTRB;
		M2S(206 downto 199) <= Inputs_WDATA(3);
		M2S(198 downto 191) <= Inputs_WDATA(2);
		M2S(190 downto 183) <= Inputs_WDATA(1);
		M2S(182 downto 175) <= Inputs_WDATA(0);
		M2S(174 downto 168) <= (others => '0');
		M2S(167) <= AXI4MasterModule_L82F23T24_Expr;
		M2S(166) <= Inputs_WE;
		M2S(165 downto 159) <= (others => '0');
		M2S(158) <= AXI4_M_AW_L47F30T31_Expr;
		M2S(157 downto 151) <= (others => '0');
		M2S(150) <= AXI4_M_AW_L44F32T33_Expr;
		M2S(149 downto 147) <= (others => '0');
		M2S(146) <= AXI4_M_AW_L41F31T44_Expr;
		M2S(145) <= '0';
		M2S(144 downto 143) <= AXI4_M_AW_L38F33T66_Expr;
		M2S(142 downto 140) <= (others => '0');
		M2S(139) <= AXI4_M_AW_L35F35T63_Expr;
		M2S(138) <= '0';
		M2S(137) <= AXI4_M_AW_L32F33T47_Expr;
		M2S(136) <= '0';
		M2S(135) <= AXI4_M_AW_L29F35T48_Expr;
		M2S(134) <= '0';
		M2S(133 downto 132) <= AXI4_M_AW_L26F33T43_Expr;
		M2S(131 downto 125) <= (others => '0');
		M2S(124) <= AXI4_M_AW_L23F29T30_Expr;
		M2S(123 downto 92) <= Inputs_AWADDR;
		M2S(91 downto 85) <= (others => '0');
		M2S(84) <= AXI4_M_AW_L17F28T29_Expr;
		M2S(83) <= AXI4MasterModule_L73F26T30_Expr;
		M2S(82) <= Inputs_RE;
		M2S(81 downto 75) <= (others => '0');
		M2S(74) <= AXI4_M_AR_L48F30T31_Expr;
		M2S(73 downto 67) <= (others => '0');
		M2S(66) <= AXI4_M_AR_L45F32T33_Expr;
		M2S(65 downto 63) <= (others => '0');
		M2S(62) <= AXI4_M_AR_L42F31T44_Expr;
		M2S(61) <= '0';
		M2S(60 downto 59) <= AXI4_M_AR_L39F33T66_Expr;
		M2S(58 downto 56) <= (others => '0');
		M2S(55) <= AXI4_M_AR_L36F35T63_Expr;
		M2S(54) <= '0';
		M2S(53) <= AXI4_M_AR_L33F33T47_Expr;
		M2S(52) <= '0';
		M2S(51) <= AXI4_M_AR_L30F35T48_Expr;
		M2S(50) <= '0';
		M2S(49 downto 48) <= AXI4_M_AR_L27F33T43_Expr;
		M2S(47 downto 41) <= (others => '0');
		M2S(40) <= AXI4_M_AR_L24F29T30_Expr;
		M2S(39 downto 8) <= Inputs_ARADDR;
		M2S(7 downto 1) <= (others => '0');
		M2S(0) <= AXI4_M_AR_L18F28T29_Expr;
		RACK <= AXI4MasterModule_L59F29T76_Expr;
		RDATA0 <= Inputs_S2M_R_RDATA(0);
		RDATA1 <= Inputs_S2M_R_RDATA(1);
		RDATA2 <= Inputs_S2M_R_RDATA(2);
		RDATA3 <= Inputs_S2M_R_RDATA(3);
		WACK <= AXI4MasterModule_L62F29T79_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
