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
// System configuration name is StructCompositionParentModule_TopLevel_child, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module StructCompositionParentModule_TopLevel_child
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [75:0] iValue,
	output wire [75:0] Output
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [15: 0] Inputs_iValue_intValue;
	wire [7: 0] Inputs_iValue_l1_byteValue;
	wire [1: 0] Inputs_iValue_l1_l2_bitArray;
	wire Inputs_iValue_l1_l2_boolValue [0 : 1];
	wire [3 : 0] Inputs_iValue_l1_l2Array [0 : 1];
	wire [19 : 0] Inputs_iValue_l1Array [0 : 1];
	assign Inputs_iValue_l1Array[1] = iValue[75:56];
	assign Inputs_iValue_l1Array[0] = iValue[55:36];
	assign Inputs_iValue_l1_l2Array[1] = iValue[35:32];
	assign Inputs_iValue_l1_l2Array[0] = iValue[31:28];
	assign Inputs_iValue_l1_l2_boolValue[1] = iValue[27];
	assign Inputs_iValue_l1_l2_boolValue[0] = iValue[26];
	assign Inputs_iValue_l1_l2_bitArray = iValue[25:24];
	assign Inputs_iValue_l1_byteValue = iValue[23:16];
	assign Inputs_iValue_intValue = iValue[15:0];
	assign Output[75:0] = iValue;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
