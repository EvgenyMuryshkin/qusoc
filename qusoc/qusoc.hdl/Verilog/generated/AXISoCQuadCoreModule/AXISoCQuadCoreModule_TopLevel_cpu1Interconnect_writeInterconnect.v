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
// System configuration name is AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [137:0] iLeft0,
	input wire [20:0] iRight0,
	input wire [20:0] iRight1,
	input wire [20:0] iRight2,
	input wire [20:0] iRight3,
	output wire [137:0] M2S0,
	output wire [137:0] M2S1,
	output wire [137:0] M2S2,
	output wire [137:0] M2S3,
	output wire [20:0] S2M0
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
	wire signed [3: 0] rightCount = 4'b0100;
	wire InterconnectModule_L100F13L111T14_0_leftIndex = 1'b0;
	wire AXI4WriteInteconnectModule_L22F13L28T14_0_i = 1'b0;
	wire InterconnectModule_L134F9L151T10_InterconnectModule_L136F13L142T14_InterconnectModule_L138F17L141T18_InterconnectModule_L139F47T52_Expr = 1'b0;
	wire InterconnectModule_L134F9L151T10_InterconnectModule_L136F13L142T14_InterconnectModule_L138F17L141T18_InterconnectModule_L140F48T53_Expr = 1'b0;
	wire InterconnectModule_L134F9L151T10_InterconnectModule_L144F13L150T14_InterconnectModule_L146F43T47_Expr = 1'b1;
	wire InterconnectModule_L134F9L151T10_InterconnectModule_L144F13L150T14_InterconnectModule_L149F44T48_Expr = 1'b1;
	reg [0: 0] NextState_leftAddr;
	reg NextState_leftAddrValid;
	reg [1: 0] NextState_rightAddr;
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
	wire [1: 0] rightAddr;
	wire [1: 0] axiRightAddr;
	wire rangeDetectorActive;
	wire [0: 0] DuplexMux_iLeftAddr;
	wire DuplexMux_iLeftAddrValid;
	wire [1: 0] DuplexMux_iRightAddr;
	wire DuplexMux_iRightAddrValid;
	wire [137: 0] DuplexMux_oMuxLeftData;
	wire [20: 0] DuplexMux_oMuxRightData;
	wire Encoder_HasActive;
	wire [0: 0] Encoder_MSBIndex;
	wire [0: 0] Encoder_MSBValue;
	wire TransactionDetectors0_iActive;
	wire TransactionDetectors0_iRestart;
	wire TransactionDetectors0_iTXBegin;
	wire TransactionDetectors0_iTXEnd;
	wire TransactionDetectors0_oTransaction;
	wire TransactionDetectors0_oTXBegin;
	wire TransactionDetectors0_oWaitForRestart;
	wire [31: 0] rangeDetectorArray0_iAddress;
	wire rangeDetectorArray0_oActive;
	wire [1: 0] rangeDetectorArray0_oIndex;
	wire [1: 0] AXI4WriteInteconnectModule_L32F37T75_Index;
	wire AXI4WriteInteconnectModule_L35F37T79_Index;
	wire [3: 0] InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F101T138_Index;
	wire [0: 0] InterconnectModule_L114F17L117T18_Object;
	wire [226: 0] InterconnectModule_L121F17L129T18_Object;
	wire [31: 0] AXI4WriteInteconnectModule_L22F13L28T14_0_AXI4WriteInteconnectModule_L24F54L27T18_Object;
	wire [137: 0] DuplexMux_iLeft0_DuplexMux_iLeft_HardLink;
	wire [0: 0] DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink;
	wire DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink;
	wire [20: 0] DuplexMux_iRight0_DuplexMux_iRight_HardLink;
	wire [20: 0] DuplexMux_iRight1_DuplexMux_iRight_HardLink;
	wire [20: 0] DuplexMux_iRight2_DuplexMux_iRight_HardLink;
	wire [20: 0] DuplexMux_iRight3_DuplexMux_iRight_HardLink;
	wire [1: 0] DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink;
	wire DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink;
	wire [137: 0] DuplexMux_oLeft0_DuplexMux_oLeft_HardLink;
	wire [137: 0] DuplexMux_oLeft1_DuplexMux_oLeft_HardLink;
	wire [137: 0] DuplexMux_oLeft2_DuplexMux_oLeft_HardLink;
	wire [137: 0] DuplexMux_oLeft3_DuplexMux_oLeft_HardLink;
	wire [137: 0] DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink;
	wire [20: 0] DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink;
	wire [20: 0] DuplexMux_oRight0_DuplexMux_oRight_HardLink;
	wire Encoder_iValues0_Encoder_iValues_HardLink;
	wire Encoder_HasActive_Encoder_HasActive_HardLink;
	wire [0: 0] Encoder_MSBIndex_Encoder_MSBIndex_HardLink;
	wire [0: 0] Encoder_MSBValue_Encoder_MSBValue_HardLink;
	wire TransactionDetectors0_iActive_TransactionDetectors0_iActive_HardLink;
	wire TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink;
	wire TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink;
	wire TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink;
	wire TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink;
	wire TransactionDetectors0_oTXBegin_TransactionDetectors0_oTXBegin_HardLink;
	wire TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink;
	wire [31: 0] rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink;
	wire rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink;
	wire [1: 0] rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink;
	reg [0: 0] State_leftAddr = 1'b0;
	wire [0: 0] State_leftAddrDefault = 1'b0;
	reg State_leftAddrValid = 1'b0;
	wire State_leftAddrValidDefault = 1'b0;
	reg [1: 0] State_rightAddr = 2'b00;
	wire [1: 0] State_rightAddrDefault = 2'b00;
	reg State_rightAddrValid = 1'b0;
	wire State_rightAddrValidDefault = 1'b0;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr_1;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr_2;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr_1;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr_2;
	wire [0: 0] InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr;
	wire [0: 0] InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr_1;
	wire [0: 0] InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr_2;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr_1;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr_2;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L107F36T54_Expr;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L107F36T54_Expr_1;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr_1;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr_2;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr_1;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr_2;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr_1;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr_2;
	wire InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_Expr;
	wire signed [1: 0] InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_ExprLhs;
	wire signed [1: 0] InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_ExprRhs;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_Expr;
	wire signed [1: 0] InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_ExprLhs;
	wire signed [1: 0] InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_ExprRhs;
	wire InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_Expr;
	wire signed [1: 0] InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_ExprLhs;
	wire signed [1: 0] InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_ExprRhs;
	wire [137 : 0] Inputs_iLeft [0 : 0];
	wire [20 : 0] Inputs_iRight [0 : 3];
	wire ActiveTransactions [0 : 0];
	wire [137 : 0] muxLeft [0 : 3];
	wire [7 : 0] muxLeftData_W_WDATA [0 : 3];
	wire [20 : 0] muxRight [0 : 0];
	wire Transactions [0 : 0];
	wire TXBegin [0 : 0];
	wire WaitForRestarts [0 : 0];
	wire rangeDetectorActiveFlags [0 : 0];
	wire [1 : 0] rangeDetectorIndexes [0 : 0];
	wire [137 : 0] DuplexMux_iLeft [0 : 0];
	wire [20 : 0] DuplexMux_iRight [0 : 3];
	wire [137 : 0] DuplexMux_oLeft [0 : 3];
	wire [20 : 0] DuplexMux_oRight [0 : 0];
	wire Encoder_iValues [0 : 0];
	wire InterconnectModule_L78F47T105_Enumerable [0 : 0];
	wire InterconnectModule_L80F41T99_Enumerable [0 : 0];
	wire InterconnectModule_L81F36T108_Enumerable [0 : 0];
	wire InterconnectModule_L79F44T105_Enumerable [0 : 0];
	wire AXI4WriteInteconnectModule_L34F44T95_Enumerable [0 : 0];
	wire [1 : 0] AXI4WriteInteconnectModule_L31F47T97_Enumerable [0 : 0];
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
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
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_Expr = InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_ExprLhs == InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_ExprRhs ? 1'b1 : 1'b0;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_Expr = InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_ExprLhs == InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_ExprRhs ? 1'b1 : 1'b0;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_Expr = InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_ExprLhs == InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_ExprRhs ? 1'b1 : 1'b0;
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr = InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr_1 & InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr_2;
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr = InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr_1 & InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr_2;
	assign InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr = InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr_1 | InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr_2;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr = InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr_1 & InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr_2;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L107F36T54_Expr = ~InterconnectModule_L100F13L111T14_0_InterconnectModule_L107F36T54_Expr_1;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr = InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr_1 & InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr_2;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr = InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr_1 & InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr_2;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr = InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr_1 & InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr_2;
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_DuplexMux
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_DuplexMux
	(
		// [BEGIN USER MAP FOR DuplexMux]
		// [END USER MAP FOR DuplexMux]
		.iLeft0 (DuplexMux_iLeft0_DuplexMux_iLeft_HardLink),
		.iLeftAddr (DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink),
		.iLeftAddrValid (DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink),
		.iRight0 (DuplexMux_iRight0_DuplexMux_iRight_HardLink),
		.iRight1 (DuplexMux_iRight1_DuplexMux_iRight_HardLink),
		.iRight2 (DuplexMux_iRight2_DuplexMux_iRight_HardLink),
		.iRight3 (DuplexMux_iRight3_DuplexMux_iRight_HardLink),
		.iRightAddr (DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink),
		.iRightAddrValid (DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink),
		.oLeft0 (DuplexMux_oLeft0_DuplexMux_oLeft_HardLink),
		.oLeft1 (DuplexMux_oLeft1_DuplexMux_oLeft_HardLink),
		.oLeft2 (DuplexMux_oLeft2_DuplexMux_oLeft_HardLink),
		.oLeft3 (DuplexMux_oLeft3_DuplexMux_oLeft_HardLink),
		.oMuxLeftData (DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink),
		.oMuxRightData (DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink),
		.oRight0 (DuplexMux_oRight0_DuplexMux_oRight_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_Encoder
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_Encoder
	(
		// [BEGIN USER MAP FOR Encoder]
		// [END USER MAP FOR Encoder]
		.iValues0 (Encoder_iValues0_Encoder_iValues_HardLink),
		.HasActive (Encoder_HasActive_Encoder_HasActive_HardLink),
		.MSBIndex (Encoder_MSBIndex_Encoder_MSBIndex_HardLink),
		.MSBValue (Encoder_MSBValue_Encoder_MSBValue_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_TransactionDetectors0
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_TransactionDetectors0
	(
		// [BEGIN USER MAP FOR TransactionDetectors0]
		// [END USER MAP FOR TransactionDetectors0]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.iActive (TransactionDetectors0_iActive_TransactionDetectors0_iActive_HardLink),
		.iRestart (TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink),
		.iTXBegin (TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink),
		.iTXEnd (TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink),
		.oTransaction (TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink),
		.oTXBegin (TransactionDetectors0_oTXBegin_TransactionDetectors0_oTXBegin_HardLink),
		.oWaitForRestart (TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_rangeDetectorArray0
	AXISoCQuadCoreModule_TopLevel_cpu1Interconnect_writeInterconnect_rangeDetectorArray0
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
				NextState_leftAddrValid = InterconnectModule_L134F9L151T10_InterconnectModule_L136F13L142T14_InterconnectModule_L138F17L141T18_InterconnectModule_L139F47T52_Expr;
				NextState_rightAddrValid = InterconnectModule_L134F9L151T10_InterconnectModule_L136F13L142T14_InterconnectModule_L138F17L141T18_InterconnectModule_L140F48T53_Expr;
			end
		end
		else if ((Encoder_HasActive == 1))
		begin
			NextState_leftAddr = Encoder_MSBIndex;
			NextState_leftAddrValid = InterconnectModule_L134F9L151T10_InterconnectModule_L144F13L150T14_InterconnectModule_L146F43T47_Expr;
			NextState_rightAddr = rightAddr;
			NextState_rightAddrValid = InterconnectModule_L134F9L151T10_InterconnectModule_L144F13L150T14_InterconnectModule_L149F44T48_Expr;
		end
	end
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_ExprLhs = {
		1'b0,
		State_leftAddr
	}
	;
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_ExprRhs = {
		1'b0,
		State_leftAddr
	}
	;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_ExprLhs = {
		1'b0,
		Encoder_MSBIndex
	}
	;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_ExprRhs = {
		1'b0,
		InterconnectModule_L100F13L111T14_0_leftIndex
	}
	;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_ExprLhs = {
		1'b0,
		State_leftAddr
	}
	;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_ExprRhs = {
		1'b0,
		InterconnectModule_L100F13L111T14_0_leftIndex
	}
	;
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr_1 = InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr;
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr_2 = InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F122T151_Expr;
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr_1 = Inputs_iLeft[State_leftAddr][137];
	assign InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T118_Expr_2 = muxRightData_B_BVALID;
	assign InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr_1[0] = TransactionDetectors0_oTXBegin;
	assign InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr_2[0] = TransactionDetectors0_oTransaction;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr_1 = Encoder_HasActive;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr_2 = InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F56T85_Expr;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L107F36T54_Expr_1 = Encoder_HasActive;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr_1 = Inputs_iLeft[0][82];
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr_2 = InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F101T138_Index;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr_1 = InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr_2 = InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F122T151_Expr;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr_1 = Inputs_iLeft[0][137];
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T118_Expr_2 = muxRightData_B_BVALID;
	assign Inputs_iLeft[0] = iLeft0;
	assign Inputs_iRight[0] = iRight0;
	assign Inputs_iRight[1] = iRight1;
	assign Inputs_iRight[2] = iRight2;
	assign Inputs_iRight[3] = iRight3;
	assign InterconnectModule_L78F47T105_Enumerable[0] = TransactionDetectors0_oTransaction;
	assign ActiveTransactions[0] = InterconnectModule_L78F47T105_Enumerable[0];
	assign currentTXEnd = InterconnectModule_L87F40T91_AXI4WriteInteconnectModule_L43F78T151_Expr;
	assign muxLeft[0] = DuplexMux_oLeft[0];
	assign muxLeft[1] = DuplexMux_oLeft[1];
	assign muxLeft[2] = DuplexMux_oLeft[2];
	assign muxLeft[3] = DuplexMux_oLeft[3];
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
	assign InterconnectModule_L80F41T99_Enumerable[0] = TransactionDetectors0_oTransaction;
	assign Transactions[0] = InterconnectModule_L80F41T99_Enumerable[0];
	assign InterconnectModule_L81F36T108_Enumerable[0] = InterconnectModule_L81F36T108_TransactionDetectors0_InterconnectModule_L81F69T97_Expr;
	assign TXBegin[0] = InterconnectModule_L81F36T108_Enumerable[0];
	assign InterconnectModule_L79F44T105_Enumerable[0] = TransactionDetectors0_oWaitForRestart;
	assign WaitForRestarts[0] = InterconnectModule_L79F44T105_Enumerable[0];
	assign axiRightAddr = AXI4WriteInteconnectModule_L32F37T75_Index;
	assign rangeDetectorActive = AXI4WriteInteconnectModule_L35F37T79_Index;
	assign AXI4WriteInteconnectModule_L34F44T95_Enumerable[0] = rangeDetectorArray0_oActive;
	assign rangeDetectorActiveFlags[0] = AXI4WriteInteconnectModule_L34F44T95_Enumerable[0];
	assign AXI4WriteInteconnectModule_L31F47T97_Enumerable[0] = rangeDetectorArray0_oIndex;
	assign rangeDetectorIndexes[0] = AXI4WriteInteconnectModule_L31F47T97_Enumerable[0];
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[0] = InterconnectModule_L100F13L111T14_0_InterconnectModule_L108F35T85_Expr;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[1] = InterconnectModule_L100F13L111T14_0_InterconnectModule_L107F36T54_Expr;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[2] = InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F80T138_Expr;
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[3] = InterconnectModule_L100F13L111T14_0_InterconnectModule_L106F34T75_AXI4WriteInteconnectModule_L43F78T151_Expr;
	assign TransactionDetectors0_iTXEnd = InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[3];
	assign TransactionDetectors0_iTXBegin = InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[2];
	assign TransactionDetectors0_iRestart = InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[1];
	assign TransactionDetectors0_iActive = InterconnectModule_L100F13L111T14_0_InterconnectModule_L103F21L109T22_Object[0];
	assign InterconnectModule_L114F17L117T18_Object[0:0] = TXBegin[0];
	assign Encoder_iValues[0] = InterconnectModule_L114F17L117T18_Object[0];
	assign InterconnectModule_L121F17L129T18_Object[137:0] = Inputs_iLeft[0];
	assign InterconnectModule_L121F17L129T18_Object[138:138] = State_leftAddr;
	assign InterconnectModule_L121F17L129T18_Object[139] = State_leftAddrValid;
	assign InterconnectModule_L121F17L129T18_Object[223:140] = {
		Inputs_iRight[3],
		Inputs_iRight[2],
		Inputs_iRight[1],
		Inputs_iRight[0]
	}
	;
	assign InterconnectModule_L121F17L129T18_Object[225:224] = State_rightAddr;
	assign InterconnectModule_L121F17L129T18_Object[226] = State_rightAddrValid;
	assign DuplexMux_iRightAddrValid = InterconnectModule_L121F17L129T18_Object[226];
	assign DuplexMux_iRightAddr = InterconnectModule_L121F17L129T18_Object[225:224];
	assign DuplexMux_iRight[3] = InterconnectModule_L121F17L129T18_Object[223:203];
	assign DuplexMux_iRight[2] = InterconnectModule_L121F17L129T18_Object[202:182];
	assign DuplexMux_iRight[1] = InterconnectModule_L121F17L129T18_Object[181:161];
	assign DuplexMux_iRight[0] = InterconnectModule_L121F17L129T18_Object[160:140];
	assign DuplexMux_iLeftAddrValid = InterconnectModule_L121F17L129T18_Object[139];
	assign DuplexMux_iLeftAddr = InterconnectModule_L121F17L129T18_Object[138:138];
	assign DuplexMux_iLeft[0] = InterconnectModule_L121F17L129T18_Object[137:0];
	assign AXI4WriteInteconnectModule_L22F13L28T14_0_AXI4WriteInteconnectModule_L24F54L27T18_Object[31:0] = Inputs_iLeft[0][39:8];
	assign rangeDetectorArray0_iAddress = AXI4WriteInteconnectModule_L22F13L28T14_0_AXI4WriteInteconnectModule_L24F54L27T18_Object[31:0];
	assign M2S0 = muxLeft[0];
	assign M2S1 = muxLeft[1];
	assign M2S2 = muxLeft[2];
	assign M2S3 = muxLeft[3];
	assign S2M0 = muxRight[0];
	assign DuplexMux_iLeft0_DuplexMux_iLeft_HardLink = DuplexMux_iLeft[0];
	assign DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink = DuplexMux_iLeftAddr;
	assign DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink = DuplexMux_iLeftAddrValid;
	assign DuplexMux_iRight0_DuplexMux_iRight_HardLink = DuplexMux_iRight[0];
	assign DuplexMux_iRight1_DuplexMux_iRight_HardLink = DuplexMux_iRight[1];
	assign DuplexMux_iRight2_DuplexMux_iRight_HardLink = DuplexMux_iRight[2];
	assign DuplexMux_iRight3_DuplexMux_iRight_HardLink = DuplexMux_iRight[3];
	assign DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink = DuplexMux_iRightAddr;
	assign DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink = DuplexMux_iRightAddrValid;
	assign DuplexMux_oLeft[0] = DuplexMux_oLeft0_DuplexMux_oLeft_HardLink;
	assign DuplexMux_oLeft[1] = DuplexMux_oLeft1_DuplexMux_oLeft_HardLink;
	assign DuplexMux_oLeft[2] = DuplexMux_oLeft2_DuplexMux_oLeft_HardLink;
	assign DuplexMux_oLeft[3] = DuplexMux_oLeft3_DuplexMux_oLeft_HardLink;
	assign DuplexMux_oMuxLeftData = DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink;
	assign DuplexMux_oMuxRightData = DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink;
	assign DuplexMux_oRight[0] = DuplexMux_oRight0_DuplexMux_oRight_HardLink;
	assign Encoder_iValues0_Encoder_iValues_HardLink = Encoder_iValues[0];
	assign Encoder_HasActive = Encoder_HasActive_Encoder_HasActive_HardLink;
	assign Encoder_MSBIndex = Encoder_MSBIndex_Encoder_MSBIndex_HardLink;
	assign Encoder_MSBValue = Encoder_MSBValue_Encoder_MSBValue_HardLink;
	assign TransactionDetectors0_iActive_TransactionDetectors0_iActive_HardLink = TransactionDetectors0_iActive;
	assign TransactionDetectors0_iRestart_TransactionDetectors0_iRestart_HardLink = TransactionDetectors0_iRestart;
	assign TransactionDetectors0_iTXBegin_TransactionDetectors0_iTXBegin_HardLink = TransactionDetectors0_iTXBegin;
	assign TransactionDetectors0_iTXEnd_TransactionDetectors0_iTXEnd_HardLink = TransactionDetectors0_iTXEnd;
	assign TransactionDetectors0_oTransaction = TransactionDetectors0_oTransaction_TransactionDetectors0_oTransaction_HardLink;
	assign TransactionDetectors0_oTXBegin = TransactionDetectors0_oTXBegin_TransactionDetectors0_oTXBegin_HardLink;
	assign TransactionDetectors0_oWaitForRestart = TransactionDetectors0_oWaitForRestart_TransactionDetectors0_oWaitForRestart_HardLink;
	assign rangeDetectorArray0_iAddress_rangeDetectorArray0_iAddress_HardLink = rangeDetectorArray0_iAddress;
	assign rangeDetectorArray0_oActive = rangeDetectorArray0_oActive_rangeDetectorArray0_oActive_HardLink;
	assign rangeDetectorArray0_oIndex = rangeDetectorArray0_oIndex_rangeDetectorArray0_oIndex_HardLink;
	assign AXI4WriteInteconnectModule_L35F37T79_Index = rangeDetectorActiveFlags[Encoder_MSBIndex];
	assign InterconnectModule_L100F13L111T14_0_InterconnectModule_L105F36T79_AXI4WriteInteconnectModule_L44F101T138_Index = rangeDetectorActiveFlags[0];
	assign AXI4WriteInteconnectModule_L32F37T75_Index = rangeDetectorIndexes[Encoder_MSBIndex];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
