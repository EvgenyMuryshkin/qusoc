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
// System configuration name is AXISoCDualCoreModule_TopLevel_CPU0, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCDualCoreModule_TopLevel_CPU0
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [73:0] S2M,
	output wire [221:0] M2S
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [0: 0] ARUSER = 1'b0;
	wire [1: 0] AXI4RISCVModule_L50F52T53_Expr = 2'b11;
	wire [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L39F69T75_Expr = 4'b1111;
	wire AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F42T43_Expr = 1'b0;
	wire [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L42F69T75_Expr = 4'b0001;
	wire AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F47T48_Expr = 1'b1;
	wire [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L44F69T75_Expr = 4'b0011;
	wire AXI4RISCVModule_L64F35T36_Expr = 1'b0;
	wire RISCVModule_Types_L11F30T35_Expr = 1'b0;
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
	wire [1: 0] addressBits;
	wire [4: 0] internalByte;
	wire [31: 0] internalWriteData;
	wire [3: 0] memAccessWSTRB;
	wire [3: 0] wstrb;
	wire [31: 0] CPU_BaseAddress;
	wire CPU_ExtIRQ;
	wire [31: 0] CPU_MemReadData;
	wire CPU_MemReady;
	wire CPU_BREADY;
	wire CPU_IsHalted;
	wire [2: 0] CPU_MemAccessMode;
	wire [31: 0] CPU_MemAddress;
	wire CPU_MemRead;
	wire CPU_MemWrite;
	wire [31: 0] CPU_MemWriteData;
	wire CPU_RREADY;
	wire [111: 0] Master_Master;
	wire [73: 0] Master_S2M;
	wire [221: 0] Master_M2S;
	wire Master_RACK;
	wire Master_WACK;
	wire [1: 0] AXI4RISCVModule_L49F36T73_Index;
	wire [31: 0] AXI4RISCVModule_L53F42T88_Resize;
	reg [3: 0] AXI4RISCVModule_L38F13L47T14_mask;
	wire [3: 0] AXI4RISCVModule_L52F30T67_Index;
	wire [65: 0] AXI4RISCVModule_L62F23L67T18_Object;
	wire [31: 0] AXI4RISCVModule_L66F35T64_Source;
	wire [185: 0] AXI4RISCVModule_L71F23L86T18_Object;
	wire [31: 0] CPU_BaseAddress_CPU_BaseAddress_HardLink;
	wire CPU_ExtIRQ_CPU_ExtIRQ_HardLink;
	wire [31: 0] CPU_MemReadData_CPU_MemReadData_HardLink;
	wire CPU_MemReady_CPU_MemReady_HardLink;
	wire CPU_BREADY_CPU_BREADY_HardLink;
	wire CPU_IsHalted_CPU_IsHalted_HardLink;
	wire [2: 0] CPU_MemAccessMode_CPU_MemAccessMode_HardLink;
	wire [31: 0] CPU_MemAddress_CPU_MemAddress_HardLink;
	wire CPU_MemRead_CPU_MemRead_HardLink;
	wire CPU_MemWrite_CPU_MemWrite_HardLink;
	wire [31: 0] CPU_MemWriteData_CPU_MemWriteData_HardLink;
	wire CPU_RREADY_CPU_RREADY_HardLink;
	wire [111: 0] Master_Master_Master_Master_HardLink;
	wire [73: 0] Master_S2M_Master_S2M_HardLink;
	wire [221: 0] Master_M2S_Master_M2S_HardLink;
	wire Master_RACK_Master_RACK_HardLink;
	wire [7: 0] Master_RDATA0_Master_RDATA_HardLink;
	wire [7: 0] Master_RDATA1_Master_RDATA_HardLink;
	wire [7: 0] Master_RDATA2_Master_RDATA_HardLink;
	wire [7: 0] Master_RDATA3_Master_RDATA_HardLink;
	wire Master_WACK_Master_WACK_HardLink;
	wire [4: 0] AXI4RISCVModule_L50F37T53_Expr;
	wire [4: 0] AXI4RISCVModule_L50F37T53_Expr_1;
	wire [31: 0] AXI4RISCVModule_L53F43T75_Expr;
	wire [31: 0] AXI4RISCVModule_L53F43T75_Expr_1;
	wire [3: 0] AXI4RISCVModule_L52F31T60_Expr;
	wire [3: 0] AXI4RISCVModule_L52F31T60_Expr_1;
	wire AXI4RISCVModule_L65F32T58_Expr;
	wire AXI4RISCVModule_L65F32T58_Expr_1;
	wire AXI4RISCVModule_L65F32T58_Expr_2;
	wire AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_Expr;
	wire signed [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_ExprLhs;
	wire signed [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_ExprRhs;
	wire AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_Expr;
	wire signed [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_ExprLhs;
	wire signed [3: 0] AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_ExprRhs;
	wire [7 : 0] Inputs_S2M_R_R_RDATA [0 : 3];
	wire [7 : 0] Master_RDATA [0 : 3];
	assign AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_Expr = AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_ExprLhs == AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_ExprRhs ? 1'b1 : 1'b0;
	assign AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_Expr = AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_ExprLhs == AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_ExprRhs ? 1'b1 : 1'b0;
	assign AXI4RISCVModule_L50F37T53_Expr[0] = 0;
	assign AXI4RISCVModule_L50F37T53_Expr[1] = 0;
	assign AXI4RISCVModule_L50F37T53_Expr[2] = 0;
	assign AXI4RISCVModule_L50F37T53_Expr[3] = AXI4RISCVModule_L50F37T53_Expr_1[0];
	assign AXI4RISCVModule_L50F37T53_Expr[4] = AXI4RISCVModule_L50F37T53_Expr_1[1];
	assign AXI4RISCVModule_L53F43T75_Expr = (AXI4RISCVModule_L53F43T75_Expr_1 << internalByte);
	assign AXI4RISCVModule_L52F31T60_Expr = (AXI4RISCVModule_L52F31T60_Expr_1 << addressBits);
	assign AXI4RISCVModule_L65F32T58_Expr = AXI4RISCVModule_L65F32T58_Expr_1 | AXI4RISCVModule_L65F32T58_Expr_2;
	AXISoCDualCoreModule_TopLevel_CPU0_CPU
	AXISoCDualCoreModule_TopLevel_CPU0_CPU
	(
		// [BEGIN USER MAP FOR CPU]
		// [END USER MAP FOR CPU]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.BaseAddress (CPU_BaseAddress_CPU_BaseAddress_HardLink),
		.ExtIRQ (CPU_ExtIRQ_CPU_ExtIRQ_HardLink),
		.MemReadData (CPU_MemReadData_CPU_MemReadData_HardLink),
		.MemReady (CPU_MemReady_CPU_MemReady_HardLink),
		.BREADY (CPU_BREADY_CPU_BREADY_HardLink),
		.IsHalted (CPU_IsHalted_CPU_IsHalted_HardLink),
		.MemAccessMode (CPU_MemAccessMode_CPU_MemAccessMode_HardLink),
		.MemAddress (CPU_MemAddress_CPU_MemAddress_HardLink),
		.MemRead (CPU_MemRead_CPU_MemRead_HardLink),
		.MemWrite (CPU_MemWrite_CPU_MemWrite_HardLink),
		.MemWriteData (CPU_MemWriteData_CPU_MemWriteData_HardLink),
		.RREADY (CPU_RREADY_CPU_RREADY_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_CPU0_Master
	AXISoCDualCoreModule_TopLevel_CPU0_Master
	(
		// [BEGIN USER MAP FOR Master]
		// [END USER MAP FOR Master]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.Master (Master_Master_Master_Master_HardLink),
		.S2M (Master_S2M_Master_S2M_HardLink),
		.M2S (Master_M2S_Master_M2S_HardLink),
		.RACK (Master_RACK_Master_RACK_HardLink),
		.RDATA0 (Master_RDATA0_Master_RDATA_HardLink),
		.RDATA1 (Master_RDATA1_Master_RDATA_HardLink),
		.RDATA2 (Master_RDATA2_Master_RDATA_HardLink),
		.RDATA3 (Master_RDATA3_Master_RDATA_HardLink),
		.WACK (Master_WACK_Master_WACK_HardLink)
	);
	always @ (*)
	begin
		AXI4RISCVModule_L38F13L47T14_mask = AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L39F69T75_Expr;
		if ((AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_Expr == 1))
		begin
			AXI4RISCVModule_L38F13L47T14_mask = AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L42F69T75_Expr;
		end
		else if ((AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_Expr == 1))
		begin
			AXI4RISCVModule_L38F13L47T14_mask = AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L44F69T75_Expr;
		end
	end
	assign AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_ExprLhs = {
		1'b0,
		CPU_MemAccessMode
	}
	;
	assign AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F21T43_ExprRhs = {
		{3{1'b0}},
		AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L41F42T43_Expr
	}
	;
	assign AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_ExprLhs = {
		1'b0,
		CPU_MemAccessMode
	}
	;
	assign AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F26T48_ExprRhs = {
		{3{1'b0}},
		AXI4RISCVModule_L38F13L47T14_AXI4RISCVModule_L43F47T48_Expr
	}
	;
	assign AXI4RISCVModule_L50F37T53_Expr_1 = {
		{3{1'b0}},
		addressBits
	}
	;
	assign AXI4RISCVModule_L53F43T75_Expr_1 = CPU_MemWriteData;
	assign AXI4RISCVModule_L52F31T60_Expr_1 = memAccessWSTRB;
	assign AXI4RISCVModule_L65F32T58_Expr_1 = Master_RACK;
	assign AXI4RISCVModule_L65F32T58_Expr_2 = Master_WACK;
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
	assign AXI4RISCVModule_L49F36T73_Index = CPU_MemAddress[1:0];
	assign addressBits = AXI4RISCVModule_L49F36T73_Index;
	assign internalByte = AXI4RISCVModule_L50F37T53_Expr;
	assign AXI4RISCVModule_L53F42T88_Resize = AXI4RISCVModule_L53F43T75_Expr;
	assign internalWriteData = AXI4RISCVModule_L53F42T88_Resize;
	assign memAccessWSTRB = AXI4RISCVModule_L38F13L47T14_mask;
	assign AXI4RISCVModule_L52F30T67_Index = AXI4RISCVModule_L52F31T60_Expr[3:0];
	assign wstrb = AXI4RISCVModule_L52F30T67_Index;
	assign AXI4RISCVModule_L62F23L67T18_Object[31:0] = {
		{31{1'b0}},
		AXI4RISCVModule_L64F35T36_Expr
	}
	;
	assign AXI4RISCVModule_L62F23L67T18_Object[32] = RISCVModule_Types_L11F30T35_Expr;
	assign AXI4RISCVModule_L66F35T64_Source = {
		Master_RDATA[3],
		Master_RDATA[2],
		Master_RDATA[1],
		Master_RDATA[0]
	}
	;
	assign AXI4RISCVModule_L62F23L67T18_Object[64:33] = AXI4RISCVModule_L66F35T64_Source;
	assign AXI4RISCVModule_L62F23L67T18_Object[65] = AXI4RISCVModule_L65F32T58_Expr;
	assign CPU_MemReady = AXI4RISCVModule_L62F23L67T18_Object[65];
	assign CPU_MemReadData = AXI4RISCVModule_L62F23L67T18_Object[64:33];
	assign CPU_ExtIRQ = AXI4RISCVModule_L62F23L67T18_Object[32];
	assign CPU_BaseAddress = AXI4RISCVModule_L62F23L67T18_Object[31:0];
	assign AXI4RISCVModule_L71F23L86T18_Object[31:0] = CPU_MemAddress;
	assign AXI4RISCVModule_L71F23L86T18_Object[39:32] = {
		{7{1'b0}},
		ARUSER
	}
	;
	assign AXI4RISCVModule_L71F23L86T18_Object[71:40] = CPU_MemAddress;
	assign AXI4RISCVModule_L71F23L86T18_Object[72] = CPU_BREADY;
	assign AXI4RISCVModule_L71F23L86T18_Object[73] = CPU_MemRead;
	assign AXI4RISCVModule_L71F23L86T18_Object[74] = CPU_RREADY;
	assign AXI4RISCVModule_L71F23L86T18_Object[106:75] = internalWriteData;
	assign AXI4RISCVModule_L71F23L86T18_Object[107] = CPU_MemWrite;
	assign AXI4RISCVModule_L71F23L86T18_Object[111:108] = wstrb;
	assign AXI4RISCVModule_L71F23L86T18_Object[112] = Inputs_S2M_R_AR_ARREADY;
	assign AXI4RISCVModule_L71F23L86T18_Object[120:113] = Inputs_S2M_R_R_RID;
	assign AXI4RISCVModule_L71F23L86T18_Object[152:121] = {
		Inputs_S2M_R_R_RDATA[3],
		Inputs_S2M_R_R_RDATA[2],
		Inputs_S2M_R_R_RDATA[1],
		Inputs_S2M_R_R_RDATA[0]
	}
	;
	assign AXI4RISCVModule_L71F23L86T18_Object[154:153] = Inputs_S2M_R_R_RRESP;
	assign AXI4RISCVModule_L71F23L86T18_Object[155] = Inputs_S2M_R_R_RLAST;
	assign AXI4RISCVModule_L71F23L86T18_Object[163:156] = Inputs_S2M_R_R_RUSER;
	assign AXI4RISCVModule_L71F23L86T18_Object[164] = Inputs_S2M_R_R_RVALID;
	assign AXI4RISCVModule_L71F23L86T18_Object[165] = Inputs_S2M_W_AW_AWREADY;
	assign AXI4RISCVModule_L71F23L86T18_Object[173:166] = Inputs_S2M_W_B_BID;
	assign AXI4RISCVModule_L71F23L86T18_Object[175:174] = Inputs_S2M_W_B_BRESP;
	assign AXI4RISCVModule_L71F23L86T18_Object[183:176] = Inputs_S2M_W_B_BUSER;
	assign AXI4RISCVModule_L71F23L86T18_Object[184] = Inputs_S2M_W_B_BVALID;
	assign AXI4RISCVModule_L71F23L86T18_Object[185] = Inputs_S2M_W_W_WREADY;
	assign Master_S2M = AXI4RISCVModule_L71F23L86T18_Object[185:112];
	assign Master_Master = AXI4RISCVModule_L71F23L86T18_Object[111:0];
	assign M2S = Master_M2S;
	assign CPU_BaseAddress_CPU_BaseAddress_HardLink = CPU_BaseAddress;
	assign CPU_ExtIRQ_CPU_ExtIRQ_HardLink = CPU_ExtIRQ;
	assign CPU_MemReadData_CPU_MemReadData_HardLink = CPU_MemReadData;
	assign CPU_MemReady_CPU_MemReady_HardLink = CPU_MemReady;
	assign CPU_BREADY = CPU_BREADY_CPU_BREADY_HardLink;
	assign CPU_IsHalted = CPU_IsHalted_CPU_IsHalted_HardLink;
	assign CPU_MemAccessMode = CPU_MemAccessMode_CPU_MemAccessMode_HardLink;
	assign CPU_MemAddress = CPU_MemAddress_CPU_MemAddress_HardLink;
	assign CPU_MemRead = CPU_MemRead_CPU_MemRead_HardLink;
	assign CPU_MemWrite = CPU_MemWrite_CPU_MemWrite_HardLink;
	assign CPU_MemWriteData = CPU_MemWriteData_CPU_MemWriteData_HardLink;
	assign CPU_RREADY = CPU_RREADY_CPU_RREADY_HardLink;
	assign Master_Master_Master_Master_HardLink = Master_Master;
	assign Master_S2M_Master_S2M_HardLink = Master_S2M;
	assign Master_M2S = Master_M2S_Master_M2S_HardLink;
	assign Master_RACK = Master_RACK_Master_RACK_HardLink;
	assign Master_RDATA[0] = Master_RDATA0_Master_RDATA_HardLink;
	assign Master_RDATA[1] = Master_RDATA1_Master_RDATA_HardLink;
	assign Master_RDATA[2] = Master_RDATA2_Master_RDATA_HardLink;
	assign Master_RDATA[3] = Master_RDATA3_Master_RDATA_HardLink;
	assign Master_WACK = Master_WACK_Master_WACK_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
