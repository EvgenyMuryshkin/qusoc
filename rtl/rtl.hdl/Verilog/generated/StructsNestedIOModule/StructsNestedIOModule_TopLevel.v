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
// System configuration name is StructsNestedIOModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module StructsNestedIOModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [15:0] Value_intValue,
	input wire [7:0] Value_l1_byteValue,
	input wire [1:0] Value_l1_l2_bitArray,
	input wire Value_l1_l2_boolValue0,
	input wire Value_l1_l2_boolValue1,
	input wire [1:0] Value_l1_l2Array0_bitArray,
	input wire Value_l1_l2Array0_boolValue0,
	input wire Value_l1_l2Array0_boolValue1,
	input wire [1:0] Value_l1_l2Array1_bitArray,
	input wire Value_l1_l2Array1_boolValue0,
	input wire Value_l1_l2Array1_boolValue1,
	input wire [7:0] Value_l1Array0_byteValue,
	input wire [1:0] Value_l1Array0_l2_bitArray,
	input wire Value_l1Array0_l2_boolValue0,
	input wire Value_l1Array0_l2_boolValue1,
	input wire [1:0] Value_l1Array0_l2Array0_bitArray,
	input wire Value_l1Array0_l2Array0_boolValue0,
	input wire Value_l1Array0_l2Array0_boolValue1,
	input wire [1:0] Value_l1Array0_l2Array1_bitArray,
	input wire Value_l1Array0_l2Array1_boolValue0,
	input wire Value_l1Array0_l2Array1_boolValue1,
	input wire [7:0] Value_l1Array1_byteValue,
	input wire [1:0] Value_l1Array1_l2_bitArray,
	input wire Value_l1Array1_l2_boolValue0,
	input wire Value_l1Array1_l2_boolValue1,
	input wire [1:0] Value_l1Array1_l2Array0_bitArray,
	input wire Value_l1Array1_l2Array0_boolValue0,
	input wire Value_l1Array1_l2Array0_boolValue1,
	input wire [1:0] Value_l1Array1_l2Array1_bitArray,
	input wire Value_l1Array1_l2Array1_boolValue0,
	input wire Value_l1Array1_l2Array1_boolValue1,
	output wire [15:0] oDirect_intValue,
	output wire [7:0] oDirect_l1_byteValue,
	output wire [1:0] oDirect_l1_l2_bitArray,
	output wire oDirect_l1_l2_boolValue0,
	output wire oDirect_l1_l2_boolValue1,
	output wire [1:0] oDirect_l1_l2Array0_bitArray,
	output wire oDirect_l1_l2Array0_boolValue0,
	output wire oDirect_l1_l2Array0_boolValue1,
	output wire [1:0] oDirect_l1_l2Array1_bitArray,
	output wire oDirect_l1_l2Array1_boolValue0,
	output wire oDirect_l1_l2Array1_boolValue1,
	output wire [7:0] oDirect_l1Array0_byteValue,
	output wire [1:0] oDirect_l1Array0_l2_bitArray,
	output wire oDirect_l1Array0_l2_boolValue0,
	output wire oDirect_l1Array0_l2_boolValue1,
	output wire [1:0] oDirect_l1Array0_l2Array0_bitArray,
	output wire oDirect_l1Array0_l2Array0_boolValue0,
	output wire oDirect_l1Array0_l2Array0_boolValue1,
	output wire [1:0] oDirect_l1Array0_l2Array1_bitArray,
	output wire oDirect_l1Array0_l2Array1_boolValue0,
	output wire oDirect_l1Array0_l2Array1_boolValue1,
	output wire [7:0] oDirect_l1Array1_byteValue,
	output wire [1:0] oDirect_l1Array1_l2_bitArray,
	output wire oDirect_l1Array1_l2_boolValue0,
	output wire oDirect_l1Array1_l2_boolValue1,
	output wire [1:0] oDirect_l1Array1_l2Array0_bitArray,
	output wire oDirect_l1Array1_l2Array0_boolValue0,
	output wire oDirect_l1Array1_l2Array0_boolValue1,
	output wire [1:0] oDirect_l1Array1_l2Array1_bitArray,
	output wire oDirect_l1Array1_l2Array1_boolValue0,
	output wire oDirect_l1Array1_l2Array1_boolValue1
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [15: 0] Inputs_Value_intValue;
	wire [7: 0] Inputs_Value_l1_byteValue;
	wire [1: 0] Inputs_Value_l1_l2_bitArray;
	wire Inputs_Value_l1_l2_boolValue [0 : 1];
	wire [3 : 0] Inputs_Value_l1_l2Array [0 : 1];
	wire [19 : 0] Inputs_Value_l1Array [0 : 1];
	assign Inputs_Value_intValue = Value_intValue;
	assign Inputs_Value_l1_byteValue = Value_l1_byteValue;
	assign Inputs_Value_l1_l2_bitArray = Value_l1_l2_bitArray;
	assign Inputs_Value_l1_l2_boolValue[0] = Value_l1_l2_boolValue0;
	assign Inputs_Value_l1_l2_boolValue[1] = Value_l1_l2_boolValue1;
	assign Inputs_Value_l1_l2Array[0][3] = Value_l1_l2Array0_boolValue1;
	assign Inputs_Value_l1_l2Array[0][2] = Value_l1_l2Array0_boolValue0;
	assign Inputs_Value_l1_l2Array[0][1:0] = Value_l1_l2Array0_bitArray;
	assign Inputs_Value_l1_l2Array[1][3] = Value_l1_l2Array1_boolValue1;
	assign Inputs_Value_l1_l2Array[1][2] = Value_l1_l2Array1_boolValue0;
	assign Inputs_Value_l1_l2Array[1][1:0] = Value_l1_l2Array1_bitArray;
	assign Inputs_Value_l1Array[0][19] = Value_l1Array0_l2Array1_boolValue1;
	assign Inputs_Value_l1Array[0][18] = Value_l1Array0_l2Array1_boolValue0;
	assign Inputs_Value_l1Array[0][17:16] = Value_l1Array0_l2Array1_bitArray;
	assign Inputs_Value_l1Array[0][15] = Value_l1Array0_l2Array0_boolValue1;
	assign Inputs_Value_l1Array[0][14] = Value_l1Array0_l2Array0_boolValue0;
	assign Inputs_Value_l1Array[0][13:12] = Value_l1Array0_l2Array0_bitArray;
	assign Inputs_Value_l1Array[0][11] = Value_l1Array0_l2_boolValue1;
	assign Inputs_Value_l1Array[0][10] = Value_l1Array0_l2_boolValue0;
	assign Inputs_Value_l1Array[0][9:8] = Value_l1Array0_l2_bitArray;
	assign Inputs_Value_l1Array[0][7:0] = Value_l1Array0_byteValue;
	assign Inputs_Value_l1Array[1][19] = Value_l1Array1_l2Array1_boolValue1;
	assign Inputs_Value_l1Array[1][18] = Value_l1Array1_l2Array1_boolValue0;
	assign Inputs_Value_l1Array[1][17:16] = Value_l1Array1_l2Array1_bitArray;
	assign Inputs_Value_l1Array[1][15] = Value_l1Array1_l2Array0_boolValue1;
	assign Inputs_Value_l1Array[1][14] = Value_l1Array1_l2Array0_boolValue0;
	assign Inputs_Value_l1Array[1][13:12] = Value_l1Array1_l2Array0_bitArray;
	assign Inputs_Value_l1Array[1][11] = Value_l1Array1_l2_boolValue1;
	assign Inputs_Value_l1Array[1][10] = Value_l1Array1_l2_boolValue0;
	assign Inputs_Value_l1Array[1][9:8] = Value_l1Array1_l2_bitArray;
	assign Inputs_Value_l1Array[1][7:0] = Value_l1Array1_byteValue;
	assign oDirect_intValue = Inputs_Value_intValue;
	assign oDirect_l1_byteValue = Inputs_Value_l1_byteValue;
	assign oDirect_l1_l2_bitArray = Inputs_Value_l1_l2_bitArray;
	assign oDirect_l1_l2_boolValue0 = Inputs_Value_l1_l2_boolValue[0];
	assign oDirect_l1_l2_boolValue1 = Inputs_Value_l1_l2_boolValue[1];
	assign oDirect_l1_l2Array0_boolValue1 = Inputs_Value_l1_l2Array[0][3];
	assign oDirect_l1_l2Array0_boolValue0 = Inputs_Value_l1_l2Array[0][2];
	assign oDirect_l1_l2Array0_bitArray = Inputs_Value_l1_l2Array[0][1:0];
	assign oDirect_l1_l2Array1_boolValue1 = Inputs_Value_l1_l2Array[1][3];
	assign oDirect_l1_l2Array1_boolValue0 = Inputs_Value_l1_l2Array[1][2];
	assign oDirect_l1_l2Array1_bitArray = Inputs_Value_l1_l2Array[1][1:0];
	assign oDirect_l1Array0_l2Array1_boolValue1 = Inputs_Value_l1Array[0][19];
	assign oDirect_l1Array0_l2Array1_boolValue0 = Inputs_Value_l1Array[0][18];
	assign oDirect_l1Array0_l2Array1_bitArray = Inputs_Value_l1Array[0][17:16];
	assign oDirect_l1Array0_l2Array0_boolValue1 = Inputs_Value_l1Array[0][15];
	assign oDirect_l1Array0_l2Array0_boolValue0 = Inputs_Value_l1Array[0][14];
	assign oDirect_l1Array0_l2Array0_bitArray = Inputs_Value_l1Array[0][13:12];
	assign oDirect_l1Array0_l2_boolValue1 = Inputs_Value_l1Array[0][11];
	assign oDirect_l1Array0_l2_boolValue0 = Inputs_Value_l1Array[0][10];
	assign oDirect_l1Array0_l2_bitArray = Inputs_Value_l1Array[0][9:8];
	assign oDirect_l1Array0_byteValue = Inputs_Value_l1Array[0][7:0];
	assign oDirect_l1Array1_l2Array1_boolValue1 = Inputs_Value_l1Array[1][19];
	assign oDirect_l1Array1_l2Array1_boolValue0 = Inputs_Value_l1Array[1][18];
	assign oDirect_l1Array1_l2Array1_bitArray = Inputs_Value_l1Array[1][17:16];
	assign oDirect_l1Array1_l2Array0_boolValue1 = Inputs_Value_l1Array[1][15];
	assign oDirect_l1Array1_l2Array0_boolValue0 = Inputs_Value_l1Array[1][14];
	assign oDirect_l1Array1_l2Array0_bitArray = Inputs_Value_l1Array[1][13:12];
	assign oDirect_l1Array1_l2_boolValue1 = Inputs_Value_l1Array[1][11];
	assign oDirect_l1Array1_l2_boolValue0 = Inputs_Value_l1Array[1][10];
	assign oDirect_l1Array1_l2_bitArray = Inputs_Value_l1Array[1][9:8];
	assign oDirect_l1Array1_byteValue = Inputs_Value_l1Array[1][7:0];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
