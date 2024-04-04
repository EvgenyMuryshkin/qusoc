`timescale 1ns/1ps
`default_nettype none
// PLEASE READ THIS, IT MAY SAVE YOU SOME TIME AND MONEY, THANK YOU!
// * This file was generated by Quokka FPGA Toolkit.
// * Generated code is your property, do whatever you want with it
// * Place custom code between [BEGIN USER ***] and [END USER ***].
// * CAUTION: All code outside of [USER] scope is subject to regeneration.
// * Bad things happen sometimes in developer's life,
//   it is recommended to use source control management software (e.g. git, bzr etc) to keep your custom code safe'n'sound.
// * Internal structure of code is subject to change.
//   You can use some of signals in custom code, but most likely they will not exist in future (e.g. will get shorter or gone completely)
// * Please send your feedback, comments, improvement ideas etc. to evmuryshkin@gmail.com
// * Visit https://github.com/EvgenyMuryshkin/QuokkaEvaluation to access latest version of playground
//
// DISCLAIMER:
//   Code comes AS-IS, it is your responsibility to make sure it is working as expected
//   no responsibility will be taken for any loss or damage caused by use of Quokka toolkit.
//
// System configuration name is AXI4WriteInteconnectModule_1x2_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4WriteInteconnectModule_1x2_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] iLeft0_AW_AWID,
	input wire [31:0] iLeft0_AW_AWADDR,
	input wire [7:0] iLeft0_AW_AWLEN,
	input wire [2:0] iLeft0_AW_AWSIZE,
	input wire [1:0] iLeft0_AW_AWBURST,
	input wire [1:0] iLeft0_AW_AWLOCK,
	input wire [3:0] iLeft0_AW_AWCACHE,
	input wire [2:0] iLeft0_AW_AWPROT,
	input wire [3:0] iLeft0_AW_AWQOS,
	input wire [7:0] iLeft0_AW_AWREGION,
	input wire [7:0] iLeft0_AW_AWUSER,
	input wire iLeft0_AW_AWVALID,
	input wire [7:0] iLeft0_W_WID,
	input wire [7:0] iLeft0_W_WDATA0,
	input wire [7:0] iLeft0_W_WDATA1,
	input wire [7:0] iLeft0_W_WDATA2,
	input wire [7:0] iLeft0_W_WDATA3,
	input wire [3:0] iLeft0_W_WSTRB,
	input wire iLeft0_W_WLAST,
	input wire [7:0] iLeft0_W_WUSER,
	input wire iLeft0_W_WVALID,
	input wire iLeft0_B_BREADY,
	input wire iRight0_AW_AWREADY,
	input wire [7:0] iRight0_B_BID,
	input wire [1:0] iRight0_B_BRESP,
	input wire [7:0] iRight0_B_BUSER,
	input wire iRight0_B_BVALID,
	input wire iRight0_W_WREADY,
	input wire iRight1_AW_AWREADY,
	input wire [7:0] iRight1_B_BID,
	input wire [1:0] iRight1_B_BRESP,
	input wire [7:0] iRight1_B_BUSER,
	input wire iRight1_B_BVALID,
	input wire iRight1_W_WREADY,
	output wire [7:0] M2S0_AW_AWID,
	output wire [31:0] M2S0_AW_AWADDR,
	output wire [7:0] M2S0_AW_AWLEN,
	output wire [2:0] M2S0_AW_AWSIZE,
	output wire [1:0] M2S0_AW_AWBURST,
	output wire [1:0] M2S0_AW_AWLOCK,
	output wire [3:0] M2S0_AW_AWCACHE,
	output wire [2:0] M2S0_AW_AWPROT,
	output wire [3:0] M2S0_AW_AWQOS,
	output wire [7:0] M2S0_AW_AWREGION,
	output wire [7:0] M2S0_AW_AWUSER,
	output wire M2S0_AW_AWVALID,
	output wire [7:0] M2S0_W_WID,
	output wire [7:0] M2S0_W_WDATA0,
	output wire [7:0] M2S0_W_WDATA1,
	output wire [7:0] M2S0_W_WDATA2,
	output wire [7:0] M2S0_W_WDATA3,
	output wire [3:0] M2S0_W_WSTRB,
	output wire M2S0_W_WLAST,
	output wire [7:0] M2S0_W_WUSER,
	output wire M2S0_W_WVALID,
	output wire M2S0_B_BREADY,
	output wire [7:0] M2S1_AW_AWID,
	output wire [31:0] M2S1_AW_AWADDR,
	output wire [7:0] M2S1_AW_AWLEN,
	output wire [2:0] M2S1_AW_AWSIZE,
	output wire [1:0] M2S1_AW_AWBURST,
	output wire [1:0] M2S1_AW_AWLOCK,
	output wire [3:0] M2S1_AW_AWCACHE,
	output wire [2:0] M2S1_AW_AWPROT,
	output wire [3:0] M2S1_AW_AWQOS,
	output wire [7:0] M2S1_AW_AWREGION,
	output wire [7:0] M2S1_AW_AWUSER,
	output wire M2S1_AW_AWVALID,
	output wire [7:0] M2S1_W_WID,
	output wire [7:0] M2S1_W_WDATA0,
	output wire [7:0] M2S1_W_WDATA1,
	output wire [7:0] M2S1_W_WDATA2,
	output wire [7:0] M2S1_W_WDATA3,
	output wire [3:0] M2S1_W_WSTRB,
	output wire M2S1_W_WLAST,
	output wire [7:0] M2S1_W_WUSER,
	output wire M2S1_W_WVALID,
	output wire M2S1_B_BREADY,
	output wire S2M0_AW_AWREADY,
	output wire [7:0] S2M0_B_BID,
	output wire [1:0] S2M0_B_BRESP,
	output wire [7:0] S2M0_B_BUSER,
	output wire S2M0_B_BVALID,
	output wire S2M0_W_WREADY,
	output wire oEncoderHasActive,
	output wire [7:0] oLeft0_AW_AWID,
	output wire [31:0] oLeft0_AW_AWADDR,
	output wire [7:0] oLeft0_AW_AWLEN,
	output wire [2:0] oLeft0_AW_AWSIZE,
	output wire [1:0] oLeft0_AW_AWBURST,
	output wire [1:0] oLeft0_AW_AWLOCK,
	output wire [3:0] oLeft0_AW_AWCACHE,
	output wire [2:0] oLeft0_AW_AWPROT,
	output wire [3:0] oLeft0_AW_AWQOS,
	output wire [7:0] oLeft0_AW_AWREGION,
	output wire [7:0] oLeft0_AW_AWUSER,
	output wire oLeft0_AW_AWVALID,
	output wire [7:0] oLeft0_W_WID,
	output wire [7:0] oLeft0_W_WDATA0,
	output wire [7:0] oLeft0_W_WDATA1,
	output wire [7:0] oLeft0_W_WDATA2,
	output wire [7:0] oLeft0_W_WDATA3,
	output wire [3:0] oLeft0_W_WSTRB,
	output wire oLeft0_W_WLAST,
	output wire [7:0] oLeft0_W_WUSER,
	output wire oLeft0_W_WVALID,
	output wire oLeft0_B_BREADY,
	output wire [7:0] oLeft1_AW_AWID,
	output wire [31:0] oLeft1_AW_AWADDR,
	output wire [7:0] oLeft1_AW_AWLEN,
	output wire [2:0] oLeft1_AW_AWSIZE,
	output wire [1:0] oLeft1_AW_AWBURST,
	output wire [1:0] oLeft1_AW_AWLOCK,
	output wire [3:0] oLeft1_AW_AWCACHE,
	output wire [2:0] oLeft1_AW_AWPROT,
	output wire [3:0] oLeft1_AW_AWQOS,
	output wire [7:0] oLeft1_AW_AWREGION,
	output wire [7:0] oLeft1_AW_AWUSER,
	output wire oLeft1_AW_AWVALID,
	output wire [7:0] oLeft1_W_WID,
	output wire [7:0] oLeft1_W_WDATA0,
	output wire [7:0] oLeft1_W_WDATA1,
	output wire [7:0] oLeft1_W_WDATA2,
	output wire [7:0] oLeft1_W_WDATA3,
	output wire [3:0] oLeft1_W_WSTRB,
	output wire oLeft1_W_WLAST,
	output wire [7:0] oLeft1_W_WUSER,
	output wire oLeft1_W_WVALID,
	output wire oLeft1_B_BREADY,
	output wire [0:0] oNextRightAddr,
	output wire oRangeDetectorActive0,
	output wire [0:0] oRangeDetectorIndex0,
	output wire oRight0_AW_AWREADY,
	output wire [7:0] oRight0_B_BID,
	output wire [1:0] oRight0_B_BRESP,
	output wire [7:0] oRight0_B_BUSER,
	output wire oRight0_B_BVALID,
	output wire oRight0_W_WREADY,
	output wire [0:0] oStateRightAddr,
	output wire oStateRightAddrValid,
	output wire oTransactions0,
	output wire oTXBegin0
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [1: 0] leftCount = 2'b01;
	wire signed [2: 0] rightCount = 3'b010;
	wire InterconnectModule_L99F13L109T14_0_leftIndex = 1'b0;
	wire AXI4WriteInteconnectModule_L23F13L29T14_0_i = 1'b0;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L137F47T52_Expr = 1'b0;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L138F48T53_Expr = 1'b0;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L144F43T47_Expr = 1'b1;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L147F44T48_Expr = 1'b1;
	reg [0: 0] NextState_leftAddr;
	reg NextState_leftAddrValid;
	reg [0: 0] NextState_rightAddr;
	reg NextState_rightAddrValid;
	wire currentTXEnd;
	wire [7: 0] muxLeftData_AW_AWID;
	wire [31: 0] muxLeftData_AW_AWADDR;
	wire [7: 0] muxLeftData_AW_AWLEN;
	wire [2: 0] muxLeftData_AW_AWSIZE;
	wire [1: 0] muxLeftData_AW_AWBURST;
	wire [1: 0] muxLeftData_AW_AWLOCK;
	wire [3: 0] muxLeftData_AW_AWCACHE;
	wire [2: 0] muxLeftData_AW_AWPROT;
	wire [3: 0] muxLeftData_AW_AWQOS;
	wire [7: 0] muxLeftData_AW_AWREGION;
	wire [7: 0] muxLeftData_AW_AWUSER;
	wire muxLeftData_AW_AWVALID;
	wire [7: 0] muxLeftData_W_WID;
	wire [3: 0] muxLeftData_W_WSTRB;
	wire muxLeftData_W_WLAST;
	wire [7: 0] muxLeftData_W_WUSER;
	wire muxLeftData_W_WVALID;
	wire muxLeftData_B_BREADY;
	wire muxRightData_AW_AWREADY;
	wire [7: 0] muxRightData_B_BID;
	wire [1: 0] muxRightData_B_BRESP;
	wire [7: 0] muxRightData_B_BUSER;
	wire muxRightData_B_BVALID;
	wire muxRightData_W_WREADY;
	wire [0: 0] rightAddr;
	wire [0: 0] axiRightAddr;
	wire rangeDetectorActive;
	wire [0: 0] DuplexMux_iLeftAddr;
	wire DuplexMux_iLeftAddrValid;
	wire [0: 0] DuplexMux_iRightAddr;
	wire DuplexMux_iRightAddrValid;
	wire [137: 0] DuplexMux_oMuxLeftData;
	wire [20: 0] DuplexMux_oMuxRightData;
	wire Encoder_HasActive;
	wire [0: 0] Encoder_MSBIndex;
	wire [0: 0] Encoder_MSBValue;
	wire TransactionDetectors0_iRestart;
	wire TransactionDetectors0_iTXBegin;
	wire TransactionDetectors0_iTXEnd;
	wire TransactionDetectors0_oTransaction;
	wire TransactionDetectors0_oWaitForRestart;
	wire [31: 0] rangeDetectorArray0_iAddress;
	wire rangeDetectorArray0_oActive;
	wire [0: 0] rangeDetectorArray0_oIndex;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F111T137_Index;
	wire [0: 0] AXI4WriteInteconnectModule_L33F37T75_Index;
	wire AXI4WriteInteconnectModule_L36F37T79_Index;
	wire [2: 0] InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index;
	wire [0: 0] InterconnectModule_L112F17L115T18_Object;
	wire [183: 0] InterconnectModule_L119F17L127T18_Object;
	wire [31: 0] AXI4WriteInteconnectModule_L23F13L29T14_0_AXI4WriteInteconnectModule_L25F54L28T18_Object;
	wire [137: 0] DuplexMux_iLeft0_DuplexMux_iLeft_HardLink;
	wire [0: 0] DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink;
	wire DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink;
	wire [20: 0] DuplexMux_iRight0_DuplexMux_iRight_HardLink;
	wire [20: 0] DuplexMux_iRight1_DuplexMux_iRight_HardLink;
	wire [0: 0] DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink;
	wire DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink;
	wire [137: 0] DuplexMux_oLeft0_DuplexMux_oLeft_HardLink;
	wire [137: 0] DuplexMux_oLeft1_DuplexMux_oLeft_HardLink;
	wire [137: 0] DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink;
	wire [20: 0] DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink;
	wire [20: 0] DuplexMux_oRight0_DuplexMux_oRight_HardLink;
	wire Encoder_iValues0_Encoder_iValues_HardLink;
	wire Encoder_HasActive_Encoder_HasActive_HardLink;
	wire [0: 0] Encoder_MSBIndex_Encoder_MSBIndex_HardLink;
	wire [0: 0] Encoder_MSBValue_Encoder_MSBValue_HardLink;
	wire TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink;
	wire TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink;
	wire TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink;
	wire TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink;
	wire TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink;
	wire [31: 0] rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink;
	wire rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink;
	wire [0: 0] rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink;
	reg [0: 0] State_leftAddr = 1'b0;
	wire [0: 0] State_leftAddrDefault = 1'b0;
	reg State_leftAddrValid = 1'b0;
	wire State_leftAddrValidDefault = 1'b0;
	reg [0: 0] State_rightAddr = 1'b0;
	wire [0: 0] State_rightAddrDefault = 1'b0;
	reg State_rightAddrValid = 1'b0;
	wire State_rightAddrValidDefault = 1'b0;
	wire InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr;
	wire InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr_1;
	wire InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr_2;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr_1;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr_2;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr_1;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr_2;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F110T137_Expr;
	wire InterconnectModule_L89F37T148_0_InterconnectModule_L89F110T137_Expr_1;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr_1;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr_2;
	wire [137 : 0] Inputs_iLeft [0 : 0];
	wire [20 : 0] Inputs_iRight [0 : 1];
	wire ActiveTransactions [0 : 0];
	wire [137 : 0] muxLeft [0 : 1];
	wire [7 : 0] muxLeftData_W_WDATA [0 : 3];
	wire [20 : 0] muxRight [0 : 0];
	wire Transactions [0 : 0];
	wire TXBegin [0 : 0];
	wire WaitForRestarts [0 : 0];
	wire rangeDetectorActiveFlags [0 : 0];
	wire [0 : 0] rangeDetectorIndexes [0 : 0];
	wire [137 : 0] DuplexMux_iLeft [0 : 0];
	wire [20 : 0] DuplexMux_iRight [0 : 1];
	wire [137 : 0] DuplexMux_oLeft [0 : 1];
	wire [20 : 0] DuplexMux_oRight [0 : 0];
	wire Encoder_iValues [0 : 0];
	wire InterconnectModule_L78F48T106_Enumerable [0 : 0];
	wire InterconnectModule_L80F42T100_Enumerable [0 : 0];
	wire InterconnectModule_L89F37T148_Enumerable [0 : 0];
	wire InterconnectModule_L79F45T106_Enumerable [0 : 0];
	wire AXI4WriteInteconnectModule_L35F44T95_Enumerable [0 : 0];
	wire [0 : 0] AXI4WriteInteconnectModule_L32F47T97_Enumerable [0 : 0];
	wire AXI4WriteInteconnectModule_1x2_L22F47T98_Enumerable [0 : 0];
	wire [0 : 0] AXI4WriteInteconnectModule_1x2_L21F53T103_Enumerable [0 : 0];
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_leftAddr <= State_leftAddrDefault;
			State_leftAddrValid <= State_leftAddrValidDefault;
			State_rightAddr <= State_rightAddrDefault;
			State_rightAddrValid <= State_rightAddrValidDefault;
		end
		else
		begin
			State_leftAddr <= NextState_leftAddr;
			State_leftAddrValid <= NextState_leftAddrValid;
			State_rightAddr <= NextState_rightAddr;
			State_rightAddrValid <= NextState_rightAddrValid;
		end
	end
	assign InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr = InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr_1 & InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr_2;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr = InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr_1 & InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr_2;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr = InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr_1 & InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr_2;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F110T137_Expr = ~InterconnectModule_L89F37T148_0_InterconnectModule_L89F110T137_Expr_1;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr = ~InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr = InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr_1 & InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr_2;
	AXI4WriteInteconnectModule_1x2_TopLevel_DuplexMux
	AXI4WriteInteconnectModule_1x2_TopLevel_DuplexMux
	(
		// [BEGIN USER MAP FOR DuplexMux]
		// [END USER MAP FOR DuplexMux]
		.iLeft0 (DuplexMux_iLeft0_DuplexMux_iLeft_HardLink),
		.iLeftAddr (DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink),
		.iLeftAddrValid (DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink),
		.iRight0 (DuplexMux_iRight0_DuplexMux_iRight_HardLink),
		.iRight1 (DuplexMux_iRight1_DuplexMux_iRight_HardLink),
		.iRightAddr (DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink),
		.iRightAddrValid (DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink),
		.oLeft0 (DuplexMux_oLeft0_DuplexMux_oLeft_HardLink),
		.oLeft1 (DuplexMux_oLeft1_DuplexMux_oLeft_HardLink),
		.oMuxLeftData (DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink),
		.oMuxRightData (DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink),
		.oRight0 (DuplexMux_oRight0_DuplexMux_oRight_HardLink)
	);
	AXI4WriteInteconnectModule_1x2_TopLevel_Encoder
	AXI4WriteInteconnectModule_1x2_TopLevel_Encoder
	(
		// [BEGIN USER MAP FOR Encoder]
		// [END USER MAP FOR Encoder]
		.iValues0 (Encoder_iValues0_Encoder_iValues_HardLink),
		.HasActive (Encoder_HasActive_Encoder_HasActive_HardLink),
		.MSBIndex (Encoder_MSBIndex_Encoder_MSBIndex_HardLink),
		.MSBValue (Encoder_MSBValue_Encoder_MSBValue_HardLink)
	);
	AXI4WriteInteconnectModule_1x2_TopLevel_TransactionDetectors0
	AXI4WriteInteconnectModule_1x2_TopLevel_TransactionDetectors0
	(
		// [BEGIN USER MAP FOR TransactionDetectors0]
		// [END USER MAP FOR TransactionDetectors0]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.iRestart (TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink),
		.iTXBegin (TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink),
		.iTXEnd (TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink),
		.oTransaction (TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink),
		.oWaitForRestart (TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink)
	);
	AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0
	AXI4WriteInteconnectModule_1x2_TopLevel_rangeDetectorArray0
	(
		// [BEGIN USER MAP FOR rangeDetectorArray0]
		// [END USER MAP FOR rangeDetectorArray0]
		.iAddress (rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink),
		.oActive (rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink),
		.oIndex (rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink)
	);
	always @ (*)
	begin
		NextState_leftAddr = State_leftAddr;
		NextState_leftAddrValid = State_leftAddrValid;
		NextState_rightAddr = State_rightAddr;
		NextState_rightAddrValid = State_rightAddrValid;
		if ((State_rightAddrValid == 1))
		begin
			if ((currentTXEnd == 1))
			begin
				NextState_leftAddrValid = InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L137F47T52_Expr;
				NextState_rightAddrValid = InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L138F48T53_Expr;
			end
		end
		else if ((Encoder_HasActive == 1))
		begin
			NextState_leftAddr = Encoder_MSBIndex;
			NextState_leftAddrValid = InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L144F43T47_Expr;
			NextState_rightAddr = rightAddr;
			NextState_rightAddrValid = InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L147F44T48_Expr;
		end
	end
	assign InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr_1 = Inputs_iLeft[State_leftAddr][137];
	assign InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr_2 = muxRightData_B_BVALID;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr_1 = InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr_2 = InterconnectModule_L89F37T148_0_InterconnectModule_L89F110T137_Expr;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr_1 = Inputs_iLeft[0][82];
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T106_AXI4WriteInteconnectModule_L45F63T103_Expr_2 = rangeDetectorActive;
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F110T137_Expr_1 = InterconnectModule_L89F37T148_0_InterconnectModule_L89F111T137_Index;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1 = Encoder_HasActive;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr_1 = Inputs_iLeft[0][137];
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr_2 = muxRightData_B_BVALID;
	assign Inputs_iLeft[0][137] = iLeft0_B_BREADY;
	assign Inputs_iLeft[0][136] = iLeft0_W_WVALID;
	assign Inputs_iLeft[0][135:128] = iLeft0_W_WUSER;
	assign Inputs_iLeft[0][127] = iLeft0_W_WLAST;
	assign Inputs_iLeft[0][126:123] = iLeft0_W_WSTRB;
	assign Inputs_iLeft[0][122:115] = iLeft0_W_WDATA3;
	assign Inputs_iLeft[0][114:107] = iLeft0_W_WDATA2;
	assign Inputs_iLeft[0][106:99] = iLeft0_W_WDATA1;
	assign Inputs_iLeft[0][98:91] = iLeft0_W_WDATA0;
	assign Inputs_iLeft[0][90:83] = iLeft0_W_WID;
	assign Inputs_iLeft[0][82] = iLeft0_AW_AWVALID;
	assign Inputs_iLeft[0][81:74] = iLeft0_AW_AWUSER;
	assign Inputs_iLeft[0][73:66] = iLeft0_AW_AWREGION;
	assign Inputs_iLeft[0][65:62] = iLeft0_AW_AWQOS;
	assign Inputs_iLeft[0][61:59] = iLeft0_AW_AWPROT;
	assign Inputs_iLeft[0][58:55] = iLeft0_AW_AWCACHE;
	assign Inputs_iLeft[0][54:53] = iLeft0_AW_AWLOCK;
	assign Inputs_iLeft[0][52:51] = iLeft0_AW_AWBURST;
	assign Inputs_iLeft[0][50:48] = iLeft0_AW_AWSIZE;
	assign Inputs_iLeft[0][47:40] = iLeft0_AW_AWLEN;
	assign Inputs_iLeft[0][39:8] = iLeft0_AW_AWADDR;
	assign Inputs_iLeft[0][7:0] = iLeft0_AW_AWID;
	assign Inputs_iRight[0][20] = iRight0_W_WREADY;
	assign Inputs_iRight[0][19] = iRight0_B_BVALID;
	assign Inputs_iRight[0][18:11] = iRight0_B_BUSER;
	assign Inputs_iRight[0][10:9] = iRight0_B_BRESP;
	assign Inputs_iRight[0][8:1] = iRight0_B_BID;
	assign Inputs_iRight[0][0] = iRight0_AW_AWREADY;
	assign Inputs_iRight[1][20] = iRight1_W_WREADY;
	assign Inputs_iRight[1][19] = iRight1_B_BVALID;
	assign Inputs_iRight[1][18:11] = iRight1_B_BUSER;
	assign Inputs_iRight[1][10:9] = iRight1_B_BRESP;
	assign Inputs_iRight[1][8:1] = iRight1_B_BID;
	assign Inputs_iRight[1][0] = iRight1_AW_AWREADY;
	assign InterconnectModule_L78F48T106_Enumerable[0] = TransactionDetectors0_oTransaction;
	assign ActiveTransactions[0] = InterconnectModule_L78F48T106_Enumerable[0];
	assign currentTXEnd = InterconnectModule_L86F40T75_AXI4WriteInteconnectModule_L44F61T101_Expr;
	assign muxLeft[0] = DuplexMux_oLeft[0];
	assign muxLeft[1] = DuplexMux_oLeft[1];
	assign muxLeftData_AW_AWID = DuplexMux_oMuxLeftData[7:0];
	assign muxLeftData_AW_AWADDR = DuplexMux_oMuxLeftData[39:8];
	assign muxLeftData_AW_AWLEN = DuplexMux_oMuxLeftData[47:40];
	assign muxLeftData_AW_AWSIZE = DuplexMux_oMuxLeftData[50:48];
	assign muxLeftData_AW_AWBURST = DuplexMux_oMuxLeftData[52:51];
	assign muxLeftData_AW_AWLOCK = DuplexMux_oMuxLeftData[54:53];
	assign muxLeftData_AW_AWCACHE = DuplexMux_oMuxLeftData[58:55];
	assign muxLeftData_AW_AWPROT = DuplexMux_oMuxLeftData[61:59];
	assign muxLeftData_AW_AWQOS = DuplexMux_oMuxLeftData[65:62];
	assign muxLeftData_AW_AWREGION = DuplexMux_oMuxLeftData[73:66];
	assign muxLeftData_AW_AWUSER = DuplexMux_oMuxLeftData[81:74];
	assign muxLeftData_AW_AWVALID = DuplexMux_oMuxLeftData[82];
	assign muxLeftData_W_WID = DuplexMux_oMuxLeftData[90:83];
	assign muxLeftData_W_WDATA[0] = DuplexMux_oMuxLeftData[98:91];
	assign muxLeftData_W_WDATA[1] = DuplexMux_oMuxLeftData[106:99];
	assign muxLeftData_W_WDATA[2] = DuplexMux_oMuxLeftData[114:107];
	assign muxLeftData_W_WDATA[3] = DuplexMux_oMuxLeftData[122:115];
	assign muxLeftData_W_WSTRB = DuplexMux_oMuxLeftData[126:123];
	assign muxLeftData_W_WLAST = DuplexMux_oMuxLeftData[127];
	assign muxLeftData_W_WUSER = DuplexMux_oMuxLeftData[135:128];
	assign muxLeftData_W_WVALID = DuplexMux_oMuxLeftData[136];
	assign muxLeftData_B_BREADY = DuplexMux_oMuxLeftData[137];
	assign muxRight[0] = DuplexMux_oRight[0];
	assign muxRightData_AW_AWREADY = DuplexMux_oMuxRightData[0];
	assign muxRightData_B_BID = DuplexMux_oMuxRightData[8:1];
	assign muxRightData_B_BRESP = DuplexMux_oMuxRightData[10:9];
	assign muxRightData_B_BUSER = DuplexMux_oMuxRightData[18:11];
	assign muxRightData_B_BVALID = DuplexMux_oMuxRightData[19];
	assign muxRightData_W_WREADY = DuplexMux_oMuxRightData[20];
	assign rightAddr = axiRightAddr;
	assign InterconnectModule_L80F42T100_Enumerable[0] = TransactionDetectors0_oTransaction;
	assign Transactions[0] = InterconnectModule_L80F42T100_Enumerable[0];
	assign InterconnectModule_L89F37T148_Enumerable[0] = InterconnectModule_L89F37T148_0_InterconnectModule_L89F74T137_Expr;
	assign TXBegin[0] = InterconnectModule_L89F37T148_Enumerable[0];
	assign InterconnectModule_L79F45T106_Enumerable[0] = TransactionDetectors0_oWaitForRestart;
	assign WaitForRestarts[0] = InterconnectModule_L79F45T106_Enumerable[0];
	assign axiRightAddr = AXI4WriteInteconnectModule_L33F37T75_Index;
	assign rangeDetectorActive = AXI4WriteInteconnectModule_L36F37T79_Index;
	assign AXI4WriteInteconnectModule_L35F44T95_Enumerable[0] = rangeDetectorArray0_oActive;
	assign rangeDetectorActiveFlags[0] = AXI4WriteInteconnectModule_L35F44T95_Enumerable[0];
	assign AXI4WriteInteconnectModule_L32F47T97_Enumerable[0] = rangeDetectorArray0_oIndex;
	assign rangeDetectorIndexes[0] = AXI4WriteInteconnectModule_L32F47T97_Enumerable[0];
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object[0] = InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object[1] = InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object[2] = InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4WriteInteconnectModule_L44F61T101_Expr;
	assign TransactionDetectors0_iTXEnd = InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object[2];
	assign TransactionDetectors0_iTXBegin = InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object[1];
	assign TransactionDetectors0_iRestart = InterconnectModule_L99F13L109T14_0_InterconnectModule_L102F21L107T22_Object[0];
	assign InterconnectModule_L112F17L115T18_Object[0:0] = TXBegin[0];
	assign Encoder_iValues[0] = InterconnectModule_L112F17L115T18_Object[0];
	assign InterconnectModule_L119F17L127T18_Object[137:0] = Inputs_iLeft[0];
	assign InterconnectModule_L119F17L127T18_Object[138:138] = State_leftAddr;
	assign InterconnectModule_L119F17L127T18_Object[139] = State_leftAddrValid;
	assign InterconnectModule_L119F17L127T18_Object[181:140] = {
		Inputs_iRight[1],
		Inputs_iRight[0]
	}
	;
	assign InterconnectModule_L119F17L127T18_Object[182:182] = State_rightAddr;
	assign InterconnectModule_L119F17L127T18_Object[183] = State_rightAddrValid;
	assign DuplexMux_iRightAddrValid = InterconnectModule_L119F17L127T18_Object[183];
	assign DuplexMux_iRightAddr = InterconnectModule_L119F17L127T18_Object[182:182];
	assign DuplexMux_iRight[1] = InterconnectModule_L119F17L127T18_Object[181:161];
	assign DuplexMux_iRight[0] = InterconnectModule_L119F17L127T18_Object[160:140];
	assign DuplexMux_iLeftAddrValid = InterconnectModule_L119F17L127T18_Object[139];
	assign DuplexMux_iLeftAddr = InterconnectModule_L119F17L127T18_Object[138:138];
	assign DuplexMux_iLeft[0] = InterconnectModule_L119F17L127T18_Object[137:0];
	assign AXI4WriteInteconnectModule_L23F13L29T14_0_AXI4WriteInteconnectModule_L25F54L28T18_Object[31:0] = Inputs_iLeft[0][39:8];
	assign rangeDetectorArray0_iAddress = AXI4WriteInteconnectModule_L23F13L29T14_0_AXI4WriteInteconnectModule_L25F54L28T18_Object[31:0];
	assign M2S0_B_BREADY = muxLeft[0][137];
	assign M2S0_W_WVALID = muxLeft[0][136];
	assign M2S0_W_WUSER = muxLeft[0][135:128];
	assign M2S0_W_WLAST = muxLeft[0][127];
	assign M2S0_W_WSTRB = muxLeft[0][126:123];
	assign M2S0_W_WDATA3 = muxLeft[0][122:115];
	assign M2S0_W_WDATA2 = muxLeft[0][114:107];
	assign M2S0_W_WDATA1 = muxLeft[0][106:99];
	assign M2S0_W_WDATA0 = muxLeft[0][98:91];
	assign M2S0_W_WID = muxLeft[0][90:83];
	assign M2S0_AW_AWVALID = muxLeft[0][82];
	assign M2S0_AW_AWUSER = muxLeft[0][81:74];
	assign M2S0_AW_AWREGION = muxLeft[0][73:66];
	assign M2S0_AW_AWQOS = muxLeft[0][65:62];
	assign M2S0_AW_AWPROT = muxLeft[0][61:59];
	assign M2S0_AW_AWCACHE = muxLeft[0][58:55];
	assign M2S0_AW_AWLOCK = muxLeft[0][54:53];
	assign M2S0_AW_AWBURST = muxLeft[0][52:51];
	assign M2S0_AW_AWSIZE = muxLeft[0][50:48];
	assign M2S0_AW_AWLEN = muxLeft[0][47:40];
	assign M2S0_AW_AWADDR = muxLeft[0][39:8];
	assign M2S0_AW_AWID = muxLeft[0][7:0];
	assign M2S1_B_BREADY = muxLeft[1][137];
	assign M2S1_W_WVALID = muxLeft[1][136];
	assign M2S1_W_WUSER = muxLeft[1][135:128];
	assign M2S1_W_WLAST = muxLeft[1][127];
	assign M2S1_W_WSTRB = muxLeft[1][126:123];
	assign M2S1_W_WDATA3 = muxLeft[1][122:115];
	assign M2S1_W_WDATA2 = muxLeft[1][114:107];
	assign M2S1_W_WDATA1 = muxLeft[1][106:99];
	assign M2S1_W_WDATA0 = muxLeft[1][98:91];
	assign M2S1_W_WID = muxLeft[1][90:83];
	assign M2S1_AW_AWVALID = muxLeft[1][82];
	assign M2S1_AW_AWUSER = muxLeft[1][81:74];
	assign M2S1_AW_AWREGION = muxLeft[1][73:66];
	assign M2S1_AW_AWQOS = muxLeft[1][65:62];
	assign M2S1_AW_AWPROT = muxLeft[1][61:59];
	assign M2S1_AW_AWCACHE = muxLeft[1][58:55];
	assign M2S1_AW_AWLOCK = muxLeft[1][54:53];
	assign M2S1_AW_AWBURST = muxLeft[1][52:51];
	assign M2S1_AW_AWSIZE = muxLeft[1][50:48];
	assign M2S1_AW_AWLEN = muxLeft[1][47:40];
	assign M2S1_AW_AWADDR = muxLeft[1][39:8];
	assign M2S1_AW_AWID = muxLeft[1][7:0];
	assign S2M0_W_WREADY = muxRight[0][20];
	assign S2M0_B_BVALID = muxRight[0][19];
	assign S2M0_B_BUSER = muxRight[0][18:11];
	assign S2M0_B_BRESP = muxRight[0][10:9];
	assign S2M0_B_BID = muxRight[0][8:1];
	assign S2M0_AW_AWREADY = muxRight[0][0];
	assign oEncoderHasActive = Encoder_HasActive;
	assign oLeft0_B_BREADY = muxLeft[0][137];
	assign oLeft0_W_WVALID = muxLeft[0][136];
	assign oLeft0_W_WUSER = muxLeft[0][135:128];
	assign oLeft0_W_WLAST = muxLeft[0][127];
	assign oLeft0_W_WSTRB = muxLeft[0][126:123];
	assign oLeft0_W_WDATA3 = muxLeft[0][122:115];
	assign oLeft0_W_WDATA2 = muxLeft[0][114:107];
	assign oLeft0_W_WDATA1 = muxLeft[0][106:99];
	assign oLeft0_W_WDATA0 = muxLeft[0][98:91];
	assign oLeft0_W_WID = muxLeft[0][90:83];
	assign oLeft0_AW_AWVALID = muxLeft[0][82];
	assign oLeft0_AW_AWUSER = muxLeft[0][81:74];
	assign oLeft0_AW_AWREGION = muxLeft[0][73:66];
	assign oLeft0_AW_AWQOS = muxLeft[0][65:62];
	assign oLeft0_AW_AWPROT = muxLeft[0][61:59];
	assign oLeft0_AW_AWCACHE = muxLeft[0][58:55];
	assign oLeft0_AW_AWLOCK = muxLeft[0][54:53];
	assign oLeft0_AW_AWBURST = muxLeft[0][52:51];
	assign oLeft0_AW_AWSIZE = muxLeft[0][50:48];
	assign oLeft0_AW_AWLEN = muxLeft[0][47:40];
	assign oLeft0_AW_AWADDR = muxLeft[0][39:8];
	assign oLeft0_AW_AWID = muxLeft[0][7:0];
	assign oLeft1_B_BREADY = muxLeft[1][137];
	assign oLeft1_W_WVALID = muxLeft[1][136];
	assign oLeft1_W_WUSER = muxLeft[1][135:128];
	assign oLeft1_W_WLAST = muxLeft[1][127];
	assign oLeft1_W_WSTRB = muxLeft[1][126:123];
	assign oLeft1_W_WDATA3 = muxLeft[1][122:115];
	assign oLeft1_W_WDATA2 = muxLeft[1][114:107];
	assign oLeft1_W_WDATA1 = muxLeft[1][106:99];
	assign oLeft1_W_WDATA0 = muxLeft[1][98:91];
	assign oLeft1_W_WID = muxLeft[1][90:83];
	assign oLeft1_AW_AWVALID = muxLeft[1][82];
	assign oLeft1_AW_AWUSER = muxLeft[1][81:74];
	assign oLeft1_AW_AWREGION = muxLeft[1][73:66];
	assign oLeft1_AW_AWQOS = muxLeft[1][65:62];
	assign oLeft1_AW_AWPROT = muxLeft[1][61:59];
	assign oLeft1_AW_AWCACHE = muxLeft[1][58:55];
	assign oLeft1_AW_AWLOCK = muxLeft[1][54:53];
	assign oLeft1_AW_AWBURST = muxLeft[1][52:51];
	assign oLeft1_AW_AWSIZE = muxLeft[1][50:48];
	assign oLeft1_AW_AWLEN = muxLeft[1][47:40];
	assign oLeft1_AW_AWADDR = muxLeft[1][39:8];
	assign oLeft1_AW_AWID = muxLeft[1][7:0];
	assign oNextRightAddr = rightAddr;
	assign AXI4WriteInteconnectModule_1x2_L22F47T98_Enumerable[0] = rangeDetectorArray0_oActive;
	assign oRangeDetectorActive0 = AXI4WriteInteconnectModule_1x2_L22F47T98_Enumerable[0];
	assign AXI4WriteInteconnectModule_1x2_L21F53T103_Enumerable[0] = rangeDetectorArray0_oIndex;
	assign oRangeDetectorIndex0 = AXI4WriteInteconnectModule_1x2_L21F53T103_Enumerable[0];
	assign oRight0_W_WREADY = muxRight[0][20];
	assign oRight0_B_BVALID = muxRight[0][19];
	assign oRight0_B_BUSER = muxRight[0][18:11];
	assign oRight0_B_BRESP = muxRight[0][10:9];
	assign oRight0_B_BID = muxRight[0][8:1];
	assign oRight0_AW_AWREADY = muxRight[0][0];
	assign oStateRightAddr = State_rightAddr;
	assign oStateRightAddrValid = State_rightAddrValid;
	assign oTransactions0 = Transactions[0];
	assign oTXBegin0 = TXBegin[0];
	assign DuplexMux_iLeft0_DuplexMux_iLeft_HardLink = DuplexMux_iLeft[0];
	assign DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink = DuplexMux_iLeftAddr;
	assign DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink = DuplexMux_iLeftAddrValid;
	assign DuplexMux_iRight0_DuplexMux_iRight_HardLink = DuplexMux_iRight[0];
	assign DuplexMux_iRight1_DuplexMux_iRight_HardLink = DuplexMux_iRight[1];
	assign DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink = DuplexMux_iRightAddr;
	assign DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink = DuplexMux_iRightAddrValid;
	assign DuplexMux_oLeft[0] = DuplexMux_oLeft0_DuplexMux_oLeft_HardLink;
	assign DuplexMux_oLeft[1] = DuplexMux_oLeft1_DuplexMux_oLeft_HardLink;
	assign DuplexMux_oMuxLeftData = DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink;
	assign DuplexMux_oMuxRightData = DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink;
	assign DuplexMux_oRight[0] = DuplexMux_oRight0_DuplexMux_oRight_HardLink;
	assign Encoder_iValues0_Encoder_iValues_HardLink = Encoder_iValues[0];
	assign Encoder_HasActive = Encoder_HasActive_Encoder_HasActive_HardLink;
	assign Encoder_MSBIndex = Encoder_MSBIndex_Encoder_MSBIndex_HardLink;
	assign Encoder_MSBValue = Encoder_MSBValue_Encoder_MSBValue_HardLink;
	assign TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink = TransactionDetectors0_iRestart;
	assign TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink = TransactionDetectors0_iTXBegin;
	assign TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink = TransactionDetectors0_iTXEnd;
	assign TransactionDetectors0_oTransaction = TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink;
	assign TransactionDetectors0_oWaitForRestart = TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink;
	assign rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink = rangeDetectorArray0_iAddress;
	assign rangeDetectorArray0_oActive = rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink;
	assign rangeDetectorArray0_oIndex = rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index = TXBegin[0];
	assign InterconnectModule_L89F37T148_0_InterconnectModule_L89F111T137_Index = WaitForRestarts[0];
	assign AXI4WriteInteconnectModule_L36F37T79_Index = rangeDetectorActiveFlags[Encoder_MSBIndex];
	assign AXI4WriteInteconnectModule_L33F37T75_Index = rangeDetectorIndexes[Encoder_MSBIndex];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
