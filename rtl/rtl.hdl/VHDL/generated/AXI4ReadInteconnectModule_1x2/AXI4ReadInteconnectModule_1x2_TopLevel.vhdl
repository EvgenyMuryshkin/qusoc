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
-- System configuration name is AXI4ReadInteconnectModule_1x2_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4ReadInteconnectModule_1x2_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iLeft0_AR_ARID : in unsigned (7 downto 0);
		iLeft0_AR_ARADDR : in unsigned (31 downto 0);
		iLeft0_AR_ARLEN : in unsigned (7 downto 0);
		iLeft0_AR_ARSIZE : in unsigned (2 downto 0);
		iLeft0_AR_ARBURST : in unsigned (1 downto 0);
		iLeft0_AR_ARLOCK : in unsigned (1 downto 0);
		iLeft0_AR_ARCACHE : in unsigned (3 downto 0);
		iLeft0_AR_ARPROT : in unsigned (2 downto 0);
		iLeft0_AR_ARQOS : in unsigned (3 downto 0);
		iLeft0_AR_ARREGION : in unsigned (7 downto 0);
		iLeft0_AR_ARUSER : in unsigned (7 downto 0);
		iLeft0_AR_ARVALID : in std_logic;
		iLeft0_R_RREADY : in std_logic;
		iRight0_AR_ARREADY : in std_logic;
		iRight0_R_RID : in unsigned (7 downto 0);
		iRight0_R_RDATA0 : in unsigned (7 downto 0);
		iRight0_R_RDATA1 : in unsigned (7 downto 0);
		iRight0_R_RDATA2 : in unsigned (7 downto 0);
		iRight0_R_RDATA3 : in unsigned (7 downto 0);
		iRight0_R_RRESP : in unsigned (1 downto 0);
		iRight0_R_RLAST : in std_logic;
		iRight0_R_RUSER : in unsigned (7 downto 0);
		iRight0_R_RVALID : in std_logic;
		iRight1_AR_ARREADY : in std_logic;
		iRight1_R_RID : in unsigned (7 downto 0);
		iRight1_R_RDATA0 : in unsigned (7 downto 0);
		iRight1_R_RDATA1 : in unsigned (7 downto 0);
		iRight1_R_RDATA2 : in unsigned (7 downto 0);
		iRight1_R_RDATA3 : in unsigned (7 downto 0);
		iRight1_R_RRESP : in unsigned (1 downto 0);
		iRight1_R_RLAST : in std_logic;
		iRight1_R_RUSER : in unsigned (7 downto 0);
		iRight1_R_RVALID : in std_logic;
		oLeft0_AR_ARID : out unsigned (7 downto 0);
		oLeft0_AR_ARADDR : out unsigned (31 downto 0);
		oLeft0_AR_ARLEN : out unsigned (7 downto 0);
		oLeft0_AR_ARSIZE : out unsigned (2 downto 0);
		oLeft0_AR_ARBURST : out unsigned (1 downto 0);
		oLeft0_AR_ARLOCK : out unsigned (1 downto 0);
		oLeft0_AR_ARCACHE : out unsigned (3 downto 0);
		oLeft0_AR_ARPROT : out unsigned (2 downto 0);
		oLeft0_AR_ARQOS : out unsigned (3 downto 0);
		oLeft0_AR_ARREGION : out unsigned (7 downto 0);
		oLeft0_AR_ARUSER : out unsigned (7 downto 0);
		oLeft0_AR_ARVALID : out std_logic;
		oLeft0_R_RREADY : out std_logic;
		oLeft1_AR_ARID : out unsigned (7 downto 0);
		oLeft1_AR_ARADDR : out unsigned (31 downto 0);
		oLeft1_AR_ARLEN : out unsigned (7 downto 0);
		oLeft1_AR_ARSIZE : out unsigned (2 downto 0);
		oLeft1_AR_ARBURST : out unsigned (1 downto 0);
		oLeft1_AR_ARLOCK : out unsigned (1 downto 0);
		oLeft1_AR_ARCACHE : out unsigned (3 downto 0);
		oLeft1_AR_ARPROT : out unsigned (2 downto 0);
		oLeft1_AR_ARQOS : out unsigned (3 downto 0);
		oLeft1_AR_ARREGION : out unsigned (7 downto 0);
		oLeft1_AR_ARUSER : out unsigned (7 downto 0);
		oLeft1_AR_ARVALID : out std_logic;
		oLeft1_R_RREADY : out std_logic;
		oNextRightAddr : out unsigned (0 downto 0);
		oRangeDetectorIndex0 : out unsigned (0 downto 0);
		oRight0_AR_ARREADY : out std_logic;
		oRight0_R_RID : out unsigned (7 downto 0);
		oRight0_R_RDATA0 : out unsigned (7 downto 0);
		oRight0_R_RDATA1 : out unsigned (7 downto 0);
		oRight0_R_RDATA2 : out unsigned (7 downto 0);
		oRight0_R_RDATA3 : out unsigned (7 downto 0);
		oRight0_R_RRESP : out unsigned (1 downto 0);
		oRight0_R_RLAST : out std_logic;
		oRight0_R_RUSER : out unsigned (7 downto 0);
		oRight0_R_RVALID : out std_logic;
		oStateRightAddr : out unsigned (0 downto 0);
		oStateRightAddrValid : out std_logic;
		oTransactions0 : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4ReadInteconnectModule_1x2_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant leftCount : signed(1 downto 0) := "01";
	constant rightCount : signed(2 downto 0) := "010";
	constant InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L137F47T52_Expr : std_logic := '0';
	constant InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L138F48T53_Expr : std_logic := '0';
	constant InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L144F43T47_Expr : std_logic := '1';
	constant InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L147F44T48_Expr : std_logic := '1';
	signal NextState_leftAddr : unsigned(0 downto 0) := (others => '0');
	signal NextState_leftAddrValid : std_logic := '0';
	signal NextState_rightAddr : unsigned(0 downto 0) := (others => '0');
	signal NextState_rightAddrValid : std_logic := '0';
	signal currentTXEnd : std_logic := '0';
	signal muxLeftData_AR_ARID : unsigned(7 downto 0) := (others => '0');
	signal muxLeftData_AR_ARADDR : unsigned(31 downto 0) := (others => '0');
	signal muxLeftData_AR_ARLEN : unsigned(7 downto 0) := (others => '0');
	signal muxLeftData_AR_ARSIZE : unsigned(2 downto 0) := (others => '0');
	signal muxLeftData_AR_ARBURST : unsigned(1 downto 0) := (others => '0');
	signal muxLeftData_AR_ARLOCK : unsigned(1 downto 0) := (others => '0');
	signal muxLeftData_AR_ARCACHE : unsigned(3 downto 0) := (others => '0');
	signal muxLeftData_AR_ARPROT : unsigned(2 downto 0) := (others => '0');
	signal muxLeftData_AR_ARQOS : unsigned(3 downto 0) := (others => '0');
	signal muxLeftData_AR_ARREGION : unsigned(7 downto 0) := (others => '0');
	signal muxLeftData_AR_ARUSER : unsigned(7 downto 0) := (others => '0');
	signal muxLeftData_AR_ARVALID : std_logic := '0';
	signal muxLeftData_R_RREADY : std_logic := '0';
	signal muxRightData_AR_ARREADY : std_logic := '0';
	signal muxRightData_R_RID : unsigned(7 downto 0) := (others => '0');
	signal muxRightData_R_RRESP : unsigned(1 downto 0) := (others => '0');
	signal muxRightData_R_RLAST : std_logic := '0';
	signal muxRightData_R_RUSER : unsigned(7 downto 0) := (others => '0');
	signal muxRightData_R_RVALID : std_logic := '0';
	signal rightAddr : unsigned(0 downto 0) := (others => '0');
	signal axiRightAddr : unsigned(0 downto 0) := (others => '0');
	signal rangeDetectorActive : std_logic := '0';
	signal DuplexMux_iLeftAddr : unsigned(0 downto 0) := (others => '0');
	signal DuplexMux_iLeftAddrValid : std_logic := '0';
	signal DuplexMux_iRightAddr : unsigned(0 downto 0) := (others => '0');
	signal DuplexMux_iRightAddrValid : std_logic := '0';
	signal DuplexMux_oMuxLeftData : unsigned(83 downto 0) := (others => '0');
	signal DuplexMux_oMuxRightData : unsigned(52 downto 0) := (others => '0');
	signal Encoder_HasActive : std_logic := '0';
	signal Encoder_MSBIndex : unsigned(0 downto 0) := (others => '0');
	signal Encoder_MSBValue : unsigned(0 downto 0) := (others => '0');
	signal TransactionDetectors0_iRestart : std_logic := '0';
	signal TransactionDetectors0_iTXBegin : std_logic := '0';
	signal TransactionDetectors0_iTXEnd : std_logic := '0';
	signal TransactionDetectors0_oTransaction : std_logic := '0';
	signal TransactionDetectors0_oWaitForRestart : std_logic := '0';
	signal rangeDetectorArray0_iAddress : unsigned(31 downto 0) := (others => '0');
	signal rangeDetectorArray0_oActive : std_logic := '0';
	signal rangeDetectorArray0_oIndex : unsigned(0 downto 0) := (others => '0');
	signal AXI4ReadInteconnectModule_L33F37T75_Index : unsigned(0 downto 0) := (others => '0');
	signal AXI4ReadInteconnectModule_L36F37T79_Index : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index : std_logic := '0';
	signal InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index : std_logic := '0';
	signal DuplexMux_iLeft0_DuplexMux_iLeft_HardLink : unsigned(83 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink : unsigned(0 downto 0) := "0";
	signal DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink : std_logic := '0';
	signal DuplexMux_iRight0_DuplexMux_iRight_HardLink : unsigned(52 downto 0) := "00000000000000000000000000000000000000000000000000000";
	signal DuplexMux_iRight1_DuplexMux_iRight_HardLink : unsigned(52 downto 0) := "00000000000000000000000000000000000000000000000000000";
	signal DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink : unsigned(0 downto 0) := "0";
	signal DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink : std_logic := '0';
	signal DuplexMux_oLeft0_DuplexMux_oLeft_HardLink : unsigned(83 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal DuplexMux_oLeft1_DuplexMux_oLeft_HardLink : unsigned(83 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink : unsigned(83 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink : unsigned(52 downto 0) := "00000000000000000000000000000000000000000000000000000";
	signal DuplexMux_oRight0_DuplexMux_oRight_HardLink : unsigned(52 downto 0) := "00000000000000000000000000000000000000000000000000000";
	signal Encoder_iValues0_Encoder_iValues_HardLink : std_logic := '0';
	signal Encoder_HasActive_Encoder_HasActive_HardLink : std_logic := '0';
	signal Encoder_MSBIndex_Encoder_MSBIndex_HardLink : unsigned(0 downto 0) := "0";
	signal Encoder_MSBValue_Encoder_MSBValue_HardLink : unsigned(0 downto 0) := "0";
	signal TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink : std_logic := '0';
	signal TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink : std_logic := '0';
	signal TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink : std_logic := '0';
	signal TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink : std_logic := '0';
	signal TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink : std_logic := '0';
	signal rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink : std_logic := '0';
	signal rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink : unsigned(0 downto 0) := "0";
	signal State_leftAddr : unsigned(0 downto 0) := "0";
	constant State_leftAddrDefault : unsigned(0 downto 0) := "0";
	signal State_leftAddrValid : std_logic := '0';
	constant State_leftAddrValidDefault : std_logic := '0';
	signal State_rightAddr : unsigned(0 downto 0) := "0";
	constant State_rightAddrDefault : unsigned(0 downto 0) := "0";
	signal State_rightAddrValid : std_logic := '0';
	constant State_rightAddrValidDefault : std_logic := '0';
	signal InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr : std_logic := '0';
	signal InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1 : std_logic := '0';
	signal InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2 : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1 : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2 : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1 : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2 : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr : std_logic := '0';
	signal InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1 : std_logic := '0';
	signal InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr : std_logic := '0';
	signal InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1 : std_logic := '0';
	signal InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2 : std_logic := '0';
	signal InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr : std_logic := '0';
	signal InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1 : std_logic := '0';
	type Inputs_iLeftArray is array (0 to 0) of unsigned (83 downto 0);
	signal Inputs_iLeft : Inputs_iLeftArray := (others => (others => '0'));
	type Inputs_iRightArray is array (0 to 1) of unsigned (52 downto 0);
	signal Inputs_iRight : Inputs_iRightArray := (others => (others => '0'));
	type ActiveTransactionsArray is array (0 to 0) of std_logic;
	signal ActiveTransactions : ActiveTransactionsArray := (others => '0');
	type muxLeftArray is array (0 to 1) of unsigned (83 downto 0);
	signal muxLeft : muxLeftArray := (others => (others => '0'));
	type muxRightArray is array (0 to 0) of unsigned (52 downto 0);
	signal muxRight : muxRightArray := (others => (others => '0'));
	type muxRightData_R_RDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal muxRightData_R_RDATA : muxRightData_R_RDATAArray := (others => (others => '0'));
	type TransactionsArray is array (0 to 0) of std_logic;
	signal Transactions : TransactionsArray := (others => '0');
	type TXBeginArray is array (0 to 0) of std_logic;
	signal TXBegin : TXBeginArray := (others => '0');
	type WaitForRestartsArray is array (0 to 0) of std_logic;
	signal WaitForRestarts : WaitForRestartsArray := (others => '0');
	type rangeDetectorActiveFlagsArray is array (0 to 0) of std_logic;
	signal rangeDetectorActiveFlags : rangeDetectorActiveFlagsArray := (others => '0');
	type rangeDetectorIndexesArray is array (0 to 0) of unsigned (0 downto 0);
	signal rangeDetectorIndexes : rangeDetectorIndexesArray := (others => (others => '0'));
	type DuplexMux_iLeftArray is array (0 to 0) of unsigned (83 downto 0);
	signal DuplexMux_iLeft : DuplexMux_iLeftArray := (others => (others => '0'));
	type DuplexMux_iRightArray is array (0 to 1) of unsigned (52 downto 0);
	signal DuplexMux_iRight : DuplexMux_iRightArray := (others => (others => '0'));
	type DuplexMux_oLeftArray is array (0 to 1) of unsigned (83 downto 0);
	signal DuplexMux_oLeft : DuplexMux_oLeftArray := (others => (others => '0'));
	type DuplexMux_oRightArray is array (0 to 0) of unsigned (52 downto 0);
	signal DuplexMux_oRight : DuplexMux_oRightArray := (others => (others => '0'));
	type Encoder_iValuesArray is array (0 to 0) of std_logic;
	signal Encoder_iValues : Encoder_iValuesArray := (others => '0');
	type InterconnectModule_L78F48T106_EnumerableArray is array (0 to 0) of std_logic;
	signal InterconnectModule_L78F48T106_Enumerable : InterconnectModule_L78F48T106_EnumerableArray := (others => '0');
	type InterconnectModule_L80F42T100_EnumerableArray is array (0 to 0) of std_logic;
	signal InterconnectModule_L80F42T100_Enumerable : InterconnectModule_L80F42T100_EnumerableArray := (others => '0');
	type InterconnectModule_L79F45T106_EnumerableArray is array (0 to 0) of std_logic;
	signal InterconnectModule_L79F45T106_Enumerable : InterconnectModule_L79F45T106_EnumerableArray := (others => '0');
	type AXI4ReadInteconnectModule_L35F44T95_EnumerableArray is array (0 to 0) of std_logic;
	signal AXI4ReadInteconnectModule_L35F44T95_Enumerable : AXI4ReadInteconnectModule_L35F44T95_EnumerableArray := (others => '0');
	type AXI4ReadInteconnectModule_L32F47T97_EnumerableArray is array (0 to 0) of unsigned (0 downto 0);
	signal AXI4ReadInteconnectModule_L32F47T97_Enumerable : AXI4ReadInteconnectModule_L32F47T97_EnumerableArray := (others => (others => '0'));
	type AXI4ReadInteconnectModule_1x2_L22F53T103_EnumerableArray is array (0 to 0) of unsigned (0 downto 0);
	signal AXI4ReadInteconnectModule_1x2_L22F53T103_Enumerable : AXI4ReadInteconnectModule_1x2_L22F53T103_EnumerableArray := (others => (others => '0'));
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	process (Clock, NextState_leftAddr, NextState_leftAddrValid, NextState_rightAddr, NextState_rightAddrValid, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_leftAddr <= State_leftAddrDefault;
				State_leftAddrValid <= State_leftAddrValidDefault;
				State_rightAddr <= State_rightAddrDefault;
				State_rightAddrValid <= State_rightAddrValidDefault;
			else
				State_leftAddr <= NextState_leftAddr;
				State_leftAddrValid <= NextState_leftAddrValid;
				State_rightAddr <= NextState_rightAddr;
				State_rightAddrValid <= NextState_rightAddrValid;
			end if;
		end if;
	end process;
	process (InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1, InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2)
	begin
		InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr <= InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1 AND InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2;
	end process;
	process (InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1, InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2)
	begin
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr <= InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1 AND InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2;
	end process;
	process (InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1, InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2)
	begin
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr <= InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1 AND InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2;
	end process;
	process (InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1)
	begin
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr <= NOT InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1;
	end process;
	process (InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1, InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2)
	begin
		InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr <= InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1 AND InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2;
	end process;
	process (InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1)
	begin
		InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr <= NOT InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1;
	end process;
	AXI4ReadInteconnectModule_1x2_TopLevel_DuplexMux : entity work.AXI4ReadInteconnectModule_1x2_TopLevel_DuplexMux
	port map
	(
		-- [BEGIN USER MAP FOR DuplexMux]
		-- [END USER MAP FOR DuplexMux]
		iLeft0 => DuplexMux_iLeft0_DuplexMux_iLeft_HardLink,
		iLeftAddr => DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink,
		iLeftAddrValid => DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink,
		iRight0 => DuplexMux_iRight0_DuplexMux_iRight_HardLink,
		iRight1 => DuplexMux_iRight1_DuplexMux_iRight_HardLink,
		iRightAddr => DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink,
		iRightAddrValid => DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink,
		oLeft0 => DuplexMux_oLeft0_DuplexMux_oLeft_HardLink,
		oLeft1 => DuplexMux_oLeft1_DuplexMux_oLeft_HardLink,
		oMuxLeftData => DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink,
		oMuxRightData => DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink,
		oRight0 => DuplexMux_oRight0_DuplexMux_oRight_HardLink
	)
	;
	AXI4ReadInteconnectModule_1x2_TopLevel_Encoder : entity work.AXI4ReadInteconnectModule_1x2_TopLevel_Encoder
	port map
	(
		-- [BEGIN USER MAP FOR Encoder]
		-- [END USER MAP FOR Encoder]
		iValues0 => Encoder_iValues0_Encoder_iValues_HardLink,
		HasActive => Encoder_HasActive_Encoder_HasActive_HardLink,
		MSBIndex => Encoder_MSBIndex_Encoder_MSBIndex_HardLink,
		MSBValue => Encoder_MSBValue_Encoder_MSBValue_HardLink
	)
	;
	AXI4ReadInteconnectModule_1x2_TopLevel_TransactionDetectors0 : entity work.AXI4ReadInteconnectModule_1x2_TopLevel_TransactionDetectors0
	port map
	(
		-- [BEGIN USER MAP FOR TransactionDetectors0]
		-- [END USER MAP FOR TransactionDetectors0]
		BoardSignals => BoardSignals,
		iRestart => TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink,
		iTXBegin => TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink,
		iTXEnd => TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink,
		oTransaction => TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink,
		oWaitForRestart => TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink
	)
	;
	AXI4ReadInteconnectModule_1x2_TopLevel_rangeDetectorArray0 : entity work.AXI4ReadInteconnectModule_1x2_TopLevel_rangeDetectorArray0
	port map
	(
		-- [BEGIN USER MAP FOR rangeDetectorArray0]
		-- [END USER MAP FOR rangeDetectorArray0]
		iAddress => rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink,
		oActive => rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink,
		oIndex => rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink
	)
	;
	process (currentTXEnd, Encoder_HasActive, Encoder_MSBIndex, rightAddr, State_leftAddr, State_leftAddrValid, State_rightAddr, State_rightAddrValid)
	begin
		NextState_leftAddr <= State_leftAddr;
		NextState_leftAddrValid <= State_leftAddrValid;
		NextState_rightAddr <= State_rightAddr;
		NextState_rightAddrValid <= State_rightAddrValid;
		if State_rightAddrValid = '1' then
			if currentTXEnd = '1' then
				NextState_leftAddrValid <= InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L137F47T52_Expr;
				NextState_rightAddrValid <= InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L138F48T53_Expr;
			end if;
		elsif Encoder_HasActive = '1' then
			NextState_leftAddr <= Encoder_MSBIndex;
			NextState_leftAddrValid <= InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L144F43T47_Expr;
			NextState_rightAddr <= rightAddr;
			NextState_rightAddrValid <= InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L147F44T48_Expr;
		end if;
	end process;
	process (AXI4ReadInteconnectModule_1x2_L22F53T103_Enumerable, AXI4ReadInteconnectModule_L32F47T97_Enumerable, AXI4ReadInteconnectModule_L33F37T75_Index, AXI4ReadInteconnectModule_L35F44T95_Enumerable, AXI4ReadInteconnectModule_L36F37T79_Index, axiRightAddr, DuplexMux_iLeft, DuplexMux_iLeftAddr, DuplexMux_iLeftAddrValid, DuplexMux_iRight, DuplexMux_iRightAddr, DuplexMux_iRightAddrValid, DuplexMux_oLeft, DuplexMux_oLeft0_DuplexMux_oLeft_HardLink, DuplexMux_oLeft1_DuplexMux_oLeft_HardLink, DuplexMux_oMuxLeftData, DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink, DuplexMux_oMuxRightData, DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink, DuplexMux_oRight, DuplexMux_oRight0_DuplexMux_oRight_HardLink, Encoder_HasActive, Encoder_HasActive_Encoder_HasActive_HardLink, Encoder_iValues, Encoder_MSBIndex_Encoder_MSBIndex_HardLink, Encoder_MSBValue_Encoder_MSBValue_HardLink, iLeft0_AR_ARADDR, iLeft0_AR_ARBURST, iLeft0_AR_ARCACHE, iLeft0_AR_ARID, iLeft0_AR_ARLEN, iLeft0_AR_ARLOCK, iLeft0_AR_ARPROT, iLeft0_AR_ARQOS, iLeft0_AR_ARREGION, iLeft0_AR_ARSIZE, iLeft0_AR_ARUSER, iLeft0_AR_ARVALID, iLeft0_R_RREADY, Inputs_iLeft, Inputs_iRight, InterconnectModule_L78F48T106_Enumerable, InterconnectModule_L79F45T106_Enumerable, InterconnectModule_L80F42T100_Enumerable, InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr, InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr, InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr, InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr, InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index, InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index, InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr, InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr, iRight0_AR_ARREADY, iRight0_R_RDATA0, iRight0_R_RDATA1, iRight0_R_RDATA2, iRight0_R_RDATA3, iRight0_R_RID, iRight0_R_RLAST, iRight0_R_RRESP, iRight0_R_RUSER, iRight0_R_RVALID, iRight1_AR_ARREADY, iRight1_R_RDATA0, iRight1_R_RDATA1, iRight1_R_RDATA2, iRight1_R_RDATA3, iRight1_R_RID, iRight1_R_RLAST, iRight1_R_RRESP, iRight1_R_RUSER, iRight1_R_RVALID, muxLeft, muxRight, muxRightData_R_RVALID, rangeDetectorActive, rangeDetectorActiveFlags, rangeDetectorArray0_iAddress, rangeDetectorArray0_oActive, rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink, rangeDetectorArray0_oIndex, rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink, rangeDetectorIndexes, rightAddr, State_leftAddr, State_leftAddrValid, State_rightAddr, State_rightAddrValid, TransactionDetectors0_iRestart, TransactionDetectors0_iTXBegin, TransactionDetectors0_iTXEnd, TransactionDetectors0_oTransaction, TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink, TransactionDetectors0_oWaitForRestart, TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink, Transactions, TXBegin, WaitForRestarts)
	begin
		InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1 <= Inputs_iLeft(TO_INTEGER(State_leftAddr))(83);
		InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2 <= muxRightData_R_RVALID;
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1 <= InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr;
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2 <= InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr;
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1 <= Inputs_iLeft(0)(82);
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2 <= rangeDetectorActive;
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1 <= InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index;
		InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1 <= Inputs_iLeft(0)(83);
		InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2 <= muxRightData_R_RVALID;
		InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1 <= Encoder_HasActive;
		Inputs_iLeft(0)(83) <= iLeft0_R_RREADY;
		Inputs_iLeft(0)(82) <= iLeft0_AR_ARVALID;
		Inputs_iLeft(0)(81 downto 74) <= iLeft0_AR_ARUSER;
		Inputs_iLeft(0)(73 downto 66) <= iLeft0_AR_ARREGION;
		Inputs_iLeft(0)(65 downto 62) <= iLeft0_AR_ARQOS;
		Inputs_iLeft(0)(61 downto 59) <= iLeft0_AR_ARPROT;
		Inputs_iLeft(0)(58 downto 55) <= iLeft0_AR_ARCACHE;
		Inputs_iLeft(0)(54 downto 53) <= iLeft0_AR_ARLOCK;
		Inputs_iLeft(0)(52 downto 51) <= iLeft0_AR_ARBURST;
		Inputs_iLeft(0)(50 downto 48) <= iLeft0_AR_ARSIZE;
		Inputs_iLeft(0)(47 downto 40) <= iLeft0_AR_ARLEN;
		Inputs_iLeft(0)(39 downto 8) <= iLeft0_AR_ARADDR;
		Inputs_iLeft(0)(7 downto 0) <= iLeft0_AR_ARID;
		Inputs_iRight(0)(52) <= iRight0_R_RVALID;
		Inputs_iRight(0)(51 downto 44) <= iRight0_R_RUSER;
		Inputs_iRight(0)(43) <= iRight0_R_RLAST;
		Inputs_iRight(0)(42 downto 41) <= iRight0_R_RRESP;
		Inputs_iRight(0)(40 downto 33) <= iRight0_R_RDATA3;
		Inputs_iRight(0)(32 downto 25) <= iRight0_R_RDATA2;
		Inputs_iRight(0)(24 downto 17) <= iRight0_R_RDATA1;
		Inputs_iRight(0)(16 downto 9) <= iRight0_R_RDATA0;
		Inputs_iRight(0)(8 downto 1) <= iRight0_R_RID;
		Inputs_iRight(0)(0) <= iRight0_AR_ARREADY;
		Inputs_iRight(1)(52) <= iRight1_R_RVALID;
		Inputs_iRight(1)(51 downto 44) <= iRight1_R_RUSER;
		Inputs_iRight(1)(43) <= iRight1_R_RLAST;
		Inputs_iRight(1)(42 downto 41) <= iRight1_R_RRESP;
		Inputs_iRight(1)(40 downto 33) <= iRight1_R_RDATA3;
		Inputs_iRight(1)(32 downto 25) <= iRight1_R_RDATA2;
		Inputs_iRight(1)(24 downto 17) <= iRight1_R_RDATA1;
		Inputs_iRight(1)(16 downto 9) <= iRight1_R_RDATA0;
		Inputs_iRight(1)(8 downto 1) <= iRight1_R_RID;
		Inputs_iRight(1)(0) <= iRight1_AR_ARREADY;
		InterconnectModule_L78F48T106_Enumerable(0) <= TransactionDetectors0_oTransaction;
		ActiveTransactions(0) <= InterconnectModule_L78F48T106_Enumerable(0);
		currentTXEnd <= InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr;
		muxLeft(0) <= DuplexMux_oLeft(0);
		muxLeft(1) <= DuplexMux_oLeft(1);
		muxLeftData_AR_ARID <= DuplexMux_oMuxLeftData(7 downto 0);
		muxLeftData_AR_ARADDR <= DuplexMux_oMuxLeftData(39 downto 8);
		muxLeftData_AR_ARLEN <= DuplexMux_oMuxLeftData(47 downto 40);
		muxLeftData_AR_ARSIZE <= DuplexMux_oMuxLeftData(50 downto 48);
		muxLeftData_AR_ARBURST <= DuplexMux_oMuxLeftData(52 downto 51);
		muxLeftData_AR_ARLOCK <= DuplexMux_oMuxLeftData(54 downto 53);
		muxLeftData_AR_ARCACHE <= DuplexMux_oMuxLeftData(58 downto 55);
		muxLeftData_AR_ARPROT <= DuplexMux_oMuxLeftData(61 downto 59);
		muxLeftData_AR_ARQOS <= DuplexMux_oMuxLeftData(65 downto 62);
		muxLeftData_AR_ARREGION <= DuplexMux_oMuxLeftData(73 downto 66);
		muxLeftData_AR_ARUSER <= DuplexMux_oMuxLeftData(81 downto 74);
		muxLeftData_AR_ARVALID <= DuplexMux_oMuxLeftData(82);
		muxLeftData_R_RREADY <= DuplexMux_oMuxLeftData(83);
		muxRight(0) <= DuplexMux_oRight(0);
		muxRightData_AR_ARREADY <= DuplexMux_oMuxRightData(0);
		muxRightData_R_RID <= DuplexMux_oMuxRightData(8 downto 1);
		muxRightData_R_RDATA(0) <= DuplexMux_oMuxRightData(16 downto 9);
		muxRightData_R_RDATA(1) <= DuplexMux_oMuxRightData(24 downto 17);
		muxRightData_R_RDATA(2) <= DuplexMux_oMuxRightData(32 downto 25);
		muxRightData_R_RDATA(3) <= DuplexMux_oMuxRightData(40 downto 33);
		muxRightData_R_RRESP <= DuplexMux_oMuxRightData(42 downto 41);
		muxRightData_R_RLAST <= DuplexMux_oMuxRightData(43);
		muxRightData_R_RUSER <= DuplexMux_oMuxRightData(51 downto 44);
		muxRightData_R_RVALID <= DuplexMux_oMuxRightData(52);
		rightAddr <= axiRightAddr;
		InterconnectModule_L80F42T100_Enumerable(0) <= TransactionDetectors0_oTransaction;
		Transactions(0) <= InterconnectModule_L80F42T100_Enumerable(0);
		InterconnectModule_L79F45T106_Enumerable(0) <= TransactionDetectors0_oWaitForRestart;
		WaitForRestarts(0) <= InterconnectModule_L79F45T106_Enumerable(0);
		axiRightAddr <= AXI4ReadInteconnectModule_L33F37T75_Index;
		rangeDetectorActive <= AXI4ReadInteconnectModule_L36F37T79_Index;
		AXI4ReadInteconnectModule_L35F44T95_Enumerable(0) <= rangeDetectorArray0_oActive;
		rangeDetectorActiveFlags(0) <= AXI4ReadInteconnectModule_L35F44T95_Enumerable(0);
		AXI4ReadInteconnectModule_L32F47T97_Enumerable(0) <= rangeDetectorArray0_oIndex;
		rangeDetectorIndexes(0) <= AXI4ReadInteconnectModule_L32F47T97_Enumerable(0);
		TXBegin(0) <= InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr;
		TransactionDetectors0_iRestart <= InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr;
		TransactionDetectors0_iTXBegin <= InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index;
		TransactionDetectors0_iTXEnd <= InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr;
		Encoder_iValues(0) <= TXBegin(0);
		DuplexMux_iLeft(0) <= Inputs_iLeft(0);
		DuplexMux_iLeftAddr <= State_leftAddr;
		DuplexMux_iLeftAddrValid <= State_leftAddrValid;
		DuplexMux_iRight(0) <= Inputs_iRight(0);
		DuplexMux_iRight(1) <= Inputs_iRight(1);
		DuplexMux_iRightAddr <= State_rightAddr;
		DuplexMux_iRightAddrValid <= State_rightAddrValid;
		rangeDetectorArray0_iAddress <= Inputs_iLeft(0)(39 downto 8);
		oLeft0_R_RREADY <= muxLeft(0)(83);
		oLeft0_AR_ARVALID <= muxLeft(0)(82);
		oLeft0_AR_ARUSER <= muxLeft(0)(81 downto 74);
		oLeft0_AR_ARREGION <= muxLeft(0)(73 downto 66);
		oLeft0_AR_ARQOS <= muxLeft(0)(65 downto 62);
		oLeft0_AR_ARPROT <= muxLeft(0)(61 downto 59);
		oLeft0_AR_ARCACHE <= muxLeft(0)(58 downto 55);
		oLeft0_AR_ARLOCK <= muxLeft(0)(54 downto 53);
		oLeft0_AR_ARBURST <= muxLeft(0)(52 downto 51);
		oLeft0_AR_ARSIZE <= muxLeft(0)(50 downto 48);
		oLeft0_AR_ARLEN <= muxLeft(0)(47 downto 40);
		oLeft0_AR_ARADDR <= muxLeft(0)(39 downto 8);
		oLeft0_AR_ARID <= muxLeft(0)(7 downto 0);
		oLeft1_R_RREADY <= muxLeft(1)(83);
		oLeft1_AR_ARVALID <= muxLeft(1)(82);
		oLeft1_AR_ARUSER <= muxLeft(1)(81 downto 74);
		oLeft1_AR_ARREGION <= muxLeft(1)(73 downto 66);
		oLeft1_AR_ARQOS <= muxLeft(1)(65 downto 62);
		oLeft1_AR_ARPROT <= muxLeft(1)(61 downto 59);
		oLeft1_AR_ARCACHE <= muxLeft(1)(58 downto 55);
		oLeft1_AR_ARLOCK <= muxLeft(1)(54 downto 53);
		oLeft1_AR_ARBURST <= muxLeft(1)(52 downto 51);
		oLeft1_AR_ARSIZE <= muxLeft(1)(50 downto 48);
		oLeft1_AR_ARLEN <= muxLeft(1)(47 downto 40);
		oLeft1_AR_ARADDR <= muxLeft(1)(39 downto 8);
		oLeft1_AR_ARID <= muxLeft(1)(7 downto 0);
		oNextRightAddr <= rightAddr;
		AXI4ReadInteconnectModule_1x2_L22F53T103_Enumerable(0) <= rangeDetectorArray0_oIndex;
		oRangeDetectorIndex0 <= AXI4ReadInteconnectModule_1x2_L22F53T103_Enumerable(0);
		oRight0_R_RVALID <= muxRight(0)(52);
		oRight0_R_RUSER <= muxRight(0)(51 downto 44);
		oRight0_R_RLAST <= muxRight(0)(43);
		oRight0_R_RRESP <= muxRight(0)(42 downto 41);
		oRight0_R_RDATA3 <= muxRight(0)(40 downto 33);
		oRight0_R_RDATA2 <= muxRight(0)(32 downto 25);
		oRight0_R_RDATA1 <= muxRight(0)(24 downto 17);
		oRight0_R_RDATA0 <= muxRight(0)(16 downto 9);
		oRight0_R_RID <= muxRight(0)(8 downto 1);
		oRight0_AR_ARREADY <= muxRight(0)(0);
		oStateRightAddr <= State_rightAddr;
		oStateRightAddrValid <= State_rightAddrValid;
		oTransactions0 <= Transactions(0);
		DuplexMux_iLeft0_DuplexMux_iLeft_HardLink <= DuplexMux_iLeft(0);
		DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink <= DuplexMux_iLeftAddr;
		DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink <= DuplexMux_iLeftAddrValid;
		DuplexMux_iRight0_DuplexMux_iRight_HardLink <= DuplexMux_iRight(0);
		DuplexMux_iRight1_DuplexMux_iRight_HardLink <= DuplexMux_iRight(1);
		DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink <= DuplexMux_iRightAddr;
		DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink <= DuplexMux_iRightAddrValid;
		DuplexMux_oLeft(0) <= DuplexMux_oLeft0_DuplexMux_oLeft_HardLink;
		DuplexMux_oLeft(1) <= DuplexMux_oLeft1_DuplexMux_oLeft_HardLink;
		DuplexMux_oMuxLeftData <= DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink;
		DuplexMux_oMuxRightData <= DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink;
		DuplexMux_oRight(0) <= DuplexMux_oRight0_DuplexMux_oRight_HardLink;
		Encoder_iValues0_Encoder_iValues_HardLink <= Encoder_iValues(0);
		Encoder_HasActive <= Encoder_HasActive_Encoder_HasActive_HardLink;
		Encoder_MSBIndex <= Encoder_MSBIndex_Encoder_MSBIndex_HardLink;
		Encoder_MSBValue <= Encoder_MSBValue_Encoder_MSBValue_HardLink;
		TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink <= TransactionDetectors0_iRestart;
		TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink <= TransactionDetectors0_iTXBegin;
		TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink <= TransactionDetectors0_iTXEnd;
		TransactionDetectors0_oTransaction <= TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink;
		TransactionDetectors0_oWaitForRestart <= TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink;
		rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink <= rangeDetectorArray0_iAddress;
		rangeDetectorArray0_oActive <= rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink;
		rangeDetectorArray0_oIndex <= rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink;
		InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index <= TXBegin(0);
		InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index <= WaitForRestarts(0);
		AXI4ReadInteconnectModule_L36F37T79_Index <= rangeDetectorActiveFlags(TO_INTEGER(Encoder_MSBIndex));
		AXI4ReadInteconnectModule_L33F37T75_Index <= rangeDetectorIndexes(TO_INTEGER(Encoder_MSBIndex));
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;