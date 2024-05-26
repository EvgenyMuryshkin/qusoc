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
// System configuration name is AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors9, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors9
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [31:0] Value,
	output wire IsActive
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [31: 0] rangeFrom = 32'b10000000000000000000000000101000;
	wire [31: 0] rangeTo = 32'b10000000000000000000000000101000;
	wire [31: 0] Inputs_Value;
	wire RangeDetectorModule_L33F33T85_Expr;
	wire RangeDetectorModule_L33F33T85_Expr_1;
	wire RangeDetectorModule_L33F33T85_Expr_2;
	wire RangeDetectorModule_L33F33T58_Expr;
	wire signed [32: 0] RangeDetectorModule_L33F33T58_ExprLhs;
	wire signed [32: 0] RangeDetectorModule_L33F33T58_ExprRhs;
	wire RangeDetectorModule_L33F62T85_Expr;
	wire signed [32: 0] RangeDetectorModule_L33F62T85_ExprLhs;
	wire signed [32: 0] RangeDetectorModule_L33F62T85_ExprRhs;
	assign RangeDetectorModule_L33F33T58_Expr = RangeDetectorModule_L33F33T58_ExprLhs >= RangeDetectorModule_L33F33T58_ExprRhs ? 1'b1 : 1'b0;
	assign RangeDetectorModule_L33F62T85_Expr = RangeDetectorModule_L33F62T85_ExprLhs <= RangeDetectorModule_L33F62T85_ExprRhs ? 1'b1 : 1'b0;
	assign RangeDetectorModule_L33F33T85_Expr = RangeDetectorModule_L33F33T85_Expr_1 & RangeDetectorModule_L33F33T85_Expr_2;
	assign RangeDetectorModule_L33F33T58_ExprLhs = {
		1'b0,
		Inputs_Value
	}
	;
	assign RangeDetectorModule_L33F33T58_ExprRhs = {
		1'b0,
		rangeFrom
	}
	;
	assign RangeDetectorModule_L33F62T85_ExprLhs = {
		1'b0,
		Inputs_Value
	}
	;
	assign RangeDetectorModule_L33F62T85_ExprRhs = {
		1'b0,
		rangeTo
	}
	;
	assign RangeDetectorModule_L33F33T85_Expr_1 = RangeDetectorModule_L33F33T58_Expr;
	assign RangeDetectorModule_L33F33T85_Expr_2 = RangeDetectorModule_L33F62T85_Expr;
	assign Inputs_Value = Value;
	assign IsActive = RangeDetectorModule_L33F33T85_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
