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
// System configuration name is NativeGetterModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module NativeGetterModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [7: 0] Value,
	output wire [7: 0] Getter
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L35F30T43_Expr = 8'b11111111;
	wire [6: 0] BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F36T39_Expr = 7'b1100100;
	wire [7: 0] Inputs_Value;
	reg [7: 0] BitArrayGetterModule_L34F13L41T14_result;
	wire BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_Expr;
	wire signed [8: 0] BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_ExprLhs;
	wire signed [8: 0] BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_ExprRhs;
	assign BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_Expr = BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_ExprLhs < BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_ExprRhs ? 1'b1 : 1'b0;
	always @ (*)
	begin
		BitArrayGetterModule_L34F13L41T14_result = BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L35F30T43_Expr;
		if ((BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_Expr == 1))
		begin
			BitArrayGetterModule_L34F13L41T14_result = Inputs_Value;
		end
	end
	assign BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_ExprLhs = { {1{1'b0}}, Inputs_Value }/*expand*/;
	assign BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F21T39_ExprRhs = { {2{1'b0}}, BitArrayGetterModule_L34F13L41T14_BitArrayGetterModule_L37F36T39_Expr }/*expand*/;
	assign Inputs_Value = Value;
	assign Getter = BitArrayGetterModule_L34F13L41T14_result;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
