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
// System configuration name is FunctionsPipelineModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module FunctionsPipelineModule_TopLevel (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  Clock,
	input wire  Reset,
	input wire  signed [31: 0] inNumerator,
	output wire signed [31: 0] OutResult
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T61_Expr = 1'b0;
wire signed  [31:0] Inputs_inNumerator;
reg signed  [31:0] Pipeline_stage0_NextState_numerator;
wire signed  [31:0] Pipeline_Inputs_inNumerator;
wire signed  [31:0] Pipeline_State_numerator;
wire signed  [31:0] Pipeline_NextState_numerator;
wire  Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L35F47T64_Index;
reg  Pipeline_FunctionsPipelineModule_L34F29L41T18_isNumeratorNegative;
reg signed  [31:0] Pipeline_stage0_State_numerator = 32'b00000000000000000000000000000000;
wire signed  [31:0] Pipeline_stage0_State_numeratorDefault = 32'b00000000000000000000000000000000;
wire signed  [33:0] Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr;
wire signed  [33:0] Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr_1;
wire signed  [33:0] Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr_2;
reg  [31:0] Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup;
wire  Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_LookupMultiplexerAddress;
wire  [31:0] Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup1;
wire  [31:0] Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup2;
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
Pipeline_stage0_State_numerator <= Pipeline_stage0_State_numeratorDefault;
end
else begin
Pipeline_stage0_State_numerator <= Pipeline_stage0_NextState_numerator;
end
end
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr = Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr_1 - Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr_2;
always @*
begin
case (Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_LookupMultiplexerAddress)
    'b0:
Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup = Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup1;
    'b1:
Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup = Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup2;
  default:
Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup = 'b00000000000000000000000000000000;
endcase

end
always @*
begin
Pipeline_stage0_NextState_numerator = Pipeline_stage0_State_numerator;
Pipeline_FunctionsPipelineModule_L34F29L41T18_isNumeratorNegative = Zero;
Pipeline_FunctionsPipelineModule_L34F29L41T18_isNumeratorNegative = Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L35F47T64_Index;
Pipeline_stage0_NextState_numerator = Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup/*cast*/;

end
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr_1 = { {33{1'b0}}, Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T61_Expr }/*expand*/;
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr_2 = { {2{Pipeline_Inputs_inNumerator[31]}}, Pipeline_Inputs_inNumerator }/*expand*/;
assign Inputs_inNumerator = inNumerator;
assign Pipeline_State_numerator = Pipeline_stage0_State_numerator;
assign Pipeline_NextState_numerator = Pipeline_stage0_NextState_numerator;
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L35F47T64_Index = Pipeline_Inputs_inNumerator[31]/*cast*/;
assign OutResult = Pipeline_State_numerator;
assign Pipeline_Inputs_inNumerator = Inputs_inNumerator;
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup1 = Pipeline_Inputs_inNumerator/*cast*/;
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_Lookup2 = Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F60T77_Expr[31:0]/*truncate*/;
assign Pipeline_FunctionsPipelineModule_L34F29L41T18_FunctionsPipelineModule_L39F37T94_LookupMultiplexerAddress = Pipeline_FunctionsPipelineModule_L34F29L41T18_isNumeratorNegative;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
