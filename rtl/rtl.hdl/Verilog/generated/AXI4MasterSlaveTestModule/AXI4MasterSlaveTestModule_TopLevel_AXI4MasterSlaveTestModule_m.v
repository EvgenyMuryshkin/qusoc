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
// System configuration name is AXI4MasterSlaveTestModule_TopLevel_AXI4MasterSlaveTestModule_m, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4MasterSlaveTestModule_TopLevel_AXI4MasterSlaveTestModule_m (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  BoardSignals_Clock,
	input wire  BoardSignals_Reset,
	input wire  BoardSignals_Running,
	input wire  BoardSignals_Starting,
	input wire  BoardSignals_Started,
	input wire  S2M_AR_ARREADY,
	input wire  S2M_AW_AWREADY,
	input wire  [8: 1] S2M_B_BID,
	input wire  [2: 1] S2M_B_BRESP,
	input wire  [8: 1] S2M_B_BUSER,
	input wire  S2M_B_BVALID,
	input wire  [8: 1] S2M_R_RID,
	input wire  [8: 1] S2M_R_RDATA0,
	input wire  [8: 1] S2M_R_RDATA1,
	input wire  [8: 1] S2M_R_RDATA2,
	input wire  [8: 1] S2M_R_RDATA3,
	input wire  [2: 1] S2M_R_RRESP,
	input wire  S2M_R_RLAST,
	input wire  [8: 1] S2M_R_RUSER,
	input wire  S2M_R_RVALID,
	input wire  S2M_W_WREADY,
	input wire  [32: 1] AXADDR,
	input wire  RE,
	input wire  WE,
	input wire  [8: 1] WDATA0,
	input wire  [8: 1] WDATA1,
	input wire  [8: 1] WDATA2,
	input wire  [8: 1] WDATA3,
	input wire  [4: 1] WSTRB,
	output wire InvalidInputs,
	output wire OutACK,
	output wire [8: 1] RDATA0,
	output wire [8: 1] RDATA1,
	output wire [8: 1] RDATA2,
	output wire [8: 1] RDATA3,
	output wire [8: 1] M2S_AR_ARID,
	output wire [32: 1] M2S_AR_ARADDR,
	output wire [8: 1] M2S_AR_ARLEN,
	output wire [3: 1] M2S_AR_ARSIZE,
	output wire [2: 1] M2S_AR_ARBURST,
	output wire [2: 1] M2S_AR_ARLOCK,
	output wire [4: 1] M2S_AR_ARCACHE,
	output wire [3: 1] M2S_AR_ARPROT,
	output wire [4: 1] M2S_AR_ARQOS,
	output wire [8: 1] M2S_AR_ARREGION,
	output wire [8: 1] M2S_AR_ARUSER,
	output wire M2S_AR_ARVALID,
	output wire M2S_R_RREADY,
	output wire [8: 1] M2S_AW_AWID,
	output wire [32: 1] M2S_AW_AWADDR,
	output wire [8: 1] M2S_AW_AWLEN,
	output wire [3: 1] M2S_AW_AWSIZE,
	output wire [2: 1] M2S_AW_AWBURST,
	output wire [2: 1] M2S_AW_AWLOCK,
	output wire [4: 1] M2S_AW_AWCACHE,
	output wire [3: 1] M2S_AW_AWPROT,
	output wire [4: 1] M2S_AW_AWQOS,
	output wire [8: 1] M2S_AW_AWREGION,
	output wire [8: 1] M2S_AW_AWUSER,
	output wire M2S_AW_AWVALID,
	output wire [8: 1] M2S_W_WID,
	output wire [8: 1] M2S_W_WDATA0,
	output wire [8: 1] M2S_W_WDATA1,
	output wire [8: 1] M2S_W_WDATA2,
	output wire [8: 1] M2S_W_WDATA3,
	output wire [4: 1] M2S_W_WSTRB,
	output wire M2S_W_WLAST,
	output wire [8: 1] M2S_W_WUSER,
	output wire M2S_W_WVALID,
	output wire M2S_B_BREADY
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
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F22T40_Expr = 1'b0;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L91F37T54_Expr = 1'b1;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F22T39_Expr = 1'b1;
wire  [2:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L95F21L108T22_AXI4MasterModule_L97F25L102T26_AXI4MasterModule_L101F45T63_Expr = 3'b100;
wire  [1:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L95F21L108T22_AXI4MasterModule_L104F25L107T26_AXI4MasterModule_L106F45T63_Expr = 2'b10;
wire  [1:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F22T40_Expr = 2'b10;
wire  [1:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L112F21L115T22_AXI4MasterModule_L114F41T58_Expr = 2'b11;
wire  [1:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F22T39_Expr = 2'b11;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L118F37T54_Expr = 1'b1;
wire  [2:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F22T40_Expr = 3'b100;
wire  [2:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L122F21L124T22_AXI4MasterModule_L123F41T58_Expr = 3'b101;
wire  [2:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F22T39_Expr = 3'b101;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L127F37T54_Expr = 1'b1;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L130F17L132T18_AXI4MasterModule_L131F37T54_Expr = 1'b1;
wire  [1:0] AXI4MasterModule_L55F44T61_Expr = 2'b11;
wire  [2:0] AXI4MasterModule_L55F78T95_Expr = 3'b101;
wire  [1:0] AXI4MasterModule_L62F40T58_Expr = 2'b10;
wire  AXI4_M_AR_L15F28T29_Expr = 1'b0;
wire  AXI4_M_AR_L17F29T30_Expr = 1'b1;
wire  [1:0] AXI4_M_AR_L18F33T43_Expr = 2'b10;
wire  AXI4_M_AR_L19F35T48_Expr = 1'b1;
wire  AXI4_M_AR_L20F33T47_Expr = 1'b0;
wire  AXI4_M_AR_L21F35T63_Expr = 1'b0;
wire  [1:0] AXI4_M_AR_L22F33T66_Expr = 2'b10;
wire  AXI4_M_AR_L23F31T44_Expr = 1'b0;
wire  AXI4_M_AR_L24F32T33_Expr = 1'b0;
wire  AXI4_M_AR_L25F30T31_Expr = 1'b0;
wire  [1:0] AXI4MasterModule_L66F39T56_Expr = 2'b11;
wire  [2:0] AXI4MasterModule_L71F40T58_Expr = 3'b100;
wire  AXI4_M_AW_L14F28T29_Expr = 1'b0;
wire  AXI4_M_AW_L16F29T30_Expr = 1'b1;
wire  [1:0] AXI4_M_AW_L17F33T43_Expr = 2'b10;
wire  AXI4_M_AW_L18F35T48_Expr = 1'b1;
wire  AXI4_M_AW_L19F33T47_Expr = 1'b0;
wire  AXI4_M_AW_L20F35T63_Expr = 1'b0;
wire  [1:0] AXI4_M_AW_L21F33T66_Expr = 2'b10;
wire  AXI4_M_AW_L22F31T44_Expr = 1'b0;
wire  AXI4_M_AW_L23F32T33_Expr = 1'b0;
wire  AXI4_M_AW_L24F30T31_Expr = 1'b0;
wire  AXI4MasterModule_L75F23T24_Expr = 1'b0;
wire  [2:0] AXI4MasterModule_L78F39T57_Expr = 3'b100;
wire  AXI4_M_W_L17F29T33_Expr = 1'b1;
wire  AXI4_M_W_L18F29T30_Expr = 1'b0;
wire  [2:0] AXI4MasterModule_L82F39T56_Expr = 3'b101;
wire  Inputs_S2M_AR_ARREADY;
wire  Inputs_S2M_AW_AWREADY;
wire  [7:0] Inputs_S2M_B_BID;
wire  [1:0] Inputs_S2M_B_BRESP;
wire  [7:0] Inputs_S2M_B_BUSER;
wire  Inputs_S2M_B_BVALID;
wire  [7:0] Inputs_S2M_R_RID;
wire  [7:0] Inputs_S2M_R_RDATA0;
wire  [7:0] Inputs_S2M_R_RDATA1;
wire  [7:0] Inputs_S2M_R_RDATA2;
wire  [7:0] Inputs_S2M_R_RDATA3;
wire  [1:0] Inputs_S2M_R_RRESP;
wire  Inputs_S2M_R_RLAST;
wire  [7:0] Inputs_S2M_R_RUSER;
wire  Inputs_S2M_R_RVALID;
wire  Inputs_S2M_W_WREADY;
wire  [31:0] Inputs_AXADDR;
wire  Inputs_RE;
wire  Inputs_WE;
wire  [7:0] Inputs_WDATA0;
wire  [7:0] Inputs_WDATA1;
wire  [7:0] Inputs_WDATA2;
wire  [7:0] Inputs_WDATA3;
wire  [3:0] Inputs_WSTRB;
reg  [2:0] NextState_fsm;
reg  [31:0] NextState_AXADDR;
reg  [3:0] NextState_WSTRB;
wire  internalInvalidInputs;
reg  [7:0] State_ARDATADefault = 8'b00000000;
reg  [7:0] State_AWDATADefault = 8'b00000000;
reg  [2:0] State_fsm = 3'b000;
wire  [2:0] State_fsmDefault = 3'b000;
reg  [31:0] State_AXADDR = 32'b00000000000000000000000000000000;
wire  [31:0] State_AXADDRDefault = 32'b00000000000000000000000000000000;
reg  [3:0] State_WSTRB = 4'b0000;
wire  [3:0] State_WSTRBDefault = 4'b0000;
wire  AXI4MasterModule_L53F39T60_Expr;
wire  AXI4MasterModule_L53F39T60_Expr_1;
wire  AXI4MasterModule_L53F39T60_Expr_2;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L94F25T47_Expr;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L94F25T47_Expr_1;
wire  AXI4MasterModule_L55F31T95_Expr;
wire  AXI4MasterModule_L55F31T95_Expr_1;
wire  AXI4MasterModule_L55F31T95_Expr_2;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_Case;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_CaseLhs;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_CaseRhs;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_Case;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_CaseLhs;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_CaseRhs;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_Case;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_CaseLhs;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_CaseRhs;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_Case;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_CaseLhs;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_CaseRhs;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_Case;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_CaseLhs;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_CaseRhs;
wire  AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_Case;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_CaseLhs;
wire signed  [3:0] AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_CaseRhs;
wire  AXI4MasterModule_L55F31T61_Expr;
wire signed  [3:0] AXI4MasterModule_L55F31T61_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L55F31T61_ExprRhs;
wire  AXI4MasterModule_L55F65T95_Expr;
wire signed  [3:0] AXI4MasterModule_L55F65T95_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L55F65T95_ExprRhs;
wire  AXI4MasterModule_L62F27T58_Expr;
wire signed  [3:0] AXI4MasterModule_L62F27T58_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L62F27T58_ExprRhs;
wire  AXI4MasterModule_L66F26T56_Expr;
wire signed  [3:0] AXI4MasterModule_L66F26T56_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L66F26T56_ExprRhs;
wire  AXI4MasterModule_L71F27T58_Expr;
wire signed  [3:0] AXI4MasterModule_L71F27T58_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L71F27T58_ExprRhs;
wire  AXI4MasterModule_L78F26T57_Expr;
wire signed  [3:0] AXI4MasterModule_L78F26T57_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L78F26T57_ExprRhs;
wire  AXI4MasterModule_L82F26T56_Expr;
wire signed  [3:0] AXI4MasterModule_L82F26T56_ExprLhs;
wire signed  [3:0] AXI4MasterModule_L82F26T56_ExprRhs;
integer State_ARDATA_Iterator;
reg [7:0] State_ARDATA [0 : 3];
initial
begin : Init_State_ARDATA
	for (State_ARDATA_Iterator = 0; State_ARDATA_Iterator < 4; State_ARDATA_Iterator = State_ARDATA_Iterator + 1)
		State_ARDATA[State_ARDATA_Iterator] = 0;
end
integer NextState_ARDATA_Iterator;
reg [7:0] NextState_ARDATA [0 : 3];
initial
begin : Init_NextState_ARDATA
	for (NextState_ARDATA_Iterator = 0; NextState_ARDATA_Iterator < 4; NextState_ARDATA_Iterator = NextState_ARDATA_Iterator + 1)
		NextState_ARDATA[NextState_ARDATA_Iterator] = 0;
end
integer State_AWDATA_Iterator;
reg [7:0] State_AWDATA [0 : 3];
initial
begin : Init_State_AWDATA
	for (State_AWDATA_Iterator = 0; State_AWDATA_Iterator < 4; State_AWDATA_Iterator = State_AWDATA_Iterator + 1)
		State_AWDATA[State_AWDATA_Iterator] = 0;
end
integer NextState_AWDATA_Iterator;
reg [7:0] NextState_AWDATA [0 : 3];
initial
begin : Init_NextState_AWDATA
	for (NextState_AWDATA_Iterator = 0; NextState_AWDATA_Iterator < 4; NextState_AWDATA_Iterator = NextState_AWDATA_Iterator + 1)
		NextState_AWDATA[NextState_AWDATA_Iterator] = 0;
end
always @(posedge BoardSignals_Clock)
begin
if ( BoardSignals_Reset == 1 ) begin
State_fsm <= State_fsmDefault;
State_AXADDR <= State_AXADDRDefault;
State_WSTRB <= State_WSTRBDefault;
end
else begin
State_fsm <= NextState_fsm;
State_AXADDR <= NextState_AXADDR;
State_WSTRB <= NextState_WSTRB;
end
end
always @(posedge BoardSignals_Clock)
begin
if ( BoardSignals_Reset == 1 ) begin
for (State_ARDATA_Iterator = 0; State_ARDATA_Iterator < 4; State_ARDATA_Iterator = State_ARDATA_Iterator + 1)
begin
State_ARDATA[State_ARDATA_Iterator] <= State_ARDATADefault;
end
end
else begin
for (State_ARDATA_Iterator = 0; State_ARDATA_Iterator < 4; State_ARDATA_Iterator = State_ARDATA_Iterator + 1)
begin
State_ARDATA[State_ARDATA_Iterator] <= NextState_ARDATA[State_ARDATA_Iterator];
end
end
end
always @(posedge BoardSignals_Clock)
begin
if ( BoardSignals_Reset == 1 ) begin
for (State_AWDATA_Iterator = 0; State_AWDATA_Iterator < 4; State_AWDATA_Iterator = State_AWDATA_Iterator + 1)
begin
State_AWDATA[State_AWDATA_Iterator] <= State_AWDATADefault;
end
end
else begin
for (State_AWDATA_Iterator = 0; State_AWDATA_Iterator < 4; State_AWDATA_Iterator = State_AWDATA_Iterator + 1)
begin
State_AWDATA[State_AWDATA_Iterator] <= NextState_AWDATA[State_AWDATA_Iterator];
end
end
end
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_Case = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_CaseLhs == AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_CaseRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_Case = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_CaseLhs == AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_CaseRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_Case = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_CaseLhs == AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_CaseRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_Case = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_CaseLhs == AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_CaseRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_Case = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_CaseLhs == AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_CaseRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_Case = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_CaseLhs == AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_CaseRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L55F31T61_Expr = AXI4MasterModule_L55F31T61_ExprLhs == AXI4MasterModule_L55F31T61_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L55F65T95_Expr = AXI4MasterModule_L55F65T95_ExprLhs == AXI4MasterModule_L55F65T95_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L62F27T58_Expr = AXI4MasterModule_L62F27T58_ExprLhs == AXI4MasterModule_L62F27T58_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L66F26T56_Expr = AXI4MasterModule_L66F26T56_ExprLhs == AXI4MasterModule_L66F26T56_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L71F27T58_Expr = AXI4MasterModule_L71F27T58_ExprLhs == AXI4MasterModule_L71F27T58_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L78F26T57_Expr = AXI4MasterModule_L78F26T57_ExprLhs == AXI4MasterModule_L78F26T57_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L82F26T56_Expr = AXI4MasterModule_L82F26T56_ExprLhs == AXI4MasterModule_L82F26T56_ExprRhs ? 1'b1 : 1'b0;
assign AXI4MasterModule_L53F39T60_Expr = AXI4MasterModule_L53F39T60_Expr_1 & AXI4MasterModule_L53F39T60_Expr_2;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L94F25T47_Expr = ~AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L94F25T47_Expr_1;
assign AXI4MasterModule_L55F31T95_Expr = AXI4MasterModule_L55F31T95_Expr_1 | AXI4MasterModule_L55F31T95_Expr_2;
always @*
begin
for (NextState_AWDATA_Iterator = 0; NextState_AWDATA_Iterator < 4; NextState_AWDATA_Iterator = NextState_AWDATA_Iterator + 1)
begin
NextState_AWDATA[NextState_AWDATA_Iterator] = State_AWDATA[NextState_AWDATA_Iterator];
end
for (NextState_ARDATA_Iterator = 0; NextState_ARDATA_Iterator < 4; NextState_ARDATA_Iterator = NextState_ARDATA_Iterator + 1)
begin
NextState_ARDATA[NextState_ARDATA_Iterator] = State_ARDATA[NextState_ARDATA_Iterator];
end
NextState_fsm = State_fsm;
NextState_AXADDR = State_AXADDR;
NextState_WSTRB = State_WSTRB;
if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_Case == 1 ) begin
NextState_fsm = { {2{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L91F37T54_Expr }/*expand*/;
end
else if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_Case == 1 ) begin
if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L94F25T47_Expr == 1 ) begin
if ( Inputs_WE == 1 ) begin
NextState_AXADDR = Inputs_AXADDR;
NextState_AWDATA[0] = Inputs_WDATA0;
NextState_AWDATA[1] = Inputs_WDATA1;
NextState_AWDATA[2] = Inputs_WDATA2;
NextState_AWDATA[3] = Inputs_WDATA3;
NextState_WSTRB = Inputs_WSTRB;
NextState_fsm = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L95F21L108T22_AXI4MasterModule_L97F25L102T26_AXI4MasterModule_L101F45T63_Expr;
end
else if ( Inputs_RE == 1 ) begin
NextState_AXADDR = Inputs_AXADDR;
NextState_fsm = { {1{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L95F21L108T22_AXI4MasterModule_L104F25L107T26_AXI4MasterModule_L106F45T63_Expr }/*expand*/;
end
end
end
else if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_Case == 1 ) begin
if ( Inputs_S2M_R_RVALID == 1 ) begin
NextState_ARDATA[0] = Inputs_S2M_R_RDATA0;
NextState_ARDATA[1] = Inputs_S2M_R_RDATA1;
NextState_ARDATA[2] = Inputs_S2M_R_RDATA2;
NextState_ARDATA[3] = Inputs_S2M_R_RDATA3;
NextState_fsm = { {1{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L112F21L115T22_AXI4MasterModule_L114F41T58_Expr }/*expand*/;
end
end
else if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_Case == 1 ) begin
NextState_fsm = { {2{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L118F37T54_Expr }/*expand*/;
end
else if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_Case == 1 ) begin
if ( Inputs_S2M_B_BVALID == 1 ) begin
NextState_fsm = AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L122F21L124T22_AXI4MasterModule_L123F41T58_Expr;
end
end
else if ( AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_Case == 1 ) begin
NextState_fsm = { {2{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L127F37T54_Expr }/*expand*/;
end
else begin
NextState_fsm = { {2{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L130F17L132T18_AXI4MasterModule_L131F37T54_Expr }/*expand*/;
end

end
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_CaseLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F17L92T27_CaseRhs = { {3{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L90F22T40_Expr }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_CaseLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F17L109T27_CaseRhs = { {3{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L93F22T39_Expr }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_CaseLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F17L116T27_CaseRhs = { {2{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L110F22T40_Expr }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_CaseLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F17L119T27_CaseRhs = { {2{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L117F22T39_Expr }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_CaseLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F17L125T27_CaseRhs = { {1{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L120F22T40_Expr }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_CaseLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F17L128T27_CaseRhs = { {1{1'b0}}, AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L126F22T39_Expr }/*expand*/;
assign AXI4MasterModule_L55F31T61_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L55F31T61_ExprRhs = { {2{1'b0}}, AXI4MasterModule_L55F44T61_Expr }/*expand*/;
assign AXI4MasterModule_L55F65T95_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L55F65T95_ExprRhs = { {1{1'b0}}, AXI4MasterModule_L55F78T95_Expr }/*expand*/;
assign AXI4MasterModule_L62F27T58_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L62F27T58_ExprRhs = { {2{1'b0}}, AXI4MasterModule_L62F40T58_Expr }/*expand*/;
assign AXI4MasterModule_L66F26T56_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L66F26T56_ExprRhs = { {2{1'b0}}, AXI4MasterModule_L66F39T56_Expr }/*expand*/;
assign AXI4MasterModule_L71F27T58_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L71F27T58_ExprRhs = { {1{1'b0}}, AXI4MasterModule_L71F40T58_Expr }/*expand*/;
assign AXI4MasterModule_L78F26T57_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L78F26T57_ExprRhs = { {1{1'b0}}, AXI4MasterModule_L78F39T57_Expr }/*expand*/;
assign AXI4MasterModule_L82F26T56_ExprLhs = { {1{1'b0}}, State_fsm }/*expand*/;
assign AXI4MasterModule_L82F26T56_ExprRhs = { {1{1'b0}}, AXI4MasterModule_L82F39T56_Expr }/*expand*/;
assign AXI4MasterModule_L53F39T60_Expr_1 = Inputs_RE;
assign AXI4MasterModule_L53F39T60_Expr_2 = Inputs_WE;
assign AXI4MasterModule_L87F9L135T10_AXI4MasterModule_L88F13L134T14_AXI4MasterModule_L94F25T47_Expr_1 = internalInvalidInputs;
assign AXI4MasterModule_L55F31T95_Expr_1 = AXI4MasterModule_L55F31T61_Expr;
assign AXI4MasterModule_L55F31T95_Expr_2 = AXI4MasterModule_L55F65T95_Expr;
assign Inputs_S2M_AR_ARREADY = S2M_AR_ARREADY;
assign Inputs_S2M_AW_AWREADY = S2M_AW_AWREADY;
assign Inputs_S2M_B_BID = S2M_B_BID;
assign Inputs_S2M_B_BRESP = S2M_B_BRESP;
assign Inputs_S2M_B_BUSER = S2M_B_BUSER;
assign Inputs_S2M_B_BVALID = S2M_B_BVALID;
assign Inputs_S2M_R_RID = S2M_R_RID;
assign Inputs_S2M_R_RDATA0 = S2M_R_RDATA0;
assign Inputs_S2M_R_RDATA1 = S2M_R_RDATA1;
assign Inputs_S2M_R_RDATA2 = S2M_R_RDATA2;
assign Inputs_S2M_R_RDATA3 = S2M_R_RDATA3;
assign Inputs_S2M_R_RRESP = S2M_R_RRESP;
assign Inputs_S2M_R_RLAST = S2M_R_RLAST;
assign Inputs_S2M_R_RUSER = S2M_R_RUSER;
assign Inputs_S2M_R_RVALID = S2M_R_RVALID;
assign Inputs_S2M_W_WREADY = S2M_W_WREADY;
assign Inputs_AXADDR = AXADDR;
assign Inputs_RE = RE;
assign Inputs_WE = WE;
assign Inputs_WDATA0 = WDATA0;
assign Inputs_WDATA1 = WDATA1;
assign Inputs_WDATA2 = WDATA2;
assign Inputs_WDATA3 = WDATA3;
assign Inputs_WSTRB = WSTRB;
assign internalInvalidInputs = AXI4MasterModule_L53F39T60_Expr;
assign InvalidInputs = internalInvalidInputs;
assign OutACK = AXI4MasterModule_L55F31T95_Expr;
assign RDATA0 = State_ARDATA[0];
assign RDATA1 = State_ARDATA[1];
assign RDATA2 = State_ARDATA[2];
assign RDATA3 = State_ARDATA[3];
assign M2S_AR_ARID = { {7{1'b0}}, AXI4_M_AR_L15F28T29_Expr }/*expand*/;
assign M2S_AR_ARADDR = State_AXADDR;
assign M2S_AR_ARLEN = { {7{1'b0}}, AXI4_M_AR_L17F29T30_Expr }/*expand*/;
assign M2S_AR_ARSIZE = { {1{1'b0}}, AXI4_M_AR_L18F33T43_Expr }/*expand*/;
assign M2S_AR_ARBURST = { {1{1'b0}}, AXI4_M_AR_L19F35T48_Expr }/*expand*/;
assign M2S_AR_ARLOCK = { {1{1'b0}}, AXI4_M_AR_L20F33T47_Expr }/*expand*/;
assign M2S_AR_ARCACHE = { {3{1'b0}}, AXI4_M_AR_L21F35T63_Expr }/*expand*/;
assign M2S_AR_ARPROT = { {1{1'b0}}, AXI4_M_AR_L22F33T66_Expr }/*expand*/;
assign M2S_AR_ARQOS = { {3{1'b0}}, AXI4_M_AR_L23F31T44_Expr }/*expand*/;
assign M2S_AR_ARREGION = { {7{1'b0}}, AXI4_M_AR_L24F32T33_Expr }/*expand*/;
assign M2S_AR_ARUSER = { {7{1'b0}}, AXI4_M_AR_L25F30T31_Expr }/*expand*/;
assign M2S_AR_ARVALID = AXI4MasterModule_L62F27T58_Expr;
assign M2S_R_RREADY = AXI4MasterModule_L66F26T56_Expr;
assign M2S_AW_AWID = { {7{1'b0}}, AXI4_M_AW_L14F28T29_Expr }/*expand*/;
assign M2S_AW_AWADDR = State_AXADDR;
assign M2S_AW_AWLEN = { {7{1'b0}}, AXI4_M_AW_L16F29T30_Expr }/*expand*/;
assign M2S_AW_AWSIZE = { {1{1'b0}}, AXI4_M_AW_L17F33T43_Expr }/*expand*/;
assign M2S_AW_AWBURST = { {1{1'b0}}, AXI4_M_AW_L18F35T48_Expr }/*expand*/;
assign M2S_AW_AWLOCK = { {1{1'b0}}, AXI4_M_AW_L19F33T47_Expr }/*expand*/;
assign M2S_AW_AWCACHE = { {3{1'b0}}, AXI4_M_AW_L20F35T63_Expr }/*expand*/;
assign M2S_AW_AWPROT = { {1{1'b0}}, AXI4_M_AW_L21F33T66_Expr }/*expand*/;
assign M2S_AW_AWQOS = { {3{1'b0}}, AXI4_M_AW_L22F31T44_Expr }/*expand*/;
assign M2S_AW_AWREGION = { {7{1'b0}}, AXI4_M_AW_L23F32T33_Expr }/*expand*/;
assign M2S_AW_AWUSER = { {7{1'b0}}, AXI4_M_AW_L24F30T31_Expr }/*expand*/;
assign M2S_AW_AWVALID = AXI4MasterModule_L71F27T58_Expr;
assign M2S_W_WID = { {7{1'b0}}, AXI4MasterModule_L75F23T24_Expr }/*expand*/;
assign M2S_W_WDATA0 = State_AWDATA[0];
assign M2S_W_WDATA1 = State_AWDATA[1];
assign M2S_W_WDATA2 = State_AWDATA[2];
assign M2S_W_WDATA3 = State_AWDATA[3];
assign M2S_W_WSTRB = State_WSTRB;
assign M2S_W_WLAST = AXI4_M_W_L17F29T33_Expr;
assign M2S_W_WUSER = { {7{1'b0}}, AXI4_M_W_L18F29T30_Expr }/*expand*/;
assign M2S_W_WVALID = AXI4MasterModule_L78F26T57_Expr;
assign M2S_B_BREADY = AXI4MasterModule_L82F26T56_Expr;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
