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
// System configuration name is StageArraysPipelineModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module StageArraysPipelineModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire inReady,
	input wire [7: 0] inData0,
	input wire [7: 0] inData1,
	input wire [7: 0] inData2,
	input wire [7: 0] inData3,
	input wire [7: 0] inData4,
	input wire [7: 0] inData5,
	input wire [7: 0] inData6,
	input wire [7: 0] inData7,
	output wire outReady,
	output wire [15: 0] outResult
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [5: 0] Pipeline_StageArraysPipelineModule_L30F25T27_Expr = 6'b101010;
	wire Inputs_inReady;
	wire [7: 0] Inputs_inData0;
	wire [7: 0] Inputs_inData1;
	wire [7: 0] Inputs_inData2;
	wire [7: 0] Inputs_inData3;
	wire [7: 0] Inputs_inData4;
	wire [7: 0] Inputs_inData5;
	wire [7: 0] Inputs_inData6;
	wire [7: 0] Inputs_inData7;
	reg Pipeline_stage0_NextState_IsS0Ready;
	reg [15: 0] Pipeline_stage0_NextState_sums0;
	reg [15: 0] Pipeline_stage0_NextState_sums1;
	reg [15: 0] Pipeline_stage0_NextState_sums2;
	reg [15: 0] Pipeline_stage0_NextState_sums3;
	reg [15: 0] Pipeline_stage0_NextState_sums4;
	reg Pipeline_stage1_NextState_IsS1Ready;
	reg [15: 0] Pipeline_stage1_NextState_s0Sums0;
	reg [15: 0] Pipeline_stage1_NextState_s0Sums1;
	reg [15: 0] Pipeline_stage1_NextState_s0Sums2;
	reg [15: 0] Pipeline_stage1_NextState_s0Sums3;
	reg [15: 0] Pipeline_stage1_NextState_s0Sums4;
	reg [15: 0] Pipeline_stage1_NextState_sums0;
	reg [15: 0] Pipeline_stage1_NextState_sums1;
	reg Pipeline_stage2_NextState_ready;
	reg [15: 0] Pipeline_stage2_NextState_result;
	wire Pipeline_Inputs_inReady;
	wire [7: 0] Pipeline_Inputs_inData0;
	wire [7: 0] Pipeline_Inputs_inData1;
	wire [7: 0] Pipeline_Inputs_inData2;
	wire [7: 0] Pipeline_Inputs_inData3;
	wire [7: 0] Pipeline_Inputs_inData4;
	wire [7: 0] Pipeline_Inputs_inData5;
	wire [7: 0] Pipeline_Inputs_inData6;
	wire [7: 0] Pipeline_Inputs_inData7;
	wire Pipeline_State_ready;
	wire [15: 0] Pipeline_State_result;
	wire Pipeline_NextState_ready;
	wire [15: 0] Pipeline_NextState_result;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L26F25T60_Cast;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L27F25T60_Cast;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L28F25T60_Cast;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L29F25T60_Cast;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L38F25T58_Cast;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L39F25T58_Cast;
	wire [15: 0] Pipeline_StageArraysPipelineModule_L44F30T78_Cast;
	reg Pipeline_stage0_State_IsS0Ready = 1'b0;
	wire Pipeline_stage0_State_IsS0ReadyDefault = 1'b0;
	reg [15: 0] Pipeline_stage0_State_sums0 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage0_State_sums0Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage0_State_sums1 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage0_State_sums1Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage0_State_sums2 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage0_State_sums2Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage0_State_sums3 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage0_State_sums3Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage0_State_sums4 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage0_State_sums4Default = 16'b0000000000000000;
	reg Pipeline_stage1_State_IsS1Ready = 1'b0;
	wire Pipeline_stage1_State_IsS1ReadyDefault = 1'b0;
	reg [15: 0] Pipeline_stage1_State_s0Sums0 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_s0Sums0Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage1_State_s0Sums1 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_s0Sums1Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage1_State_s0Sums2 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_s0Sums2Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage1_State_s0Sums3 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_s0Sums3Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage1_State_s0Sums4 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_s0Sums4Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage1_State_sums0 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_sums0Default = 16'b0000000000000000;
	reg [15: 0] Pipeline_stage1_State_sums1 = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage1_State_sums1Default = 16'b0000000000000000;
	reg Pipeline_stage2_State_ready = 1'b0;
	wire Pipeline_stage2_State_readyDefault = 1'b0;
	reg [15: 0] Pipeline_stage2_State_result = 16'b0000000000000000;
	wire [15: 0] Pipeline_stage2_State_resultDefault = 16'b0000000000000000;
	wire [9: 0] Pipeline_StageArraysPipelineModule_L26F34T59_Expr;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L26F34T59_Expr_1;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L26F34T59_Expr_2;
	wire [9: 0] Pipeline_StageArraysPipelineModule_L27F34T59_Expr;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L27F34T59_Expr_1;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L27F34T59_Expr_2;
	wire [9: 0] Pipeline_StageArraysPipelineModule_L28F34T59_Expr;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L28F34T59_Expr_1;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L28F34T59_Expr_2;
	wire [9: 0] Pipeline_StageArraysPipelineModule_L29F34T59_Expr;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L29F34T59_Expr_1;
	wire signed [9: 0] Pipeline_StageArraysPipelineModule_L29F34T59_Expr_2;
	wire [17: 0] Pipeline_StageArraysPipelineModule_L38F34T57_Expr;
	wire signed [17: 0] Pipeline_StageArraysPipelineModule_L38F34T57_Expr_1;
	wire signed [17: 0] Pipeline_StageArraysPipelineModule_L38F34T57_Expr_2;
	wire [17: 0] Pipeline_StageArraysPipelineModule_L39F34T57_Expr;
	wire signed [17: 0] Pipeline_StageArraysPipelineModule_L39F34T57_Expr_1;
	wire signed [17: 0] Pipeline_StageArraysPipelineModule_L39F34T57_Expr_2;
	wire [19: 0] Pipeline_StageArraysPipelineModule_L44F39T77_Expr;
	wire signed [19: 0] Pipeline_StageArraysPipelineModule_L44F39T77_Expr_1;
	wire signed [19: 0] Pipeline_StageArraysPipelineModule_L44F39T77_Expr_2;
	wire [17: 0] Pipeline_StageArraysPipelineModule_L44F39T62_Expr;
	wire signed [17: 0] Pipeline_StageArraysPipelineModule_L44F39T62_Expr_1;
	wire signed [17: 0] Pipeline_StageArraysPipelineModule_L44F39T62_Expr_2;
	always @ (posedge Clock)
	begin
		if (((Reset) == (1)))
		begin
			Pipeline_stage0_State_IsS0Ready <= Pipeline_stage0_State_IsS0ReadyDefault;
			Pipeline_stage0_State_sums0 <= Pipeline_stage0_State_sums0Default;
			Pipeline_stage0_State_sums1 <= Pipeline_stage0_State_sums1Default;
			Pipeline_stage0_State_sums2 <= Pipeline_stage0_State_sums2Default;
			Pipeline_stage0_State_sums3 <= Pipeline_stage0_State_sums3Default;
			Pipeline_stage0_State_sums4 <= Pipeline_stage0_State_sums4Default;
			Pipeline_stage1_State_IsS1Ready <= Pipeline_stage1_State_IsS1ReadyDefault;
			Pipeline_stage1_State_s0Sums0 <= Pipeline_stage1_State_s0Sums0Default;
			Pipeline_stage1_State_s0Sums1 <= Pipeline_stage1_State_s0Sums1Default;
			Pipeline_stage1_State_s0Sums2 <= Pipeline_stage1_State_s0Sums2Default;
			Pipeline_stage1_State_s0Sums3 <= Pipeline_stage1_State_s0Sums3Default;
			Pipeline_stage1_State_s0Sums4 <= Pipeline_stage1_State_s0Sums4Default;
			Pipeline_stage1_State_sums0 <= Pipeline_stage1_State_sums0Default;
			Pipeline_stage1_State_sums1 <= Pipeline_stage1_State_sums1Default;
			Pipeline_stage2_State_ready <= Pipeline_stage2_State_readyDefault;
			Pipeline_stage2_State_result <= Pipeline_stage2_State_resultDefault;
		end
		else
		begin
			Pipeline_stage0_State_IsS0Ready <= Pipeline_stage0_NextState_IsS0Ready;
			Pipeline_stage0_State_sums0 <= Pipeline_stage0_NextState_sums0;
			Pipeline_stage0_State_sums1 <= Pipeline_stage0_NextState_sums1;
			Pipeline_stage0_State_sums2 <= Pipeline_stage0_NextState_sums2;
			Pipeline_stage0_State_sums3 <= Pipeline_stage0_NextState_sums3;
			Pipeline_stage0_State_sums4 <= Pipeline_stage0_NextState_sums4;
			Pipeline_stage1_State_IsS1Ready <= Pipeline_stage1_NextState_IsS1Ready;
			Pipeline_stage1_State_s0Sums0 <= Pipeline_stage1_NextState_s0Sums0;
			Pipeline_stage1_State_s0Sums1 <= Pipeline_stage1_NextState_s0Sums1;
			Pipeline_stage1_State_s0Sums2 <= Pipeline_stage1_NextState_s0Sums2;
			Pipeline_stage1_State_s0Sums3 <= Pipeline_stage1_NextState_s0Sums3;
			Pipeline_stage1_State_s0Sums4 <= Pipeline_stage1_NextState_s0Sums4;
			Pipeline_stage1_State_sums0 <= Pipeline_stage1_NextState_sums0;
			Pipeline_stage1_State_sums1 <= Pipeline_stage1_NextState_sums1;
			Pipeline_stage2_State_ready <= Pipeline_stage2_NextState_ready;
			Pipeline_stage2_State_result <= Pipeline_stage2_NextState_result;
		end
	end
	assign Pipeline_StageArraysPipelineModule_L26F34T59_Expr = Pipeline_StageArraysPipelineModule_L26F34T59_Expr_1 + Pipeline_StageArraysPipelineModule_L26F34T59_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L27F34T59_Expr = Pipeline_StageArraysPipelineModule_L27F34T59_Expr_1 + Pipeline_StageArraysPipelineModule_L27F34T59_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L28F34T59_Expr = Pipeline_StageArraysPipelineModule_L28F34T59_Expr_1 + Pipeline_StageArraysPipelineModule_L28F34T59_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L29F34T59_Expr = Pipeline_StageArraysPipelineModule_L29F34T59_Expr_1 + Pipeline_StageArraysPipelineModule_L29F34T59_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L38F34T57_Expr = Pipeline_StageArraysPipelineModule_L38F34T57_Expr_1 + Pipeline_StageArraysPipelineModule_L38F34T57_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L39F34T57_Expr = Pipeline_StageArraysPipelineModule_L39F34T57_Expr_1 + Pipeline_StageArraysPipelineModule_L39F34T57_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L44F39T77_Expr = Pipeline_StageArraysPipelineModule_L44F39T77_Expr_1 + Pipeline_StageArraysPipelineModule_L44F39T77_Expr_2;
	assign Pipeline_StageArraysPipelineModule_L44F39T62_Expr = Pipeline_StageArraysPipelineModule_L44F39T62_Expr_1 + Pipeline_StageArraysPipelineModule_L44F39T62_Expr_2;
	always @ (*)
	begin
		Pipeline_stage0_NextState_IsS0Ready = Pipeline_stage0_State_IsS0Ready;
		Pipeline_stage0_NextState_sums0 = Pipeline_stage0_State_sums0;
		Pipeline_stage0_NextState_sums1 = Pipeline_stage0_State_sums1;
		Pipeline_stage0_NextState_sums2 = Pipeline_stage0_State_sums2;
		Pipeline_stage0_NextState_sums3 = Pipeline_stage0_State_sums3;
		Pipeline_stage0_NextState_sums4 = Pipeline_stage0_State_sums4;
		Pipeline_stage1_NextState_IsS1Ready = Pipeline_stage1_State_IsS1Ready;
		Pipeline_stage1_NextState_s0Sums0 = Pipeline_stage1_State_s0Sums0;
		Pipeline_stage1_NextState_s0Sums1 = Pipeline_stage1_State_s0Sums1;
		Pipeline_stage1_NextState_s0Sums2 = Pipeline_stage1_State_s0Sums2;
		Pipeline_stage1_NextState_s0Sums3 = Pipeline_stage1_State_s0Sums3;
		Pipeline_stage1_NextState_s0Sums4 = Pipeline_stage1_State_s0Sums4;
		Pipeline_stage1_NextState_sums0 = Pipeline_stage1_State_sums0;
		Pipeline_stage1_NextState_sums1 = Pipeline_stage1_State_sums1;
		Pipeline_stage2_NextState_ready = Pipeline_stage2_State_ready;
		Pipeline_stage2_NextState_result = Pipeline_stage2_State_result;
		Pipeline_stage0_NextState_sums0 = Pipeline_StageArraysPipelineModule_L26F25T60_Cast;
		Pipeline_stage0_NextState_sums1 = Pipeline_StageArraysPipelineModule_L27F25T60_Cast;
		Pipeline_stage0_NextState_sums2 = Pipeline_StageArraysPipelineModule_L28F25T60_Cast;
		Pipeline_stage0_NextState_sums3 = Pipeline_StageArraysPipelineModule_L29F25T60_Cast;
		Pipeline_stage0_NextState_sums4 = { {10{1'b0}}, Pipeline_StageArraysPipelineModule_L30F25T27_Expr }/*expand*/;
		Pipeline_stage1_NextState_s0Sums0 = Pipeline_stage0_State_sums0;
		Pipeline_stage1_NextState_s0Sums1 = Pipeline_stage0_State_sums1;
		Pipeline_stage1_NextState_s0Sums2 = Pipeline_stage0_State_sums2;
		Pipeline_stage1_NextState_s0Sums3 = Pipeline_stage0_State_sums3;
		Pipeline_stage1_NextState_s0Sums4 = Pipeline_stage0_State_sums4;
		Pipeline_stage1_NextState_sums0 = Pipeline_StageArraysPipelineModule_L38F25T58_Cast;
		Pipeline_stage1_NextState_sums1 = Pipeline_StageArraysPipelineModule_L39F25T58_Cast;
		Pipeline_stage0_NextState_IsS0Ready = Pipeline_Inputs_inReady;
		Pipeline_stage1_NextState_IsS1Ready = Pipeline_stage0_State_IsS0Ready;
		Pipeline_stage2_NextState_ready = Pipeline_stage1_State_IsS1Ready;
		Pipeline_stage2_NextState_result = Pipeline_StageArraysPipelineModule_L44F30T78_Cast;
	end
	assign Pipeline_StageArraysPipelineModule_L26F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData0 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L26F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData1 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L27F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData2 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L27F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData3 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L28F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData4 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L28F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData5 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L29F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData6 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L29F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData7 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L38F34T57_Expr_1 = { {2{1'b0}}, Pipeline_stage0_State_sums0 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L38F34T57_Expr_2 = { {2{1'b0}}, Pipeline_stage0_State_sums1 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L39F34T57_Expr_1 = { {2{1'b0}}, Pipeline_stage0_State_sums2 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L39F34T57_Expr_2 = { {2{1'b0}}, Pipeline_stage0_State_sums3 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L44F39T77_Expr_1 = { {2{1'b0}}, Pipeline_StageArraysPipelineModule_L44F39T62_Expr }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L44F39T77_Expr_2 = { {4{1'b0}}, Pipeline_stage1_State_s0Sums4 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L44F39T62_Expr_1 = { {2{1'b0}}, Pipeline_stage1_State_sums0 }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L44F39T62_Expr_2 = { {2{1'b0}}, Pipeline_stage1_State_sums0 }/*expand*/;
	assign Inputs_inReady = inReady;
	assign Inputs_inData0 = inData0;
	assign Inputs_inData1 = inData1;
	assign Inputs_inData2 = inData2;
	assign Inputs_inData3 = inData3;
	assign Inputs_inData4 = inData4;
	assign Inputs_inData5 = inData5;
	assign Inputs_inData6 = inData6;
	assign Inputs_inData7 = inData7;
	assign Pipeline_State_ready = Pipeline_stage2_State_ready;
	assign Pipeline_State_result = Pipeline_stage2_State_result;
	assign Pipeline_NextState_ready = Pipeline_stage2_NextState_ready;
	assign Pipeline_NextState_result = Pipeline_stage2_NextState_result;
	assign Pipeline_StageArraysPipelineModule_L26F25T60_Cast = { {6{1'b0}}, Pipeline_StageArraysPipelineModule_L26F34T59_Expr }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L27F25T60_Cast = { {6{1'b0}}, Pipeline_StageArraysPipelineModule_L27F34T59_Expr }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L28F25T60_Cast = { {6{1'b0}}, Pipeline_StageArraysPipelineModule_L28F34T59_Expr }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L29F25T60_Cast = { {6{1'b0}}, Pipeline_StageArraysPipelineModule_L29F34T59_Expr }/*expand*/;
	assign Pipeline_StageArraysPipelineModule_L38F25T58_Cast = Pipeline_StageArraysPipelineModule_L38F34T57_Expr[15:0]/*truncate*/;
	assign Pipeline_StageArraysPipelineModule_L39F25T58_Cast = Pipeline_StageArraysPipelineModule_L39F34T57_Expr[15:0]/*truncate*/;
	assign Pipeline_StageArraysPipelineModule_L44F30T78_Cast = Pipeline_StageArraysPipelineModule_L44F39T77_Expr[15:0]/*truncate*/;
	assign outReady = Pipeline_State_ready;
	assign outResult = Pipeline_State_result;
	assign Pipeline_Inputs_inReady = Inputs_inReady;
	assign Pipeline_Inputs_inData0 = Inputs_inData0;
	assign Pipeline_Inputs_inData1 = Inputs_inData1;
	assign Pipeline_Inputs_inData2 = Inputs_inData2;
	assign Pipeline_Inputs_inData3 = Inputs_inData3;
	assign Pipeline_Inputs_inData4 = Inputs_inData4;
	assign Pipeline_Inputs_inData5 = Inputs_inData5;
	assign Pipeline_Inputs_inData6 = Inputs_inData6;
	assign Pipeline_Inputs_inData7 = Inputs_inData7;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
