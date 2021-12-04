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
// System configuration name is ShifterModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module ShifterModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [7: 0] Value,
	input wire [2: 0] ShiftBy,
	output wire [7: 0] SHLL,
	output wire [7: 0] SHRL,
	output wire signed [7: 0] SHRA
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] Inputs_Value;
	wire [2: 0] Inputs_ShiftBy;
	wire [7: 0] ShifterModule_L14F36T59_SignChange;
	wire signed [7: 0] ShifterModule_L15F36T57_SignChange;
	wire [7: 0] ShifterModule_L13F36T66_Expr;
	wire [7: 0] ShifterModule_L13F36T66_Expr_1;
	wire [7: 0] ShifterModule_L14F36T77_Expr;
	wire [7: 0] ShifterModule_L14F36T77_Expr_1;
	wire signed [7: 0] ShifterModule_L15F36T75_Expr;
	wire signed [7: 0] ShifterModule_L15F36T75_Expr_1;
	assign ShifterModule_L13F36T66_Expr = (ShifterModule_L13F36T66_Expr_1 << Inputs_ShiftBy);
	assign ShifterModule_L14F36T77_Expr = (ShifterModule_L14F36T77_Expr_1 >> Inputs_ShiftBy);
	assign ShifterModule_L15F36T75_Expr = (ShifterModule_L15F36T75_Expr_1 >>> Inputs_ShiftBy);
	assign ShifterModule_L13F36T66_Expr_1 = Inputs_Value;
	assign ShifterModule_L14F36T77_Expr_1 = ShifterModule_L14F36T59_SignChange;
	assign ShifterModule_L15F36T75_Expr_1 = ShifterModule_L15F36T57_SignChange;
	assign Inputs_Value = Value;
	assign Inputs_ShiftBy = ShiftBy;
	assign SHLL = ShifterModule_L13F36T66_Expr;
	assign ShifterModule_L14F36T59_SignChange = Inputs_Value;
	assign SHRL = ShifterModule_L14F36T77_Expr;
	assign ShifterModule_L15F36T57_SignChange = Inputs_Value/*cast*/;
	assign SHRA = ShifterModule_L15F36T75_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
