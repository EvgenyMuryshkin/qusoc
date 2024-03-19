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
// System configuration name is IOTupleDirectInputComponentsOutputParentModule_TopLevel_child, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module IOTupleDirectInputComponentsOutputParentModule_TopLevel_child
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [59:0] iTuple,
	input wire [53:0] iTupleArray0,
	input wire [53:0] iTupleArray1,
	output wire [59:0] Output_iTuple,
	output wire [53:0] Output_iTupleArray0,
	output wire [53:0] Output_iTupleArray1
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire Inputs_iTuple_Item1;
	wire [7: 0] Inputs_iTuple_Item2;
	wire Inputs_iTuple_Item4_L1Flag;
	wire Inputs_iTuple_Item4_L2_L2Flag;
	wire [7: 0] Inputs_iTuple_Item4_L2Tuple_Item1;
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
	wire [59: 0] IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple;
	wire [3 : 0] Inputs_iTuple_Item3 [0 : 1];
	wire Inputs_iTuple_Item4_L2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Array [0 : 1];
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Tuple_Item3 [0 : 1];
	wire [53 : 0] Inputs_iTupleArray [0 : 1];
	assign Inputs_iTuple_Item1 = iTuple[59];
	assign Inputs_iTuple_Item2 = iTuple[58:51];
	assign Inputs_iTuple_Item3[1] = iTuple[50:47];
	assign Inputs_iTuple_Item3[0] = iTuple[46:43];
	assign Inputs_iTuple_Item4_L2Tuple_Item1 = iTuple[42:35];
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[1] = iTuple[34];
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[0] = iTuple[33];
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag = iTuple[32];
	assign Inputs_iTuple_Item4_L2Tuple_Item3[1] = iTuple[31:25];
	assign Inputs_iTuple_Item4_L2Tuple_Item3[0] = iTuple[24:18];
	assign Inputs_iTuple_Item4_L2Array[1] = iTuple[17:11];
	assign Inputs_iTuple_Item4_L2Array[0] = iTuple[10:4];
	assign Inputs_iTuple_Item4_L2_L2Values[1] = iTuple[3];
	assign Inputs_iTuple_Item4_L2_L2Values[0] = iTuple[2];
	assign Inputs_iTuple_Item4_L2_L2Flag = iTuple[1];
	assign Inputs_iTuple_Item4_L1Flag = iTuple[0];
	assign Inputs_iTupleArray[0] = iTupleArray0;
	assign Inputs_iTupleArray[1] = iTupleArray1;
	assign IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple = { Inputs_iTuple_Item1, Inputs_iTuple_Item2, Inputs_iTuple_Item3[1], Inputs_iTuple_Item3[0], Inputs_iTuple_Item4_L2Tuple_Item1, Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[1], Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[0], Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag, Inputs_iTuple_Item4_L2Tuple_Item3[1], Inputs_iTuple_Item4_L2Tuple_Item3[0], Inputs_iTuple_Item4_L2Array[1], Inputs_iTuple_Item4_L2Array[0], Inputs_iTuple_Item4_L2_L2Values[1], Inputs_iTuple_Item4_L2_L2Values[0], Inputs_iTuple_Item4_L2_L2Flag, Inputs_iTuple_Item4_L1Flag };
	assign Output_iTuple = IOTupleDirectInputComponentsOutputModule_L18F30T43_Tuple;
	assign Output_iTupleArray0 = Inputs_iTupleArray[0];
	assign Output_iTupleArray1 = Inputs_iTupleArray[1];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
