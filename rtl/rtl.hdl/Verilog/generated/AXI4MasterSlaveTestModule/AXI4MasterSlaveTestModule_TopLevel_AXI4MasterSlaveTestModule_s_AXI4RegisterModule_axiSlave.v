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
// System configuration name is AXI4MasterSlaveTestModule_TopLevel_AXI4MasterSlaveTestModule_s_AXI4RegisterModule_axiSlave, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4MasterSlaveTestModule_TopLevel_AXI4MasterSlaveTestModule_s_AXI4RegisterModule_axiSlave (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  BoardSignals_Clock,
	input wire  BoardSignals_Reset,
	input wire  BoardSignals_Running,
	input wire  BoardSignals_Starting,
	input wire  BoardSignals_Started,
	input wire  [8: 1] M2S_AR_ARID,
	input wire  [32: 1] M2S_AR_ARADDR,
	input wire  [8: 1] M2S_AR_ARLEN,
	input wire  [3: 1] M2S_AR_ARSIZE,
	input wire  [2: 1] M2S_AR_ARBURST,
	input wire  [2: 1] M2S_AR_ARLOCK,
	input wire  [4: 1] M2S_AR_ARCACHE,
	input wire  [3: 1] M2S_AR_ARPROT,
	input wire  [4: 1] M2S_AR_ARQOS,
	input wire  [8: 1] M2S_AR_ARREGION,
	input wire  [8: 1] M2S_AR_ARUSER,
	input wire  M2S_AR_ARVALID,
	input wire  M2S_R_RREADY,
	input wire  [8: 1] M2S_AW_AWID,
	input wire  [32: 1] M2S_AW_AWADDR,
	input wire  [8: 1] M2S_AW_AWLEN,
	input wire  [3: 1] M2S_AW_AWSIZE,
	input wire  [2: 1] M2S_AW_AWBURST,
	input wire  [2: 1] M2S_AW_AWLOCK,
	input wire  [4: 1] M2S_AW_AWCACHE,
	input wire  [3: 1] M2S_AW_AWPROT,
	input wire  [4: 1] M2S_AW_AWQOS,
	input wire  [8: 1] M2S_AW_AWREGION,
	input wire  [8: 1] M2S_AW_AWUSER,
	input wire  M2S_AW_AWVALID,
	input wire  [8: 1] M2S_W_WID,
	input wire  [8: 1] M2S_W_WDATA0,
	input wire  [8: 1] M2S_W_WDATA1,
	input wire  [8: 1] M2S_W_WDATA2,
	input wire  [8: 1] M2S_W_WDATA3,
	input wire  [4: 1] M2S_W_WSTRB,
	input wire  M2S_W_WLAST,
	input wire  [8: 1] M2S_W_WUSER,
	input wire  M2S_W_WVALID,
	input wire  M2S_B_BREADY,
	input wire  RVALID,
	input wire  [8: 1] RDATA0,
	input wire  [8: 1] RDATA1,
	input wire  [8: 1] RDATA2,
	input wire  [8: 1] RDATA3,
	input wire  RACK,
	input wire  WACK,
	output wire S2M_AR_ARREADY,
	output wire S2M_AW_AWREADY,
	output wire [8: 1] S2M_B_BID,
	output wire [2: 1] S2M_B_BRESP,
	output wire [8: 1] S2M_B_BUSER,
	output wire S2M_B_BVALID,
	output wire [8: 1] S2M_R_RID,
	output wire [8: 1] S2M_R_RDATA0,
	output wire [8: 1] S2M_R_RDATA1,
	output wire [8: 1] S2M_R_RDATA2,
	output wire [8: 1] S2M_R_RDATA3,
	output wire [2: 1] S2M_R_RRESP,
	output wire S2M_R_RLAST,
	output wire [8: 1] S2M_R_RUSER,
	output wire S2M_R_RVALID,
	output wire S2M_W_WREADY,
	output wire [4: 1] WSTRB,
	output wire [8: 1] WDATA0,
	output wire [8: 1] WDATA1,
	output wire [8: 1] WDATA2,
	output wire [8: 1] WDATA3,
	output wire WVALID
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  [1:0] size = 2'b10;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F22T43_Expr = 1'b0;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L83F17L85T18_AXI4NonBufferedSlaveModule_L84F41T61_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F22T42_Expr = 1'b1;
wire  [1:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L88F17L93T18_AXI4NonBufferedSlaveModule_L90F21L92T22_AXI4NonBufferedSlaveModule_L91F45T63_Expr = 2'b10;
wire  [1:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F22T40_Expr = 2'b10;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L98F45T65_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L102F17L104T18_AXI4NonBufferedSlaveModule_L103F41T61_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F22T44_Expr = 1'b0;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L111F17L113T18_AXI4NonBufferedSlaveModule_L112F42T63_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F22T43_Expr = 1'b1;
wire  [1:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L116F17L119T18_AXI4NonBufferedSlaveModule_L118F46T65_Expr = 2'b10;
wire  [1:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F22T41_Expr = 2'b10;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L124F46T67_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L128F17L130T18_AXI4NonBufferedSlaveModule_L129F42T63_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L43F44T64_Expr = 1'b1;
wire  [1:0] AXI4NonBufferedSlaveModule_L49F43T61_Expr = 2'b10;
wire  AXI4NonBufferedSlaveModule_L51F25T37_Expr = 1'b0;
wire  AXI4_S_R_L18F29T33_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L55F45T66_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L59F44T65_Expr = 1'b1;
wire  AXI4NonBufferedSlaveModule_L64F25T37_Expr = 1'b0;
wire  [1:0] AXI4NonBufferedSlaveModule_L66F44T63_Expr = 2'b10;
wire  [7:0] Inputs_M2S_AR_ARID;
wire  [31:0] Inputs_M2S_AR_ARADDR;
wire  [7:0] Inputs_M2S_AR_ARLEN;
wire  [2:0] Inputs_M2S_AR_ARSIZE;
wire  [1:0] Inputs_M2S_AR_ARBURST;
wire  [1:0] Inputs_M2S_AR_ARLOCK;
wire  [3:0] Inputs_M2S_AR_ARCACHE;
wire  [2:0] Inputs_M2S_AR_ARPROT;
wire  [3:0] Inputs_M2S_AR_ARQOS;
wire  [7:0] Inputs_M2S_AR_ARREGION;
wire  [7:0] Inputs_M2S_AR_ARUSER;
wire  Inputs_M2S_AR_ARVALID;
wire  Inputs_M2S_R_RREADY;
wire  [7:0] Inputs_M2S_AW_AWID;
wire  [31:0] Inputs_M2S_AW_AWADDR;
wire  [7:0] Inputs_M2S_AW_AWLEN;
wire  [2:0] Inputs_M2S_AW_AWSIZE;
wire  [1:0] Inputs_M2S_AW_AWBURST;
wire  [1:0] Inputs_M2S_AW_AWLOCK;
wire  [3:0] Inputs_M2S_AW_AWCACHE;
wire  [2:0] Inputs_M2S_AW_AWPROT;
wire  [3:0] Inputs_M2S_AW_AWQOS;
wire  [7:0] Inputs_M2S_AW_AWREGION;
wire  [7:0] Inputs_M2S_AW_AWUSER;
wire  Inputs_M2S_AW_AWVALID;
wire  [7:0] Inputs_M2S_W_WID;
wire  [7:0] Inputs_M2S_W_WDATA0;
wire  [7:0] Inputs_M2S_W_WDATA1;
wire  [7:0] Inputs_M2S_W_WDATA2;
wire  [7:0] Inputs_M2S_W_WDATA3;
wire  [3:0] Inputs_M2S_W_WSTRB;
wire  Inputs_M2S_W_WLAST;
wire  [7:0] Inputs_M2S_W_WUSER;
wire  Inputs_M2S_W_WVALID;
wire  Inputs_M2S_B_BREADY;
wire  Inputs_RVALID;
wire  [7:0] Inputs_RDATA0;
wire  [7:0] Inputs_RDATA1;
wire  [7:0] Inputs_RDATA2;
wire  [7:0] Inputs_RDATA3;
wire  Inputs_RACK;
wire  Inputs_WACK;
reg  [1:0] NextState_readFSM;
reg  [1:0] NextState_writeFSM;
wire  axiWE;
reg  [1:0] State_readFSM = 2'b00;
wire  [1:0] State_readFSMDefault = 2'b00;
reg  [1:0] State_writeFSM = 2'b00;
wire  [1:0] State_writeFSMDefault = 2'b00;
wire  AXI4NonBufferedSlaveModule_L70F23T67_Expr;
wire  AXI4NonBufferedSlaveModule_L70F23T67_Expr_1;
wire  AXI4NonBufferedSlaveModule_L70F23T67_Expr_2;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr_1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr_2;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr_1;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr_2;
wire  AXI4NonBufferedSlaveModule_L49F26T76_Expr;
wire  AXI4NonBufferedSlaveModule_L49F26T76_Expr_1;
wire  AXI4NonBufferedSlaveModule_L49F26T76_Expr_2;
wire  AXI4NonBufferedSlaveModule_L59F26T80_Expr;
wire  AXI4NonBufferedSlaveModule_L59F26T80_Expr_1;
wire  AXI4NonBufferedSlaveModule_L59F26T80_Expr_2;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_Case;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_CaseLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_CaseRhs;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_Case;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_CaseLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_CaseRhs;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_Case;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_CaseLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_CaseRhs;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_Case;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_CaseLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_CaseRhs;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_Case;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_CaseLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_CaseRhs;
wire  AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_Case;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_CaseLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_CaseRhs;
wire  AXI4NonBufferedSlaveModule_L43F27T64_Expr;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L43F27T64_ExprLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L43F27T64_ExprRhs;
wire  AXI4NonBufferedSlaveModule_L49F26T61_Expr;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L49F26T61_ExprLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L49F26T61_ExprRhs;
wire  AXI4NonBufferedSlaveModule_L55F27T66_Expr;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L55F27T66_ExprLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L55F27T66_ExprRhs;
wire  AXI4NonBufferedSlaveModule_L59F26T65_Expr;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L59F26T65_ExprLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L59F26T65_ExprRhs;
wire  AXI4NonBufferedSlaveModule_L66F26T63_Expr;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L66F26T63_ExprLhs;
wire signed  [2:0] AXI4NonBufferedSlaveModule_L66F26T63_ExprRhs;
always @(posedge BoardSignals_Clock)
begin
if ( BoardSignals_Reset == 1 ) begin
State_readFSM <= State_readFSMDefault;
State_writeFSM <= State_writeFSMDefault;
end
else begin
State_readFSM <= NextState_readFSM;
State_writeFSM <= NextState_writeFSM;
end
end
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_Case = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_CaseLhs == AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_CaseRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_Case = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_CaseLhs == AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_CaseRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_Case = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_CaseLhs == AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_CaseRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_Case = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_CaseLhs == AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_CaseRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_Case = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_CaseLhs == AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_CaseRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_Case = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_CaseLhs == AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_CaseRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L43F27T64_Expr = AXI4NonBufferedSlaveModule_L43F27T64_ExprLhs == AXI4NonBufferedSlaveModule_L43F27T64_ExprRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L49F26T61_Expr = AXI4NonBufferedSlaveModule_L49F26T61_ExprLhs == AXI4NonBufferedSlaveModule_L49F26T61_ExprRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L55F27T66_Expr = AXI4NonBufferedSlaveModule_L55F27T66_ExprLhs == AXI4NonBufferedSlaveModule_L55F27T66_ExprRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L59F26T65_Expr = AXI4NonBufferedSlaveModule_L59F26T65_ExprLhs == AXI4NonBufferedSlaveModule_L59F26T65_ExprRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L66F26T63_Expr = AXI4NonBufferedSlaveModule_L66F26T63_ExprLhs == AXI4NonBufferedSlaveModule_L66F26T63_ExprRhs ? 1'b1 : 1'b0;
assign AXI4NonBufferedSlaveModule_L70F23T67_Expr = AXI4NonBufferedSlaveModule_L70F23T67_Expr_1 & AXI4NonBufferedSlaveModule_L70F23T67_Expr_2;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr_1 & AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr_2;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr_1 & AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr_2;
assign AXI4NonBufferedSlaveModule_L49F26T76_Expr = AXI4NonBufferedSlaveModule_L49F26T76_Expr_1 & AXI4NonBufferedSlaveModule_L49F26T76_Expr_2;
assign AXI4NonBufferedSlaveModule_L59F26T80_Expr = AXI4NonBufferedSlaveModule_L59F26T80_Expr_1 & AXI4NonBufferedSlaveModule_L59F26T80_Expr_2;
always @*
begin
NextState_readFSM = State_readFSM;
NextState_writeFSM = State_writeFSM;
if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_Case == 1 ) begin
NextState_readFSM = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L83F17L85T18_AXI4NonBufferedSlaveModule_L84F41T61_Expr }/*expand*/;
end
else if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_Case == 1 ) begin
if ( Inputs_M2S_AR_ARVALID == 1 ) begin
NextState_readFSM = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L88F17L93T18_AXI4NonBufferedSlaveModule_L90F21L92T22_AXI4NonBufferedSlaveModule_L91F45T63_Expr;
end
end
else if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_Case == 1 ) begin
if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr == 1 ) begin
NextState_readFSM = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L98F45T65_Expr }/*expand*/;
end
end
else begin
NextState_readFSM = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L102F17L104T18_AXI4NonBufferedSlaveModule_L103F41T61_Expr }/*expand*/;
end
if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_Case == 1 ) begin
NextState_writeFSM = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L111F17L113T18_AXI4NonBufferedSlaveModule_L112F42T63_Expr }/*expand*/;
end
else if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_Case == 1 ) begin
if ( axiWE == 1 ) begin
NextState_writeFSM = AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L116F17L119T18_AXI4NonBufferedSlaveModule_L118F46T65_Expr;
end
end
else if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_Case == 1 ) begin
if ( AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr == 1 ) begin
NextState_writeFSM = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L124F46T67_Expr }/*expand*/;
end
end
else begin
NextState_writeFSM = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L128F17L130T18_AXI4NonBufferedSlaveModule_L129F42T63_Expr }/*expand*/;
end

end
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_CaseLhs = { {1{1'b0}}, State_readFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F17L86T23_CaseRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L82F22T43_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_CaseLhs = { {1{1'b0}}, State_readFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F17L94T23_CaseRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L87F22T42_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_CaseLhs = { {1{1'b0}}, State_readFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F17L100T23_CaseRhs = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L95F22T40_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_CaseLhs = { {1{1'b0}}, State_writeFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F17L114T23_CaseRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L110F22T44_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_CaseLhs = { {1{1'b0}}, State_writeFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F17L120T23_CaseRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L115F22T43_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_CaseLhs = { {1{1'b0}}, State_writeFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F17L126T23_CaseRhs = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L121F22T41_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L43F27T64_ExprLhs = { {1{1'b0}}, State_readFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L43F27T64_ExprRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L43F44T64_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L49F26T61_ExprLhs = { {1{1'b0}}, State_readFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L49F26T61_ExprRhs = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L49F43T61_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L55F27T66_ExprLhs = { {1{1'b0}}, State_writeFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L55F27T66_ExprRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L55F45T66_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L59F26T65_ExprLhs = { {1{1'b0}}, State_writeFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L59F26T65_ExprRhs = { {2{1'b0}}, AXI4NonBufferedSlaveModule_L59F44T65_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L66F26T63_ExprLhs = { {1{1'b0}}, State_writeFSM }/*expand*/;
assign AXI4NonBufferedSlaveModule_L66F26T63_ExprRhs = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L66F44T63_Expr }/*expand*/;
assign AXI4NonBufferedSlaveModule_L70F23T67_Expr_1 = Inputs_M2S_AW_AWVALID;
assign AXI4NonBufferedSlaveModule_L70F23T67_Expr_2 = Inputs_M2S_W_WVALID;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr_1 = Inputs_M2S_R_RREADY;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L80F13L106T14_AXI4NonBufferedSlaveModule_L96F17L99T18_AXI4NonBufferedSlaveModule_L97F25T59_Expr_2 = Inputs_RACK;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr_1 = Inputs_M2S_B_BREADY;
assign AXI4NonBufferedSlaveModule_L77F9L133T10_AXI4NonBufferedSlaveModule_L108F13L132T14_AXI4NonBufferedSlaveModule_L122F17L125T18_AXI4NonBufferedSlaveModule_L123F25T59_Expr_2 = Inputs_WACK;
assign AXI4NonBufferedSlaveModule_L49F26T76_Expr_1 = AXI4NonBufferedSlaveModule_L49F26T61_Expr;
assign AXI4NonBufferedSlaveModule_L49F26T76_Expr_2 = Inputs_RACK;
assign AXI4NonBufferedSlaveModule_L59F26T80_Expr_1 = AXI4NonBufferedSlaveModule_L59F26T65_Expr;
assign AXI4NonBufferedSlaveModule_L59F26T80_Expr_2 = Inputs_WACK;
assign Inputs_M2S_AR_ARID = M2S_AR_ARID;
assign Inputs_M2S_AR_ARADDR = M2S_AR_ARADDR;
assign Inputs_M2S_AR_ARLEN = M2S_AR_ARLEN;
assign Inputs_M2S_AR_ARSIZE = M2S_AR_ARSIZE;
assign Inputs_M2S_AR_ARBURST = M2S_AR_ARBURST;
assign Inputs_M2S_AR_ARLOCK = M2S_AR_ARLOCK;
assign Inputs_M2S_AR_ARCACHE = M2S_AR_ARCACHE;
assign Inputs_M2S_AR_ARPROT = M2S_AR_ARPROT;
assign Inputs_M2S_AR_ARQOS = M2S_AR_ARQOS;
assign Inputs_M2S_AR_ARREGION = M2S_AR_ARREGION;
assign Inputs_M2S_AR_ARUSER = M2S_AR_ARUSER;
assign Inputs_M2S_AR_ARVALID = M2S_AR_ARVALID;
assign Inputs_M2S_R_RREADY = M2S_R_RREADY;
assign Inputs_M2S_AW_AWID = M2S_AW_AWID;
assign Inputs_M2S_AW_AWADDR = M2S_AW_AWADDR;
assign Inputs_M2S_AW_AWLEN = M2S_AW_AWLEN;
assign Inputs_M2S_AW_AWSIZE = M2S_AW_AWSIZE;
assign Inputs_M2S_AW_AWBURST = M2S_AW_AWBURST;
assign Inputs_M2S_AW_AWLOCK = M2S_AW_AWLOCK;
assign Inputs_M2S_AW_AWCACHE = M2S_AW_AWCACHE;
assign Inputs_M2S_AW_AWPROT = M2S_AW_AWPROT;
assign Inputs_M2S_AW_AWQOS = M2S_AW_AWQOS;
assign Inputs_M2S_AW_AWREGION = M2S_AW_AWREGION;
assign Inputs_M2S_AW_AWUSER = M2S_AW_AWUSER;
assign Inputs_M2S_AW_AWVALID = M2S_AW_AWVALID;
assign Inputs_M2S_W_WID = M2S_W_WID;
assign Inputs_M2S_W_WDATA0 = M2S_W_WDATA0;
assign Inputs_M2S_W_WDATA1 = M2S_W_WDATA1;
assign Inputs_M2S_W_WDATA2 = M2S_W_WDATA2;
assign Inputs_M2S_W_WDATA3 = M2S_W_WDATA3;
assign Inputs_M2S_W_WSTRB = M2S_W_WSTRB;
assign Inputs_M2S_W_WLAST = M2S_W_WLAST;
assign Inputs_M2S_W_WUSER = M2S_W_WUSER;
assign Inputs_M2S_W_WVALID = M2S_W_WVALID;
assign Inputs_M2S_B_BREADY = M2S_B_BREADY;
assign Inputs_RVALID = RVALID;
assign Inputs_RDATA0 = RDATA0;
assign Inputs_RDATA1 = RDATA1;
assign Inputs_RDATA2 = RDATA2;
assign Inputs_RDATA3 = RDATA3;
assign Inputs_RACK = RACK;
assign Inputs_WACK = WACK;
assign axiWE = AXI4NonBufferedSlaveModule_L70F23T67_Expr;
assign S2M_AR_ARREADY = AXI4NonBufferedSlaveModule_L43F27T64_Expr;
assign S2M_AW_AWREADY = AXI4NonBufferedSlaveModule_L55F27T66_Expr;
assign S2M_B_BID = Inputs_M2S_W_WID;
assign S2M_B_BRESP = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L64F25T37_Expr }/*expand*/;
assign S2M_B_BUSER = Inputs_M2S_W_WUSER;
assign S2M_B_BVALID = AXI4NonBufferedSlaveModule_L66F26T63_Expr;
assign S2M_R_RID = Inputs_M2S_AR_ARID;
assign S2M_R_RDATA0 = Inputs_RDATA0;
assign S2M_R_RDATA1 = Inputs_RDATA1;
assign S2M_R_RDATA2 = Inputs_RDATA2;
assign S2M_R_RDATA3 = Inputs_RDATA3;
assign S2M_R_RRESP = { {1{1'b0}}, AXI4NonBufferedSlaveModule_L51F25T37_Expr }/*expand*/;
assign S2M_R_RLAST = AXI4_S_R_L18F29T33_Expr;
assign S2M_R_RUSER = Inputs_M2S_AR_ARUSER;
assign S2M_R_RVALID = AXI4NonBufferedSlaveModule_L49F26T76_Expr;
assign S2M_W_WREADY = AXI4NonBufferedSlaveModule_L59F26T80_Expr;
assign WSTRB = Inputs_M2S_W_WSTRB;
assign WDATA0 = Inputs_M2S_W_WDATA0;
assign WDATA1 = Inputs_M2S_W_WDATA1;
assign WDATA2 = Inputs_M2S_W_WDATA2;
assign WDATA3 = Inputs_M2S_W_WDATA3;
assign WVALID = axiWE;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
