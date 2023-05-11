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
// System configuration name is IOTupleStateInputL7ComponentsOutputModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module IOTupleStateInputL7ComponentsOutputModule_TopLevel
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
	wire [3: 0] State_Value_iTuple_Item3Default = 4'b0000;
	wire State_Value_iTuple_Item4_L2_L2ValuesDefault = 1'b0;
	wire [6: 0] State_Value_iTuple_Item4_L2ArrayDefault = 7'b0000000;
	wire State_Value_iTuple_Item4_L2Tuple_Item2_L2ValuesDefault = 1'b0;
	wire [6: 0] State_Value_iTuple_Item4_L2Tuple_Item3Default = 7'b0000000;
	wire [53: 0] State_Value_iTupleArrayDefault = 54'b000000000000000000000000000000000000000000000000000000;
	wire Inputs_iTuple_Item1;
	wire [7: 0] Inputs_iTuple_Item2;
	wire Inputs_iTuple_Item4_L1Flag;
	wire Inputs_iTuple_Item4_L2_L2Flag;
	wire [7: 0] Inputs_iTuple_Item4_L2Tuple_Item1;
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
	reg NextState_Value_iTuple_Item1;
	reg [7: 0] NextState_Value_iTuple_Item2;
	reg NextState_Value_iTuple_Item4_L1Flag;
	reg NextState_Value_iTuple_Item4_L2_L2Flag;
	reg [7: 0] NextState_Value_iTuple_Item4_L2Tuple_Item1;
	reg NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Flag;
	reg State_Value_iTuple_Item1 = 1'b0;
	wire State_Value_iTuple_Item1Default = 1'b0;
	reg [7: 0] State_Value_iTuple_Item2 = 8'b00000000;
	wire [7: 0] State_Value_iTuple_Item2Default = 8'b00000000;
	reg State_Value_iTuple_Item4_L1Flag = 1'b0;
	wire State_Value_iTuple_Item4_L1FlagDefault = 1'b0;
	reg State_Value_iTuple_Item4_L2_L2Flag = 1'b0;
	wire State_Value_iTuple_Item4_L2_L2FlagDefault = 1'b0;
	reg [7: 0] State_Value_iTuple_Item4_L2Tuple_Item1 = 8'b00000000;
	wire [7: 0] State_Value_iTuple_Item4_L2Tuple_Item1Default = 8'b00101010;
	reg State_Value_iTuple_Item4_L2Tuple_Item2_L2Flag = 1'b0;
	wire State_Value_iTuple_Item4_L2Tuple_Item2_L2FlagDefault = 1'b0;
	wire [3 : 0] Inputs_iTuple_Item3 [0 : 1];
	wire Inputs_iTuple_Item4_L2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Array [0 : 1];
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Values [0 : 1];
	wire [6 : 0] Inputs_iTuple_Item4_L2Tuple_Item3 [0 : 1];
	wire [53 : 0] Inputs_iTupleArray [0 : 1];
	integer State_Value_iTuple_Item3_Iterator;
	reg [3 : 0] State_Value_iTuple_Item3 [0 : 1];
	initial
	begin : Init_State_Value_iTuple_Item3
		for (State_Value_iTuple_Item3_Iterator = 0; State_Value_iTuple_Item3_Iterator < 2; State_Value_iTuple_Item3_Iterator = State_Value_iTuple_Item3_Iterator + 1)
			State_Value_iTuple_Item3[State_Value_iTuple_Item3_Iterator] = 0;
	end
	integer NextState_Value_iTuple_Item3_Iterator;
	reg [3 : 0] NextState_Value_iTuple_Item3 [0 : 1];
	initial
	begin : Init_NextState_Value_iTuple_Item3
		for (NextState_Value_iTuple_Item3_Iterator = 0; NextState_Value_iTuple_Item3_Iterator < 2; NextState_Value_iTuple_Item3_Iterator = NextState_Value_iTuple_Item3_Iterator + 1)
			NextState_Value_iTuple_Item3[NextState_Value_iTuple_Item3_Iterator] = 0;
	end
	integer State_Value_iTuple_Item4_L2_L2Values_Iterator;
	reg State_Value_iTuple_Item4_L2_L2Values [0 : 1];
	initial
	begin : Init_State_Value_iTuple_Item4_L2_L2Values
$readmemh("IOTupleStateInputL7ComponentsOutputModule_TopLevel_State_Value_iTuple_Item4_L2_L2Values.hex", State_Value_iTuple_Item4_L2_L2Values);
	end
	integer NextState_Value_iTuple_Item4_L2_L2Values_Iterator;
	reg NextState_Value_iTuple_Item4_L2_L2Values [0 : 1];
	initial
	begin : Init_NextState_Value_iTuple_Item4_L2_L2Values
		for (NextState_Value_iTuple_Item4_L2_L2Values_Iterator = 0; NextState_Value_iTuple_Item4_L2_L2Values_Iterator < 2; NextState_Value_iTuple_Item4_L2_L2Values_Iterator = NextState_Value_iTuple_Item4_L2_L2Values_Iterator + 1)
			NextState_Value_iTuple_Item4_L2_L2Values[NextState_Value_iTuple_Item4_L2_L2Values_Iterator] = 0;
	end
	integer State_Value_iTuple_Item4_L2Array_Iterator;
	reg [6 : 0] State_Value_iTuple_Item4_L2Array [0 : 1];
	initial
	begin : Init_State_Value_iTuple_Item4_L2Array
		for (State_Value_iTuple_Item4_L2Array_Iterator = 0; State_Value_iTuple_Item4_L2Array_Iterator < 2; State_Value_iTuple_Item4_L2Array_Iterator = State_Value_iTuple_Item4_L2Array_Iterator + 1)
			State_Value_iTuple_Item4_L2Array[State_Value_iTuple_Item4_L2Array_Iterator] = 0;
	end
	integer NextState_Value_iTuple_Item4_L2Array_Iterator;
	reg [6 : 0] NextState_Value_iTuple_Item4_L2Array [0 : 1];
	initial
	begin : Init_NextState_Value_iTuple_Item4_L2Array
		for (NextState_Value_iTuple_Item4_L2Array_Iterator = 0; NextState_Value_iTuple_Item4_L2Array_Iterator < 2; NextState_Value_iTuple_Item4_L2Array_Iterator = NextState_Value_iTuple_Item4_L2Array_Iterator + 1)
			NextState_Value_iTuple_Item4_L2Array[NextState_Value_iTuple_Item4_L2Array_Iterator] = 0;
	end
	integer State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator;
	reg State_Value_iTuple_Item4_L2Tuple_Item2_L2Values [0 : 1];
	initial
	begin : Init_State_Value_iTuple_Item4_L2Tuple_Item2_L2Values
$readmemh("IOTupleStateInputL7ComponentsOutputModule_TopLevel_State_Value_iTuple_Item4_L2Tuple_Item2_L2Values.hex", State_Value_iTuple_Item4_L2Tuple_Item2_L2Values);
	end
	integer NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator;
	reg NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values [0 : 1];
	initial
	begin : Init_NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values
		for (NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = 0; NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator < 2; NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator + 1)
			NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values[NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator] = 0;
	end
	integer State_Value_iTuple_Item4_L2Tuple_Item3_Iterator;
	reg [6 : 0] State_Value_iTuple_Item4_L2Tuple_Item3 [0 : 1];
	initial
	begin : Init_State_Value_iTuple_Item4_L2Tuple_Item3
		for (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator = 0; State_Value_iTuple_Item4_L2Tuple_Item3_Iterator < 2; State_Value_iTuple_Item4_L2Tuple_Item3_Iterator = State_Value_iTuple_Item4_L2Tuple_Item3_Iterator + 1)
			State_Value_iTuple_Item4_L2Tuple_Item3[State_Value_iTuple_Item4_L2Tuple_Item3_Iterator] = 0;
	end
	integer NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator;
	reg [6 : 0] NextState_Value_iTuple_Item4_L2Tuple_Item3 [0 : 1];
	initial
	begin : Init_NextState_Value_iTuple_Item4_L2Tuple_Item3
		for (NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator = 0; NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator < 2; NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator = NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator + 1)
			NextState_Value_iTuple_Item4_L2Tuple_Item3[NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator] = 0;
	end
	integer State_Value_iTupleArray_Iterator;
	reg [53 : 0] State_Value_iTupleArray [0 : 1];
	initial
	begin : Init_State_Value_iTupleArray
$readmemh("IOTupleStateInputL7ComponentsOutputModule_TopLevel_State_Value_iTupleArray.hex", State_Value_iTupleArray);
	end
	integer NextState_Value_iTupleArray_Iterator;
	reg [53 : 0] NextState_Value_iTupleArray [0 : 1];
	initial
	begin : Init_NextState_Value_iTupleArray
		for (NextState_Value_iTupleArray_Iterator = 0; NextState_Value_iTupleArray_Iterator < 2; NextState_Value_iTupleArray_Iterator = NextState_Value_iTupleArray_Iterator + 1)
			NextState_Value_iTupleArray[NextState_Value_iTupleArray_Iterator] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_Value_iTuple_Item1 <= State_Value_iTuple_Item1Default;
			State_Value_iTuple_Item2 <= State_Value_iTuple_Item2Default;
			State_Value_iTuple_Item4_L1Flag <= State_Value_iTuple_Item4_L1FlagDefault;
			State_Value_iTuple_Item4_L2_L2Flag <= State_Value_iTuple_Item4_L2_L2FlagDefault;
			State_Value_iTuple_Item4_L2Tuple_Item1 <= State_Value_iTuple_Item4_L2Tuple_Item1Default;
			State_Value_iTuple_Item4_L2Tuple_Item2_L2Flag <= State_Value_iTuple_Item4_L2Tuple_Item2_L2FlagDefault;
		end
		else
		begin
			State_Value_iTuple_Item1 <= NextState_Value_iTuple_Item1;
			State_Value_iTuple_Item2 <= NextState_Value_iTuple_Item2;
			State_Value_iTuple_Item4_L1Flag <= NextState_Value_iTuple_Item4_L1Flag;
			State_Value_iTuple_Item4_L2_L2Flag <= NextState_Value_iTuple_Item4_L2_L2Flag;
			State_Value_iTuple_Item4_L2Tuple_Item1 <= NextState_Value_iTuple_Item4_L2Tuple_Item1;
			State_Value_iTuple_Item4_L2Tuple_Item2_L2Flag <= NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Flag;
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Value_iTuple_Item3_Iterator = 0; (State_Value_iTuple_Item3_Iterator < 2); State_Value_iTuple_Item3_Iterator = (State_Value_iTuple_Item3_Iterator + 1))
			begin
				State_Value_iTuple_Item3[State_Value_iTuple_Item3_Iterator] <= State_Value_iTuple_Item3Default;
			end
		end
		else
		begin
			for (State_Value_iTuple_Item3_Iterator = 0; (State_Value_iTuple_Item3_Iterator < 2); State_Value_iTuple_Item3_Iterator = (State_Value_iTuple_Item3_Iterator + 1))
			begin
				State_Value_iTuple_Item3[State_Value_iTuple_Item3_Iterator] <= NextState_Value_iTuple_Item3[State_Value_iTuple_Item3_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
		end
		else
		begin
			for (State_Value_iTuple_Item4_L2_L2Values_Iterator = 0; (State_Value_iTuple_Item4_L2_L2Values_Iterator < 2); State_Value_iTuple_Item4_L2_L2Values_Iterator = (State_Value_iTuple_Item4_L2_L2Values_Iterator + 1))
			begin
				State_Value_iTuple_Item4_L2_L2Values[State_Value_iTuple_Item4_L2_L2Values_Iterator] <= NextState_Value_iTuple_Item4_L2_L2Values[State_Value_iTuple_Item4_L2_L2Values_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Value_iTuple_Item4_L2Array_Iterator = 0; (State_Value_iTuple_Item4_L2Array_Iterator < 2); State_Value_iTuple_Item4_L2Array_Iterator = (State_Value_iTuple_Item4_L2Array_Iterator + 1))
			begin
				State_Value_iTuple_Item4_L2Array[State_Value_iTuple_Item4_L2Array_Iterator] <= State_Value_iTuple_Item4_L2ArrayDefault;
			end
		end
		else
		begin
			for (State_Value_iTuple_Item4_L2Array_Iterator = 0; (State_Value_iTuple_Item4_L2Array_Iterator < 2); State_Value_iTuple_Item4_L2Array_Iterator = (State_Value_iTuple_Item4_L2Array_Iterator + 1))
			begin
				State_Value_iTuple_Item4_L2Array[State_Value_iTuple_Item4_L2Array_Iterator] <= NextState_Value_iTuple_Item4_L2Array[State_Value_iTuple_Item4_L2Array_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
		end
		else
		begin
			for (State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = 0; (State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator < 2); State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = (State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator + 1))
			begin
				State_Value_iTuple_Item4_L2Tuple_Item2_L2Values[State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator] <= NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values[State_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator = 0; (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator < 2); State_Value_iTuple_Item4_L2Tuple_Item3_Iterator = (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator + 1))
			begin
				State_Value_iTuple_Item4_L2Tuple_Item3[State_Value_iTuple_Item4_L2Tuple_Item3_Iterator] <= State_Value_iTuple_Item4_L2Tuple_Item3Default;
			end
		end
		else
		begin
			for (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator = 0; (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator < 2); State_Value_iTuple_Item4_L2Tuple_Item3_Iterator = (State_Value_iTuple_Item4_L2Tuple_Item3_Iterator + 1))
			begin
				State_Value_iTuple_Item4_L2Tuple_Item3[State_Value_iTuple_Item4_L2Tuple_Item3_Iterator] <= NextState_Value_iTuple_Item4_L2Tuple_Item3[State_Value_iTuple_Item4_L2Tuple_Item3_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
		end
		else
		begin
			for (State_Value_iTupleArray_Iterator = 0; (State_Value_iTupleArray_Iterator < 2); State_Value_iTupleArray_Iterator = (State_Value_iTupleArray_Iterator + 1))
			begin
				State_Value_iTupleArray[State_Value_iTupleArray_Iterator] <= NextState_Value_iTupleArray[State_Value_iTupleArray_Iterator];
			end
		end
	end
	always @ (*)
	begin
		NextState_Value_iTuple_Item3_Iterator = 0;
		NextState_Value_iTuple_Item4_L2_L2Values_Iterator = 0;
		NextState_Value_iTuple_Item4_L2Array_Iterator = 0;
		NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = 0;
		NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator = 0;
		NextState_Value_iTupleArray_Iterator = 0;
		for (NextState_Value_iTuple_Item3_Iterator = 0; (NextState_Value_iTuple_Item3_Iterator < 2); NextState_Value_iTuple_Item3_Iterator = (NextState_Value_iTuple_Item3_Iterator + 1))
		begin
			NextState_Value_iTuple_Item3[NextState_Value_iTuple_Item3_Iterator] = State_Value_iTuple_Item3[NextState_Value_iTuple_Item3_Iterator];
		end
		for (NextState_Value_iTuple_Item4_L2_L2Values_Iterator = 0; (NextState_Value_iTuple_Item4_L2_L2Values_Iterator < 2); NextState_Value_iTuple_Item4_L2_L2Values_Iterator = (NextState_Value_iTuple_Item4_L2_L2Values_Iterator + 1))
		begin
			NextState_Value_iTuple_Item4_L2_L2Values[NextState_Value_iTuple_Item4_L2_L2Values_Iterator] = State_Value_iTuple_Item4_L2_L2Values[NextState_Value_iTuple_Item4_L2_L2Values_Iterator];
		end
		for (NextState_Value_iTuple_Item4_L2Array_Iterator = 0; (NextState_Value_iTuple_Item4_L2Array_Iterator < 2); NextState_Value_iTuple_Item4_L2Array_Iterator = (NextState_Value_iTuple_Item4_L2Array_Iterator + 1))
		begin
			NextState_Value_iTuple_Item4_L2Array[NextState_Value_iTuple_Item4_L2Array_Iterator] = State_Value_iTuple_Item4_L2Array[NextState_Value_iTuple_Item4_L2Array_Iterator];
		end
		for (NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = 0; (NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator < 2); NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator = (NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator + 1))
		begin
			NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values[NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator] = State_Value_iTuple_Item4_L2Tuple_Item2_L2Values[NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values_Iterator];
		end
		for (NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator = 0; (NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator < 2); NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator = (NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator + 1))
		begin
			NextState_Value_iTuple_Item4_L2Tuple_Item3[NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator] = State_Value_iTuple_Item4_L2Tuple_Item3[NextState_Value_iTuple_Item4_L2Tuple_Item3_Iterator];
		end
		for (NextState_Value_iTupleArray_Iterator = 0; (NextState_Value_iTupleArray_Iterator < 2); NextState_Value_iTupleArray_Iterator = (NextState_Value_iTupleArray_Iterator + 1))
		begin
			NextState_Value_iTupleArray[NextState_Value_iTupleArray_Iterator] = State_Value_iTupleArray[NextState_Value_iTupleArray_Iterator];
		end
		NextState_Value_iTuple_Item1 = State_Value_iTuple_Item1;
		NextState_Value_iTuple_Item2 = State_Value_iTuple_Item2;
		NextState_Value_iTuple_Item4_L1Flag = State_Value_iTuple_Item4_L1Flag;
		NextState_Value_iTuple_Item4_L2_L2Flag = State_Value_iTuple_Item4_L2_L2Flag;
		NextState_Value_iTuple_Item4_L2Tuple_Item1 = State_Value_iTuple_Item4_L2Tuple_Item1;
		NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Flag = State_Value_iTuple_Item4_L2Tuple_Item2_L2Flag;
		NextState_Value_iTuple_Item1 = Inputs_iTuple_Item1;
		NextState_Value_iTuple_Item2 = Inputs_iTuple_Item2;
		NextState_Value_iTuple_Item3[0] = Inputs_iTuple_Item3[0];
		NextState_Value_iTuple_Item3[1] = Inputs_iTuple_Item3[1];
		NextState_Value_iTuple_Item4_L1Flag = Inputs_iTuple_Item4_L1Flag;
		NextState_Value_iTuple_Item4_L2_L2Flag = Inputs_iTuple_Item4_L2_L2Flag;
		NextState_Value_iTuple_Item4_L2_L2Values[0] = Inputs_iTuple_Item4_L2_L2Values[0];
		NextState_Value_iTuple_Item4_L2_L2Values[1] = Inputs_iTuple_Item4_L2_L2Values[1];
		NextState_Value_iTuple_Item4_L2Array[0] = Inputs_iTuple_Item4_L2Array[0];
		NextState_Value_iTuple_Item4_L2Array[1] = Inputs_iTuple_Item4_L2Array[1];
		NextState_Value_iTuple_Item4_L2Tuple_Item1 = Inputs_iTuple_Item4_L2Tuple_Item1;
		NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Flag = Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
		NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values[0] = Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[0];
		NextState_Value_iTuple_Item4_L2Tuple_Item2_L2Values[1] = Inputs_iTuple_Item4_L2Tuple_Item2_L2Values[1];
		NextState_Value_iTuple_Item4_L2Tuple_Item3[0] = Inputs_iTuple_Item4_L2Tuple_Item3[0];
		NextState_Value_iTuple_Item4_L2Tuple_Item3[1] = Inputs_iTuple_Item4_L2Tuple_Item3[1];
		NextState_Value_iTupleArray[0] = Inputs_iTupleArray[0];
		NextState_Value_iTupleArray[1] = Inputs_iTupleArray[1];
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
	assign Output_iTuple_Item1 = State_Value_iTuple_Item1;
	assign Output_iTuple_Item2 = State_Value_iTuple_Item2;
	assign Output_iTuple_Item30 = State_Value_iTuple_Item3[0];
	assign Output_iTuple_Item31 = State_Value_iTuple_Item3[1];
	assign Output_iTuple_Item4_L1Flag = State_Value_iTuple_Item4_L1Flag;
	assign Output_iTuple_Item4_L2_L2Flag = State_Value_iTuple_Item4_L2_L2Flag;
	assign Output_iTuple_Item4_L2_L2Values0 = State_Value_iTuple_Item4_L2_L2Values[0];
	assign Output_iTuple_Item4_L2_L2Values1 = State_Value_iTuple_Item4_L2_L2Values[1];
	assign Output_iTuple_Item4_L2Array0_L2Flag = State_Value_iTuple_Item4_L2Array[0][0];
	assign Output_iTuple_Item4_L2Array0_L2Values0 = State_Value_iTuple_Item4_L2Array[0][3:1];
	assign Output_iTuple_Item4_L2Array0_L2Values1 = State_Value_iTuple_Item4_L2Array[0][6:4];
	assign Output_iTuple_Item4_L2Array1_L2Flag = State_Value_iTuple_Item4_L2Array[1][0];
	assign Output_iTuple_Item4_L2Array1_L2Values1 = State_Value_iTuple_Item4_L2Array[1][6:4];
	assign Output_iTuple_Item4_L2Array1_L2Values0 = State_Value_iTuple_Item4_L2Array[1][3:1];
	assign Output_iTuple_Item4_L2Tuple_Item1 = State_Value_iTuple_Item4_L2Tuple_Item1;
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Flag = State_Value_iTuple_Item4_L2Tuple_Item2_L2Flag;
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Values0 = State_Value_iTuple_Item4_L2Tuple_Item2_L2Values[0];
	assign Output_iTuple_Item4_L2Tuple_Item2_L2Values1 = State_Value_iTuple_Item4_L2Tuple_Item2_L2Values[1];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Flag = State_Value_iTuple_Item4_L2Tuple_Item3[0][0];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Values1 = State_Value_iTuple_Item4_L2Tuple_Item3[0][6:4];
	assign Output_iTuple_Item4_L2Tuple_Item30_L2Values0 = State_Value_iTuple_Item4_L2Tuple_Item3[0][3:1];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Flag = State_Value_iTuple_Item4_L2Tuple_Item3[1][0];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Values0 = State_Value_iTuple_Item4_L2Tuple_Item3[1][3:1];
	assign Output_iTuple_Item4_L2Tuple_Item31_L2Values1 = State_Value_iTuple_Item4_L2Tuple_Item3[1][6:4];
	assign Output_iTupleArray0_Item1 = State_Value_iTupleArray[0][53];
	assign Output_iTupleArray0_Item2 = State_Value_iTupleArray[0][52:49];
	assign Output_iTupleArray0_Item3_L1Flag = State_Value_iTupleArray[0][6];
	assign Output_iTupleArray0_Item3_L2_L2Flag = State_Value_iTupleArray[0][7];
	assign Output_iTupleArray0_Item3_L2_L2Values0 = State_Value_iTupleArray[0][8];
	assign Output_iTupleArray0_Item3_L2_L2Values1 = State_Value_iTupleArray[0][9];
	assign Output_iTupleArray0_Item3_L2Array0_L2Flag = State_Value_iTupleArray[0][10];
	assign Output_iTupleArray0_Item3_L2Array0_L2Values1 = State_Value_iTupleArray[0][16:14];
	assign Output_iTupleArray0_Item3_L2Array0_L2Values0 = State_Value_iTupleArray[0][13:11];
	assign Output_iTupleArray0_Item3_L2Array1_L2Flag = State_Value_iTupleArray[0][17];
	assign Output_iTupleArray0_Item3_L2Array1_L2Values0 = State_Value_iTupleArray[0][20:18];
	assign Output_iTupleArray0_Item3_L2Array1_L2Values1 = State_Value_iTupleArray[0][23:21];
	assign Output_iTupleArray0_Item3_L2Tuple_Item1 = State_Value_iTupleArray[0][48:41];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag = State_Value_iTupleArray[0][38];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values1 = State_Value_iTupleArray[0][40];
	assign Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values0 = State_Value_iTupleArray[0][39];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values1 = State_Value_iTupleArray[0][30:28];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Values0 = State_Value_iTupleArray[0][27:25];
	assign Output_iTupleArray0_Item3_L2Tuple_Item30_L2Flag = State_Value_iTupleArray[0][24];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag = State_Value_iTupleArray[0][31];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values1 = State_Value_iTupleArray[0][37:35];
	assign Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values0 = State_Value_iTupleArray[0][34:32];
	assign Output_iTupleArray0_Item40_L2Flag = State_Value_iTupleArray[0][0];
	assign Output_iTupleArray0_Item40_L2Values0 = State_Value_iTupleArray[0][1];
	assign Output_iTupleArray0_Item40_L2Values1 = State_Value_iTupleArray[0][2];
	assign Output_iTupleArray0_Item41_L2Flag = State_Value_iTupleArray[0][3];
	assign Output_iTupleArray0_Item41_L2Values1 = State_Value_iTupleArray[0][5];
	assign Output_iTupleArray0_Item41_L2Values0 = State_Value_iTupleArray[0][4];
	assign Output_iTupleArray1_Item1 = State_Value_iTupleArray[1][53];
	assign Output_iTupleArray1_Item2 = State_Value_iTupleArray[1][52:49];
	assign Output_iTupleArray1_Item3_L1Flag = State_Value_iTupleArray[1][6];
	assign Output_iTupleArray1_Item3_L2_L2Flag = State_Value_iTupleArray[1][7];
	assign Output_iTupleArray1_Item3_L2_L2Values1 = State_Value_iTupleArray[1][9];
	assign Output_iTupleArray1_Item3_L2_L2Values0 = State_Value_iTupleArray[1][8];
	assign Output_iTupleArray1_Item3_L2Array0_L2Values1 = State_Value_iTupleArray[1][16:14];
	assign Output_iTupleArray1_Item3_L2Array0_L2Values0 = State_Value_iTupleArray[1][13:11];
	assign Output_iTupleArray1_Item3_L2Array0_L2Flag = State_Value_iTupleArray[1][10];
	assign Output_iTupleArray1_Item3_L2Array1_L2Flag = State_Value_iTupleArray[1][17];
	assign Output_iTupleArray1_Item3_L2Array1_L2Values1 = State_Value_iTupleArray[1][23:21];
	assign Output_iTupleArray1_Item3_L2Array1_L2Values0 = State_Value_iTupleArray[1][20:18];
	assign Output_iTupleArray1_Item3_L2Tuple_Item1 = State_Value_iTupleArray[1][48:41];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values1 = State_Value_iTupleArray[1][40];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Values0 = State_Value_iTupleArray[1][39];
	assign Output_iTupleArray1_Item3_L2Tuple_Item2_L2Flag = State_Value_iTupleArray[1][38];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values1 = State_Value_iTupleArray[1][37:35];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Values0 = State_Value_iTupleArray[1][34:32];
	assign Output_iTupleArray1_Item3_L2Tuple_Item31_L2Flag = State_Value_iTupleArray[1][31];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values1 = State_Value_iTupleArray[1][30:28];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Values0 = State_Value_iTupleArray[1][27:25];
	assign Output_iTupleArray1_Item3_L2Tuple_Item30_L2Flag = State_Value_iTupleArray[1][24];
	assign Output_iTupleArray1_Item40_L2Flag = State_Value_iTupleArray[1][0];
	assign Output_iTupleArray1_Item40_L2Values1 = State_Value_iTupleArray[1][2];
	assign Output_iTupleArray1_Item40_L2Values0 = State_Value_iTupleArray[1][1];
	assign Output_iTupleArray1_Item41_L2Flag = State_Value_iTupleArray[1][3];
	assign Output_iTupleArray1_Item41_L2Values0 = State_Value_iTupleArray[1][4];
	assign Output_iTupleArray1_Item41_L2Values1 = State_Value_iTupleArray[1][5];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
