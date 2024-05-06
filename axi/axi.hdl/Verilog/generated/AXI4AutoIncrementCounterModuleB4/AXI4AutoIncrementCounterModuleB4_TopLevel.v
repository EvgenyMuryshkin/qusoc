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
// System configuration name is AXI4AutoIncrementCounterModuleB4_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4AutoIncrementCounterModuleB4_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] M2S_R_AR_ARID,
	input wire [31:0] M2S_R_AR_ARADDR,
	input wire [7:0] M2S_R_AR_ARLEN,
	input wire [2:0] M2S_R_AR_ARSIZE,
	input wire [1:0] M2S_R_AR_ARBURST,
	input wire [1:0] M2S_R_AR_ARLOCK,
	input wire [3:0] M2S_R_AR_ARCACHE,
	input wire [2:0] M2S_R_AR_ARPROT,
	input wire [3:0] M2S_R_AR_ARQOS,
	input wire [7:0] M2S_R_AR_ARREGION,
	input wire [7:0] M2S_R_AR_ARUSER,
	input wire M2S_R_AR_ARVALID,
	input wire M2S_R_R_RREADY,
	input wire [7:0] M2S_W_AW_AWID,
	input wire [31:0] M2S_W_AW_AWADDR,
	input wire [7:0] M2S_W_AW_AWLEN,
	input wire [2:0] M2S_W_AW_AWSIZE,
	input wire [1:0] M2S_W_AW_AWBURST,
	input wire [1:0] M2S_W_AW_AWLOCK,
	input wire [3:0] M2S_W_AW_AWCACHE,
	input wire [2:0] M2S_W_AW_AWPROT,
	input wire [3:0] M2S_W_AW_AWQOS,
	input wire [7:0] M2S_W_AW_AWREGION,
	input wire [7:0] M2S_W_AW_AWUSER,
	input wire M2S_W_AW_AWVALID,
	input wire [7:0] M2S_W_W_WID,
	input wire [7:0] M2S_W_W_WDATA0,
	input wire [7:0] M2S_W_W_WDATA1,
	input wire [7:0] M2S_W_W_WDATA2,
	input wire [7:0] M2S_W_W_WDATA3,
	input wire [3:0] M2S_W_W_WSTRB,
	input wire M2S_W_W_WLAST,
	input wire [7:0] M2S_W_W_WUSER,
	input wire M2S_W_W_WVALID,
	input wire M2S_W_B_BREADY,
	output wire [31:0] oCounter,
	output wire outWritten,
	output wire S2M_R_AR_ARREADY,
	output wire [7:0] S2M_R_R_RID,
	output wire [7:0] S2M_R_R_RDATA0,
	output wire [7:0] S2M_R_R_RDATA1,
	output wire [7:0] S2M_R_R_RDATA2,
	output wire [7:0] S2M_R_R_RDATA3,
	output wire [1:0] S2M_R_R_RRESP,
	output wire S2M_R_R_RLAST,
	output wire [7:0] S2M_R_R_RUSER,
	output wire S2M_R_R_RVALID,
	output wire S2M_W_AW_AWREADY,
	output wire [7:0] S2M_W_B_BID,
	output wire [1:0] S2M_W_B_BRESP,
	output wire [7:0] S2M_W_B_BUSER,
	output wire S2M_W_B_BVALID,
	output wire S2M_W_W_WREADY
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [6: 0] axiBits = 7'b0100000;
	wire [1: 0] size = 2'b10;
	wire AXI4AutoIncrementCounterModule_L54F29T33_Expr = 1'b1;
	wire AXI4AutoIncrementCounterModule_L56F29T34_Expr = 1'b0;
	wire AXI4AutoIncrementCounterModule_L58F28T33_Expr = 1'b0;
	wire AXI4AutoIncrementCounterModule_L55F28T32_Expr = 1'b1;
	wire AXI4AutoIncrementCounterModule_L57F28T33_Expr = 1'b0;
	wire AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F54T55_Expr = 1'b1;
	wire [7: 0] Inputs_M2S_R_AR_ARID;
	wire [31: 0] Inputs_M2S_R_AR_ARADDR;
	wire [7: 0] Inputs_M2S_R_AR_ARLEN;
	wire [2: 0] Inputs_M2S_R_AR_ARSIZE;
	wire [1: 0] Inputs_M2S_R_AR_ARBURST;
	wire [1: 0] Inputs_M2S_R_AR_ARLOCK;
	wire [3: 0] Inputs_M2S_R_AR_ARCACHE;
	wire [2: 0] Inputs_M2S_R_AR_ARPROT;
	wire [3: 0] Inputs_M2S_R_AR_ARQOS;
	wire [7: 0] Inputs_M2S_R_AR_ARREGION;
	wire [7: 0] Inputs_M2S_R_AR_ARUSER;
	wire Inputs_M2S_R_AR_ARVALID;
	wire Inputs_M2S_R_R_RREADY;
	wire [7: 0] Inputs_M2S_W_AW_AWID;
	wire [31: 0] Inputs_M2S_W_AW_AWADDR;
	wire [7: 0] Inputs_M2S_W_AW_AWLEN;
	wire [2: 0] Inputs_M2S_W_AW_AWSIZE;
	wire [1: 0] Inputs_M2S_W_AW_AWBURST;
	wire [1: 0] Inputs_M2S_W_AW_AWLOCK;
	wire [3: 0] Inputs_M2S_W_AW_AWCACHE;
	wire [2: 0] Inputs_M2S_W_AW_AWPROT;
	wire [3: 0] Inputs_M2S_W_AW_AWQOS;
	wire [7: 0] Inputs_M2S_W_AW_AWREGION;
	wire [7: 0] Inputs_M2S_W_AW_AWUSER;
	wire Inputs_M2S_W_AW_AWVALID;
	wire [7: 0] Inputs_M2S_W_W_WID;
	wire [3: 0] Inputs_M2S_W_W_WSTRB;
	wire Inputs_M2S_W_W_WLAST;
	wire [7: 0] Inputs_M2S_W_W_WUSER;
	wire Inputs_M2S_W_W_WVALID;
	wire Inputs_M2S_W_B_BREADY;
	reg [31: 0] NextState_counter;
	reg NextState_Written;
	wire axiSlave_inARREADY;
	wire axiSlave_inAWREADY;
	wire axiSlave_inBVALID;
	wire axiSlave_inRVALID;
	wire axiSlave_inWREADY;
	wire [221: 0] axiSlave_M2S;
	wire [31: 0] axiSlave_outARADDR;
	wire axiSlave_outARREADYConfirming;
	wire axiSlave_outARVALID;
	wire [31: 0] axiSlave_outAWADDR;
	wire axiSlave_outAWREADYConfirming;
	wire axiSlave_outAWVALID;
	wire axiSlave_outReadTXCompleting;
	wire axiSlave_outWREADYConfirming;
	wire axiSlave_outWriteTXCompleting;
	wire [3: 0] axiSlave_outWSTRB;
	wire axiSlave_outWVALID;
	wire [73: 0] axiSlave_S2M;
	wire [258: 0] AXI4AutoIncrementCounterModule_L51F37L60T14_Object;
	wire [32: 0] AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F37T67_SignChange;
	wire [31: 0] AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F37T84_Resize;
	wire axiSlave_inARREADY_axiSlave_inARREADY_HardLink;
	wire axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink;
	wire axiSlave_inBVALID_axiSlave_inBVALID_HardLink;
	wire [7: 0] axiSlave_inRDATA0_axiSlave_inRDATA_HardLink;
	wire [7: 0] axiSlave_inRDATA1_axiSlave_inRDATA_HardLink;
	wire [7: 0] axiSlave_inRDATA2_axiSlave_inRDATA_HardLink;
	wire [7: 0] axiSlave_inRDATA3_axiSlave_inRDATA_HardLink;
	wire axiSlave_inRVALID_axiSlave_inRVALID_HardLink;
	wire axiSlave_inWREADY_axiSlave_inWREADY_HardLink;
	wire [221: 0] axiSlave_M2S_axiSlave_M2S_HardLink;
	wire [31: 0] axiSlave_outARADDR_axiSlave_outARADDR_HardLink;
	wire axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink;
	wire axiSlave_outARVALID_axiSlave_outARVALID_HardLink;
	wire [31: 0] axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink;
	wire axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink;
	wire axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink;
	wire axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink;
	wire [7: 0] axiSlave_outWDATA0_axiSlave_outWDATA_HardLink;
	wire [7: 0] axiSlave_outWDATA1_axiSlave_outWDATA_HardLink;
	wire [7: 0] axiSlave_outWDATA2_axiSlave_outWDATA_HardLink;
	wire [7: 0] axiSlave_outWDATA3_axiSlave_outWDATA_HardLink;
	wire axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink;
	wire axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink;
	wire [3: 0] axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink;
	wire axiSlave_outWVALID_axiSlave_outWVALID_HardLink;
	wire [73: 0] axiSlave_S2M_axiSlave_S2M_HardLink;
	reg [31: 0] State_counter = 32'b00000000000000000000000000000000;
	wire [31: 0] State_counterDefault = 32'b00000000000000000000000000000000;
	reg State_Written = 1'b0;
	wire State_WrittenDefault = 1'b0;
	wire [33: 0] AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr;
	wire signed [33: 0] AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr_1;
	wire signed [33: 0] AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr_2;
	wire [7 : 0] Inputs_M2S_W_W_WDATA [0 : 3];
	wire [7 : 0] axiSlave_inRDATA [0 : 3];
	wire [7 : 0] axiSlave_outWDATA [0 : 3];
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
			State_counter <= State_counterDefault;
			State_Written <= State_WrittenDefault;
		end
		else
		begin
			State_counter <= NextState_counter;
			State_Written <= NextState_Written;
		end
	end
	assign AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr = AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr_1 + AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr_2;
	AXI4AutoIncrementCounterModuleB4_TopLevel_axiSlave
	AXI4AutoIncrementCounterModuleB4_TopLevel_axiSlave
	(
		// [BEGIN USER MAP FOR axiSlave]
		// [END USER MAP FOR axiSlave]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.inARREADY (axiSlave_inARREADY_axiSlave_inARREADY_HardLink),
		.inAWREADY (axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink),
		.inBVALID (axiSlave_inBVALID_axiSlave_inBVALID_HardLink),
		.inRDATA0 (axiSlave_inRDATA0_axiSlave_inRDATA_HardLink),
		.inRDATA1 (axiSlave_inRDATA1_axiSlave_inRDATA_HardLink),
		.inRDATA2 (axiSlave_inRDATA2_axiSlave_inRDATA_HardLink),
		.inRDATA3 (axiSlave_inRDATA3_axiSlave_inRDATA_HardLink),
		.inRVALID (axiSlave_inRVALID_axiSlave_inRVALID_HardLink),
		.inWREADY (axiSlave_inWREADY_axiSlave_inWREADY_HardLink),
		.M2S (axiSlave_M2S_axiSlave_M2S_HardLink),
		.outARADDR (axiSlave_outARADDR_axiSlave_outARADDR_HardLink),
		.outARREADYConfirming (axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink),
		.outARVALID (axiSlave_outARVALID_axiSlave_outARVALID_HardLink),
		.outAWADDR (axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink),
		.outAWREADYConfirming (axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink),
		.outAWVALID (axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink),
		.outReadTXCompleting (axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink),
		.outWDATA0 (axiSlave_outWDATA0_axiSlave_outWDATA_HardLink),
		.outWDATA1 (axiSlave_outWDATA1_axiSlave_outWDATA_HardLink),
		.outWDATA2 (axiSlave_outWDATA2_axiSlave_outWDATA_HardLink),
		.outWDATA3 (axiSlave_outWDATA3_axiSlave_outWDATA_HardLink),
		.outWREADYConfirming (axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink),
		.outWriteTXCompleting (axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink),
		.outWSTRB (axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink),
		.outWVALID (axiSlave_outWVALID_axiSlave_outWVALID_HardLink),
		.S2M (axiSlave_S2M_axiSlave_S2M_HardLink)
	);
	always @ (*)
	begin
		NextState_counter = State_counter;
		NextState_Written = State_Written;
		NextState_Written = axiSlave_outARREADYConfirming;
		if ((axiSlave_outARREADYConfirming == 1))
		begin
			NextState_counter = AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F37T84_Resize;
		end
	end
	assign AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr_1 = {
		{2{1'b0}},
		State_counter
	}
	;
	assign AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr_2 = {
		{33{1'b0}},
		AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F54T55_Expr
	}
	;
	assign Inputs_M2S_R_AR_ARID = M2S_R_AR_ARID;
	assign Inputs_M2S_R_AR_ARADDR = M2S_R_AR_ARADDR;
	assign Inputs_M2S_R_AR_ARLEN = M2S_R_AR_ARLEN;
	assign Inputs_M2S_R_AR_ARSIZE = M2S_R_AR_ARSIZE;
	assign Inputs_M2S_R_AR_ARBURST = M2S_R_AR_ARBURST;
	assign Inputs_M2S_R_AR_ARLOCK = M2S_R_AR_ARLOCK;
	assign Inputs_M2S_R_AR_ARCACHE = M2S_R_AR_ARCACHE;
	assign Inputs_M2S_R_AR_ARPROT = M2S_R_AR_ARPROT;
	assign Inputs_M2S_R_AR_ARQOS = M2S_R_AR_ARQOS;
	assign Inputs_M2S_R_AR_ARREGION = M2S_R_AR_ARREGION;
	assign Inputs_M2S_R_AR_ARUSER = M2S_R_AR_ARUSER;
	assign Inputs_M2S_R_AR_ARVALID = M2S_R_AR_ARVALID;
	assign Inputs_M2S_R_R_RREADY = M2S_R_R_RREADY;
	assign Inputs_M2S_W_AW_AWID = M2S_W_AW_AWID;
	assign Inputs_M2S_W_AW_AWADDR = M2S_W_AW_AWADDR;
	assign Inputs_M2S_W_AW_AWLEN = M2S_W_AW_AWLEN;
	assign Inputs_M2S_W_AW_AWSIZE = M2S_W_AW_AWSIZE;
	assign Inputs_M2S_W_AW_AWBURST = M2S_W_AW_AWBURST;
	assign Inputs_M2S_W_AW_AWLOCK = M2S_W_AW_AWLOCK;
	assign Inputs_M2S_W_AW_AWCACHE = M2S_W_AW_AWCACHE;
	assign Inputs_M2S_W_AW_AWPROT = M2S_W_AW_AWPROT;
	assign Inputs_M2S_W_AW_AWQOS = M2S_W_AW_AWQOS;
	assign Inputs_M2S_W_AW_AWREGION = M2S_W_AW_AWREGION;
	assign Inputs_M2S_W_AW_AWUSER = M2S_W_AW_AWUSER;
	assign Inputs_M2S_W_AW_AWVALID = M2S_W_AW_AWVALID;
	assign Inputs_M2S_W_W_WID = M2S_W_W_WID;
	assign Inputs_M2S_W_W_WDATA[0] = M2S_W_W_WDATA0;
	assign Inputs_M2S_W_W_WDATA[1] = M2S_W_W_WDATA1;
	assign Inputs_M2S_W_W_WDATA[2] = M2S_W_W_WDATA2;
	assign Inputs_M2S_W_W_WDATA[3] = M2S_W_W_WDATA3;
	assign Inputs_M2S_W_W_WSTRB = M2S_W_W_WSTRB;
	assign Inputs_M2S_W_W_WLAST = M2S_W_W_WLAST;
	assign Inputs_M2S_W_W_WUSER = M2S_W_W_WUSER;
	assign Inputs_M2S_W_W_WVALID = M2S_W_W_WVALID;
	assign Inputs_M2S_W_B_BREADY = M2S_W_B_BREADY;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[0] = AXI4AutoIncrementCounterModule_L54F29T33_Expr;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[1] = AXI4AutoIncrementCounterModule_L56F29T34_Expr;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[2] = AXI4AutoIncrementCounterModule_L58F28T33_Expr;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[34:3] = State_counter;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[35] = AXI4AutoIncrementCounterModule_L55F28T32_Expr;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[36] = AXI4AutoIncrementCounterModule_L57F28T33_Expr;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[44:37] = Inputs_M2S_R_AR_ARID;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[76:45] = Inputs_M2S_R_AR_ARADDR;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[84:77] = Inputs_M2S_R_AR_ARLEN;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[87:85] = Inputs_M2S_R_AR_ARSIZE;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[89:88] = Inputs_M2S_R_AR_ARBURST;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[91:90] = Inputs_M2S_R_AR_ARLOCK;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[95:92] = Inputs_M2S_R_AR_ARCACHE;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[98:96] = Inputs_M2S_R_AR_ARPROT;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[102:99] = Inputs_M2S_R_AR_ARQOS;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[110:103] = Inputs_M2S_R_AR_ARREGION;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[118:111] = Inputs_M2S_R_AR_ARUSER;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[119] = Inputs_M2S_R_AR_ARVALID;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[120] = Inputs_M2S_R_R_RREADY;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[128:121] = Inputs_M2S_W_AW_AWID;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[160:129] = Inputs_M2S_W_AW_AWADDR;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[168:161] = Inputs_M2S_W_AW_AWLEN;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[171:169] = Inputs_M2S_W_AW_AWSIZE;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[173:172] = Inputs_M2S_W_AW_AWBURST;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[175:174] = Inputs_M2S_W_AW_AWLOCK;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[179:176] = Inputs_M2S_W_AW_AWCACHE;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[182:180] = Inputs_M2S_W_AW_AWPROT;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[186:183] = Inputs_M2S_W_AW_AWQOS;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[194:187] = Inputs_M2S_W_AW_AWREGION;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[202:195] = Inputs_M2S_W_AW_AWUSER;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[203] = Inputs_M2S_W_AW_AWVALID;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[211:204] = Inputs_M2S_W_W_WID;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[243:212] = {
		Inputs_M2S_W_W_WDATA[3],
		Inputs_M2S_W_W_WDATA[2],
		Inputs_M2S_W_W_WDATA[1],
		Inputs_M2S_W_W_WDATA[0]
	}
	;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[247:244] = Inputs_M2S_W_W_WSTRB;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[248] = Inputs_M2S_W_W_WLAST;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[256:249] = Inputs_M2S_W_W_WUSER;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[257] = Inputs_M2S_W_W_WVALID;
	assign AXI4AutoIncrementCounterModule_L51F37L60T14_Object[258] = Inputs_M2S_W_B_BREADY;
	assign axiSlave_M2S = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[258:37];
	assign axiSlave_inWREADY = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[36];
	assign axiSlave_inRVALID = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[35];
	assign axiSlave_inRDATA[3] = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[34:27];
	assign axiSlave_inRDATA[2] = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[26:19];
	assign axiSlave_inRDATA[1] = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[18:11];
	assign axiSlave_inRDATA[0] = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[10:3];
	assign axiSlave_inBVALID = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[2];
	assign axiSlave_inAWREADY = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[1];
	assign axiSlave_inARREADY = AXI4AutoIncrementCounterModule_L51F37L60T14_Object[0];
	assign AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F37T67_SignChange = AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F38T55_Expr[32:0];
	assign AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F37T84_Resize = AXI4AutoIncrementCounterModule_L63F9L70T10_AXI4AutoIncrementCounterModule_L67F13L69T14_AXI4AutoIncrementCounterModule_L68F37T67_SignChange[31:0];
	assign oCounter = State_counter;
	assign outWritten = State_Written;
	assign S2M_W_W_WREADY = axiSlave_S2M[73];
	assign S2M_W_B_BVALID = axiSlave_S2M[72];
	assign S2M_W_B_BUSER = axiSlave_S2M[71:64];
	assign S2M_W_B_BRESP = axiSlave_S2M[63:62];
	assign S2M_W_B_BID = axiSlave_S2M[61:54];
	assign S2M_W_AW_AWREADY = axiSlave_S2M[53];
	assign S2M_R_R_RVALID = axiSlave_S2M[52];
	assign S2M_R_R_RUSER = axiSlave_S2M[51:44];
	assign S2M_R_R_RLAST = axiSlave_S2M[43];
	assign S2M_R_R_RRESP = axiSlave_S2M[42:41];
	assign S2M_R_R_RDATA3 = axiSlave_S2M[40:33];
	assign S2M_R_R_RDATA2 = axiSlave_S2M[32:25];
	assign S2M_R_R_RDATA1 = axiSlave_S2M[24:17];
	assign S2M_R_R_RDATA0 = axiSlave_S2M[16:9];
	assign S2M_R_R_RID = axiSlave_S2M[8:1];
	assign S2M_R_AR_ARREADY = axiSlave_S2M[0];
	assign axiSlave_inARREADY_axiSlave_inARREADY_HardLink = axiSlave_inARREADY;
	assign axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink = axiSlave_inAWREADY;
	assign axiSlave_inBVALID_axiSlave_inBVALID_HardLink = axiSlave_inBVALID;
	assign axiSlave_inRDATA0_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[0];
	assign axiSlave_inRDATA1_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[1];
	assign axiSlave_inRDATA2_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[2];
	assign axiSlave_inRDATA3_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[3];
	assign axiSlave_inRVALID_axiSlave_inRVALID_HardLink = axiSlave_inRVALID;
	assign axiSlave_inWREADY_axiSlave_inWREADY_HardLink = axiSlave_inWREADY;
	assign axiSlave_M2S_axiSlave_M2S_HardLink = axiSlave_M2S;
	assign axiSlave_outARADDR = axiSlave_outARADDR_axiSlave_outARADDR_HardLink;
	assign axiSlave_outARREADYConfirming = axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink;
	assign axiSlave_outARVALID = axiSlave_outARVALID_axiSlave_outARVALID_HardLink;
	assign axiSlave_outAWADDR = axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink;
	assign axiSlave_outAWREADYConfirming = axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink;
	assign axiSlave_outAWVALID = axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink;
	assign axiSlave_outReadTXCompleting = axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink;
	assign axiSlave_outWDATA[0] = axiSlave_outWDATA0_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWDATA[1] = axiSlave_outWDATA1_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWDATA[2] = axiSlave_outWDATA2_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWDATA[3] = axiSlave_outWDATA3_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWREADYConfirming = axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink;
	assign axiSlave_outWriteTXCompleting = axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink;
	assign axiSlave_outWSTRB = axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink;
	assign axiSlave_outWVALID = axiSlave_outWVALID_axiSlave_outWVALID_HardLink;
	assign axiSlave_S2M = axiSlave_S2M_axiSlave_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule