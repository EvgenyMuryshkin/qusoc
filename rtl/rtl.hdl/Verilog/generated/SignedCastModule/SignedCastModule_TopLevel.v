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
// System configuration name is SignedCastModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module SignedCastModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire signed [15:0] ShortValue,
	output wire [7:0] ByteValue,
	output wire signed [31:0] IntValue,
	output wire signed [7:0] SByteValue,
	output wire [31:0] UIntValue,
	output wire [15:0] UShortValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [15: 0] Inputs_ShortValue;
	wire [7: 0] SignedCastModule_L13F34T57_Cast;
	wire signed [7: 0] SignedCastModule_L14F36T60_Cast;
	wire [31: 0] SignedCastModule_L17F34T57_Cast;
	wire [15: 0] SignedCastModule_L15F38T63_Cast;
	assign Inputs_ShortValue = ShortValue;
	assign SignedCastModule_L13F34T57_Cast = Inputs_ShortValue[7:0];
	assign ByteValue = SignedCastModule_L13F34T57_Cast;
	assign IntValue = { {16{Inputs_ShortValue[15]}}, Inputs_ShortValue };
	assign SignedCastModule_L14F36T60_Cast = Inputs_ShortValue[7:0];
	assign SByteValue = SignedCastModule_L14F36T60_Cast;
	assign SignedCastModule_L17F34T57_Cast = { {16{Inputs_ShortValue[15]}}, Inputs_ShortValue };
	assign UIntValue = SignedCastModule_L17F34T57_Cast;
	assign SignedCastModule_L15F38T63_Cast = Inputs_ShortValue;
	assign UShortValue = SignedCastModule_L15F38T63_Cast;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
