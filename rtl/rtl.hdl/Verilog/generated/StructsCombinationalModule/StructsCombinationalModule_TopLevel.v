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
// System configuration name is StructsCombinationalModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module StructsCombinationalModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [7:0] In_Op1,
	input wire [7:0] In_Op2,
	output wire [7:0] Op1,
	output wire [7:0] Sum,
	output wire [7:0] OutDirect_Op1,
	output wire [7:0] OutDirect_Op2,
	output wire [7:0] OutInternal_Op1,
	output wire [7:0] OutInternal_Op2,
	output wire [7:0] OutSwapped_Op1,
	output wire [7:0] OutSwapped_Op2,
	output wire [7:0] OutMath_Op1,
	output wire [7:0] OutMath_Op2,
	output wire [7:0] Default1_Op1,
	output wire [7:0] Default1_Op2,
	output wire [7:0] Default2_Op1,
	output wire [7:0] Default2_Op2
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [5: 0] StructsModule_L35F52T54_Expr = 6'b101010;
	wire [4: 0] StructsModule_L11F27T29_Expr = 5'b10100;
	wire [3: 0] StructsModule_L10F27T29_Expr = 4'b1010;
	wire [7: 0] Inputs_In_Op1;
	wire [7: 0] Inputs_In_Op2;
	wire [7: 0] internalDirect_Op1;
	wire [7: 0] internalDirect_Op2;
	wire [7: 0] internalSum;
	wire [7: 0] StructsModule_L22F29T66_Cast;
	wire [7: 0] StructsModule_L31F19T56_Cast;
	wire [7: 0] StructsModule_L32F19T56_Cast;
	wire [9: 0] StructsModule_L22F36T65_Expr;
	wire signed [9: 0] StructsModule_L22F36T65_Expr_1;
	wire signed [9: 0] StructsModule_L22F36T65_Expr_2;
	wire [9: 0] StructsModule_L31F26T55_Expr;
	wire signed [9: 0] StructsModule_L31F26T55_Expr_1;
	wire signed [9: 0] StructsModule_L31F26T55_Expr_2;
	wire signed [9: 0] StructsModule_L32F26T55_Expr;
	wire signed [9: 0] StructsModule_L32F26T55_Expr_1;
	wire signed [9: 0] StructsModule_L32F26T55_Expr_2;
	assign StructsModule_L22F36T65_Expr = StructsModule_L22F36T65_Expr_1 + StructsModule_L22F36T65_Expr_2;
	assign StructsModule_L31F26T55_Expr = StructsModule_L31F26T55_Expr_1 + StructsModule_L31F26T55_Expr_2;
	assign StructsModule_L32F26T55_Expr = StructsModule_L32F26T55_Expr_1 - StructsModule_L32F26T55_Expr_2;
	assign StructsModule_L22F36T65_Expr_1 = { {2{1'b0}}, Inputs_In_Op1 };
	assign StructsModule_L22F36T65_Expr_2 = { {2{1'b0}}, Inputs_In_Op2 };
	assign StructsModule_L31F26T55_Expr_1 = { {2{1'b0}}, Inputs_In_Op1 };
	assign StructsModule_L31F26T55_Expr_2 = { {2{1'b0}}, Inputs_In_Op2 };
	assign StructsModule_L32F26T55_Expr_1 = { {2{1'b0}}, Inputs_In_Op1 };
	assign StructsModule_L32F26T55_Expr_2 = { {2{1'b0}}, Inputs_In_Op2 };
	assign Inputs_In_Op1 = In_Op1;
	assign Inputs_In_Op2 = In_Op2;
	assign internalDirect_Op1 = Inputs_In_Op1;
	assign internalDirect_Op2 = Inputs_In_Op2;
	assign StructsModule_L22F29T66_Cast = StructsModule_L22F36T65_Expr[7:0];
	assign internalSum = StructsModule_L22F29T66_Cast;
	assign Op1 = Inputs_In_Op1;
	assign Sum = internalSum;
	assign OutDirect_Op1 = Inputs_In_Op1;
	assign OutDirect_Op2 = Inputs_In_Op2;
	assign OutInternal_Op1 = internalDirect_Op1;
	assign OutInternal_Op2 = internalDirect_Op2;
	assign OutSwapped_Op1 = Inputs_In_Op2;
	assign OutSwapped_Op2 = Inputs_In_Op1;
	assign StructsModule_L31F19T56_Cast = StructsModule_L31F26T55_Expr[7:0];
	assign StructsModule_L32F19T56_Cast = StructsModule_L32F26T55_Expr[7:0];
	assign OutMath_Op1 = StructsModule_L31F19T56_Cast;
	assign OutMath_Op2 = StructsModule_L32F19T56_Cast;
	assign Default1_Op1 = { {2{1'b0}}, StructsModule_L35F52T54_Expr };
	assign Default1_Op2 = { {3{1'b0}}, StructsModule_L11F27T29_Expr };
	assign Default2_Op1 = { {4{1'b0}}, StructsModule_L10F27T29_Expr };
	assign Default2_Op2 = { {3{1'b0}}, StructsModule_L11F27T29_Expr };
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
