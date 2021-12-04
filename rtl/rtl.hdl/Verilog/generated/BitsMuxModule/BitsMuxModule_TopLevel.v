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
// System configuration name is BitsMuxModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module BitsMuxModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [7: 0] Addr,
	input wire [7: 0] Value,
	output wire [1: 0] pixelBits
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [1: 0] BitsMuxModule_L14F76T77_Expr = 2'b10;
	wire [7: 0] Inputs_Addr;
	wire [7: 0] Inputs_Value;
	wire [1: 0] pixelAddress;
	wire [1: 0] BitsMuxModule_L13F37T54_Index;
	wire [7: 0] BitsMuxModule_L14F42T71_Source;
	wire [1: 0] BitsMuxModule_L14F41T100_Index;
	wire [7: 0] BitsMuxModule_L14F42T93_Expr;
	wire [7: 0] BitsMuxModule_L14F42T93_Expr_1;
	wire [4: 0] BitsMuxModule_L14F76T92_Expr;
	wire signed [4: 0] BitsMuxModule_L14F76T92_Expr_1;
	wire signed [4: 0] BitsMuxModule_L14F76T92_Expr_2;
	assign BitsMuxModule_L14F42T93_Expr = (BitsMuxModule_L14F42T93_Expr_1 >> BitsMuxModule_L14F76T92_Expr);
	assign BitsMuxModule_L14F76T92_Expr = BitsMuxModule_L14F76T92_Expr_1 * BitsMuxModule_L14F76T92_Expr_2;
	assign BitsMuxModule_L14F42T93_Expr_1 = BitsMuxModule_L14F42T71_Source;
	assign BitsMuxModule_L14F76T92_Expr_1 = { {3{1'b0}}, BitsMuxModule_L14F76T77_Expr }/*expand*/;
	assign BitsMuxModule_L14F76T92_Expr_2 = { {3{1'b0}}, pixelAddress }/*expand*/;
	assign Inputs_Addr = Addr;
	assign Inputs_Value = Value;
	assign BitsMuxModule_L13F37T54_Index = Inputs_Addr[1:0];
	assign pixelAddress = BitsMuxModule_L13F37T54_Index;
	assign BitsMuxModule_L14F42T71_Source = Inputs_Value;
	assign BitsMuxModule_L14F41T100_Index = BitsMuxModule_L14F42T93_Expr[1:0];
	assign pixelBits = BitsMuxModule_L14F41T100_Index;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
