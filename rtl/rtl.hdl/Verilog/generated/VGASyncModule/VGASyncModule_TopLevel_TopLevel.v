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
// System configuration name is VGASyncModule_TopLevel_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module VGASyncModule_TopLevel_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire Enabled,
	output wire OutVisible,
	output wire OutFP,
	output wire OutSP,
	output wire OutBP,
	output wire OutMax,
	output wire [9:0] OutCounter
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [8: 0] visible = 9'b111100000;
	wire [8: 0] fp = 9'b111101010;
	wire [8: 0] sp = 9'b111101100;
	wire [9: 0] bp = 10'b1000001101;
	wire [9: 0] max = 10'b1000001100;
	wire [3: 0] capacity = 4'b1010;
	wire VGASyncModule_L64F9L67T10_VGASyncModule_L66F85T86_Expr = 1'b0;
	wire VGASyncModule_L64F9L67T10_VGASyncModule_L66F106T107_Expr = 1'b1;
	wire Inputs_Enabled;
	reg [9: 0] NextState_counter;
	wire internalIsMax;
	wire [9: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize;
	wire [9: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange;
	reg [9: 0] State_counter = 10'b0000000000;
	wire [9: 0] State_counterDefault = 10'b0000000001;
	wire VGASyncModule_L57F30T76_Expr;
	wire VGASyncModule_L57F30T76_Expr_1;
	wire VGASyncModule_L57F30T76_Expr_2;
	wire VGASyncModule_L58F30T71_Expr;
	wire VGASyncModule_L58F30T71_Expr_1;
	wire VGASyncModule_L58F30T71_Expr_2;
	wire VGASyncModule_L59F30T71_Expr;
	wire VGASyncModule_L59F30T71_Expr_1;
	wire VGASyncModule_L59F30T71_Expr_2;
	wire [11: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr;
	wire signed [11: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1;
	wire signed [11: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2;
	wire VGASyncModule_L54F31T51_Expr;
	wire signed [10: 0] VGASyncModule_L54F31T51_ExprLhs;
	wire signed [10: 0] VGASyncModule_L54F31T51_ExprRhs;
	wire VGASyncModule_L56F35T58_Expr;
	wire signed [10: 0] VGASyncModule_L56F35T58_ExprLhs;
	wire signed [10: 0] VGASyncModule_L56F35T58_ExprRhs;
	wire VGASyncModule_L57F30T54_Expr;
	wire signed [10: 0] VGASyncModule_L57F30T54_ExprLhs;
	wire signed [10: 0] VGASyncModule_L57F30T54_ExprRhs;
	wire VGASyncModule_L57F58T76_Expr;
	wire signed [10: 0] VGASyncModule_L57F58T76_ExprLhs;
	wire signed [10: 0] VGASyncModule_L57F58T76_ExprRhs;
	wire VGASyncModule_L58F30T49_Expr;
	wire signed [10: 0] VGASyncModule_L58F30T49_ExprLhs;
	wire signed [10: 0] VGASyncModule_L58F30T49_ExprRhs;
	wire VGASyncModule_L58F53T71_Expr;
	wire signed [10: 0] VGASyncModule_L58F53T71_ExprLhs;
	wire signed [10: 0] VGASyncModule_L58F53T71_ExprRhs;
	wire VGASyncModule_L59F30T49_Expr;
	wire signed [10: 0] VGASyncModule_L59F30T49_ExprLhs;
	wire signed [10: 0] VGASyncModule_L59F30T49_ExprRhs;
	wire VGASyncModule_L59F53T71_Expr;
	wire signed [10: 0] VGASyncModule_L59F53T71_ExprLhs;
	wire signed [10: 0] VGASyncModule_L59F53T71_ExprRhs;
	reg [9: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup;
	wire VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress;
	wire [9: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1;
	wire [9: 0] VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2;
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_counter <= State_counterDefault;
		end
		else
		begin
			State_counter <= NextState_counter;
		end
	end
	assign VGASyncModule_L54F31T51_Expr = VGASyncModule_L54F31T51_ExprLhs == VGASyncModule_L54F31T51_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L56F35T58_Expr = VGASyncModule_L56F35T58_ExprLhs < VGASyncModule_L56F35T58_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L57F30T54_Expr = VGASyncModule_L57F30T54_ExprLhs >= VGASyncModule_L57F30T54_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L57F58T76_Expr = VGASyncModule_L57F58T76_ExprLhs < VGASyncModule_L57F58T76_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L58F30T49_Expr = VGASyncModule_L58F30T49_ExprLhs >= VGASyncModule_L58F30T49_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L58F53T71_Expr = VGASyncModule_L58F53T71_ExprLhs < VGASyncModule_L58F53T71_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L59F30T49_Expr = VGASyncModule_L59F30T49_ExprLhs >= VGASyncModule_L59F30T49_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L59F53T71_Expr = VGASyncModule_L59F53T71_ExprLhs < VGASyncModule_L59F53T71_ExprRhs ? 1'b1 : 1'b0;
	assign VGASyncModule_L57F30T76_Expr = VGASyncModule_L57F30T76_Expr_1 & VGASyncModule_L57F30T76_Expr_2;
	assign VGASyncModule_L58F30T71_Expr = VGASyncModule_L58F30T71_Expr_1 & VGASyncModule_L58F30T71_Expr_2;
	assign VGASyncModule_L59F30T71_Expr = VGASyncModule_L59F30T71_Expr_1 & VGASyncModule_L59F30T71_Expr_2;
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr = VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1 + VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2;
	always @ (*)
	begin
		case (VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress)
			'b0:
			begin
				VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup = VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1;
			end
			'b1:
			begin
				VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup = VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2;
			end
			default:
			begin
				VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup = 'b0000000000;
			end
		endcase
	end
	always @ (*)
	begin
		NextState_counter = State_counter;
		if ((Inputs_Enabled == 1))
		begin
			NextState_counter = VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange;
		end
	end
	assign VGASyncModule_L54F31T51_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L54F31T51_ExprRhs = { 1'b0, max };
	assign VGASyncModule_L56F35T58_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L56F35T58_ExprRhs = { {2{1'b0}}, visible };
	assign VGASyncModule_L57F30T54_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L57F30T54_ExprRhs = { {2{1'b0}}, visible };
	assign VGASyncModule_L57F58T76_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L57F58T76_ExprRhs = { {2{1'b0}}, fp };
	assign VGASyncModule_L58F30T49_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L58F30T49_ExprRhs = { {2{1'b0}}, fp };
	assign VGASyncModule_L58F53T71_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L58F53T71_ExprRhs = { {2{1'b0}}, sp };
	assign VGASyncModule_L59F30T49_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L59F30T49_ExprRhs = { {2{1'b0}}, sp };
	assign VGASyncModule_L59F53T71_ExprLhs = { 1'b0, State_counter };
	assign VGASyncModule_L59F53T71_ExprRhs = { 1'b0, bp };
	assign VGASyncModule_L57F30T76_Expr_1 = VGASyncModule_L57F30T54_Expr;
	assign VGASyncModule_L57F30T76_Expr_2 = VGASyncModule_L57F58T76_Expr;
	assign VGASyncModule_L58F30T71_Expr_1 = VGASyncModule_L58F30T49_Expr;
	assign VGASyncModule_L58F30T71_Expr_2 = VGASyncModule_L58F53T71_Expr;
	assign VGASyncModule_L59F30T71_Expr_1 = VGASyncModule_L59F30T49_Expr;
	assign VGASyncModule_L59F30T71_Expr_2 = VGASyncModule_L59F53T71_Expr;
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_1 = { {2{1'b0}}, State_counter };
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr_2 = { {11{1'b0}}, VGASyncModule_L64F9L67T10_VGASyncModule_L66F106T107_Expr };
	assign Inputs_Enabled = Enabled;
	assign internalIsMax = VGASyncModule_L54F31T51_Expr;
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize = VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup;
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T137_SignChange = VGASyncModule_L64F9L67T10_VGASyncModule_L66F37T126_Resize;
	assign OutVisible = VGASyncModule_L56F35T58_Expr;
	assign OutFP = VGASyncModule_L57F30T76_Expr;
	assign OutSP = VGASyncModule_L58F30T71_Expr;
	assign OutBP = VGASyncModule_L59F30T71_Expr;
	assign OutMax = internalIsMax;
	assign OutCounter = State_counter;
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup1 = VGASyncModule_L64F9L67T10_VGASyncModule_L66F90T107_Expr[9:0];
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_Lookup2 = { {9{1'b0}}, VGASyncModule_L64F9L67T10_VGASyncModule_L66F85T86_Expr };
	assign VGASyncModule_L64F9L67T10_VGASyncModule_L66F53T107_LookupMultiplexerAddress = internalIsMax;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
