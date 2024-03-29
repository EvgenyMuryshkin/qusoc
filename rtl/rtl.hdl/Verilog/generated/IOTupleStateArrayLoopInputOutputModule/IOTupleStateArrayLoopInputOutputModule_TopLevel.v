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
// System configuration name is IOTupleStateArrayLoopInputOutputModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module IOTupleStateArrayLoopInputOutputModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
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
	wire [167: 0] State_ValueDefault = 168'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
	wire Inputs_iTuple_Item1;
	wire [7: 0] Inputs_iTuple_Item2;
	wire Inputs_iTuple_Item4_L1Flag;
	wire Inputs_iTuple_Item4_L2_L2Flag;
	wire [7: 0] Inputs_iTuple_Item4_L2Tuple_Item1;
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
	integer idx;
	wire [3 : 0] Inputs_iTuple_Item3 [0 : 1];
	wire Inputs_iTuple_Item4_L2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Array [0 : 1];
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Tuple_Item3 [0 : 1];
	wire [53 : 0] Inputs_iTupleArray [0 : 1];
	integer State_Value_Iterator;
	reg [167 : 0] State_Value [0 : 3];
	initial
	begin : Init_State_Value
$readmemh("IOTupleStateArrayLoopInputOutputModule_TopLevel_State_Value.hex", State_Value);
	end
	integer NextState_Value_Iterator;
	reg [167 : 0] NextState_Value [0 : 3];
	initial
	begin : Init_NextState_Value
		for (NextState_Value_Iterator = 0; NextState_Value_Iterator < 4; NextState_Value_Iterator = NextState_Value_Iterator + 1)
			NextState_Value[NextState_Value_Iterator] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
		end
		else
		begin
			for (State_Value_Iterator = 0; (State_Value_Iterator < 4); State_Value_Iterator = (State_Value_Iterator + 1))
			begin
				State_Value[State_Value_Iterator] <= NextState_Value[State_Value_Iterator];
			end
		end
	end
	always @ (*)
	begin
		NextState_Value_Iterator = 0;
		idx = 0;
		for (NextState_Value_Iterator = 0; (NextState_Value_Iterator < 4); NextState_Value_Iterator = (NextState_Value_Iterator + 1))
		begin
			NextState_Value[NextState_Value_Iterator] = State_Value[NextState_Value_Iterator];
		end
		NextState_Value[0] = {
			Inputs_iTupleArray[1],
			Inputs_iTupleArray[0],
			Inputs_iTuple_Item1,
			Inputs_iTuple_Item2,
			Inputs_iTuple_Item3[1],
			Inputs_iTuple_Item3[0],
			Inputs_iTuple_Item4_L2Tuple_Item1,
			Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[1],
			Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[0],
			Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag,
			Inputs_iTuple_Item4_L2Tuple_Item3[1],
			Inputs_iTuple_Item4_L2Tuple_Item3[0],
			Inputs_iTuple_Item4_L2Array[1],
			Inputs_iTuple_Item4_L2Array[0],
			Inputs_iTuple_Item4_L2_L2Values[1],
			Inputs_iTuple_Item4_L2_L2Values[0],
			Inputs_iTuple_Item4_L2_L2Flag,
			Inputs_iTuple_Item4_L1Flag
		}
		;
		for (idx = 0; (idx < 3); idx = (idx + 1))
		begin
			NextState_Value[(idx + 1)] = State_Value[idx];
		end
	end
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
	assign Output_iTupleArray1_Item1 = State_Value[3][167];
	assign Output_iTupleArray1_Item2 = State_Value[3][166:163];
	assign Output_iTupleArray1_Item3_L2Tuple_Item1 = State_Value[3][162:155];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values1 = State_Value[3][154];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values0 = State_Value[3][153];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Flag = State_Value[3][152];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values1 = State_Value[3][151:149];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values0 = State_Value[3][148:146];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Flag = State_Value[3][145];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values1 = State_Value[3][144:142];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values0 = State_Value[3][141:139];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Flag = State_Value[3][138];
	assign Output_iTupleArray1_Item3_L2Array1_L2Values1 = State_Value[3][137:135];
	assign Output_iTupleArray1_Item3_L2Array1_L2Values0 = State_Value[3][134:132];
	assign Output_iTupleArray1_Item3_L2Array1_L2Flag = State_Value[3][131];
	assign Output_iTupleArray1_Item3_L2Array0_L2Values1 = State_Value[3][130:128];
	assign Output_iTupleArray1_Item3_L2Array0_L2Values0 = State_Value[3][127:125];
	assign Output_iTupleArray1_Item3_L2Array0_L2Flag = State_Value[3][124];
	assign Output_iTupleArray1_Item3_L2_L2Values1 = State_Value[3][123];
	assign Output_iTupleArray1_Item3_L2_L2Values0 = State_Value[3][122];
	assign Output_iTupleArray1_Item3_L2_L2Flag = State_Value[3][121];
	assign Output_iTupleArray1_Item3_L1Flag = State_Value[3][120];
	assign Output_iTupleArray1_Item41_L2Values1 = State_Value[3][119];
	assign Output_iTupleArray1_Item41_L2Values0 = State_Value[3][118];
	assign Output_iTupleArray1_Item41_L2Flag = State_Value[3][117];
	assign Output_iTupleArray1_Item40_L2Values1 = State_Value[3][116];
	assign Output_iTupleArray1_Item40_L2Values0 = State_Value[3][115];
	assign Output_iTupleArray1_Item40_L2Flag = State_Value[3][114];
	assign Output_iTupleArray0_Item1 = State_Value[3][113];
	assign Output_iTupleArray0_Item2 = State_Value[3][112:109];
	assign Output_iTupleArray0_Item3_L2Tuple_Item1 = State_Value[3][108:101];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values1 = State_Value[3][100];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values0 = State_Value[3][99];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag = State_Value[3][98];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values1 = State_Value[3][97:95];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values0 = State_Value[3][94:92];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag = State_Value[3][91];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values1 = State_Value[3][90:88];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values0 = State_Value[3][87:85];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Flag = State_Value[3][84];
	assign Output_iTupleArray0_Item3_L2Array1_L2Values1 = State_Value[3][83:81];
	assign Output_iTupleArray0_Item3_L2Array1_L2Values0 = State_Value[3][80:78];
	assign Output_iTupleArray0_Item3_L2Array1_L2Flag = State_Value[3][77];
	assign Output_iTupleArray0_Item3_L2Array0_L2Values1 = State_Value[3][76:74];
	assign Output_iTupleArray0_Item3_L2Array0_L2Values0 = State_Value[3][73:71];
	assign Output_iTupleArray0_Item3_L2Array0_L2Flag = State_Value[3][70];
	assign Output_iTupleArray0_Item3_L2_L2Values1 = State_Value[3][69];
	assign Output_iTupleArray0_Item3_L2_L2Values0 = State_Value[3][68];
	assign Output_iTupleArray0_Item3_L2_L2Flag = State_Value[3][67];
	assign Output_iTupleArray0_Item3_L1Flag = State_Value[3][66];
	assign Output_iTupleArray0_Item41_L2Values1 = State_Value[3][65];
	assign Output_iTupleArray0_Item41_L2Values0 = State_Value[3][64];
	assign Output_iTupleArray0_Item41_L2Flag = State_Value[3][63];
	assign Output_iTupleArray0_Item40_L2Values1 = State_Value[3][62];
	assign Output_iTupleArray0_Item40_L2Values0 = State_Value[3][61];
	assign Output_iTupleArray0_Item40_L2Flag = State_Value[3][60];
	assign Output_iTuple_Item1 = State_Value[3][59];
	assign Output_iTuple_Item2 = State_Value[3][58:51];
	assign Output_iTuple_Item31 = State_Value[3][50:47];
	assign Output_iTuple_Item30 = State_Value[3][46:43];
	assign Output_iTuple_Item4_L2Tuple_Item1 = State_Value[3][42:35];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Values1 = State_Value[3][34];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Values0 = State_Value[3][33];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Flag = State_Value[3][32];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Values1 = State_Value[3][31:29];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Values0 = State_Value[3][28:26];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Flag = State_Value[3][25];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Values1 = State_Value[3][24:22];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Values0 = State_Value[3][21:19];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Flag = State_Value[3][18];
	assign Output_iTuple_Item4_L2Array1_L2Values1 = State_Value[3][17:15];
	assign Output_iTuple_Item4_L2Array1_L2Values0 = State_Value[3][14:12];
	assign Output_iTuple_Item4_L2Array1_L2Flag = State_Value[3][11];
	assign Output_iTuple_Item4_L2Array0_L2Values1 = State_Value[3][10:8];
	assign Output_iTuple_Item4_L2Array0_L2Values0 = State_Value[3][7:5];
	assign Output_iTuple_Item4_L2Array0_L2Flag = State_Value[3][4];
	assign Output_iTuple_Item4_L2_L2Values1 = State_Value[3][3];
	assign Output_iTuple_Item4_L2_L2Values0 = State_Value[3][2];
	assign Output_iTuple_Item4_L2_L2Flag = State_Value[3][1];
	assign Output_iTuple_Item4_L1Flag = State_Value[3][0];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
