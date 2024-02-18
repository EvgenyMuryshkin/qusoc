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
// System configuration name is AXI4ReadInteconnectModule_1x2_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4ReadInteconnectModule_1x2_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] iLeft0_AR_ARID,
	input wire [31:0] iLeft0_AR_ARADDR,
	input wire [7:0] iLeft0_AR_ARLEN,
	input wire [2:0] iLeft0_AR_ARSIZE,
	input wire [1:0] iLeft0_AR_ARBURST,
	input wire [1:0] iLeft0_AR_ARLOCK,
	input wire [3:0] iLeft0_AR_ARCACHE,
	input wire [2:0] iLeft0_AR_ARPROT,
	input wire [3:0] iLeft0_AR_ARQOS,
	input wire [7:0] iLeft0_AR_ARREGION,
	input wire [7:0] iLeft0_AR_ARUSER,
	input wire iLeft0_AR_ARVALID,
	input wire iLeft0_R_RREADY,
	input wire iRight0_AR_ARREADY,
	input wire [7:0] iRight0_R_RID,
	input wire [7:0] iRight0_R_RDATA0,
	input wire [7:0] iRight0_R_RDATA1,
	input wire [7:0] iRight0_R_RDATA2,
	input wire [7:0] iRight0_R_RDATA3,
	input wire [1:0] iRight0_R_RRESP,
	input wire iRight0_R_RLAST,
	input wire [7:0] iRight0_R_RUSER,
	input wire iRight0_R_RVALID,
	input wire iRight1_AR_ARREADY,
	input wire [7:0] iRight1_R_RID,
	input wire [7:0] iRight1_R_RDATA0,
	input wire [7:0] iRight1_R_RDATA1,
	input wire [7:0] iRight1_R_RDATA2,
	input wire [7:0] iRight1_R_RDATA3,
	input wire [1:0] iRight1_R_RRESP,
	input wire iRight1_R_RLAST,
	input wire [7:0] iRight1_R_RUSER,
	input wire iRight1_R_RVALID,
	output wire [7:0] oLeft0_AR_ARID,
	output wire [31:0] oLeft0_AR_ARADDR,
	output wire [7:0] oLeft0_AR_ARLEN,
	output wire [2:0] oLeft0_AR_ARSIZE,
	output wire [1:0] oLeft0_AR_ARBURST,
	output wire [1:0] oLeft0_AR_ARLOCK,
	output wire [3:0] oLeft0_AR_ARCACHE,
	output wire [2:0] oLeft0_AR_ARPROT,
	output wire [3:0] oLeft0_AR_ARQOS,
	output wire [7:0] oLeft0_AR_ARREGION,
	output wire [7:0] oLeft0_AR_ARUSER,
	output wire oLeft0_AR_ARVALID,
	output wire oLeft0_R_RREADY,
	output wire [7:0] oLeft1_AR_ARID,
	output wire [31:0] oLeft1_AR_ARADDR,
	output wire [7:0] oLeft1_AR_ARLEN,
	output wire [2:0] oLeft1_AR_ARSIZE,
	output wire [1:0] oLeft1_AR_ARBURST,
	output wire [1:0] oLeft1_AR_ARLOCK,
	output wire [3:0] oLeft1_AR_ARCACHE,
	output wire [2:0] oLeft1_AR_ARPROT,
	output wire [3:0] oLeft1_AR_ARQOS,
	output wire [7:0] oLeft1_AR_ARREGION,
	output wire [7:0] oLeft1_AR_ARUSER,
	output wire oLeft1_AR_ARVALID,
	output wire oLeft1_R_RREADY,
	output wire [0:0] oNextRightAddr,
	output wire [0:0] oRangeDetectorIndex0,
	output wire oRight0_AR_ARREADY,
	output wire [7:0] oRight0_R_RID,
	output wire [7:0] oRight0_R_RDATA0,
	output wire [7:0] oRight0_R_RDATA1,
	output wire [7:0] oRight0_R_RDATA2,
	output wire [7:0] oRight0_R_RDATA3,
	output wire [1:0] oRight0_R_RRESP,
	output wire oRight0_R_RLAST,
	output wire [7:0] oRight0_R_RUSER,
	output wire oRight0_R_RVALID,
	output wire [0:0] oStateRightAddr,
	output wire oStateRightAddrValid,
	output wire oTransactions0
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
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L137F47T52_Expr = 1'b0;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L134F13L140T14_InterconnectModule_L136F17L139T18_InterconnectModule_L138F48T53_Expr = 1'b0;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L144F43T47_Expr = 1'b1;
	wire InterconnectModule_L132F9L149T10_InterconnectModule_L142F13L148T14_InterconnectModule_L147F44T48_Expr = 1'b1;
	reg [0: 0] NextState_leftAddr;
	reg NextState_leftAddrValid;
	reg [0: 0] NextState_rightAddr;
	reg NextState_rightAddrValid;
	wire currentTXEnd;
	wire [7: 0] muxLeftData_AR_ARID;
	wire [31: 0] muxLeftData_AR_ARADDR;
	wire [7: 0] muxLeftData_AR_ARLEN;
	wire [2: 0] muxLeftData_AR_ARSIZE;
	wire [1: 0] muxLeftData_AR_ARBURST;
	wire [1: 0] muxLeftData_AR_ARLOCK;
	wire [3: 0] muxLeftData_AR_ARCACHE;
	wire [2: 0] muxLeftData_AR_ARPROT;
	wire [3: 0] muxLeftData_AR_ARQOS;
	wire [7: 0] muxLeftData_AR_ARREGION;
	wire [7: 0] muxLeftData_AR_ARUSER;
	wire muxLeftData_AR_ARVALID;
	wire muxLeftData_R_RREADY;
	wire muxRightData_AR_ARREADY;
	wire [7: 0] muxRightData_R_RID;
	wire [1: 0] muxRightData_R_RRESP;
	wire muxRightData_R_RLAST;
	wire [7: 0] muxRightData_R_RUSER;
	wire muxRightData_R_RVALID;
	wire [0: 0] rightAddr;
	wire [0: 0] axiRightAddr;
	wire rangeDetectorActive;
	wire [0: 0] DuplexMux_iLeftAddr;
	wire DuplexMux_iLeftAddrValid;
	wire [0: 0] DuplexMux_iRightAddr;
	wire DuplexMux_iRightAddrValid;
	wire [83: 0] DuplexMux_oMuxLeftData;
	wire [52: 0] DuplexMux_oMuxRightData;
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
	wire [0: 0] AXI4ReadInteconnectModule_L33F37T75_Index;
	wire AXI4ReadInteconnectModule_L36F37T79_Index;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index;
	wire [83: 0] DuplexMux_iLeft0_DuplexMux_iLeft_HardLink;
	wire [0: 0] DuplexMux_iLeftAddr_DuplexMux_iLeftAddr_HardLink;
	wire DuplexMux_iLeftAddrValid_DuplexMux_iLeftAddrValid_HardLink;
	wire [52: 0] DuplexMux_iRight0_DuplexMux_iRight_HardLink;
	wire [52: 0] DuplexMux_iRight1_DuplexMux_iRight_HardLink;
	wire [0: 0] DuplexMux_iRightAddr_DuplexMux_iRightAddr_HardLink;
	wire DuplexMux_iRightAddrValid_DuplexMux_iRightAddrValid_HardLink;
	wire [83: 0] DuplexMux_oLeft0_DuplexMux_oLeft_HardLink;
	wire [83: 0] DuplexMux_oLeft1_DuplexMux_oLeft_HardLink;
	wire [83: 0] DuplexMux_oMuxLeftData_DuplexMux_oMuxLeftData_HardLink;
	wire [52: 0] DuplexMux_oMuxRightData_DuplexMux_oMuxRightData_HardLink;
	wire [52: 0] DuplexMux_oRight0_DuplexMux_oRight_HardLink;
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
	wire InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr;
	wire InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1;
	wire InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr;
	wire InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr;
	wire InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1;
	wire [83 : 0] Inputs_iLeft [0 : 0];
	wire [52 : 0] Inputs_iRight [0 : 1];
	wire ActiveTransactions [0 : 0];
	wire [83 : 0] muxLeft [0 : 1];
	wire [52 : 0] muxRight [0 : 0];
	wire [7 : 0] muxRightData_R_RDATA [0 : 3];
	wire Transactions [0 : 0];
	wire TXBegin [0 : 0];
	wire WaitForRestarts [0 : 0];
	wire rangeDetectorActiveFlags [0 : 0];
	wire [0 : 0] rangeDetectorIndexes [0 : 0];
	wire [83 : 0] DuplexMux_iLeft [0 : 0];
	wire [52 : 0] DuplexMux_iRight [0 : 1];
	wire [83 : 0] DuplexMux_oLeft [0 : 1];
	wire [52 : 0] DuplexMux_oRight [0 : 0];
	wire Encoder_iValues [0 : 0];
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
	assign InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr = InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1 & InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr = InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1 & InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr = InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1 & InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr = ~InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr = InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1 & InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr = ~InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1;
	AXI4ReadInteconnectModule_1x2_TopLevel_DuplexMux
	AXI4ReadInteconnectModule_1x2_TopLevel_DuplexMux
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
	AXI4ReadInteconnectModule_1x2_TopLevel_Encoder
	AXI4ReadInteconnectModule_1x2_TopLevel_Encoder
	(
		// [BEGIN USER MAP FOR Encoder]
		// [END USER MAP FOR Encoder]
		.iValues0 (Encoder_iValues0_Encoder_iValues_HardLink),
		.HasActive (Encoder_HasActive_Encoder_HasActive_HardLink),
		.MSBIndex (Encoder_MSBIndex_Encoder_MSBIndex_HardLink),
		.MSBValue (Encoder_MSBValue_Encoder_MSBValue_HardLink)
	);
	AXI4ReadInteconnectModule_1x2_TopLevel_TransactionDetectors0
	AXI4ReadInteconnectModule_1x2_TopLevel_TransactionDetectors0
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
	AXI4ReadInteconnectModule_1x2_TopLevel_rangeDetectorArray0
	AXI4ReadInteconnectModule_1x2_TopLevel_rangeDetectorArray0
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
	assign InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_1 = Inputs_iLeft[State_leftAddr][83];
	assign InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr_2 = muxRightData_R_RVALID;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_1 = InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr_2 = InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_1 = Inputs_iLeft[0][82];
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T70_AXI4ReadInteconnectModule_L45F63T103_Expr_2 = rangeDetectorActive;
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F74T101_Expr_1 = InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_1 = Inputs_iLeft[0][83];
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr_2 = muxRightData_R_RVALID;
	assign InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr_1 = Encoder_HasActive;
	assign Inputs_iLeft[0][83] = iLeft0_R_RREADY;
	assign Inputs_iLeft[0][82] = iLeft0_AR_ARVALID;
	assign Inputs_iLeft[0][81:74] = iLeft0_AR_ARUSER;
	assign Inputs_iLeft[0][73:66] = iLeft0_AR_ARREGION;
	assign Inputs_iLeft[0][65:62] = iLeft0_AR_ARQOS;
	assign Inputs_iLeft[0][61:59] = iLeft0_AR_ARPROT;
	assign Inputs_iLeft[0][58:55] = iLeft0_AR_ARCACHE;
	assign Inputs_iLeft[0][54:53] = iLeft0_AR_ARLOCK;
	assign Inputs_iLeft[0][52:51] = iLeft0_AR_ARBURST;
	assign Inputs_iLeft[0][50:48] = iLeft0_AR_ARSIZE;
	assign Inputs_iLeft[0][47:40] = iLeft0_AR_ARLEN;
	assign Inputs_iLeft[0][39:8] = iLeft0_AR_ARADDR;
	assign Inputs_iLeft[0][7:0] = iLeft0_AR_ARID;
	assign Inputs_iRight[0][52] = iRight0_R_RVALID;
	assign Inputs_iRight[0][51:44] = iRight0_R_RUSER;
	assign Inputs_iRight[0][43] = iRight0_R_RLAST;
	assign Inputs_iRight[0][42:41] = iRight0_R_RRESP;
	assign Inputs_iRight[0][40:33] = iRight0_R_RDATA3;
	assign Inputs_iRight[0][32:25] = iRight0_R_RDATA2;
	assign Inputs_iRight[0][24:17] = iRight0_R_RDATA1;
	assign Inputs_iRight[0][16:9] = iRight0_R_RDATA0;
	assign Inputs_iRight[0][8:1] = iRight0_R_RID;
	assign Inputs_iRight[0][0] = iRight0_AR_ARREADY;
	assign Inputs_iRight[1][52] = iRight1_R_RVALID;
	assign Inputs_iRight[1][51:44] = iRight1_R_RUSER;
	assign Inputs_iRight[1][43] = iRight1_R_RLAST;
	assign Inputs_iRight[1][42:41] = iRight1_R_RRESP;
	assign Inputs_iRight[1][40:33] = iRight1_R_RDATA3;
	assign Inputs_iRight[1][32:25] = iRight1_R_RDATA2;
	assign Inputs_iRight[1][24:17] = iRight1_R_RDATA1;
	assign Inputs_iRight[1][16:9] = iRight1_R_RDATA0;
	assign Inputs_iRight[1][8:1] = iRight1_R_RID;
	assign Inputs_iRight[1][0] = iRight1_AR_ARREADY;
	assign ActiveTransactions[0] = TransactionDetectors0_oTransaction;
	assign currentTXEnd = InterconnectModule_L86F40T75_AXI4ReadInteconnectModule_L44F61T101_Expr;
	assign muxLeft[0] = DuplexMux_oLeft[0];
	assign muxLeft[1] = DuplexMux_oLeft[1];
	assign muxLeftData_AR_ARID = DuplexMux_oMuxLeftData[7:0];
	assign muxLeftData_AR_ARADDR = DuplexMux_oMuxLeftData[39:8];
	assign muxLeftData_AR_ARLEN = DuplexMux_oMuxLeftData[47:40];
	assign muxLeftData_AR_ARSIZE = DuplexMux_oMuxLeftData[50:48];
	assign muxLeftData_AR_ARBURST = DuplexMux_oMuxLeftData[52:51];
	assign muxLeftData_AR_ARLOCK = DuplexMux_oMuxLeftData[54:53];
	assign muxLeftData_AR_ARCACHE = DuplexMux_oMuxLeftData[58:55];
	assign muxLeftData_AR_ARPROT = DuplexMux_oMuxLeftData[61:59];
	assign muxLeftData_AR_ARQOS = DuplexMux_oMuxLeftData[65:62];
	assign muxLeftData_AR_ARREGION = DuplexMux_oMuxLeftData[73:66];
	assign muxLeftData_AR_ARUSER = DuplexMux_oMuxLeftData[81:74];
	assign muxLeftData_AR_ARVALID = DuplexMux_oMuxLeftData[82];
	assign muxLeftData_R_RREADY = DuplexMux_oMuxLeftData[83];
	assign muxRight[0] = DuplexMux_oRight[0];
	assign muxRightData_AR_ARREADY = DuplexMux_oMuxRightData[0];
	assign muxRightData_R_RID = DuplexMux_oMuxRightData[8:1];
	assign muxRightData_R_RDATA[0] = DuplexMux_oMuxRightData[16:9];
	assign muxRightData_R_RDATA[1] = DuplexMux_oMuxRightData[24:17];
	assign muxRightData_R_RDATA[2] = DuplexMux_oMuxRightData[32:25];
	assign muxRightData_R_RDATA[3] = DuplexMux_oMuxRightData[40:33];
	assign muxRightData_R_RRESP = DuplexMux_oMuxRightData[42:41];
	assign muxRightData_R_RLAST = DuplexMux_oMuxRightData[43];
	assign muxRightData_R_RUSER = DuplexMux_oMuxRightData[51:44];
	assign muxRightData_R_RVALID = DuplexMux_oMuxRightData[52];
	assign rightAddr = axiRightAddr;
	assign Transactions[0] = TransactionDetectors0_oTransaction;
	assign WaitForRestarts[0] = TransactionDetectors0_oWaitForRestart;
	assign axiRightAddr = AXI4ReadInteconnectModule_L33F37T75_Index;
	assign rangeDetectorActive = AXI4ReadInteconnectModule_L36F37T79_Index;
	assign rangeDetectorActiveFlags[0] = rangeDetectorArray0_oActive;
	assign rangeDetectorIndexes[0] = rangeDetectorArray0_oIndex;
	assign TXBegin[0] = InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F38T101_Expr;
	assign TransactionDetectors0_iRestart = InterconnectModule_L99F13L109T14_0_InterconnectModule_L106F36T54_Expr;
	assign TransactionDetectors0_iTXBegin = InterconnectModule_L99F13L109T14_0_InterconnectModule_L104F36T54_Index;
	assign TransactionDetectors0_iTXEnd = InterconnectModule_L99F13L109T14_0_InterconnectModule_L105F34T64_AXI4ReadInteconnectModule_L44F61T101_Expr;
	assign Encoder_iValues[0] = TXBegin[0];
	assign DuplexMux_iLeft[0] = Inputs_iLeft[0];
	assign DuplexMux_iLeftAddr = State_leftAddr;
	assign DuplexMux_iLeftAddrValid = State_leftAddrValid;
	assign DuplexMux_iRight[0] = Inputs_iRight[0];
	assign DuplexMux_iRight[1] = Inputs_iRight[1];
	assign DuplexMux_iRightAddr = State_rightAddr;
	assign DuplexMux_iRightAddrValid = State_rightAddrValid;
	assign rangeDetectorArray0_iAddress = Inputs_iLeft[0][39:8];
	assign oLeft0_R_RREADY = muxLeft[0][83];
	assign oLeft0_AR_ARVALID = muxLeft[0][82];
	assign oLeft0_AR_ARUSER = muxLeft[0][81:74];
	assign oLeft0_AR_ARREGION = muxLeft[0][73:66];
	assign oLeft0_AR_ARQOS = muxLeft[0][65:62];
	assign oLeft0_AR_ARPROT = muxLeft[0][61:59];
	assign oLeft0_AR_ARCACHE = muxLeft[0][58:55];
	assign oLeft0_AR_ARLOCK = muxLeft[0][54:53];
	assign oLeft0_AR_ARBURST = muxLeft[0][52:51];
	assign oLeft0_AR_ARSIZE = muxLeft[0][50:48];
	assign oLeft0_AR_ARLEN = muxLeft[0][47:40];
	assign oLeft0_AR_ARADDR = muxLeft[0][39:8];
	assign oLeft0_AR_ARID = muxLeft[0][7:0];
	assign oLeft1_R_RREADY = muxLeft[1][83];
	assign oLeft1_AR_ARVALID = muxLeft[1][82];
	assign oLeft1_AR_ARUSER = muxLeft[1][81:74];
	assign oLeft1_AR_ARREGION = muxLeft[1][73:66];
	assign oLeft1_AR_ARQOS = muxLeft[1][65:62];
	assign oLeft1_AR_ARPROT = muxLeft[1][61:59];
	assign oLeft1_AR_ARCACHE = muxLeft[1][58:55];
	assign oLeft1_AR_ARLOCK = muxLeft[1][54:53];
	assign oLeft1_AR_ARBURST = muxLeft[1][52:51];
	assign oLeft1_AR_ARSIZE = muxLeft[1][50:48];
	assign oLeft1_AR_ARLEN = muxLeft[1][47:40];
	assign oLeft1_AR_ARADDR = muxLeft[1][39:8];
	assign oLeft1_AR_ARID = muxLeft[1][7:0];
	assign oNextRightAddr = rightAddr;
	assign oRangeDetectorIndex0 = rangeDetectorArray0_oIndex;
	assign oRight0_R_RVALID = muxRight[0][52];
	assign oRight0_R_RUSER = muxRight[0][51:44];
	assign oRight0_R_RLAST = muxRight[0][43];
	assign oRight0_R_RRESP = muxRight[0][42:41];
	assign oRight0_R_RDATA3 = muxRight[0][40:33];
	assign oRight0_R_RDATA2 = muxRight[0][32:25];
	assign oRight0_R_RDATA1 = muxRight[0][24:17];
	assign oRight0_R_RDATA0 = muxRight[0][16:9];
	assign oRight0_R_RID = muxRight[0][8:1];
	assign oRight0_AR_ARREADY = muxRight[0][0];
	assign oStateRightAddr = State_rightAddr;
	assign oStateRightAddrValid = State_rightAddrValid;
	assign oTransactions0 = Transactions[0];
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
	assign InterconnectModule_L94F13L97T14_0_InterconnectModule_L96F75T101_Index = WaitForRestarts[0];
	assign AXI4ReadInteconnectModule_L36F37T79_Index = rangeDetectorActiveFlags[Encoder_MSBIndex];
	assign AXI4ReadInteconnectModule_L33F37T75_Index = rangeDetectorIndexes[Encoder_MSBIndex];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
