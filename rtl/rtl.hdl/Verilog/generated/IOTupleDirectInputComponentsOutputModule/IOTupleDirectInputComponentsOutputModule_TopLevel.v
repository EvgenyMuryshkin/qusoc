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
// System configuration name is IOTupleDirectInputComponentsOutputModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module IOTupleDirectInputComponentsOutputModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire iTuple_Item1,
	input wire [7:0] iTuple_Item2,
	input wire [3:0] iTuple_Item30,
	input wire [3:0] iTuple_Item31,
	input wire iTuple_Item4_L1Flag,
	input wire iTuple_Item4_L2_L2Flag,
	input wire iTuple_Item4_L2_L2Values0,
	input wire iTuple_Item4_L2_L2Values1,
	input wire iTuple_Item4_L2Array0_L2Flag,
	input wire [2:0] iTuple_Item4_L2Array0_L2Values0,
	input wire [2:0] iTuple_Item4_L2Array0_L2Values1,
	input wire iTuple_Item4_L2Array1_L2Flag,
	input wire [2:0] iTuple_Item4_L2Array1_L2Values0,
	input wire [2:0] iTuple_Item4_L2Array1_L2Values1,
	input wire [7:0] iTuple_Item4_L2Tuple_Item1,
	input wire iTuple_Item4_L2Tuple_Item2_L2Flag,
	input wire iTuple_Item4_L2Tuple_Item2_L2Values0,
	input wire iTuple_Item4_L2Tuple_Item2_L2Values1,
	input wire iTuple_Item4_L2Tuple_Item30_L2Flag,
	input wire [2:0] iTuple_Item4_L2Tuple_Item30_L2Values0,
	input wire [2:0] iTuple_Item4_L2Tuple_Item30_L2Values1,
	input wire iTuple_Item4_L2Tuple_Item31_L2Flag,
	input wire [2:0] iTuple_Item4_L2Tuple_Item31_L2Values0,
	input wire [2:0] iTuple_Item4_L2Tuple_Item31_L2Values1,
	input wire iTupleArray0_Item1,
	input wire [3:0] iTupleArray0_Item2,
	input wire iTupleArray0_Item3_L1Flag,
	input wire iTupleArray0_Item3_L2_L2Flag,
	input wire iTupleArray0_Item3_L2_L2Values0,
	input wire iTupleArray0_Item3_L2_L2Values1,
	input wire iTupleArray0_Item3_L2Array0_L2Flag,
	input wire [2:0] iTupleArray0_Item3_L2Array0_L2Values0,
	input wire [2:0] iTupleArray0_Item3_L2Array0_L2Values1,
	input wire iTupleArray0_Item3_L2Array1_L2Flag,
	input wire [2:0] iTupleArray0_Item3_L2Array1_L2Values0,
	input wire [2:0] iTupleArray0_Item3_L2Array1_L2Values1,
	input wire [7:0] iTupleArray0_Item3_L2Tuple_Item1,
	input wire iTupleArray0_Item3_L2Tuple_Item2_L2Flag,
	input wire iTupleArray0_Item3_L2Tuple_Item2_L2Values0,
	input wire iTupleArray0_Item3_L2Tuple_Item2_L2Values1,
	input wire iTupleArray0_Item3_L2Tuple_Item30_L2Flag,
	input wire [2:0] iTupleArray0_Item3_L2Tuple_Item30_L2Values0,
	input wire [2:0] iTupleArray0_Item3_L2Tuple_Item30_L2Values1,
	input wire iTupleArray0_Item3_L2Tuple_Item31_L2Flag,
	input wire [2:0] iTupleArray0_Item3_L2Tuple_Item31_L2Values0,
	input wire [2:0] iTupleArray0_Item3_L2Tuple_Item31_L2Values1,
	input wire iTupleArray0_Item40_L2Flag,
	input wire iTupleArray0_Item40_L2Values0,
	input wire iTupleArray0_Item40_L2Values1,
	input wire iTupleArray0_Item41_L2Flag,
	input wire iTupleArray0_Item41_L2Values0,
	input wire iTupleArray0_Item41_L2Values1,
	input wire iTupleArray1_Item1,
	input wire [3:0] iTupleArray1_Item2,
	input wire iTupleArray1_Item3_L1Flag,
	input wire iTupleArray1_Item3_L2_L2Flag,
	input wire iTupleArray1_Item3_L2_L2Values0,
	input wire iTupleArray1_Item3_L2_L2Values1,
	input wire iTupleArray1_Item3_L2Array0_L2Flag,
	input wire [2:0] iTupleArray1_Item3_L2Array0_L2Values0,
	input wire [2:0] iTupleArray1_Item3_L2Array0_L2Values1,
	input wire iTupleArray1_Item3_L2Array1_L2Flag,
	input wire [2:0] iTupleArray1_Item3_L2Array1_L2Values0,
	input wire [2:0] iTupleArray1_Item3_L2Array1_L2Values1,
	input wire [7:0] iTupleArray1_Item3_L2Tuple_Item1,
	input wire iTupleArray1_Item3_L2Tuple_Item2_L2Flag,
	input wire iTupleArray1_Item3_L2Tuple_Item2_L2Values0,
	input wire iTupleArray1_Item3_L2Tuple_Item2_L2Values1,
	input wire iTupleArray1_Item3_L2Tuple_Item30_L2Flag,
	input wire [2:0] iTupleArray1_Item3_L2Tuple_Item30_L2Values0,
	input wire [2:0] iTupleArray1_Item3_L2Tuple_Item30_L2Values1,
	input wire iTupleArray1_Item3_L2Tuple_Item31_L2Flag,
	input wire [2:0] iTupleArray1_Item3_L2Tuple_Item31_L2Values0,
	input wire [2:0] iTupleArray1_Item3_L2Tuple_Item31_L2Values1,
	input wire iTupleArray1_Item40_L2Flag,
	input wire iTupleArray1_Item40_L2Values0,
	input wire iTupleArray1_Item40_L2Values1,
	input wire iTupleArray1_Item41_L2Flag,
	input wire iTupleArray1_Item41_L2Values0,
	input wire iTupleArray1_Item41_L2Values1,
	output wire Output_iTuple_Item1,
	output wire [7:0] Output_iTuple_Item2,
	output wire [3:0] Output_iTuple_Item30,
	output wire [3:0] Output_iTuple_Item31,
	output wire Output_iTuple_Item4_L1Flag,
	output wire Output_iTuple_Item4_L2_L2Flag,
	output wire Output_iTuple_Item4_L2_L2Values0,
	output wire Output_iTuple_Item4_L2_L2Values1,
	output wire Output_iTuple_Item4_L2Array0_L2Flag,
	output wire [2:0] Output_iTuple_Item4_L2Array0_L2Values0,
	output wire [2:0] Output_iTuple_Item4_L2Array0_L2Values1,
	output wire Output_iTuple_Item4_L2Array1_L2Flag,
	output wire [2:0] Output_iTuple_Item4_L2Array1_L2Values0,
	output wire [2:0] Output_iTuple_Item4_L2Array1_L2Values1,
	output wire [7:0] Output_iTuple_Item4_L2Tuple_Item1,
	output wire Output_iTuple_Item4_L2Tuple_Item2_L2Flag,
	output wire Output_iTuple_Item4_L2Tuple_Item2_L2Values0,
	output wire Output_iTuple_Item4_L2Tuple_Item2_L2Values1,
	output wire Output_iTuple_Item4_L2Tuple_Item30_L2Flag,
	output wire [2:0] Output_iTuple_Item4_L2Tuple_Item30_L2Values0,
	output wire [2:0] Output_iTuple_Item4_L2Tuple_Item30_L2Values1,
	output wire Output_iTuple_Item4_L2Tuple_Item31_L2Flag,
	output wire [2:0] Output_iTuple_Item4_L2Tuple_Item31_L2Values0,
	output wire [2:0] Output_iTuple_Item4_L2Tuple_Item31_L2Values1,
	output wire Output_iTupleArray0_Item1,
	output wire [3:0] Output_iTupleArray0_Item2,
	output wire Output_iTupleArray0_Item3_L1Flag,
	output wire Output_iTupleArray0_Item3_L2_L2Flag,
	output wire Output_iTupleArray0_Item3_L2_L2Values0,
	output wire Output_iTupleArray0_Item3_L2_L2Values1,
	output wire Output_iTupleArray0_Item3_L2Array0_L2Flag,
	output wire [2:0] Output_iTupleArray0_Item3_L2Array0_L2Values0,
	output wire [2:0] Output_iTupleArray0_Item3_L2Array0_L2Values1,
	output wire Output_iTupleArray0_Item3_L2Array1_L2Flag,
	output wire [2:0] Output_iTupleArray0_Item3_L2Array1_L2Values0,
	output wire [2:0] Output_iTupleArray0_Item3_L2Array1_L2Values1,
	output wire [7:0] Output_iTupleArray0_Item3_L2Tuple_Item1,
	output wire Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag,
	output wire Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values0,
	output wire Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values1,
	output wire Output_iTupleArray0_Item3_L2Tuple_Item30_L2Flag,
	output wire [2:0] Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values0,
	output wire [2:0] Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values1,
	output wire Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag,
	output wire [2:0] Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values0,
	output wire [2:0] Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values1,
	output wire Output_iTupleArray0_Item40_L2Flag,
	output wire Output_iTupleArray0_Item40_L2Values0,
	output wire Output_iTupleArray0_Item40_L2Values1,
	output wire Output_iTupleArray0_Item41_L2Flag,
	output wire Output_iTupleArray0_Item41_L2Values0,
	output wire Output_iTupleArray0_Item41_L2Values1,
	output wire Output_iTupleArray1_Item1,
	output wire [3:0] Output_iTupleArray1_Item2,
	output wire Output_iTupleArray1_Item3_L1Flag,
	output wire Output_iTupleArray1_Item3_L2_L2Flag,
	output wire Output_iTupleArray1_Item3_L2_L2Values0,
	output wire Output_iTupleArray1_Item3_L2_L2Values1,
	output wire Output_iTupleArray1_Item3_L2Array0_L2Flag,
	output wire [2:0] Output_iTupleArray1_Item3_L2Array0_L2Values0,
	output wire [2:0] Output_iTupleArray1_Item3_L2Array0_L2Values1,
	output wire Output_iTupleArray1_Item3_L2Array1_L2Flag,
	output wire [2:0] Output_iTupleArray1_Item3_L2Array1_L2Values0,
	output wire [2:0] Output_iTupleArray1_Item3_L2Array1_L2Values1,
	output wire [7:0] Output_iTupleArray1_Item3_L2Tuple_Item1,
	output wire Output_iTupleArray1_Item3_L2Tuple_Item2_L2Flag,
	output wire Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values0,
	output wire Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values1,
	output wire Output_iTupleArray1_Item3_L2Tuple_Item30_L2Flag,
	output wire [2:0] Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values0,
	output wire [2:0] Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values1,
	output wire Output_iTupleArray1_Item3_L2Tuple_Item31_L2Flag,
	output wire [2:0] Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values0,
	output wire [2:0] Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values1,
	output wire Output_iTupleArray1_Item40_L2Flag,
	output wire Output_iTupleArray1_Item40_L2Values0,
	output wire Output_iTupleArray1_Item40_L2Values1,
	output wire Output_iTupleArray1_Item41_L2Flag,
	output wire Output_iTupleArray1_Item41_L2Values0,
	output wire Output_iTupleArray1_Item41_L2Values1
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
	wire [59: 0] IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple;
	wire [3 : 0] Inputs_iTuple_Item3 [0 : 1];
	wire Inputs_iTuple_Item4_L2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Array [0 : 1];
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Tuple_Item3 [0 : 1];
	wire [53 : 0] Inputs_iTupleArray [0 : 1];
	assign Inputs_iTuple_Item1 = iTuple_Item1;
	assign Inputs_iTuple_Item2 = iTuple_Item2;
	assign Inputs_iTuple_Item3[0] = iTuple_Item30;
	assign Inputs_iTuple_Item3[1] = iTuple_Item31;
	assign Inputs_iTuple_Item4_L1Flag = iTuple_Item4_L1Flag;
	assign Inputs_iTuple_Item4_L2_L2Flag = iTuple_Item4_L2_L2Flag;
	assign Inputs_iTuple_Item4_L2_L2Values[0] = iTuple_Item4_L2_L2Values0;
	assign Inputs_iTuple_Item4_L2_L2Values[1] = iTuple_Item4_L2_L2Values1;
	assign Inputs_iTuple_Item4_L2Array[0][6:4] = iTuple_Item4_L2Array0_L2Values1;
	assign Inputs_iTuple_Item4_L2Array[0][3:1] = iTuple_Item4_L2Array0_L2Values0;
	assign Inputs_iTuple_Item4_L2Array[0][0] = iTuple_Item4_L2Array0_L2Flag;
	assign Inputs_iTuple_Item4_L2Array[1][6:4] = iTuple_Item4_L2Array1_L2Values1;
	assign Inputs_iTuple_Item4_L2Array[1][3:1] = iTuple_Item4_L2Array1_L2Values0;
	assign Inputs_iTuple_Item4_L2Array[1][0] = iTuple_Item4_L2Array1_L2Flag;
	assign Inputs_iTuple_Item4_L2Tuple_Item1 = iTuple_Item4_L2Tuple_Item1;
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag = iTuple_Item4_L2Tuple_Item2_L2Flag;
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[0] = iTuple_Item4_L2Tuple_Item2_L2Values0;
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[1] = iTuple_Item4_L2Tuple_Item2_L2Values1;
	assign Inputs_iTuple_Item4_L2Tuple_Item3[0][6:4] = iTuple_Item4_L2Tuple_Item30_L2Values1;
	assign Inputs_iTuple_Item4_L2Tuple_Item3[0][3:1] = iTuple_Item4_L2Tuple_Item30_L2Values0;
	assign Inputs_iTuple_Item4_L2Tuple_Item3[0][0] = iTuple_Item4_L2Tuple_Item30_L2Flag;
	assign Inputs_iTuple_Item4_L2Tuple_Item3[1][6:4] = iTuple_Item4_L2Tuple_Item31_L2Values1;
	assign Inputs_iTuple_Item4_L2Tuple_Item3[1][3:1] = iTuple_Item4_L2Tuple_Item31_L2Values0;
	assign Inputs_iTuple_Item4_L2Tuple_Item3[1][0] = iTuple_Item4_L2Tuple_Item31_L2Flag;
	assign Inputs_iTupleArray[0][53] = iTupleArray0_Item1;
	assign Inputs_iTupleArray[0][52:49] = iTupleArray0_Item2;
	assign Inputs_iTupleArray[0][48:41] = iTupleArray0_Item3_L2Tuple_Item1;
	assign Inputs_iTupleArray[0][40] = iTupleArray0_Item3_L2Tuple_Item2_L2Values1;
	assign Inputs_iTupleArray[0][39] = iTupleArray0_Item3_L2Tuple_Item2_L2Values0;
	assign Inputs_iTupleArray[0][38] = iTupleArray0_Item3_L2Tuple_Item2_L2Flag;
	assign Inputs_iTupleArray[0][37:35] = iTupleArray0_Item3_L2Tuple_Item31_L2Values1;
	assign Inputs_iTupleArray[0][34:32] = iTupleArray0_Item3_L2Tuple_Item31_L2Values0;
	assign Inputs_iTupleArray[0][31] = iTupleArray0_Item3_L2Tuple_Item31_L2Flag;
	assign Inputs_iTupleArray[0][30:28] = iTupleArray0_Item3_L2Tuple_Item30_L2Values1;
	assign Inputs_iTupleArray[0][27:25] = iTupleArray0_Item3_L2Tuple_Item30_L2Values0;
	assign Inputs_iTupleArray[0][24] = iTupleArray0_Item3_L2Tuple_Item30_L2Flag;
	assign Inputs_iTupleArray[0][23:21] = iTupleArray0_Item3_L2Array1_L2Values1;
	assign Inputs_iTupleArray[0][20:18] = iTupleArray0_Item3_L2Array1_L2Values0;
	assign Inputs_iTupleArray[0][17] = iTupleArray0_Item3_L2Array1_L2Flag;
	assign Inputs_iTupleArray[0][16:14] = iTupleArray0_Item3_L2Array0_L2Values1;
	assign Inputs_iTupleArray[0][13:11] = iTupleArray0_Item3_L2Array0_L2Values0;
	assign Inputs_iTupleArray[0][10] = iTupleArray0_Item3_L2Array0_L2Flag;
	assign Inputs_iTupleArray[0][9] = iTupleArray0_Item3_L2_L2Values1;
	assign Inputs_iTupleArray[0][8] = iTupleArray0_Item3_L2_L2Values0;
	assign Inputs_iTupleArray[0][7] = iTupleArray0_Item3_L2_L2Flag;
	assign Inputs_iTupleArray[0][6] = iTupleArray0_Item3_L1Flag;
	assign Inputs_iTupleArray[0][5] = iTupleArray0_Item41_L2Values1;
	assign Inputs_iTupleArray[0][4] = iTupleArray0_Item41_L2Values0;
	assign Inputs_iTupleArray[0][3] = iTupleArray0_Item41_L2Flag;
	assign Inputs_iTupleArray[0][2] = iTupleArray0_Item40_L2Values1;
	assign Inputs_iTupleArray[0][1] = iTupleArray0_Item40_L2Values0;
	assign Inputs_iTupleArray[0][0] = iTupleArray0_Item40_L2Flag;
	assign Inputs_iTupleArray[1][53] = iTupleArray1_Item1;
	assign Inputs_iTupleArray[1][52:49] = iTupleArray1_Item2;
	assign Inputs_iTupleArray[1][48:41] = iTupleArray1_Item3_L2Tuple_Item1;
	assign Inputs_iTupleArray[1][40] = iTupleArray1_Item3_L2Tuple_Item2_L2Values1;
	assign Inputs_iTupleArray[1][39] = iTupleArray1_Item3_L2Tuple_Item2_L2Values0;
	assign Inputs_iTupleArray[1][38] = iTupleArray1_Item3_L2Tuple_Item2_L2Flag;
	assign Inputs_iTupleArray[1][37:35] = iTupleArray1_Item3_L2Tuple_Item31_L2Values1;
	assign Inputs_iTupleArray[1][34:32] = iTupleArray1_Item3_L2Tuple_Item31_L2Values0;
	assign Inputs_iTupleArray[1][31] = iTupleArray1_Item3_L2Tuple_Item31_L2Flag;
	assign Inputs_iTupleArray[1][30:28] = iTupleArray1_Item3_L2Tuple_Item30_L2Values1;
	assign Inputs_iTupleArray[1][27:25] = iTupleArray1_Item3_L2Tuple_Item30_L2Values0;
	assign Inputs_iTupleArray[1][24] = iTupleArray1_Item3_L2Tuple_Item30_L2Flag;
	assign Inputs_iTupleArray[1][23:21] = iTupleArray1_Item3_L2Array1_L2Values1;
	assign Inputs_iTupleArray[1][20:18] = iTupleArray1_Item3_L2Array1_L2Values0;
	assign Inputs_iTupleArray[1][17] = iTupleArray1_Item3_L2Array1_L2Flag;
	assign Inputs_iTupleArray[1][16:14] = iTupleArray1_Item3_L2Array0_L2Values1;
	assign Inputs_iTupleArray[1][13:11] = iTupleArray1_Item3_L2Array0_L2Values0;
	assign Inputs_iTupleArray[1][10] = iTupleArray1_Item3_L2Array0_L2Flag;
	assign Inputs_iTupleArray[1][9] = iTupleArray1_Item3_L2_L2Values1;
	assign Inputs_iTupleArray[1][8] = iTupleArray1_Item3_L2_L2Values0;
	assign Inputs_iTupleArray[1][7] = iTupleArray1_Item3_L2_L2Flag;
	assign Inputs_iTupleArray[1][6] = iTupleArray1_Item3_L1Flag;
	assign Inputs_iTupleArray[1][5] = iTupleArray1_Item41_L2Values1;
	assign Inputs_iTupleArray[1][4] = iTupleArray1_Item41_L2Values0;
	assign Inputs_iTupleArray[1][3] = iTupleArray1_Item41_L2Flag;
	assign Inputs_iTupleArray[1][2] = iTupleArray1_Item40_L2Values1;
	assign Inputs_iTupleArray[1][1] = iTupleArray1_Item40_L2Values0;
	assign Inputs_iTupleArray[1][0] = iTupleArray1_Item40_L2Flag;
	assign IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple = { Inputs_iTuple_Item1, Inputs_iTuple_Item2, Inputs_iTuple_Item3[1], Inputs_iTuple_Item3[0], Inputs_iTuple_Item4_L2Tuple_Item1, Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[1], Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[0], Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag, Inputs_iTuple_Item4_L2Tuple_Item3[1], Inputs_iTuple_Item4_L2Tuple_Item3[0], Inputs_iTuple_Item4_L2Array[1], Inputs_iTuple_Item4_L2Array[0], Inputs_iTuple_Item4_L2_L2Values[1], Inputs_iTuple_Item4_L2_L2Values[0], Inputs_iTuple_Item4_L2_L2Flag, Inputs_iTuple_Item4_L1Flag };
	assign Output_iTuple_Item1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[59];
	assign Output_iTuple_Item2 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[58:51];
	assign Output_iTuple_Item31 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[50:47];
	assign Output_iTuple_Item30 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[46:43];
	assign Output_iTuple_Item4_L2Tuple_Item1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[42:35];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Values1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[34];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Values0 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[33];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[32];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Values1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[31:29];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Values0 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[28:26];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[25];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Values1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[24:22];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Values0 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[21:19];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[18];
	assign Output_iTuple_Item4_L2Array1_L2Values1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[17:15];
	assign Output_iTuple_Item4_L2Array1_L2Values0 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[14:12];
	assign Output_iTuple_Item4_L2Array1_L2Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[11];
	assign Output_iTuple_Item4_L2Array0_L2Values1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[10:8];
	assign Output_iTuple_Item4_L2Array0_L2Values0 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[7:5];
	assign Output_iTuple_Item4_L2Array0_L2Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[4];
	assign Output_iTuple_Item4_L2_L2Values1 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[3];
	assign Output_iTuple_Item4_L2_L2Values0 = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[2];
	assign Output_iTuple_Item4_L2_L2Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[1];
	assign Output_iTuple_Item4_L1Flag = IOTupleDirectInputComponentsOutputModule_L9F30T43_Tuple[0];
	assign Output_iTupleArray0_Item1 = Inputs_iTupleArray[0][53];
	assign Output_iTupleArray0_Item2 = Inputs_iTupleArray[0][52:49];
	assign Output_iTupleArray0_Item3_L2Tuple_Item1 = Inputs_iTupleArray[0][48:41];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values1 = Inputs_iTupleArray[0][40];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values0 = Inputs_iTupleArray[0][39];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag = Inputs_iTupleArray[0][38];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values1 = Inputs_iTupleArray[0][37:35];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values0 = Inputs_iTupleArray[0][34:32];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag = Inputs_iTupleArray[0][31];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values1 = Inputs_iTupleArray[0][30:28];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values0 = Inputs_iTupleArray[0][27:25];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Flag = Inputs_iTupleArray[0][24];
	assign Output_iTupleArray0_Item3_L2Array1_L2Values1 = Inputs_iTupleArray[0][23:21];
	assign Output_iTupleArray0_Item3_L2Array1_L2Values0 = Inputs_iTupleArray[0][20:18];
	assign Output_iTupleArray0_Item3_L2Array1_L2Flag = Inputs_iTupleArray[0][17];
	assign Output_iTupleArray0_Item3_L2Array0_L2Values1 = Inputs_iTupleArray[0][16:14];
	assign Output_iTupleArray0_Item3_L2Array0_L2Values0 = Inputs_iTupleArray[0][13:11];
	assign Output_iTupleArray0_Item3_L2Array0_L2Flag = Inputs_iTupleArray[0][10];
	assign Output_iTupleArray0_Item3_L2_L2Values1 = Inputs_iTupleArray[0][9];
	assign Output_iTupleArray0_Item3_L2_L2Values0 = Inputs_iTupleArray[0][8];
	assign Output_iTupleArray0_Item3_L2_L2Flag = Inputs_iTupleArray[0][7];
	assign Output_iTupleArray0_Item3_L1Flag = Inputs_iTupleArray[0][6];
	assign Output_iTupleArray0_Item41_L2Values1 = Inputs_iTupleArray[0][5];
	assign Output_iTupleArray0_Item41_L2Values0 = Inputs_iTupleArray[0][4];
	assign Output_iTupleArray0_Item41_L2Flag = Inputs_iTupleArray[0][3];
	assign Output_iTupleArray0_Item40_L2Values1 = Inputs_iTupleArray[0][2];
	assign Output_iTupleArray0_Item40_L2Values0 = Inputs_iTupleArray[0][1];
	assign Output_iTupleArray0_Item40_L2Flag = Inputs_iTupleArray[0][0];
	assign Output_iTupleArray1_Item1 = Inputs_iTupleArray[1][53];
	assign Output_iTupleArray1_Item2 = Inputs_iTupleArray[1][52:49];
	assign Output_iTupleArray1_Item3_L2Tuple_Item1 = Inputs_iTupleArray[1][48:41];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values1 = Inputs_iTupleArray[1][40];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values0 = Inputs_iTupleArray[1][39];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Flag = Inputs_iTupleArray[1][38];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values1 = Inputs_iTupleArray[1][37:35];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values0 = Inputs_iTupleArray[1][34:32];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Flag = Inputs_iTupleArray[1][31];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values1 = Inputs_iTupleArray[1][30:28];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values0 = Inputs_iTupleArray[1][27:25];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Flag = Inputs_iTupleArray[1][24];
	assign Output_iTupleArray1_Item3_L2Array1_L2Values1 = Inputs_iTupleArray[1][23:21];
	assign Output_iTupleArray1_Item3_L2Array1_L2Values0 = Inputs_iTupleArray[1][20:18];
	assign Output_iTupleArray1_Item3_L2Array1_L2Flag = Inputs_iTupleArray[1][17];
	assign Output_iTupleArray1_Item3_L2Array0_L2Values1 = Inputs_iTupleArray[1][16:14];
	assign Output_iTupleArray1_Item3_L2Array0_L2Values0 = Inputs_iTupleArray[1][13:11];
	assign Output_iTupleArray1_Item3_L2Array0_L2Flag = Inputs_iTupleArray[1][10];
	assign Output_iTupleArray1_Item3_L2_L2Values1 = Inputs_iTupleArray[1][9];
	assign Output_iTupleArray1_Item3_L2_L2Values0 = Inputs_iTupleArray[1][8];
	assign Output_iTupleArray1_Item3_L2_L2Flag = Inputs_iTupleArray[1][7];
	assign Output_iTupleArray1_Item3_L1Flag = Inputs_iTupleArray[1][6];
	assign Output_iTupleArray1_Item41_L2Values1 = Inputs_iTupleArray[1][5];
	assign Output_iTupleArray1_Item41_L2Values0 = Inputs_iTupleArray[1][4];
	assign Output_iTupleArray1_Item41_L2Flag = Inputs_iTupleArray[1][3];
	assign Output_iTupleArray1_Item40_L2Values1 = Inputs_iTupleArray[1][2];
	assign Output_iTupleArray1_Item40_L2Values0 = Inputs_iTupleArray[1][1];
	assign Output_iTupleArray1_Item40_L2Flag = Inputs_iTupleArray[1][0];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
