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
// System configuration name is CustomSchedulePipelineModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module CustomSchedulePipelineModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] inData0,
	input wire [7:0] inData1,
	input wire [7:0] inData2,
	input wire [7:0] inData3,
	input wire [7:0] inData4,
	input wire [7:0] inData5,
	input wire [7:0] inData6,
	input wire [7:0] inData7,
	input wire inReady,
	output wire outReady1,
	output wire outReady2,
	output wire [15:0] outResult1,
	output wire [15:0] outResult2
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [3: 0] Pipeline1_PipelineConfigurations_L38F60T61_Expr = 4'b1000;
	wire [3: 0] Pipeline2_PipelineConfigurations_L38F60T61_Expr = 4'b1000;
	wire CustomSchedulePipelineModule_L37F47T48_Expr = 1'b1;
	wire [1: 0] CustomSchedulePipelineModule_L38F47T48_Expr = 2'b10;
	wire CustomSchedulePipelineModule_L39F48T49_Expr = 1'b1;
	wire [1: 0] CustomSchedulePipelineModule_L40F47T48_Expr = 2'b11;
	wire CustomSchedulePipelineModule_L43F48T49_Expr = 1'b1;
	wire Inputs_inReady;
	reg Pipeline1_stage0_NextState_IsS0Ready;
	reg signed [31: 0] Pipeline1_stage0_NextState_sum01;
	reg signed [31: 0] Pipeline1_stage0_NextState_sum23;
	reg signed [31: 0] Pipeline1_stage0_NextState_sum45;
	reg signed [31: 0] Pipeline1_stage0_NextState_sum67;
	reg Pipeline1_stage1_NextState_IsS1Ready;
	reg signed [31: 0] Pipeline1_stage1_NextState_sum0123;
	reg signed [31: 0] Pipeline1_stage1_NextState_sum4567;
	reg Pipeline1_stage2_NextState_ready;
	reg [15: 0] Pipeline1_stage2_NextState_result;
	reg Pipeline2_stage0_NextState_IsS0Ready;
	reg signed [31: 0] Pipeline2_stage0_NextState_sum01;
	reg signed [31: 0] Pipeline2_stage0_NextState_sum23;
	reg signed [31: 0] Pipeline2_stage0_NextState_sum45;
	reg signed [31: 0] Pipeline2_stage0_NextState_sum67;
	reg Pipeline2_stage1_NextState_IsS1Ready;
	reg signed [31: 0] Pipeline2_stage1_NextState_sum0123;
	reg signed [31: 0] Pipeline2_stage1_NextState_sum4567;
	reg Pipeline2_stage2_NextState_ready;
	reg [15: 0] Pipeline2_stage2_NextState_result;
	wire Pipeline1_Inputs_inReady;
	wire Pipeline1_State_ready;
	wire [15: 0] Pipeline1_State_result;
	wire Pipeline1_NextState_ready;
	wire [15: 0] Pipeline1_NextState_result;
	wire [7: 0] Pipeline1_PipelineConfigurations_L38F40T56_Cast;
	wire [7: 0] Pipeline1_PipelineConfigurations_L38F65T81_Cast;
	wire [15: 0] Pipeline1_PipelineConfigurations_L38F30T82_Cast;
	wire Pipeline2_Inputs_inReady;
	wire Pipeline2_State_ready;
	wire [15: 0] Pipeline2_State_result;
	wire Pipeline2_NextState_ready;
	wire [15: 0] Pipeline2_NextState_result;
	wire [7: 0] Pipeline2_PipelineConfigurations_L38F40T56_Cast;
	wire [7: 0] Pipeline2_PipelineConfigurations_L38F65T81_Cast;
	wire [15: 0] Pipeline2_PipelineConfigurations_L38F30T82_Cast;
	wire [7: 0] CustomSchedulePipelineModule_L37F21T49_Cast;
	wire [7: 0] CustomSchedulePipelineModule_L38F21T49_Cast;
	wire [7: 0] CustomSchedulePipelineModule_L39F21T50_Cast;
	wire [7: 0] CustomSchedulePipelineModule_L40F21T49_Cast;
	wire [7: 0] CustomSchedulePipelineModule_L43F21T50_Cast;
	reg Pipeline1_stage0_State_IsS0Ready = 1'b0;
	wire Pipeline1_stage0_State_IsS0ReadyDefault = 1'b0;
	reg signed [31: 0] Pipeline1_stage0_State_sum01 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline1_stage0_State_sum01Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline1_stage0_State_sum23 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline1_stage0_State_sum23Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline1_stage0_State_sum45 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline1_stage0_State_sum45Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline1_stage0_State_sum67 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline1_stage0_State_sum67Default = 32'b00000000000000000000000000000000;
	reg Pipeline1_stage1_State_IsS1Ready = 1'b0;
	wire Pipeline1_stage1_State_IsS1ReadyDefault = 1'b0;
	reg signed [31: 0] Pipeline1_stage1_State_sum0123 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline1_stage1_State_sum0123Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline1_stage1_State_sum4567 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline1_stage1_State_sum4567Default = 32'b00000000000000000000000000000000;
	reg Pipeline1_stage2_State_ready = 1'b0;
	wire Pipeline1_stage2_State_readyDefault = 1'b0;
	reg [15: 0] Pipeline1_stage2_State_result = 16'b0000000000000000;
	wire [15: 0] Pipeline1_stage2_State_resultDefault = 16'b0000000000000000;
	reg Pipeline2_stage0_State_IsS0Ready = 1'b0;
	wire Pipeline2_stage0_State_IsS0ReadyDefault = 1'b0;
	reg signed [31: 0] Pipeline2_stage0_State_sum01 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline2_stage0_State_sum01Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline2_stage0_State_sum23 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline2_stage0_State_sum23Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline2_stage0_State_sum45 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline2_stage0_State_sum45Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline2_stage0_State_sum67 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline2_stage0_State_sum67Default = 32'b00000000000000000000000000000000;
	reg Pipeline2_stage1_State_IsS1Ready = 1'b0;
	wire Pipeline2_stage1_State_IsS1ReadyDefault = 1'b0;
	reg signed [31: 0] Pipeline2_stage1_State_sum0123 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline2_stage1_State_sum0123Default = 32'b00000000000000000000000000000000;
	reg signed [31: 0] Pipeline2_stage1_State_sum4567 = 32'b00000000000000000000000000000000;
	wire signed [31: 0] Pipeline2_stage1_State_sum4567Default = 32'b00000000000000000000000000000000;
	reg Pipeline2_stage2_State_ready = 1'b0;
	wire Pipeline2_stage2_State_readyDefault = 1'b0;
	reg [15: 0] Pipeline2_stage2_State_result = 16'b0000000000000000;
	wire [15: 0] Pipeline2_stage2_State_resultDefault = 16'b0000000000000000;
	wire [23: 0] Pipeline1_PipelineConfigurations_L38F39T81_Expr;
	wire [23: 0] Pipeline1_PipelineConfigurations_L38F39T81_Expr_1;
	wire [23: 0] Pipeline1_PipelineConfigurations_L38F39T81_Expr_2;
	wire [23: 0] Pipeline1_PipelineConfigurations_L38F40T61_Expr;
	wire [23: 0] Pipeline1_PipelineConfigurations_L38F40T61_Expr_1;
	wire [23: 0] Pipeline2_PipelineConfigurations_L38F39T81_Expr;
	wire [23: 0] Pipeline2_PipelineConfigurations_L38F39T81_Expr_1;
	wire [23: 0] Pipeline2_PipelineConfigurations_L38F39T81_Expr_2;
	wire [23: 0] Pipeline2_PipelineConfigurations_L38F40T61_Expr;
	wire [23: 0] Pipeline2_PipelineConfigurations_L38F40T61_Expr_1;
	wire [8: 0] CustomSchedulePipelineModule_L39F28T49_Expr;
	wire [8: 0] CustomSchedulePipelineModule_L39F28T49_Expr_1;
	wire [63: 0] CustomSchedulePipelineModule_L43F28T49_Expr;
	wire [63: 0] CustomSchedulePipelineModule_L43F28T49_Expr_1;
	wire [9: 0] Pipeline1_PipelineConfigurations_L25F29T54_Expr;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L25F29T54_Expr_1;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L25F29T54_Expr_2;
	wire [9: 0] Pipeline1_PipelineConfigurations_L26F29T54_Expr;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L26F29T54_Expr_1;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L26F29T54_Expr_2;
	wire [9: 0] Pipeline1_PipelineConfigurations_L27F29T54_Expr;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L27F29T54_Expr_1;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L27F29T54_Expr_2;
	wire [9: 0] Pipeline1_PipelineConfigurations_L28F29T54_Expr;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L28F29T54_Expr_1;
	wire signed [9: 0] Pipeline1_PipelineConfigurations_L28F29T54_Expr_2;
	wire signed [32: 0] Pipeline1_PipelineConfigurations_L32F31T50_Expr;
	wire signed [32: 0] Pipeline1_PipelineConfigurations_L32F31T50_Expr_1;
	wire signed [32: 0] Pipeline1_PipelineConfigurations_L32F31T50_Expr_2;
	wire signed [32: 0] Pipeline1_PipelineConfigurations_L33F31T50_Expr;
	wire signed [32: 0] Pipeline1_PipelineConfigurations_L33F31T50_Expr_1;
	wire signed [32: 0] Pipeline1_PipelineConfigurations_L33F31T50_Expr_2;
	wire [9: 0] Pipeline2_PipelineConfigurations_L25F29T54_Expr;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L25F29T54_Expr_1;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L25F29T54_Expr_2;
	wire [9: 0] Pipeline2_PipelineConfigurations_L26F29T54_Expr;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L26F29T54_Expr_1;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L26F29T54_Expr_2;
	wire [9: 0] Pipeline2_PipelineConfigurations_L27F29T54_Expr;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L27F29T54_Expr_1;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L27F29T54_Expr_2;
	wire [9: 0] Pipeline2_PipelineConfigurations_L28F29T54_Expr;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L28F29T54_Expr_1;
	wire signed [9: 0] Pipeline2_PipelineConfigurations_L28F29T54_Expr_2;
	wire signed [32: 0] Pipeline2_PipelineConfigurations_L32F31T50_Expr;
	wire signed [32: 0] Pipeline2_PipelineConfigurations_L32F31T50_Expr_1;
	wire signed [32: 0] Pipeline2_PipelineConfigurations_L32F31T50_Expr_2;
	wire signed [32: 0] Pipeline2_PipelineConfigurations_L33F31T50_Expr;
	wire signed [32: 0] Pipeline2_PipelineConfigurations_L33F31T50_Expr_1;
	wire signed [32: 0] Pipeline2_PipelineConfigurations_L33F31T50_Expr_2;
	wire [9: 0] CustomSchedulePipelineModule_L37F28T48_Expr;
	wire signed [9: 0] CustomSchedulePipelineModule_L37F28T48_Expr_1;
	wire signed [9: 0] CustomSchedulePipelineModule_L37F28T48_Expr_2;
	wire [10: 0] CustomSchedulePipelineModule_L38F28T48_Expr;
	wire signed [10: 0] CustomSchedulePipelineModule_L38F28T48_Expr_1;
	wire signed [10: 0] CustomSchedulePipelineModule_L38F28T48_Expr_2;
	wire signed [9: 0] CustomSchedulePipelineModule_L40F28T48_Expr;
	wire signed [9: 0] CustomSchedulePipelineModule_L40F28T48_Expr_1;
	wire signed [9: 0] CustomSchedulePipelineModule_L40F28T48_Expr_2;
	wire [7 : 0] Inputs_inData [0 : 7];
	wire [7 : 0] Pipeline1_Inputs_inData [0 : 7];
	wire [7 : 0] Pipeline2_Inputs_inData [0 : 7];
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			Pipeline1_stage0_State_IsS0Ready <= Pipeline1_stage0_State_IsS0ReadyDefault;
			Pipeline1_stage0_State_sum01 <= Pipeline1_stage0_State_sum01Default;
			Pipeline1_stage0_State_sum23 <= Pipeline1_stage0_State_sum23Default;
			Pipeline1_stage0_State_sum45 <= Pipeline1_stage0_State_sum45Default;
			Pipeline1_stage0_State_sum67 <= Pipeline1_stage0_State_sum67Default;
			Pipeline1_stage1_State_IsS1Ready <= Pipeline1_stage1_State_IsS1ReadyDefault;
			Pipeline1_stage1_State_sum0123 <= Pipeline1_stage1_State_sum0123Default;
			Pipeline1_stage1_State_sum4567 <= Pipeline1_stage1_State_sum4567Default;
			Pipeline1_stage2_State_ready <= Pipeline1_stage2_State_readyDefault;
			Pipeline1_stage2_State_result <= Pipeline1_stage2_State_resultDefault;
			Pipeline2_stage0_State_IsS0Ready <= Pipeline2_stage0_State_IsS0ReadyDefault;
			Pipeline2_stage0_State_sum01 <= Pipeline2_stage0_State_sum01Default;
			Pipeline2_stage0_State_sum23 <= Pipeline2_stage0_State_sum23Default;
			Pipeline2_stage0_State_sum45 <= Pipeline2_stage0_State_sum45Default;
			Pipeline2_stage0_State_sum67 <= Pipeline2_stage0_State_sum67Default;
			Pipeline2_stage1_State_IsS1Ready <= Pipeline2_stage1_State_IsS1ReadyDefault;
			Pipeline2_stage1_State_sum0123 <= Pipeline2_stage1_State_sum0123Default;
			Pipeline2_stage1_State_sum4567 <= Pipeline2_stage1_State_sum4567Default;
			Pipeline2_stage2_State_ready <= Pipeline2_stage2_State_readyDefault;
			Pipeline2_stage2_State_result <= Pipeline2_stage2_State_resultDefault;
		end
		else
		begin
			Pipeline1_stage0_State_IsS0Ready <= Pipeline1_stage0_NextState_IsS0Ready;
			Pipeline1_stage0_State_sum01 <= Pipeline1_stage0_NextState_sum01;
			Pipeline1_stage0_State_sum23 <= Pipeline1_stage0_NextState_sum23;
			Pipeline1_stage0_State_sum45 <= Pipeline1_stage0_NextState_sum45;
			Pipeline1_stage0_State_sum67 <= Pipeline1_stage0_NextState_sum67;
			Pipeline1_stage1_State_IsS1Ready <= Pipeline1_stage1_NextState_IsS1Ready;
			Pipeline1_stage1_State_sum0123 <= Pipeline1_stage1_NextState_sum0123;
			Pipeline1_stage1_State_sum4567 <= Pipeline1_stage1_NextState_sum4567;
			Pipeline1_stage2_State_ready <= Pipeline1_stage2_NextState_ready;
			Pipeline1_stage2_State_result <= Pipeline1_stage2_NextState_result;
			Pipeline2_stage0_State_IsS0Ready <= Pipeline2_stage0_NextState_IsS0Ready;
			Pipeline2_stage0_State_sum01 <= Pipeline2_stage0_NextState_sum01;
			Pipeline2_stage0_State_sum23 <= Pipeline2_stage0_NextState_sum23;
			Pipeline2_stage0_State_sum45 <= Pipeline2_stage0_NextState_sum45;
			Pipeline2_stage0_State_sum67 <= Pipeline2_stage0_NextState_sum67;
			Pipeline2_stage1_State_IsS1Ready <= Pipeline2_stage1_NextState_IsS1Ready;
			Pipeline2_stage1_State_sum0123 <= Pipeline2_stage1_NextState_sum0123;
			Pipeline2_stage1_State_sum4567 <= Pipeline2_stage1_NextState_sum4567;
			Pipeline2_stage2_State_ready <= Pipeline2_stage2_NextState_ready;
			Pipeline2_stage2_State_result <= Pipeline2_stage2_NextState_result;
		end
	end
	assign Pipeline1_PipelineConfigurations_L38F39T81_Expr = Pipeline1_PipelineConfigurations_L38F39T81_Expr_1 | Pipeline1_PipelineConfigurations_L38F39T81_Expr_2;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[0] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[1] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[2] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[3] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[4] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[5] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[6] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[7] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[8] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[0];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[9] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[1];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[10] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[2];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[11] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[3];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[12] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[4];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[13] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[5];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[14] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[6];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[15] = Pipeline1_PipelineConfigurations_L38F40T61_Expr_1[7];
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[16] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[17] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[18] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[19] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[20] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[21] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[22] = 0;
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr[23] = 0;
	assign Pipeline2_PipelineConfigurations_L38F39T81_Expr = Pipeline2_PipelineConfigurations_L38F39T81_Expr_1 | Pipeline2_PipelineConfigurations_L38F39T81_Expr_2;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[0] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[1] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[2] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[3] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[4] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[5] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[6] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[7] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[8] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[0];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[9] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[1];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[10] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[2];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[11] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[3];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[12] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[4];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[13] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[5];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[14] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[6];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[15] = Pipeline2_PipelineConfigurations_L38F40T61_Expr_1[7];
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[16] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[17] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[18] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[19] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[20] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[21] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[22] = 0;
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr[23] = 0;
	assign CustomSchedulePipelineModule_L39F28T49_Expr[0] = 0;
	assign CustomSchedulePipelineModule_L39F28T49_Expr[1] = CustomSchedulePipelineModule_L39F28T49_Expr_1[0];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[2] = CustomSchedulePipelineModule_L39F28T49_Expr_1[1];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[3] = CustomSchedulePipelineModule_L39F28T49_Expr_1[2];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[4] = CustomSchedulePipelineModule_L39F28T49_Expr_1[3];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[5] = CustomSchedulePipelineModule_L39F28T49_Expr_1[4];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[6] = CustomSchedulePipelineModule_L39F28T49_Expr_1[5];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[7] = CustomSchedulePipelineModule_L39F28T49_Expr_1[6];
	assign CustomSchedulePipelineModule_L39F28T49_Expr[8] = CustomSchedulePipelineModule_L39F28T49_Expr_1[7];
	// Output: CustomSchedulePipelineModule_L43F28T49_Expr, Width: 64, ShiftBy: 1, Sources: 1
	assign CustomSchedulePipelineModule_L43F28T49_Expr[0] = CustomSchedulePipelineModule_L43F28T49_Expr_1[1];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[1] = CustomSchedulePipelineModule_L43F28T49_Expr_1[2];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[2] = CustomSchedulePipelineModule_L43F28T49_Expr_1[3];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[3] = CustomSchedulePipelineModule_L43F28T49_Expr_1[4];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[4] = CustomSchedulePipelineModule_L43F28T49_Expr_1[5];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[5] = CustomSchedulePipelineModule_L43F28T49_Expr_1[6];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[6] = CustomSchedulePipelineModule_L43F28T49_Expr_1[7];
	assign CustomSchedulePipelineModule_L43F28T49_Expr[7] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[8] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[9] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[10] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[11] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[12] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[13] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[14] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[15] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[16] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[17] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[18] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[19] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[20] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[21] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[22] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[23] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[24] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[25] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[26] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[27] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[28] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[29] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[30] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[31] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[32] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[33] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[34] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[35] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[36] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[37] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[38] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[39] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[40] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[41] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[42] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[43] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[44] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[45] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[46] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[47] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[48] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[49] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[50] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[51] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[52] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[53] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[54] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[55] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[56] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[57] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[58] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[59] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[60] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[61] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[62] = 0;
	assign CustomSchedulePipelineModule_L43F28T49_Expr[63] = 0;
	assign Pipeline1_PipelineConfigurations_L25F29T54_Expr = Pipeline1_PipelineConfigurations_L25F29T54_Expr_1 + Pipeline1_PipelineConfigurations_L25F29T54_Expr_2;
	assign Pipeline1_PipelineConfigurations_L26F29T54_Expr = Pipeline1_PipelineConfigurations_L26F29T54_Expr_1 + Pipeline1_PipelineConfigurations_L26F29T54_Expr_2;
	assign Pipeline1_PipelineConfigurations_L27F29T54_Expr = Pipeline1_PipelineConfigurations_L27F29T54_Expr_1 + Pipeline1_PipelineConfigurations_L27F29T54_Expr_2;
	assign Pipeline1_PipelineConfigurations_L28F29T54_Expr = Pipeline1_PipelineConfigurations_L28F29T54_Expr_1 + Pipeline1_PipelineConfigurations_L28F29T54_Expr_2;
	assign Pipeline1_PipelineConfigurations_L32F31T50_Expr = Pipeline1_PipelineConfigurations_L32F31T50_Expr_1 + Pipeline1_PipelineConfigurations_L32F31T50_Expr_2;
	assign Pipeline1_PipelineConfigurations_L33F31T50_Expr = Pipeline1_PipelineConfigurations_L33F31T50_Expr_1 + Pipeline1_PipelineConfigurations_L33F31T50_Expr_2;
	assign Pipeline2_PipelineConfigurations_L25F29T54_Expr = Pipeline2_PipelineConfigurations_L25F29T54_Expr_1 + Pipeline2_PipelineConfigurations_L25F29T54_Expr_2;
	assign Pipeline2_PipelineConfigurations_L26F29T54_Expr = Pipeline2_PipelineConfigurations_L26F29T54_Expr_1 + Pipeline2_PipelineConfigurations_L26F29T54_Expr_2;
	assign Pipeline2_PipelineConfigurations_L27F29T54_Expr = Pipeline2_PipelineConfigurations_L27F29T54_Expr_1 + Pipeline2_PipelineConfigurations_L27F29T54_Expr_2;
	assign Pipeline2_PipelineConfigurations_L28F29T54_Expr = Pipeline2_PipelineConfigurations_L28F29T54_Expr_1 + Pipeline2_PipelineConfigurations_L28F29T54_Expr_2;
	assign Pipeline2_PipelineConfigurations_L32F31T50_Expr = Pipeline2_PipelineConfigurations_L32F31T50_Expr_1 + Pipeline2_PipelineConfigurations_L32F31T50_Expr_2;
	assign Pipeline2_PipelineConfigurations_L33F31T50_Expr = Pipeline2_PipelineConfigurations_L33F31T50_Expr_1 + Pipeline2_PipelineConfigurations_L33F31T50_Expr_2;
	assign CustomSchedulePipelineModule_L37F28T48_Expr = CustomSchedulePipelineModule_L37F28T48_Expr_1 + CustomSchedulePipelineModule_L37F28T48_Expr_2;
	assign CustomSchedulePipelineModule_L38F28T48_Expr = CustomSchedulePipelineModule_L38F28T48_Expr_1 * CustomSchedulePipelineModule_L38F28T48_Expr_2;
	assign CustomSchedulePipelineModule_L40F28T48_Expr = CustomSchedulePipelineModule_L40F28T48_Expr_1 - CustomSchedulePipelineModule_L40F28T48_Expr_2;
	always @ (*)
	begin
		Pipeline1_stage0_NextState_IsS0Ready = Pipeline1_stage0_State_IsS0Ready;
		Pipeline1_stage0_NextState_sum01 = Pipeline1_stage0_State_sum01;
		Pipeline1_stage0_NextState_sum23 = Pipeline1_stage0_State_sum23;
		Pipeline1_stage0_NextState_sum45 = Pipeline1_stage0_State_sum45;
		Pipeline1_stage0_NextState_sum67 = Pipeline1_stage0_State_sum67;
		Pipeline1_stage1_NextState_IsS1Ready = Pipeline1_stage1_State_IsS1Ready;
		Pipeline1_stage1_NextState_sum0123 = Pipeline1_stage1_State_sum0123;
		Pipeline1_stage1_NextState_sum4567 = Pipeline1_stage1_State_sum4567;
		Pipeline1_stage2_NextState_ready = Pipeline1_stage2_State_ready;
		Pipeline1_stage2_NextState_result = Pipeline1_stage2_State_result;
		Pipeline2_stage0_NextState_IsS0Ready = Pipeline2_stage0_State_IsS0Ready;
		Pipeline2_stage0_NextState_sum01 = Pipeline2_stage0_State_sum01;
		Pipeline2_stage0_NextState_sum23 = Pipeline2_stage0_State_sum23;
		Pipeline2_stage0_NextState_sum45 = Pipeline2_stage0_State_sum45;
		Pipeline2_stage0_NextState_sum67 = Pipeline2_stage0_State_sum67;
		Pipeline2_stage1_NextState_IsS1Ready = Pipeline2_stage1_State_IsS1Ready;
		Pipeline2_stage1_NextState_sum0123 = Pipeline2_stage1_State_sum0123;
		Pipeline2_stage1_NextState_sum4567 = Pipeline2_stage1_State_sum4567;
		Pipeline2_stage2_NextState_ready = Pipeline2_stage2_State_ready;
		Pipeline2_stage2_NextState_result = Pipeline2_stage2_State_result;
		Pipeline1_stage0_NextState_IsS0Ready = Pipeline1_Inputs_inReady;
		Pipeline1_stage0_NextState_sum01 = { {22{1'b0}}, Pipeline1_PipelineConfigurations_L25F29T54_Expr };
		Pipeline1_stage0_NextState_sum23 = { {22{1'b0}}, Pipeline1_PipelineConfigurations_L26F29T54_Expr };
		Pipeline1_stage0_NextState_sum45 = { {22{1'b0}}, Pipeline1_PipelineConfigurations_L27F29T54_Expr };
		Pipeline1_stage0_NextState_sum67 = { {22{1'b0}}, Pipeline1_PipelineConfigurations_L28F29T54_Expr };
		Pipeline1_stage1_NextState_IsS1Ready = Pipeline1_stage0_State_IsS0Ready;
		Pipeline1_stage1_NextState_sum0123 = Pipeline1_PipelineConfigurations_L32F31T50_Expr[31:0];
		Pipeline1_stage1_NextState_sum4567 = Pipeline1_PipelineConfigurations_L33F31T50_Expr[31:0];
		Pipeline1_stage2_NextState_ready = Pipeline1_stage1_State_IsS1Ready;
		Pipeline1_stage2_NextState_result = Pipeline1_PipelineConfigurations_L38F30T82_Cast;
		Pipeline2_stage0_NextState_IsS0Ready = Pipeline2_Inputs_inReady;
		Pipeline2_stage0_NextState_sum01 = { {22{1'b0}}, Pipeline2_PipelineConfigurations_L25F29T54_Expr };
		Pipeline2_stage0_NextState_sum23 = { {22{1'b0}}, Pipeline2_PipelineConfigurations_L26F29T54_Expr };
		Pipeline2_stage0_NextState_sum45 = { {22{1'b0}}, Pipeline2_PipelineConfigurations_L27F29T54_Expr };
		Pipeline2_stage0_NextState_sum67 = { {22{1'b0}}, Pipeline2_PipelineConfigurations_L28F29T54_Expr };
		Pipeline2_stage1_NextState_IsS1Ready = Pipeline2_stage0_State_IsS0Ready;
		Pipeline2_stage1_NextState_sum0123 = Pipeline2_PipelineConfigurations_L32F31T50_Expr[31:0];
		Pipeline2_stage1_NextState_sum4567 = Pipeline2_PipelineConfigurations_L33F31T50_Expr[31:0];
		Pipeline2_stage2_NextState_ready = Pipeline2_stage1_State_IsS1Ready;
		Pipeline2_stage2_NextState_result = Pipeline2_PipelineConfigurations_L38F30T82_Cast;
	end
	assign Pipeline1_PipelineConfigurations_L38F39T81_Expr_1 = Pipeline1_PipelineConfigurations_L38F40T61_Expr;
	assign Pipeline1_PipelineConfigurations_L38F39T81_Expr_2 = { {16{1'b0}}, Pipeline1_PipelineConfigurations_L38F65T81_Cast };
	assign Pipeline1_PipelineConfigurations_L38F40T61_Expr_1 = { {16{1'b0}}, Pipeline1_PipelineConfigurations_L38F40T56_Cast };
	assign Pipeline2_PipelineConfigurations_L38F39T81_Expr_1 = Pipeline2_PipelineConfigurations_L38F40T61_Expr;
	assign Pipeline2_PipelineConfigurations_L38F39T81_Expr_2 = { {16{1'b0}}, Pipeline2_PipelineConfigurations_L38F65T81_Cast };
	assign Pipeline2_PipelineConfigurations_L38F40T61_Expr_1 = { {16{1'b0}}, Pipeline2_PipelineConfigurations_L38F40T56_Cast };
	assign CustomSchedulePipelineModule_L39F28T49_Expr_1 = { 1'b0, Inputs_inData[5] };
	assign CustomSchedulePipelineModule_L43F28T49_Expr_1 = { {56{1'b0}}, Inputs_inData[4] };
	assign Pipeline1_PipelineConfigurations_L25F29T54_Expr_1 = { {2{1'b0}}, Pipeline1_Inputs_inData[0] };
	assign Pipeline1_PipelineConfigurations_L25F29T54_Expr_2 = { {2{1'b0}}, Pipeline1_Inputs_inData[1] };
	assign Pipeline1_PipelineConfigurations_L26F29T54_Expr_1 = { {2{1'b0}}, Pipeline1_Inputs_inData[2] };
	assign Pipeline1_PipelineConfigurations_L26F29T54_Expr_2 = { {2{1'b0}}, Pipeline1_Inputs_inData[3] };
	assign Pipeline1_PipelineConfigurations_L27F29T54_Expr_1 = { {2{1'b0}}, Pipeline1_Inputs_inData[4] };
	assign Pipeline1_PipelineConfigurations_L27F29T54_Expr_2 = { {2{1'b0}}, Pipeline1_Inputs_inData[5] };
	assign Pipeline1_PipelineConfigurations_L28F29T54_Expr_1 = { {2{1'b0}}, Pipeline1_Inputs_inData[6] };
	assign Pipeline1_PipelineConfigurations_L28F29T54_Expr_2 = { {2{1'b0}}, Pipeline1_Inputs_inData[7] };
	assign Pipeline1_PipelineConfigurations_L32F31T50_Expr_1 = { Pipeline1_stage0_State_sum01[31], Pipeline1_stage0_State_sum01 };
	assign Pipeline1_PipelineConfigurations_L32F31T50_Expr_2 = { Pipeline1_stage0_State_sum23[31], Pipeline1_stage0_State_sum23 };
	assign Pipeline1_PipelineConfigurations_L33F31T50_Expr_1 = { Pipeline1_stage0_State_sum45[31], Pipeline1_stage0_State_sum45 };
	assign Pipeline1_PipelineConfigurations_L33F31T50_Expr_2 = { Pipeline1_stage0_State_sum67[31], Pipeline1_stage0_State_sum67 };
	assign Pipeline2_PipelineConfigurations_L25F29T54_Expr_1 = { {2{1'b0}}, Pipeline2_Inputs_inData[0] };
	assign Pipeline2_PipelineConfigurations_L25F29T54_Expr_2 = { {2{1'b0}}, Pipeline2_Inputs_inData[1] };
	assign Pipeline2_PipelineConfigurations_L26F29T54_Expr_1 = { {2{1'b0}}, Pipeline2_Inputs_inData[2] };
	assign Pipeline2_PipelineConfigurations_L26F29T54_Expr_2 = { {2{1'b0}}, Pipeline2_Inputs_inData[3] };
	assign Pipeline2_PipelineConfigurations_L27F29T54_Expr_1 = { {2{1'b0}}, Pipeline2_Inputs_inData[4] };
	assign Pipeline2_PipelineConfigurations_L27F29T54_Expr_2 = { {2{1'b0}}, Pipeline2_Inputs_inData[5] };
	assign Pipeline2_PipelineConfigurations_L28F29T54_Expr_1 = { {2{1'b0}}, Pipeline2_Inputs_inData[6] };
	assign Pipeline2_PipelineConfigurations_L28F29T54_Expr_2 = { {2{1'b0}}, Pipeline2_Inputs_inData[7] };
	assign Pipeline2_PipelineConfigurations_L32F31T50_Expr_1 = { Pipeline2_stage0_State_sum01[31], Pipeline2_stage0_State_sum01 };
	assign Pipeline2_PipelineConfigurations_L32F31T50_Expr_2 = { Pipeline2_stage0_State_sum23[31], Pipeline2_stage0_State_sum23 };
	assign Pipeline2_PipelineConfigurations_L33F31T50_Expr_1 = { Pipeline2_stage0_State_sum45[31], Pipeline2_stage0_State_sum45 };
	assign Pipeline2_PipelineConfigurations_L33F31T50_Expr_2 = { Pipeline2_stage0_State_sum67[31], Pipeline2_stage0_State_sum67 };
	assign CustomSchedulePipelineModule_L37F28T48_Expr_1 = { {2{1'b0}}, Inputs_inData[7] };
	assign CustomSchedulePipelineModule_L37F28T48_Expr_2 = { {9{1'b0}}, CustomSchedulePipelineModule_L37F47T48_Expr };
	assign CustomSchedulePipelineModule_L38F28T48_Expr_1 = { {3{1'b0}}, Inputs_inData[6] };
	assign CustomSchedulePipelineModule_L38F28T48_Expr_2 = { {9{1'b0}}, CustomSchedulePipelineModule_L38F47T48_Expr };
	assign CustomSchedulePipelineModule_L40F28T48_Expr_1 = { {2{1'b0}}, Inputs_inData[3] };
	assign CustomSchedulePipelineModule_L40F28T48_Expr_2 = { {8{1'b0}}, CustomSchedulePipelineModule_L40F47T48_Expr };
	assign Inputs_inData[0] = inData0;
	assign Inputs_inData[1] = inData1;
	assign Inputs_inData[2] = inData2;
	assign Inputs_inData[3] = inData3;
	assign Inputs_inData[4] = inData4;
	assign Inputs_inData[5] = inData5;
	assign Inputs_inData[6] = inData6;
	assign Inputs_inData[7] = inData7;
	assign Inputs_inReady = inReady;
	assign Pipeline1_State_ready = Pipeline1_stage2_State_ready;
	assign Pipeline1_State_result = Pipeline1_stage2_State_result;
	assign Pipeline1_NextState_ready = Pipeline1_stage2_NextState_ready;
	assign Pipeline1_NextState_result = Pipeline1_stage2_NextState_result;
	assign Pipeline1_PipelineConfigurations_L38F40T56_Cast = Pipeline1_stage1_State_sum0123[7:0];
	assign Pipeline1_PipelineConfigurations_L38F65T81_Cast = Pipeline1_stage1_State_sum4567[7:0];
	assign Pipeline1_PipelineConfigurations_L38F30T82_Cast = Pipeline1_PipelineConfigurations_L38F39T81_Expr[15:0];
	assign Pipeline2_State_ready = Pipeline2_stage2_State_ready;
	assign Pipeline2_State_result = Pipeline2_stage2_State_result;
	assign Pipeline2_NextState_ready = Pipeline2_stage2_NextState_ready;
	assign Pipeline2_NextState_result = Pipeline2_stage2_NextState_result;
	assign Pipeline2_PipelineConfigurations_L38F40T56_Cast = Pipeline2_stage1_State_sum0123[7:0];
	assign Pipeline2_PipelineConfigurations_L38F65T81_Cast = Pipeline2_stage1_State_sum4567[7:0];
	assign Pipeline2_PipelineConfigurations_L38F30T82_Cast = Pipeline2_PipelineConfigurations_L38F39T81_Expr[15:0];
	assign outReady1 = Pipeline1_State_ready;
	assign outReady2 = Pipeline2_State_ready;
	assign outResult1 = Pipeline1_State_result;
	assign outResult2 = Pipeline2_State_result;
	assign Pipeline1_Inputs_inData[0] = Inputs_inData[0];
	assign Pipeline1_Inputs_inData[1] = Inputs_inData[1];
	assign Pipeline1_Inputs_inData[2] = Inputs_inData[2];
	assign Pipeline1_Inputs_inData[3] = Inputs_inData[3];
	assign Pipeline1_Inputs_inData[4] = Inputs_inData[4];
	assign Pipeline1_Inputs_inData[5] = Inputs_inData[5];
	assign Pipeline1_Inputs_inData[6] = Inputs_inData[6];
	assign Pipeline1_Inputs_inData[7] = Inputs_inData[7];
	assign Pipeline1_Inputs_inReady = Inputs_inReady;
	assign CustomSchedulePipelineModule_L37F21T49_Cast = CustomSchedulePipelineModule_L37F28T48_Expr[7:0];
	assign CustomSchedulePipelineModule_L38F21T49_Cast = CustomSchedulePipelineModule_L38F28T48_Expr[7:0];
	assign CustomSchedulePipelineModule_L39F21T50_Cast = CustomSchedulePipelineModule_L39F28T49_Expr[7:0];
	assign CustomSchedulePipelineModule_L40F21T49_Cast = CustomSchedulePipelineModule_L40F28T48_Expr[7:0];
	assign CustomSchedulePipelineModule_L43F21T50_Cast = CustomSchedulePipelineModule_L43F28T49_Expr[7:0];
	assign Pipeline2_Inputs_inData[0] = CustomSchedulePipelineModule_L37F21T49_Cast;
	assign Pipeline2_Inputs_inData[1] = CustomSchedulePipelineModule_L38F21T49_Cast;
	assign Pipeline2_Inputs_inData[2] = CustomSchedulePipelineModule_L39F21T50_Cast;
	assign Pipeline2_Inputs_inData[3] = CustomSchedulePipelineModule_L40F21T49_Cast;
	assign Pipeline2_Inputs_inData[4] = Inputs_inData[2];
	assign Pipeline2_Inputs_inData[5] = Inputs_inData[1];
	assign Pipeline2_Inputs_inData[6] = CustomSchedulePipelineModule_L43F21T50_Cast;
	assign Pipeline2_Inputs_inData[7] = Inputs_inData[0];
	assign Pipeline2_Inputs_inReady = Inputs_inReady;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
