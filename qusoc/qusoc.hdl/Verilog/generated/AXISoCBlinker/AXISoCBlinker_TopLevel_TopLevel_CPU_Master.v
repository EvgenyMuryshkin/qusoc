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
// System configuration name is AXISoCBlinker_TopLevel_TopLevel_CPU_Master, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCBlinker_TopLevel_TopLevel_CPU_Master
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [103:0] Master,
	input wire [73:0] S2M,
	output wire [221:0] M2S,
	output wire RACK,
	output wire [7:0] RDATA0,
	output wire [7:0] RDATA1,
	output wire [7:0] RDATA2,
	output wire [7:0] RDATA3,
	output wire WACK
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [1: 0] size = 2'b10;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F22T44_Expr = 2'b00;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L129F21T32_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L113F33T54_Expr = 2'b01;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L129F21T32_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L114F36T41_Expr = 1'b0;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F22T43_Expr = 2'b01;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L133F21L136T22_AXI4MasterModule_L134F45T64_Expr = 2'b10;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F22T41_Expr = 2'b10;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L140F21L142T22_AXI4MasterModule_L141F48T52_Expr = 1'b1;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L145F21L147T22_AXI4MasterModule_L146F25T36_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L113F33T54_Expr = 2'b01;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L145F21L147T22_AXI4MasterModule_L146F25T36_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L114F36T41_Expr = 1'b0;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F22T45_Expr = 2'b00;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L155F21T33_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L119F34T56_Expr = 2'b01;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L155F21T33_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L120F36T41_Expr = 1'b0;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L155F21T33_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L121F35T40_Expr = 1'b0;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F22T44_Expr = 2'b01;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L159F21L163T22_AXI4MasterModule_L160F46T66_Expr = 2'b10;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F22T42_Expr = 2'b10;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L167F21L169T22_AXI4MasterModule_L168F48T52_Expr = 1'b1;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L172F21L174T22_AXI4MasterModule_L173F47T51_Expr = 1'b1;
	wire [1: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L177F21L179T22_AXI4MasterModule_L178F25T37_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L119F34T56_Expr = 2'b01;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L177F21L179T22_AXI4MasterModule_L178F25T37_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L120F36T41_Expr = 1'b0;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L177F21L179T22_AXI4MasterModule_L178F25T37_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L121F35T40_Expr = 1'b0;
	wire AXI4_M_AR_L18F28T29_Expr = 1'b0;
	wire AXI4_M_AR_L24F29T30_Expr = 1'b1;
	wire [2: 0] AXI4_M_AR_L27F33T43_Expr = 3'b010;
	wire [1: 0] AXI4_M_AR_L30F35T48_Expr = 2'b01;
	wire [1: 0] AXI4_M_AR_L33F33T47_Expr = 2'b00;
	wire [3: 0] AXI4_M_AR_L36F35T63_Expr = 4'b0000;
	wire [2: 0] AXI4_M_AR_L39F33T66_Expr = 3'b010;
	wire [3: 0] AXI4_M_AR_L42F31T44_Expr = 4'b0000;
	wire AXI4_M_AR_L45F32T33_Expr = 1'b0;
	wire AXI4_M_AR_L48F30T31_Expr = 1'b0;
	wire AXI4_M_AW_L17F28T29_Expr = 1'b0;
	wire AXI4_M_AW_L23F29T30_Expr = 1'b1;
	wire [2: 0] AXI4_M_AW_L26F33T43_Expr = 3'b010;
	wire [1: 0] AXI4_M_AW_L29F35T48_Expr = 2'b01;
	wire [1: 0] AXI4_M_AW_L32F33T47_Expr = 2'b00;
	wire [3: 0] AXI4_M_AW_L35F35T63_Expr = 4'b0000;
	wire [2: 0] AXI4_M_AW_L38F33T66_Expr = 3'b010;
	wire [3: 0] AXI4_M_AW_L41F31T44_Expr = 4'b0000;
	wire AXI4_M_AW_L44F32T33_Expr = 1'b0;
	wire AXI4_M_AW_L47F30T31_Expr = 1'b0;
	wire AXI4MasterModule_L99F27T28_Expr = 1'b0;
	wire AXI4_M_W_L24F29T33_Expr = 1'b1;
	wire AXI4_M_W_L27F29T30_Expr = 1'b0;
	wire [1: 0] AXI4MasterModule_L71F46T65_Expr = 2'b10;
	wire [1: 0] AXI4MasterModule_L74F47T67_Expr = 2'b10;
	wire [31: 0] Inputs_Master_ARADDR;
	wire [31: 0] Inputs_Master_AWADDR;
	wire Inputs_Master_BREADY;
	wire Inputs_Master_RE;
	wire Inputs_Master_RREADY;
	wire Inputs_Master_WE;
	wire [3: 0] Inputs_Master_WSTRB;
	wire Inputs_S2M_R_AR_ARREADY;
	wire [7: 0] Inputs_S2M_R_R_RID;
	wire [1: 0] Inputs_S2M_R_R_RRESP;
	wire Inputs_S2M_R_R_RLAST;
	wire [7: 0] Inputs_S2M_R_R_RUSER;
	wire Inputs_S2M_R_R_RVALID;
	wire Inputs_S2M_W_AW_AWREADY;
	wire [7: 0] Inputs_S2M_W_B_BID;
	wire [1: 0] Inputs_S2M_W_B_BRESP;
	wire [7: 0] Inputs_S2M_W_B_BUSER;
	wire Inputs_S2M_W_B_BVALID;
	wire Inputs_S2M_W_W_WREADY;
	reg NextState_ARREADYACK;
	reg NextState_AWREADYACK;
	reg [1: 0] NextState_readFSM;
	reg NextState_WREADYACK;
	reg [1: 0] NextState_writeFSM;
	wire readAck;
	wire writeAck;
	reg State_ARREADYACK = 1'b0;
	wire State_ARREADYACKDefault = 1'b0;
	reg State_AWREADYACK = 1'b0;
	wire State_AWREADYACKDefault = 1'b0;
	reg [1: 0] State_readFSM = 2'b00;
	wire [1: 0] State_readFSMDefault = 2'b00;
	reg State_WREADYACK = 1'b0;
	wire State_WREADYACKDefault = 1'b0;
	reg [1: 0] State_writeFSM = 2'b00;
	wire [1: 0] State_writeFSMDefault = 2'b00;
	wire AXI4MasterModule_L68F25T66_Expr;
	wire AXI4MasterModule_L68F25T66_Expr_1;
	wire AXI4MasterModule_L68F25T66_Expr_2;
	wire AXI4MasterModule_L69F26T86_Expr;
	wire AXI4MasterModule_L69F26T86_Expr_1;
	wire AXI4MasterModule_L69F26T86_Expr_2;
	wire AXI4MasterModule_L69F26T61_Expr;
	wire AXI4MasterModule_L69F26T61_Expr_1;
	wire AXI4MasterModule_L69F26T61_Expr_2;
	wire AXI4MasterModule_L71F29T76_Expr;
	wire AXI4MasterModule_L71F29T76_Expr_1;
	wire AXI4MasterModule_L71F29T76_Expr_2;
	wire AXI4MasterModule_L74F29T79_Expr;
	wire AXI4MasterModule_L74F29T79_Expr_1;
	wire AXI4MasterModule_L74F29T79_Expr_2;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_Case;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_CaseLhs;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_CaseRhs;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_Case;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_CaseLhs;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_CaseRhs;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_Case;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_CaseLhs;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_CaseRhs;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_Case;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_CaseLhs;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_CaseRhs;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_Case;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_CaseLhs;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_CaseRhs;
	wire AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_Case;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_CaseLhs;
	wire signed [2: 0] AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_CaseRhs;
	wire AXI4MasterModule_L71F29T65_Expr;
	wire signed [2: 0] AXI4MasterModule_L71F29T65_ExprLhs;
	wire signed [2: 0] AXI4MasterModule_L71F29T65_ExprRhs;
	wire AXI4MasterModule_L74F29T67_Expr;
	wire signed [2: 0] AXI4MasterModule_L74F29T67_ExprLhs;
	wire signed [2: 0] AXI4MasterModule_L74F29T67_ExprRhs;
	wire [7 : 0] Inputs_Master_WDATA [0 : 3];
	wire [7 : 0] Inputs_S2M_R_R_RDATA [0 : 3];
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_ARREADYACK <= State_ARREADYACKDefault;
			State_AWREADYACK <= State_AWREADYACKDefault;
			State_readFSM <= State_readFSMDefault;
			State_WREADYACK <= State_WREADYACKDefault;
			State_writeFSM <= State_writeFSMDefault;
		end
		else
		begin
			State_ARREADYACK <= NextState_ARREADYACK;
			State_AWREADYACK <= NextState_AWREADYACK;
			State_readFSM <= NextState_readFSM;
			State_WREADYACK <= NextState_WREADYACK;
			State_writeFSM <= NextState_writeFSM;
		end
	end
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_Case = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_CaseLhs == AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_Case = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_CaseLhs == AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_Case = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_CaseLhs == AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_Case = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_CaseLhs == AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_Case = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_CaseLhs == AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_Case = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_CaseLhs == AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L71F29T65_Expr = AXI4MasterModule_L71F29T65_ExprLhs == AXI4MasterModule_L71F29T65_ExprRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L74F29T67_Expr = AXI4MasterModule_L74F29T67_ExprLhs == AXI4MasterModule_L74F29T67_ExprRhs ? 1'b1 : 1'b0;
	assign AXI4MasterModule_L68F25T66_Expr = AXI4MasterModule_L68F25T66_Expr_1 & AXI4MasterModule_L68F25T66_Expr_2;
	assign AXI4MasterModule_L69F26T86_Expr = AXI4MasterModule_L69F26T86_Expr_1 & AXI4MasterModule_L69F26T86_Expr_2;
	assign AXI4MasterModule_L69F26T61_Expr = AXI4MasterModule_L69F26T61_Expr_1 & AXI4MasterModule_L69F26T61_Expr_2;
	assign AXI4MasterModule_L71F29T76_Expr = AXI4MasterModule_L71F29T76_Expr_1 & AXI4MasterModule_L71F29T76_Expr_2;
	assign AXI4MasterModule_L74F29T79_Expr = AXI4MasterModule_L74F29T79_Expr_1 & AXI4MasterModule_L74F29T79_Expr_2;
	always @ (*)
	begin
		NextState_ARREADYACK = State_ARREADYACK;
		NextState_AWREADYACK = State_AWREADYACK;
		NextState_readFSM = State_readFSM;
		NextState_WREADYACK = State_WREADYACK;
		NextState_writeFSM = State_writeFSM;
		if ((AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_Case == 1))
		begin
			NextState_readFSM = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L129F21T32_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L113F33T54_Expr;
			NextState_ARREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L129F21T32_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L114F36T41_Expr;
		end
		else if ((AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_Case == 1))
		begin
			if ((Inputs_Master_RE == 1))
			begin
				NextState_readFSM = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L133F21L136T22_AXI4MasterModule_L134F45T64_Expr;
				NextState_ARREADYACK = Inputs_S2M_R_AR_ARREADY;
			end
		end
		else if ((AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_Case == 1))
		begin
			if ((Inputs_S2M_R_AR_ARREADY == 1))
			begin
				NextState_ARREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L140F21L142T22_AXI4MasterModule_L141F48T52_Expr;
			end
			if ((readAck == 1))
			begin
				NextState_readFSM = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L145F21L147T22_AXI4MasterModule_L146F25T36_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L113F33T54_Expr;
				NextState_ARREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L145F21L147T22_AXI4MasterModule_L146F25T36_AXI4MasterModule_L112F9L115T10_AXI4MasterModule_L114F36T41_Expr;
			end
		end
		if ((AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_Case == 1))
		begin
			NextState_writeFSM = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L155F21T33_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L119F34T56_Expr;
			NextState_AWREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L155F21T33_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L120F36T41_Expr;
			NextState_WREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L155F21T33_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L121F35T40_Expr;
		end
		else if ((AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_Case == 1))
		begin
			if ((Inputs_Master_WE == 1))
			begin
				NextState_writeFSM = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L159F21L163T22_AXI4MasterModule_L160F46T66_Expr;
				NextState_AWREADYACK = Inputs_S2M_W_AW_AWREADY;
				NextState_WREADYACK = Inputs_S2M_W_W_WREADY;
			end
		end
		else if ((AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_Case == 1))
		begin
			if ((Inputs_S2M_W_AW_AWREADY == 1))
			begin
				NextState_AWREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L167F21L169T22_AXI4MasterModule_L168F48T52_Expr;
			end
			if ((Inputs_S2M_W_W_WREADY == 1))
			begin
				NextState_WREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L172F21L174T22_AXI4MasterModule_L173F47T51_Expr;
			end
			if ((writeAck == 1))
			begin
				NextState_writeFSM = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L177F21L179T22_AXI4MasterModule_L178F25T37_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L119F34T56_Expr;
				NextState_AWREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L177F21L179T22_AXI4MasterModule_L178F25T37_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L120F36T41_Expr;
				NextState_WREADYACK = AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L177F21L179T22_AXI4MasterModule_L178F25T37_AXI4MasterModule_L118F9L122T10_AXI4MasterModule_L121F35T40_Expr;
			end
		end
	end
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_CaseLhs = {
		1'b0,
		State_readFSM
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F17L130T27_CaseRhs = {
		1'b0,
		AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L128F22T44_Expr
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_CaseLhs = {
		1'b0,
		State_readFSM
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F17L137T27_CaseRhs = {
		1'b0,
		AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L131F22T43_Expr
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_CaseLhs = {
		1'b0,
		State_readFSM
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F17L149T27_CaseRhs = {
		1'b0,
		AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L126F13L150T14_AXI4MasterModule_L138F22T41_Expr
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_CaseLhs = {
		1'b0,
		State_writeFSM
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F17L156T27_CaseRhs = {
		1'b0,
		AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L154F22T45_Expr
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_CaseLhs = {
		1'b0,
		State_writeFSM
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F17L164T27_CaseRhs = {
		1'b0,
		AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L157F22T44_Expr
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_CaseLhs = {
		1'b0,
		State_writeFSM
	}
	;
	assign AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F17L180T27_CaseRhs = {
		1'b0,
		AXI4MasterModule_L125F9L182T10_AXI4MasterModule_L152F13L181T14_AXI4MasterModule_L165F22T42_Expr
	}
	;
	assign AXI4MasterModule_L71F29T65_ExprLhs = {
		1'b0,
		State_readFSM
	}
	;
	assign AXI4MasterModule_L71F29T65_ExprRhs = {
		1'b0,
		AXI4MasterModule_L71F46T65_Expr
	}
	;
	assign AXI4MasterModule_L74F29T67_ExprLhs = {
		1'b0,
		State_writeFSM
	}
	;
	assign AXI4MasterModule_L74F29T67_ExprRhs = {
		1'b0,
		AXI4MasterModule_L74F47T67_Expr
	}
	;
	assign AXI4MasterModule_L68F25T66_Expr_1 = State_ARREADYACK;
	assign AXI4MasterModule_L68F25T66_Expr_2 = Inputs_S2M_R_R_RVALID;
	assign AXI4MasterModule_L69F26T86_Expr_1 = AXI4MasterModule_L69F26T61_Expr;
	assign AXI4MasterModule_L69F26T86_Expr_2 = Inputs_S2M_W_B_BVALID;
	assign AXI4MasterModule_L69F26T61_Expr_1 = State_AWREADYACK;
	assign AXI4MasterModule_L69F26T61_Expr_2 = State_WREADYACK;
	assign AXI4MasterModule_L71F29T76_Expr_1 = AXI4MasterModule_L71F29T65_Expr;
	assign AXI4MasterModule_L71F29T76_Expr_2 = readAck;
	assign AXI4MasterModule_L74F29T79_Expr_1 = AXI4MasterModule_L74F29T67_Expr;
	assign AXI4MasterModule_L74F29T79_Expr_2 = writeAck;
	assign Inputs_Master_WSTRB = Master[103:100];
	assign Inputs_Master_WE = Master[99];
	assign Inputs_Master_WDATA[3] = Master[98:91];
	assign Inputs_Master_WDATA[2] = Master[90:83];
	assign Inputs_Master_WDATA[1] = Master[82:75];
	assign Inputs_Master_WDATA[0] = Master[74:67];
	assign Inputs_Master_RREADY = Master[66];
	assign Inputs_Master_RE = Master[65];
	assign Inputs_Master_BREADY = Master[64];
	assign Inputs_Master_AWADDR = Master[63:32];
	assign Inputs_Master_ARADDR = Master[31:0];
	assign Inputs_S2M_W_W_WREADY = S2M[73];
	assign Inputs_S2M_W_B_BVALID = S2M[72];
	assign Inputs_S2M_W_B_BUSER = S2M[71:64];
	assign Inputs_S2M_W_B_BRESP = S2M[63:62];
	assign Inputs_S2M_W_B_BID = S2M[61:54];
	assign Inputs_S2M_W_AW_AWREADY = S2M[53];
	assign Inputs_S2M_R_R_RVALID = S2M[52];
	assign Inputs_S2M_R_R_RUSER = S2M[51:44];
	assign Inputs_S2M_R_R_RLAST = S2M[43];
	assign Inputs_S2M_R_R_RRESP = S2M[42:41];
	assign Inputs_S2M_R_R_RDATA[3] = S2M[40:33];
	assign Inputs_S2M_R_R_RDATA[2] = S2M[32:25];
	assign Inputs_S2M_R_R_RDATA[1] = S2M[24:17];
	assign Inputs_S2M_R_R_RDATA[0] = S2M[16:9];
	assign Inputs_S2M_R_R_RID = S2M[8:1];
	assign Inputs_S2M_R_AR_ARREADY = S2M[0];
	assign readAck = AXI4MasterModule_L68F25T66_Expr;
	assign writeAck = AXI4MasterModule_L69F26T86_Expr;
	assign M2S[221] = Inputs_Master_BREADY;
	assign M2S[220] = Inputs_Master_WE;
	assign M2S[219:212] = {
		{7{1'b0}},
		AXI4_M_W_L27F29T30_Expr
	}
	;
	assign M2S[211] = AXI4_M_W_L24F29T33_Expr;
	assign M2S[210:207] = Inputs_Master_WSTRB;
	assign M2S[206:199] = Inputs_Master_WDATA[3];
	assign M2S[198:191] = Inputs_Master_WDATA[2];
	assign M2S[190:183] = Inputs_Master_WDATA[1];
	assign M2S[182:175] = Inputs_Master_WDATA[0];
	assign M2S[174:167] = {
		{7{1'b0}},
		AXI4MasterModule_L99F27T28_Expr
	}
	;
	assign M2S[166] = Inputs_Master_WE;
	assign M2S[165:158] = {
		{7{1'b0}},
		AXI4_M_AW_L47F30T31_Expr
	}
	;
	assign M2S[157:150] = {
		{7{1'b0}},
		AXI4_M_AW_L44F32T33_Expr
	}
	;
	assign M2S[149:146] = AXI4_M_AW_L41F31T44_Expr;
	assign M2S[145:143] = AXI4_M_AW_L38F33T66_Expr;
	assign M2S[142:139] = AXI4_M_AW_L35F35T63_Expr;
	assign M2S[138:137] = AXI4_M_AW_L32F33T47_Expr;
	assign M2S[136:135] = AXI4_M_AW_L29F35T48_Expr;
	assign M2S[134:132] = AXI4_M_AW_L26F33T43_Expr;
	assign M2S[131:124] = {
		{7{1'b0}},
		AXI4_M_AW_L23F29T30_Expr
	}
	;
	assign M2S[123:92] = Inputs_Master_AWADDR;
	assign M2S[91:84] = {
		{7{1'b0}},
		AXI4_M_AW_L17F28T29_Expr
	}
	;
	assign M2S[83] = Inputs_Master_RREADY;
	assign M2S[82] = Inputs_Master_RE;
	assign M2S[81:74] = {
		{7{1'b0}},
		AXI4_M_AR_L48F30T31_Expr
	}
	;
	assign M2S[73:66] = {
		{7{1'b0}},
		AXI4_M_AR_L45F32T33_Expr
	}
	;
	assign M2S[65:62] = AXI4_M_AR_L42F31T44_Expr;
	assign M2S[61:59] = AXI4_M_AR_L39F33T66_Expr;
	assign M2S[58:55] = AXI4_M_AR_L36F35T63_Expr;
	assign M2S[54:53] = AXI4_M_AR_L33F33T47_Expr;
	assign M2S[52:51] = AXI4_M_AR_L30F35T48_Expr;
	assign M2S[50:48] = AXI4_M_AR_L27F33T43_Expr;
	assign M2S[47:40] = {
		{7{1'b0}},
		AXI4_M_AR_L24F29T30_Expr
	}
	;
	assign M2S[39:8] = Inputs_Master_ARADDR;
	assign M2S[7:0] = {
		{7{1'b0}},
		AXI4_M_AR_L18F28T29_Expr
	}
	;
	assign RACK = AXI4MasterModule_L71F29T76_Expr;
	assign RDATA0 = Inputs_S2M_R_R_RDATA[0];
	assign RDATA1 = Inputs_S2M_R_R_RDATA[1];
	assign RDATA2 = Inputs_S2M_R_R_RDATA[2];
	assign RDATA3 = Inputs_S2M_R_R_RDATA[3];
	assign WACK = AXI4MasterModule_L74F29T79_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
