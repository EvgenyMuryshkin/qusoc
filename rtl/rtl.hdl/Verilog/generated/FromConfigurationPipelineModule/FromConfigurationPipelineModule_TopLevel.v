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
// System configuration name is FromConfigurationPipelineModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module FromConfigurationPipelineModule_TopLevel (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  Clock,
	input wire  Reset,
	input wire  inReady,
	input wire  [7: 0] inData0,
	input wire  [7: 0] inData1,
	input wire  [7: 0] inData2,
	input wire  [7: 0] inData3,
	input wire  [7: 0] inData4,
	input wire  [7: 0] inData5,
	input wire  [7: 0] inData6,
	input wire  [7: 0] inData7,
	output wire outReady,
	output wire [15: 0] outResult
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  [3:0] Pipeline_PipelineConfigurations_L38F60T61_Expr = 4'b1000;
wire  Inputs_inReady;
wire  [7:0] Inputs_inData0;
wire  [7:0] Inputs_inData1;
wire  [7:0] Inputs_inData2;
wire  [7:0] Inputs_inData3;
wire  [7:0] Inputs_inData4;
wire  [7:0] Inputs_inData5;
wire  [7:0] Inputs_inData6;
wire  [7:0] Inputs_inData7;
reg  Pipeline_stage0_NextState_IsS0Ready;
reg signed  [31:0] Pipeline_stage0_NextState_sum01;
reg signed  [31:0] Pipeline_stage0_NextState_sum23;
reg signed  [31:0] Pipeline_stage0_NextState_sum45;
reg signed  [31:0] Pipeline_stage0_NextState_sum67;
reg  Pipeline_stage1_NextState_IsS1Ready;
reg signed  [31:0] Pipeline_stage1_NextState_sum0123;
reg signed  [31:0] Pipeline_stage1_NextState_sum4567;
reg  Pipeline_stage2_NextState_ready;
reg  [15:0] Pipeline_stage2_NextState_result;
wire  Pipeline_Inputs_inReady;
wire  [7:0] Pipeline_Inputs_inData0;
wire  [7:0] Pipeline_Inputs_inData1;
wire  [7:0] Pipeline_Inputs_inData2;
wire  [7:0] Pipeline_Inputs_inData3;
wire  [7:0] Pipeline_Inputs_inData4;
wire  [7:0] Pipeline_Inputs_inData5;
wire  [7:0] Pipeline_Inputs_inData6;
wire  [7:0] Pipeline_Inputs_inData7;
wire  Pipeline_State_ready;
wire  [15:0] Pipeline_State_result;
wire  Pipeline_NextState_ready;
wire  [15:0] Pipeline_NextState_result;
wire  [7:0] Pipeline_PipelineConfigurations_L38F40T56_Cast;
wire  [7:0] Pipeline_PipelineConfigurations_L38F65T81_Cast;
wire  [15:0] Pipeline_PipelineConfigurations_L38F30T82_Cast;
reg  Pipeline_stage0_State_IsS0Ready = 1'b0;
wire  Pipeline_stage0_State_IsS0ReadyDefault = 1'b0;
reg signed  [31:0] Pipeline_stage0_State_sum01 = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage0_State_sum01Default = 32'b00000000000000000000000000000000;
reg signed  [31:0] Pipeline_stage0_State_sum23 = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage0_State_sum23Default = 32'b00000000000000000000000000000000;
reg signed  [31:0] Pipeline_stage0_State_sum45 = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage0_State_sum45Default = 32'b00000000000000000000000000000000;
reg signed  [31:0] Pipeline_stage0_State_sum67 = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage0_State_sum67Default = 32'b00000000000000000000000000000000;
reg  Pipeline_stage1_State_IsS1Ready = 1'b0;
wire  Pipeline_stage1_State_IsS1ReadyDefault = 1'b0;
reg signed  [31:0] Pipeline_stage1_State_sum0123 = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage1_State_sum0123Default = 32'b00000000000000000000000000000000;
reg signed  [31:0] Pipeline_stage1_State_sum4567 = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage1_State_sum4567Default = 32'b00000000000000000000000000000000;
reg  Pipeline_stage2_State_ready = 1'b0;
wire  Pipeline_stage2_State_readyDefault = 1'b0;
reg  [15:0] Pipeline_stage2_State_result = 16'b0000000000000000;
wire  [15:0] Pipeline_stage2_State_resultDefault = 16'b0000000000000000;
wire  [23:0] Pipeline_PipelineConfigurations_L38F39T81_Expr;
wire  [23:0] Pipeline_PipelineConfigurations_L38F39T81_Expr_1;
wire  [23:0] Pipeline_PipelineConfigurations_L38F39T81_Expr_2;
wire  [23:0] Pipeline_PipelineConfigurations_L38F40T61_Expr;
wire  [23:0] Pipeline_PipelineConfigurations_L38F40T61_Expr_1;
wire  [9:0] Pipeline_PipelineConfigurations_L25F29T54_Expr;
wire signed  [9:0] Pipeline_PipelineConfigurations_L25F29T54_Expr_1;
wire signed  [9:0] Pipeline_PipelineConfigurations_L25F29T54_Expr_2;
wire  [9:0] Pipeline_PipelineConfigurations_L26F29T54_Expr;
wire signed  [9:0] Pipeline_PipelineConfigurations_L26F29T54_Expr_1;
wire signed  [9:0] Pipeline_PipelineConfigurations_L26F29T54_Expr_2;
wire  [9:0] Pipeline_PipelineConfigurations_L27F29T54_Expr;
wire signed  [9:0] Pipeline_PipelineConfigurations_L27F29T54_Expr_1;
wire signed  [9:0] Pipeline_PipelineConfigurations_L27F29T54_Expr_2;
wire  [9:0] Pipeline_PipelineConfigurations_L28F29T54_Expr;
wire signed  [9:0] Pipeline_PipelineConfigurations_L28F29T54_Expr_1;
wire signed  [9:0] Pipeline_PipelineConfigurations_L28F29T54_Expr_2;
wire signed  [32:0] Pipeline_PipelineConfigurations_L32F31T50_Expr;
wire signed  [32:0] Pipeline_PipelineConfigurations_L32F31T50_Expr_1;
wire signed  [32:0] Pipeline_PipelineConfigurations_L32F31T50_Expr_2;
wire signed  [32:0] Pipeline_PipelineConfigurations_L33F31T50_Expr;
wire signed  [32:0] Pipeline_PipelineConfigurations_L33F31T50_Expr_1;
wire signed  [32:0] Pipeline_PipelineConfigurations_L33F31T50_Expr_2;
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
Pipeline_stage0_State_IsS0Ready <= Pipeline_stage0_State_IsS0ReadyDefault;
Pipeline_stage0_State_sum01 <= Pipeline_stage0_State_sum01Default;
Pipeline_stage0_State_sum23 <= Pipeline_stage0_State_sum23Default;
Pipeline_stage0_State_sum45 <= Pipeline_stage0_State_sum45Default;
Pipeline_stage0_State_sum67 <= Pipeline_stage0_State_sum67Default;
Pipeline_stage1_State_IsS1Ready <= Pipeline_stage1_State_IsS1ReadyDefault;
Pipeline_stage1_State_sum0123 <= Pipeline_stage1_State_sum0123Default;
Pipeline_stage1_State_sum4567 <= Pipeline_stage1_State_sum4567Default;
Pipeline_stage2_State_ready <= Pipeline_stage2_State_readyDefault;
Pipeline_stage2_State_result <= Pipeline_stage2_State_resultDefault;
end
else begin
Pipeline_stage0_State_IsS0Ready <= Pipeline_stage0_NextState_IsS0Ready;
Pipeline_stage0_State_sum01 <= Pipeline_stage0_NextState_sum01;
Pipeline_stage0_State_sum23 <= Pipeline_stage0_NextState_sum23;
Pipeline_stage0_State_sum45 <= Pipeline_stage0_NextState_sum45;
Pipeline_stage0_State_sum67 <= Pipeline_stage0_NextState_sum67;
Pipeline_stage1_State_IsS1Ready <= Pipeline_stage1_NextState_IsS1Ready;
Pipeline_stage1_State_sum0123 <= Pipeline_stage1_NextState_sum0123;
Pipeline_stage1_State_sum4567 <= Pipeline_stage1_NextState_sum4567;
Pipeline_stage2_State_ready <= Pipeline_stage2_NextState_ready;
Pipeline_stage2_State_result <= Pipeline_stage2_NextState_result;
end
end
assign Pipeline_PipelineConfigurations_L38F39T81_Expr = Pipeline_PipelineConfigurations_L38F39T81_Expr_1 | Pipeline_PipelineConfigurations_L38F39T81_Expr_2;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[0] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[1] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[2] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[3] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[4] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[5] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[6] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[7] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[8] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[0];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[9] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[1];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[10] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[2];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[11] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[3];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[12] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[4];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[13] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[5];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[14] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[6];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[15] = Pipeline_PipelineConfigurations_L38F40T61_Expr_1[7];
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[16] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[17] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[18] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[19] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[20] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[21] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[22] = 0;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr[23] = 0;
assign Pipeline_PipelineConfigurations_L25F29T54_Expr = Pipeline_PipelineConfigurations_L25F29T54_Expr_1 + Pipeline_PipelineConfigurations_L25F29T54_Expr_2;
assign Pipeline_PipelineConfigurations_L26F29T54_Expr = Pipeline_PipelineConfigurations_L26F29T54_Expr_1 + Pipeline_PipelineConfigurations_L26F29T54_Expr_2;
assign Pipeline_PipelineConfigurations_L27F29T54_Expr = Pipeline_PipelineConfigurations_L27F29T54_Expr_1 + Pipeline_PipelineConfigurations_L27F29T54_Expr_2;
assign Pipeline_PipelineConfigurations_L28F29T54_Expr = Pipeline_PipelineConfigurations_L28F29T54_Expr_1 + Pipeline_PipelineConfigurations_L28F29T54_Expr_2;
assign Pipeline_PipelineConfigurations_L32F31T50_Expr = Pipeline_PipelineConfigurations_L32F31T50_Expr_1 + Pipeline_PipelineConfigurations_L32F31T50_Expr_2;
assign Pipeline_PipelineConfigurations_L33F31T50_Expr = Pipeline_PipelineConfigurations_L33F31T50_Expr_1 + Pipeline_PipelineConfigurations_L33F31T50_Expr_2;
always @*
begin
Pipeline_stage0_NextState_IsS0Ready = Pipeline_stage0_State_IsS0Ready;
Pipeline_stage0_NextState_sum01 = Pipeline_stage0_State_sum01;
Pipeline_stage0_NextState_sum23 = Pipeline_stage0_State_sum23;
Pipeline_stage0_NextState_sum45 = Pipeline_stage0_State_sum45;
Pipeline_stage0_NextState_sum67 = Pipeline_stage0_State_sum67;
Pipeline_stage1_NextState_IsS1Ready = Pipeline_stage1_State_IsS1Ready;
Pipeline_stage1_NextState_sum0123 = Pipeline_stage1_State_sum0123;
Pipeline_stage1_NextState_sum4567 = Pipeline_stage1_State_sum4567;
Pipeline_stage2_NextState_ready = Pipeline_stage2_State_ready;
Pipeline_stage2_NextState_result = Pipeline_stage2_State_result;
Pipeline_stage0_NextState_IsS0Ready = Pipeline_Inputs_inReady;
Pipeline_stage0_NextState_sum01 = { {22{1'b0}}, Pipeline_PipelineConfigurations_L25F29T54_Expr }/*expand*/;
Pipeline_stage0_NextState_sum23 = { {22{1'b0}}, Pipeline_PipelineConfigurations_L26F29T54_Expr }/*expand*/;
Pipeline_stage0_NextState_sum45 = { {22{1'b0}}, Pipeline_PipelineConfigurations_L27F29T54_Expr }/*expand*/;
Pipeline_stage0_NextState_sum67 = { {22{1'b0}}, Pipeline_PipelineConfigurations_L28F29T54_Expr }/*expand*/;
Pipeline_stage1_NextState_IsS1Ready = Pipeline_stage0_State_IsS0Ready;
Pipeline_stage1_NextState_sum0123 = Pipeline_PipelineConfigurations_L32F31T50_Expr[31:0]/*truncate*/;
Pipeline_stage1_NextState_sum4567 = Pipeline_PipelineConfigurations_L33F31T50_Expr[31:0]/*truncate*/;
Pipeline_stage2_NextState_ready = Pipeline_stage1_State_IsS1Ready;
Pipeline_stage2_NextState_result = Pipeline_PipelineConfigurations_L38F30T82_Cast;

end
assign Pipeline_PipelineConfigurations_L38F39T81_Expr_1 = Pipeline_PipelineConfigurations_L38F40T61_Expr;
assign Pipeline_PipelineConfigurations_L38F39T81_Expr_2 = { {16{1'b0}}, Pipeline_PipelineConfigurations_L38F65T81_Cast }/*expand*/;
assign Pipeline_PipelineConfigurations_L38F40T61_Expr_1 = { {16{1'b0}}, Pipeline_PipelineConfigurations_L38F40T56_Cast }/*expand*/;
assign Pipeline_PipelineConfigurations_L25F29T54_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData0 }/*expand*/;
assign Pipeline_PipelineConfigurations_L25F29T54_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData1 }/*expand*/;
assign Pipeline_PipelineConfigurations_L26F29T54_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData2 }/*expand*/;
assign Pipeline_PipelineConfigurations_L26F29T54_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData3 }/*expand*/;
assign Pipeline_PipelineConfigurations_L27F29T54_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData4 }/*expand*/;
assign Pipeline_PipelineConfigurations_L27F29T54_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData5 }/*expand*/;
assign Pipeline_PipelineConfigurations_L28F29T54_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData6 }/*expand*/;
assign Pipeline_PipelineConfigurations_L28F29T54_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData7 }/*expand*/;
assign Pipeline_PipelineConfigurations_L32F31T50_Expr_1 = { {1{Pipeline_stage0_State_sum01[31]}}, Pipeline_stage0_State_sum01 }/*expand*/;
assign Pipeline_PipelineConfigurations_L32F31T50_Expr_2 = { {1{Pipeline_stage0_State_sum23[31]}}, Pipeline_stage0_State_sum23 }/*expand*/;
assign Pipeline_PipelineConfigurations_L33F31T50_Expr_1 = { {1{Pipeline_stage0_State_sum45[31]}}, Pipeline_stage0_State_sum45 }/*expand*/;
assign Pipeline_PipelineConfigurations_L33F31T50_Expr_2 = { {1{Pipeline_stage0_State_sum67[31]}}, Pipeline_stage0_State_sum67 }/*expand*/;
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
assign Pipeline_PipelineConfigurations_L38F40T56_Cast = Pipeline_stage1_State_sum0123[7:0]/*truncate*/;
assign Pipeline_PipelineConfigurations_L38F65T81_Cast = Pipeline_stage1_State_sum4567[7:0]/*truncate*/;
assign Pipeline_PipelineConfigurations_L38F30T82_Cast = Pipeline_PipelineConfigurations_L38F39T81_Expr[15:0]/*truncate*/;
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
