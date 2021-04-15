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
// System configuration name is StageStatePipelineModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module StageStatePipelineModule_TopLevel (
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
	output wire [15: 0] outResult,
	output wire [15: 0] outS0Counter,
	output wire [15: 0] outS1Counter,
	output wire [15: 0] outS2Counter
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  Pipeline_StageStatePipelineModule_L92F60T61_Expr = 1'b1;
wire  Pipeline_StageStatePipelineModule_L97F64T65_Expr = 1'b1;
wire  Pipeline_StageStatePipelineModule_L108F59T60_Expr = 1'b1;
wire  Inputs_inReady;
wire  [7:0] Inputs_inData0;
wire  [7:0] Inputs_inData1;
wire  [7:0] Inputs_inData2;
wire  [7:0] Inputs_inData3;
wire  [7:0] Inputs_inData4;
wire  [7:0] Inputs_inData5;
wire  [7:0] Inputs_inData6;
wire  [7:0] Inputs_inData7;
reg  [15:0] Pipeline_stage0_NextState_sums0;
reg  [15:0] Pipeline_stage0_NextState_sums1;
reg  [15:0] Pipeline_stage0_NextState_sums2;
reg  [15:0] Pipeline_stage0_NextState_sums3;
reg  [15:0] Pipeline_stage0_NextState_S0Counter;
reg  Pipeline_stage0_NextState_IsReady;
reg  [15:0] Pipeline_stage1_NextState_sums0;
reg  [15:0] Pipeline_stage1_NextState_sums1;
reg  [15:0] Pipeline_stage1_NextState_S0Counter;
reg  [15:0] Pipeline_stage1_NextState_S1Counter;
reg  Pipeline_stage1_NextState_IsReady;
reg  Pipeline_stage2_NextState_IsReady;
reg  [15:0] Pipeline_stage2_NextState_result;
reg  [15:0] Pipeline_stage2_NextState_S0Counter;
reg  [15:0] Pipeline_stage2_NextState_S1Counter;
reg  [15:0] Pipeline_stage2_NextState_S2Counter;
wire  Pipeline_Inputs_inReady;
wire  [7:0] Pipeline_Inputs_inData0;
wire  [7:0] Pipeline_Inputs_inData1;
wire  [7:0] Pipeline_Inputs_inData2;
wire  [7:0] Pipeline_Inputs_inData3;
wire  [7:0] Pipeline_Inputs_inData4;
wire  [7:0] Pipeline_Inputs_inData5;
wire  [7:0] Pipeline_Inputs_inData6;
wire  [7:0] Pipeline_Inputs_inData7;
wire  Pipeline_State_IsReady;
wire  [15:0] Pipeline_State_result;
wire  [15:0] Pipeline_State_S0Counter;
wire  [15:0] Pipeline_State_S1Counter;
wire  [15:0] Pipeline_State_S2Counter;
wire  Pipeline_NextState_IsReady;
wire  [15:0] Pipeline_NextState_result;
wire  [15:0] Pipeline_NextState_S0Counter;
wire  [15:0] Pipeline_NextState_S1Counter;
wire  [15:0] Pipeline_NextState_S2Counter;
wire  [15:0] Pipeline_StageStatePipelineModule_L87F25T60_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L88F25T60_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L89F25T60_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L90F25T60_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L92F33T62_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L97F33T66_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L100F25T58_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L101F25T58_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L105F30T63_Cast;
wire  [15:0] Pipeline_StageStatePipelineModule_L108F33T61_Cast;
wire  StageStatePipelineModule_L39F33T61_Cast;
reg  [15:0] Pipeline_stage0_State_sums0 = 16'b0000000000000000;
wire  [15:0] Pipeline_stage0_State_sums0Default = 16'b0000000000000000;
reg  [15:0] Pipeline_stage0_State_sums1 = 16'b0000000000000000;
wire  [15:0] Pipeline_stage0_State_sums1Default = 16'b0000000000000000;
reg  [15:0] Pipeline_stage0_State_sums2 = 16'b0000000000000000;
wire  [15:0] Pipeline_stage0_State_sums2Default = 16'b0000000000000000;
reg  [15:0] Pipeline_stage0_State_sums3 = 16'b0000000000000000;
wire  [15:0] Pipeline_stage0_State_sums3Default = 16'b0000000000000000;
reg  [15:0] Pipeline_stage0_State_S0Counter = 16'b0000000000000000;
wire  [15:0] Pipeline_stage0_State_S0CounterDefault = 16'b0000000000000000;
reg  Pipeline_stage0_State_IsReady = 1'b0;
wire  Pipeline_stage0_State_IsReadyDefault = 1'b0;
reg  [15:0] Pipeline_stage1_State_sums0 = 16'b0000000000000000;
wire  [15:0] Pipeline_stage1_State_sums0Default = 16'b0000000000000000;
reg  [15:0] Pipeline_stage1_State_sums1 = 16'b0000000000000000;
wire  [15:0] Pipeline_stage1_State_sums1Default = 16'b0000000000000000;
reg  [15:0] Pipeline_stage1_State_S0Counter = 16'b0000000000000000;
wire  [15:0] Pipeline_stage1_State_S0CounterDefault = 16'b0000000000000000;
reg  [15:0] Pipeline_stage1_State_S1Counter = 16'b0000000000000000;
wire  [15:0] Pipeline_stage1_State_S1CounterDefault = 16'b0000000000000000;
reg  Pipeline_stage1_State_IsReady = 1'b0;
wire  Pipeline_stage1_State_IsReadyDefault = 1'b0;
reg  Pipeline_stage2_State_IsReady = 1'b0;
wire  Pipeline_stage2_State_IsReadyDefault = 1'b0;
reg  [15:0] Pipeline_stage2_State_result = 16'b0000000000000000;
wire  [15:0] Pipeline_stage2_State_resultDefault = 16'b0000000000000000;
reg  [15:0] Pipeline_stage2_State_S0Counter = 16'b0000000000000000;
wire  [15:0] Pipeline_stage2_State_S0CounterDefault = 16'b0000000000000000;
reg  [15:0] Pipeline_stage2_State_S1Counter = 16'b0000000000000000;
wire  [15:0] Pipeline_stage2_State_S1CounterDefault = 16'b0000000000000000;
reg  [15:0] Pipeline_stage2_State_S2Counter = 16'b0000000000000000;
wire  [15:0] Pipeline_stage2_State_S2CounterDefault = 16'b0000000000000000;
wire  [9:0] Pipeline_StageStatePipelineModule_L87F34T59_Expr;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L87F34T59_Expr_1;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L87F34T59_Expr_2;
wire  [9:0] Pipeline_StageStatePipelineModule_L88F34T59_Expr;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L88F34T59_Expr_1;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L88F34T59_Expr_2;
wire  [9:0] Pipeline_StageStatePipelineModule_L89F34T59_Expr;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L89F34T59_Expr_1;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L89F34T59_Expr_2;
wire  [9:0] Pipeline_StageStatePipelineModule_L90F34T59_Expr;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L90F34T59_Expr_1;
wire signed  [9:0] Pipeline_StageStatePipelineModule_L90F34T59_Expr_2;
wire  [17:0] Pipeline_StageStatePipelineModule_L92F42T61_Expr;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L92F42T61_Expr_1;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L92F42T61_Expr_2;
wire  [17:0] Pipeline_StageStatePipelineModule_L97F42T65_Expr;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L97F42T65_Expr_1;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L97F42T65_Expr_2;
wire  [17:0] Pipeline_StageStatePipelineModule_L100F34T57_Expr;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L100F34T57_Expr_1;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L100F34T57_Expr_2;
wire  [17:0] Pipeline_StageStatePipelineModule_L101F34T57_Expr;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L101F34T57_Expr_1;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L101F34T57_Expr_2;
wire  [17:0] Pipeline_StageStatePipelineModule_L105F39T62_Expr;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L105F39T62_Expr_1;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L105F39T62_Expr_2;
wire  [17:0] Pipeline_StageStatePipelineModule_L108F42T60_Expr;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L108F42T60_Expr_1;
wire signed  [17:0] Pipeline_StageStatePipelineModule_L108F42T60_Expr_2;
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
Pipeline_stage0_State_sums0 <= Pipeline_stage0_State_sums0Default;
Pipeline_stage0_State_sums1 <= Pipeline_stage0_State_sums1Default;
Pipeline_stage0_State_sums2 <= Pipeline_stage0_State_sums2Default;
Pipeline_stage0_State_sums3 <= Pipeline_stage0_State_sums3Default;
Pipeline_stage0_State_S0Counter <= Pipeline_stage0_State_S0CounterDefault;
Pipeline_stage0_State_IsReady <= Pipeline_stage0_State_IsReadyDefault;
Pipeline_stage1_State_sums0 <= Pipeline_stage1_State_sums0Default;
Pipeline_stage1_State_sums1 <= Pipeline_stage1_State_sums1Default;
Pipeline_stage1_State_S0Counter <= Pipeline_stage1_State_S0CounterDefault;
Pipeline_stage1_State_S1Counter <= Pipeline_stage1_State_S1CounterDefault;
Pipeline_stage1_State_IsReady <= Pipeline_stage1_State_IsReadyDefault;
Pipeline_stage2_State_IsReady <= Pipeline_stage2_State_IsReadyDefault;
Pipeline_stage2_State_result <= Pipeline_stage2_State_resultDefault;
Pipeline_stage2_State_S0Counter <= Pipeline_stage2_State_S0CounterDefault;
Pipeline_stage2_State_S1Counter <= Pipeline_stage2_State_S1CounterDefault;
Pipeline_stage2_State_S2Counter <= Pipeline_stage2_State_S2CounterDefault;
end
else begin
Pipeline_stage0_State_sums0 <= Pipeline_stage0_NextState_sums0;
Pipeline_stage0_State_sums1 <= Pipeline_stage0_NextState_sums1;
Pipeline_stage0_State_sums2 <= Pipeline_stage0_NextState_sums2;
Pipeline_stage0_State_sums3 <= Pipeline_stage0_NextState_sums3;
Pipeline_stage0_State_S0Counter <= Pipeline_stage0_NextState_S0Counter;
Pipeline_stage0_State_IsReady <= Pipeline_stage0_NextState_IsReady;
Pipeline_stage1_State_sums0 <= Pipeline_stage1_NextState_sums0;
Pipeline_stage1_State_sums1 <= Pipeline_stage1_NextState_sums1;
Pipeline_stage1_State_S0Counter <= Pipeline_stage1_NextState_S0Counter;
Pipeline_stage1_State_S1Counter <= Pipeline_stage1_NextState_S1Counter;
Pipeline_stage1_State_IsReady <= Pipeline_stage1_NextState_IsReady;
Pipeline_stage2_State_IsReady <= Pipeline_stage2_NextState_IsReady;
Pipeline_stage2_State_result <= Pipeline_stage2_NextState_result;
Pipeline_stage2_State_S0Counter <= Pipeline_stage2_NextState_S0Counter;
Pipeline_stage2_State_S1Counter <= Pipeline_stage2_NextState_S1Counter;
Pipeline_stage2_State_S2Counter <= Pipeline_stage2_NextState_S2Counter;
end
end
assign Pipeline_StageStatePipelineModule_L87F34T59_Expr = Pipeline_StageStatePipelineModule_L87F34T59_Expr_1 + Pipeline_StageStatePipelineModule_L87F34T59_Expr_2;
assign Pipeline_StageStatePipelineModule_L88F34T59_Expr = Pipeline_StageStatePipelineModule_L88F34T59_Expr_1 + Pipeline_StageStatePipelineModule_L88F34T59_Expr_2;
assign Pipeline_StageStatePipelineModule_L89F34T59_Expr = Pipeline_StageStatePipelineModule_L89F34T59_Expr_1 + Pipeline_StageStatePipelineModule_L89F34T59_Expr_2;
assign Pipeline_StageStatePipelineModule_L90F34T59_Expr = Pipeline_StageStatePipelineModule_L90F34T59_Expr_1 + Pipeline_StageStatePipelineModule_L90F34T59_Expr_2;
assign Pipeline_StageStatePipelineModule_L92F42T61_Expr = Pipeline_StageStatePipelineModule_L92F42T61_Expr_1 + Pipeline_StageStatePipelineModule_L92F42T61_Expr_2;
assign Pipeline_StageStatePipelineModule_L97F42T65_Expr = Pipeline_StageStatePipelineModule_L97F42T65_Expr_1 + Pipeline_StageStatePipelineModule_L97F42T65_Expr_2;
assign Pipeline_StageStatePipelineModule_L100F34T57_Expr = Pipeline_StageStatePipelineModule_L100F34T57_Expr_1 + Pipeline_StageStatePipelineModule_L100F34T57_Expr_2;
assign Pipeline_StageStatePipelineModule_L101F34T57_Expr = Pipeline_StageStatePipelineModule_L101F34T57_Expr_1 + Pipeline_StageStatePipelineModule_L101F34T57_Expr_2;
assign Pipeline_StageStatePipelineModule_L105F39T62_Expr = Pipeline_StageStatePipelineModule_L105F39T62_Expr_1 + Pipeline_StageStatePipelineModule_L105F39T62_Expr_2;
assign Pipeline_StageStatePipelineModule_L108F42T60_Expr = Pipeline_StageStatePipelineModule_L108F42T60_Expr_1 + Pipeline_StageStatePipelineModule_L108F42T60_Expr_2;
always @*
begin
Pipeline_stage0_NextState_sums0 = Pipeline_stage0_State_sums0;
Pipeline_stage0_NextState_sums1 = Pipeline_stage0_State_sums1;
Pipeline_stage0_NextState_sums2 = Pipeline_stage0_State_sums2;
Pipeline_stage0_NextState_sums3 = Pipeline_stage0_State_sums3;
Pipeline_stage0_NextState_S0Counter = Pipeline_stage0_State_S0Counter;
Pipeline_stage0_NextState_IsReady = Pipeline_stage0_State_IsReady;
Pipeline_stage1_NextState_sums0 = Pipeline_stage1_State_sums0;
Pipeline_stage1_NextState_sums1 = Pipeline_stage1_State_sums1;
Pipeline_stage1_NextState_S0Counter = Pipeline_stage1_State_S0Counter;
Pipeline_stage1_NextState_S1Counter = Pipeline_stage1_State_S1Counter;
Pipeline_stage1_NextState_IsReady = Pipeline_stage1_State_IsReady;
Pipeline_stage2_NextState_IsReady = Pipeline_stage2_State_IsReady;
Pipeline_stage2_NextState_result = Pipeline_stage2_State_result;
Pipeline_stage2_NextState_S0Counter = Pipeline_stage2_State_S0Counter;
Pipeline_stage2_NextState_S1Counter = Pipeline_stage2_State_S1Counter;
Pipeline_stage2_NextState_S2Counter = Pipeline_stage2_State_S2Counter;
Pipeline_stage0_NextState_sums0 = Pipeline_StageStatePipelineModule_L87F25T60_Cast;
Pipeline_stage0_NextState_sums1 = Pipeline_StageStatePipelineModule_L88F25T60_Cast;
Pipeline_stage0_NextState_sums2 = Pipeline_StageStatePipelineModule_L89F25T60_Cast;
Pipeline_stage0_NextState_sums3 = Pipeline_StageStatePipelineModule_L90F25T60_Cast;
Pipeline_stage0_NextState_S0Counter = Pipeline_StageStatePipelineModule_L92F33T62_Cast;
Pipeline_stage0_NextState_IsReady = Pipeline_Inputs_inReady;
Pipeline_stage1_NextState_sums0 = Pipeline_StageStatePipelineModule_L100F25T58_Cast;
Pipeline_stage1_NextState_sums1 = Pipeline_StageStatePipelineModule_L101F25T58_Cast;
Pipeline_stage1_NextState_S0Counter = Pipeline_stage0_State_S0Counter;
Pipeline_stage1_NextState_S1Counter = Pipeline_StageStatePipelineModule_L97F33T66_Cast;
Pipeline_stage1_NextState_IsReady = Pipeline_stage0_State_IsReady;
Pipeline_stage2_NextState_IsReady = Pipeline_stage1_State_IsReady;
Pipeline_stage2_NextState_result = Pipeline_StageStatePipelineModule_L105F30T63_Cast;
Pipeline_stage2_NextState_S0Counter = Pipeline_stage1_State_S0Counter;
Pipeline_stage2_NextState_S1Counter = Pipeline_stage1_State_S1Counter;
Pipeline_stage2_NextState_S2Counter = Pipeline_StageStatePipelineModule_L108F33T61_Cast;

end
assign Pipeline_StageStatePipelineModule_L87F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData2 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L87F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData3 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L88F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData4 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L88F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData5 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L89F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData0 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L89F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData1 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L90F34T59_Expr_1 = { {2{1'b0}}, Pipeline_Inputs_inData6 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L90F34T59_Expr_2 = { {2{1'b0}}, Pipeline_Inputs_inData7 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L92F42T61_Expr_1 = { {2{1'b0}}, Pipeline_stage0_State_S0Counter }/*expand*/;
assign Pipeline_StageStatePipelineModule_L92F42T61_Expr_2 = { {17{1'b0}}, Pipeline_StageStatePipelineModule_L92F60T61_Expr }/*expand*/;
assign Pipeline_StageStatePipelineModule_L97F42T65_Expr_1 = { {2{1'b0}}, Pipeline_stage1_State_S1Counter }/*expand*/;
assign Pipeline_StageStatePipelineModule_L97F42T65_Expr_2 = { {17{1'b0}}, Pipeline_StageStatePipelineModule_L97F64T65_Expr }/*expand*/;
assign Pipeline_StageStatePipelineModule_L100F34T57_Expr_1 = { {2{1'b0}}, Pipeline_stage0_State_sums0 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L100F34T57_Expr_2 = { {2{1'b0}}, Pipeline_stage0_State_sums1 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L101F34T57_Expr_1 = { {2{1'b0}}, Pipeline_stage0_State_sums2 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L101F34T57_Expr_2 = { {2{1'b0}}, Pipeline_stage0_State_sums3 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L105F39T62_Expr_1 = { {2{1'b0}}, Pipeline_stage1_State_sums0 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L105F39T62_Expr_2 = { {2{1'b0}}, Pipeline_stage1_State_sums1 }/*expand*/;
assign Pipeline_StageStatePipelineModule_L108F42T60_Expr_1 = { {2{1'b0}}, Pipeline_stage2_State_S2Counter }/*expand*/;
assign Pipeline_StageStatePipelineModule_L108F42T60_Expr_2 = { {17{1'b0}}, Pipeline_StageStatePipelineModule_L108F59T60_Expr }/*expand*/;
assign Inputs_inReady = inReady;
assign Inputs_inData0 = inData0;
assign Inputs_inData1 = inData1;
assign Inputs_inData2 = inData2;
assign Inputs_inData3 = inData3;
assign Inputs_inData4 = inData4;
assign Inputs_inData5 = inData5;
assign Inputs_inData6 = inData6;
assign Inputs_inData7 = inData7;
assign Pipeline_State_IsReady = Pipeline_stage2_State_IsReady;
assign Pipeline_State_result = Pipeline_stage2_State_result;
assign Pipeline_State_S0Counter = Pipeline_stage2_State_S0Counter;
assign Pipeline_State_S1Counter = Pipeline_stage2_State_S1Counter;
assign Pipeline_State_S2Counter = Pipeline_stage2_State_S2Counter;
assign Pipeline_NextState_IsReady = Pipeline_stage2_NextState_IsReady;
assign Pipeline_NextState_result = Pipeline_stage2_NextState_result;
assign Pipeline_NextState_S0Counter = Pipeline_stage2_NextState_S0Counter;
assign Pipeline_NextState_S1Counter = Pipeline_stage2_NextState_S1Counter;
assign Pipeline_NextState_S2Counter = Pipeline_stage2_NextState_S2Counter;
assign Pipeline_StageStatePipelineModule_L87F25T60_Cast = { {6{1'b0}}, Pipeline_StageStatePipelineModule_L87F34T59_Expr }/*expand*/;
assign Pipeline_StageStatePipelineModule_L88F25T60_Cast = { {6{1'b0}}, Pipeline_StageStatePipelineModule_L88F34T59_Expr }/*expand*/;
assign Pipeline_StageStatePipelineModule_L89F25T60_Cast = { {6{1'b0}}, Pipeline_StageStatePipelineModule_L89F34T59_Expr }/*expand*/;
assign Pipeline_StageStatePipelineModule_L90F25T60_Cast = { {6{1'b0}}, Pipeline_StageStatePipelineModule_L90F34T59_Expr }/*expand*/;
assign Pipeline_StageStatePipelineModule_L92F33T62_Cast = Pipeline_StageStatePipelineModule_L92F42T61_Expr[15:0]/*truncate*/;
assign Pipeline_StageStatePipelineModule_L97F33T66_Cast = Pipeline_StageStatePipelineModule_L97F42T65_Expr[15:0]/*truncate*/;
assign Pipeline_StageStatePipelineModule_L100F25T58_Cast = Pipeline_StageStatePipelineModule_L100F34T57_Expr[15:0]/*truncate*/;
assign Pipeline_StageStatePipelineModule_L101F25T58_Cast = Pipeline_StageStatePipelineModule_L101F34T57_Expr[15:0]/*truncate*/;
assign Pipeline_StageStatePipelineModule_L105F30T63_Cast = Pipeline_StageStatePipelineModule_L105F39T62_Expr[15:0]/*truncate*/;
assign Pipeline_StageStatePipelineModule_L108F33T61_Cast = Pipeline_StageStatePipelineModule_L108F42T60_Expr[15:0]/*truncate*/;
assign StageStatePipelineModule_L39F33T61_Cast = Pipeline_State_IsReady;
assign outReady = StageStatePipelineModule_L39F33T61_Cast;
assign outResult = Pipeline_State_result;
assign outS0Counter = Pipeline_State_S0Counter;
assign outS1Counter = Pipeline_State_S1Counter;
assign outS2Counter = Pipeline_State_S2Counter;
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
