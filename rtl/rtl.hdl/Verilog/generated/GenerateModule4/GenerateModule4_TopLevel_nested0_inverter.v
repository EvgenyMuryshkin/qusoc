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
// System configuration name is GenerateModule4_TopLevel_nested0_inverter, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module GenerateModule4_TopLevel_nested0_inverter
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire inValue,
	output wire outValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire Inputs_inValue;
	wire GenerateModule_L16F33T48_Expr;
	wire GenerateModule_L16F33T48_Expr_1;
	assign GenerateModule_L16F33T48_Expr = ~GenerateModule_L16F33T48_Expr_1;
	assign GenerateModule_L16F33T48_Expr_1 = Inputs_inValue;
	assign Inputs_inValue = inValue;
	assign outValue = GenerateModule_L16F33T48_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
