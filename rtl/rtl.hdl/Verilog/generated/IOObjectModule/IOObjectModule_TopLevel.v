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
// System configuration name is IOObjectModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module IOObjectModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] Object_L1Byte,
	input wire Object_L1Object_L2BooleanArray0,
	input wire Object_L1Object_L2BooleanArray1,
	input wire Object_L1Object_L2ObjectArray0_L3Boolean,
	input wire [1:0] Object_L1Object_L2ObjectArray0_L3RTLBitArray0,
	input wire [1:0] Object_L1Object_L2ObjectArray0_L3RTLBitArray1,
	input wire Object_L1Object_L2ObjectArray0_L3Tuple_Item1,
	input wire [1:0] Object_L1Object_L2ObjectArray0_L3Tuple_Item2,
	input wire [2:0] Object_L1Object_L2ObjectArray0_L3TupleArray0,
	input wire [2:0] Object_L1Object_L2ObjectArray0_L3TupleArray1,
	input wire Object_L1Object_L2ObjectArray1_L3Boolean,
	input wire [1:0] Object_L1Object_L2ObjectArray1_L3RTLBitArray0,
	input wire [1:0] Object_L1Object_L2ObjectArray1_L3RTLBitArray1,
	input wire Object_L1Object_L2ObjectArray1_L3Tuple_Item1,
	input wire [1:0] Object_L1Object_L2ObjectArray1_L3Tuple_Item2,
	input wire [2:0] Object_L1Object_L2ObjectArray1_L3TupleArray0,
	input wire [2:0] Object_L1Object_L2ObjectArray1_L3TupleArray1,
	input wire Object_L1Tuple_Item1,
	input wire [2:0] Object_L1Tuple_Item2,
	input wire [7:0] Objects0_L1Byte,
	input wire Objects0_L1Object_L2BooleanArray0,
	input wire Objects0_L1Object_L2BooleanArray1,
	input wire Objects0_L1Object_L2ObjectArray0_L3Boolean,
	input wire [1:0] Objects0_L1Object_L2ObjectArray0_L3RTLBitArray0,
	input wire [1:0] Objects0_L1Object_L2ObjectArray0_L3RTLBitArray1,
	input wire Objects0_L1Object_L2ObjectArray0_L3Tuple_Item1,
	input wire [1:0] Objects0_L1Object_L2ObjectArray0_L3Tuple_Item2,
	input wire [2:0] Objects0_L1Object_L2ObjectArray0_L3TupleArray0,
	input wire [2:0] Objects0_L1Object_L2ObjectArray0_L3TupleArray1,
	input wire Objects0_L1Object_L2ObjectArray1_L3Boolean,
	input wire [1:0] Objects0_L1Object_L2ObjectArray1_L3RTLBitArray0,
	input wire [1:0] Objects0_L1Object_L2ObjectArray1_L3RTLBitArray1,
	input wire Objects0_L1Object_L2ObjectArray1_L3Tuple_Item1,
	input wire [1:0] Objects0_L1Object_L2ObjectArray1_L3Tuple_Item2,
	input wire [2:0] Objects0_L1Object_L2ObjectArray1_L3TupleArray0,
	input wire [2:0] Objects0_L1Object_L2ObjectArray1_L3TupleArray1,
	input wire Objects0_L1Tuple_Item1,
	input wire [2:0] Objects0_L1Tuple_Item2,
	input wire [7:0] Objects1_L1Byte,
	input wire Objects1_L1Object_L2BooleanArray0,
	input wire Objects1_L1Object_L2BooleanArray1,
	input wire Objects1_L1Object_L2ObjectArray0_L3Boolean,
	input wire [1:0] Objects1_L1Object_L2ObjectArray0_L3RTLBitArray0,
	input wire [1:0] Objects1_L1Object_L2ObjectArray0_L3RTLBitArray1,
	input wire Objects1_L1Object_L2ObjectArray0_L3Tuple_Item1,
	input wire [1:0] Objects1_L1Object_L2ObjectArray0_L3Tuple_Item2,
	input wire [2:0] Objects1_L1Object_L2ObjectArray0_L3TupleArray0,
	input wire [2:0] Objects1_L1Object_L2ObjectArray0_L3TupleArray1,
	input wire Objects1_L1Object_L2ObjectArray1_L3Boolean,
	input wire [1:0] Objects1_L1Object_L2ObjectArray1_L3RTLBitArray0,
	input wire [1:0] Objects1_L1Object_L2ObjectArray1_L3RTLBitArray1,
	input wire Objects1_L1Object_L2ObjectArray1_L3Tuple_Item1,
	input wire [1:0] Objects1_L1Object_L2ObjectArray1_L3Tuple_Item2,
	input wire [2:0] Objects1_L1Object_L2ObjectArray1_L3TupleArray0,
	input wire [2:0] Objects1_L1Object_L2ObjectArray1_L3TupleArray1,
	input wire Objects1_L1Tuple_Item1,
	input wire [2:0] Objects1_L1Tuple_Item2,
	output wire [7:0] oInput_L1Byte,
	output wire oInput_L1Object_L2BooleanArray0,
	output wire oInput_L1Object_L2BooleanArray1,
	output wire oInput_L1Object_L2ObjectArray0_L3Boolean,
	output wire [1:0] oInput_L1Object_L2ObjectArray0_L3RTLBitArray0,
	output wire [1:0] oInput_L1Object_L2ObjectArray0_L3RTLBitArray1,
	output wire oInput_L1Object_L2ObjectArray0_L3Tuple_Item1,
	output wire [1:0] oInput_L1Object_L2ObjectArray0_L3Tuple_Item2,
	output wire [2:0] oInput_L1Object_L2ObjectArray0_L3TupleArray0,
	output wire [2:0] oInput_L1Object_L2ObjectArray0_L3TupleArray1,
	output wire oInput_L1Object_L2ObjectArray1_L3Boolean,
	output wire [1:0] oInput_L1Object_L2ObjectArray1_L3RTLBitArray0,
	output wire [1:0] oInput_L1Object_L2ObjectArray1_L3RTLBitArray1,
	output wire oInput_L1Object_L2ObjectArray1_L3Tuple_Item1,
	output wire [1:0] oInput_L1Object_L2ObjectArray1_L3Tuple_Item2,
	output wire [2:0] oInput_L1Object_L2ObjectArray1_L3TupleArray0,
	output wire [2:0] oInput_L1Object_L2ObjectArray1_L3TupleArray1,
	output wire oInput_L1Tuple_Item1,
	output wire [2:0] oInput_L1Tuple_Item2
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire State_Object_L1Object_L2BooleanArrayDefault = 1'b0;
	wire [13: 0] State_Object_L1Object_L2ObjectArrayDefault = 14'b00000000000000;
	wire [41: 0] State_ObjectsDefault = 42'b000000000000000000000000000000000000000000;
	wire [7: 0] Inputs_Object_L1Byte;
	wire Inputs_Object_L1Object_L2ObjectArray0_L3Boolean;
	wire Inputs_Object_L1Object_L2ObjectArray0_L3Tuple_Item1;
	wire [1: 0] Inputs_Object_L1Object_L2ObjectArray0_L3Tuple_Item2;
	wire Inputs_Object_L1Object_L2ObjectArray1_L3Boolean;
	wire Inputs_Object_L1Object_L2ObjectArray1_L3Tuple_Item1;
	wire [1: 0] Inputs_Object_L1Object_L2ObjectArray1_L3Tuple_Item2;
	wire Inputs_Object_L1Tuple_Item1;
	wire [2: 0] Inputs_Object_L1Tuple_Item2;
	wire [7: 0] Inputs_Objects0_L1Byte;
	wire Inputs_Objects0_L1Object_L2ObjectArray0_L3Boolean;
	wire Inputs_Objects0_L1Object_L2ObjectArray0_L3Tuple_Item1;
	wire [1: 0] Inputs_Objects0_L1Object_L2ObjectArray0_L3Tuple_Item2;
	wire Inputs_Objects0_L1Object_L2ObjectArray1_L3Boolean;
	wire Inputs_Objects0_L1Object_L2ObjectArray1_L3Tuple_Item1;
	wire [1: 0] Inputs_Objects0_L1Object_L2ObjectArray1_L3Tuple_Item2;
	wire Inputs_Objects0_L1Tuple_Item1;
	wire [2: 0] Inputs_Objects0_L1Tuple_Item2;
	wire [7: 0] Inputs_Objects1_L1Byte;
	wire Inputs_Objects1_L1Object_L2ObjectArray0_L3Boolean;
	wire Inputs_Objects1_L1Object_L2ObjectArray0_L3Tuple_Item1;
	wire [1: 0] Inputs_Objects1_L1Object_L2ObjectArray0_L3Tuple_Item2;
	wire Inputs_Objects1_L1Object_L2ObjectArray1_L3Boolean;
	wire Inputs_Objects1_L1Object_L2ObjectArray1_L3Tuple_Item1;
	wire [1: 0] Inputs_Objects1_L1Object_L2ObjectArray1_L3Tuple_Item2;
	wire Inputs_Objects1_L1Tuple_Item1;
	wire [2: 0] Inputs_Objects1_L1Tuple_Item2;
	reg [7: 0] NextState_Object_L1Byte;
	reg NextState_Object_L1Tuple_Item1;
	reg [2: 0] NextState_Object_L1Tuple_Item2;
	reg [7: 0] iInput_L1Byte;
	reg iInput_L1Tuple_Item1;
	reg [2: 0] iInput_L1Tuple_Item2;
	reg [7: 0] State_Object_L1Byte = 8'b00000000;
	wire [7: 0] State_Object_L1ByteDefault = 8'b00000000;
	reg State_Object_L1Tuple_Item1 = 1'b0;
	wire State_Object_L1Tuple_Item1Default = 1'b1;
	reg [2: 0] State_Object_L1Tuple_Item2 = 3'b000;
	wire [2: 0] State_Object_L1Tuple_Item2Default = 3'b000;
	wire Inputs_Object_L1Object_L2BooleanArray [0 : 1];
	wire [1 : 0] Inputs_Object_L1Object_L2ObjectArray0_L3RTLBitArray [0 : 1];
	wire [2 : 0] Inputs_Object_L1Object_L2ObjectArray0_L3TupleArray [0 : 1];
	wire [1 : 0] Inputs_Object_L1Object_L2ObjectArray1_L3RTLBitArray [0 : 1];
	wire [2 : 0] Inputs_Object_L1Object_L2ObjectArray1_L3TupleArray [0 : 1];
	wire Inputs_Objects0_L1Object_L2BooleanArray [0 : 1];
	wire [1 : 0] Inputs_Objects0_L1Object_L2ObjectArray0_L3RTLBitArray [0 : 1];
	wire [2 : 0] Inputs_Objects0_L1Object_L2ObjectArray0_L3TupleArray [0 : 1];
	wire [1 : 0] Inputs_Objects0_L1Object_L2ObjectArray1_L3RTLBitArray [0 : 1];
	wire [2 : 0] Inputs_Objects0_L1Object_L2ObjectArray1_L3TupleArray [0 : 1];
	wire Inputs_Objects1_L1Object_L2BooleanArray [0 : 1];
	wire [1 : 0] Inputs_Objects1_L1Object_L2ObjectArray0_L3RTLBitArray [0 : 1];
	wire [2 : 0] Inputs_Objects1_L1Object_L2ObjectArray0_L3TupleArray [0 : 1];
	wire [1 : 0] Inputs_Objects1_L1Object_L2ObjectArray1_L3RTLBitArray [0 : 1];
	wire [2 : 0] Inputs_Objects1_L1Object_L2ObjectArray1_L3TupleArray [0 : 1];
	integer State_Object_L1Object_L2BooleanArray_Iterator;
	reg State_Object_L1Object_L2BooleanArray [0 : 1];
	initial
	begin : Init_State_Object_L1Object_L2BooleanArray
		for (State_Object_L1Object_L2BooleanArray_Iterator = 0; State_Object_L1Object_L2BooleanArray_Iterator < 2; State_Object_L1Object_L2BooleanArray_Iterator = State_Object_L1Object_L2BooleanArray_Iterator + 1)
			State_Object_L1Object_L2BooleanArray[State_Object_L1Object_L2BooleanArray_Iterator] = 0;
	end
	integer NextState_Object_L1Object_L2BooleanArray_Iterator;
	reg NextState_Object_L1Object_L2BooleanArray [0 : 1];
	initial
	begin : Init_NextState_Object_L1Object_L2BooleanArray
		for (NextState_Object_L1Object_L2BooleanArray_Iterator = 0; NextState_Object_L1Object_L2BooleanArray_Iterator < 2; NextState_Object_L1Object_L2BooleanArray_Iterator = NextState_Object_L1Object_L2BooleanArray_Iterator + 1)
			NextState_Object_L1Object_L2BooleanArray[NextState_Object_L1Object_L2BooleanArray_Iterator] = 0;
	end
	integer State_Object_L1Object_L2ObjectArray_Iterator;
	reg [13 : 0] State_Object_L1Object_L2ObjectArray [0 : 1];
	initial
	begin : Init_State_Object_L1Object_L2ObjectArray
$readmemh("IOObjectModule_TopLevel_State_Object_L1Object_L2ObjectArray.hex", State_Object_L1Object_L2ObjectArray);
	end
	integer NextState_Object_L1Object_L2ObjectArray_Iterator;
	reg [13 : 0] NextState_Object_L1Object_L2ObjectArray [0 : 1];
	initial
	begin : Init_NextState_Object_L1Object_L2ObjectArray
		for (NextState_Object_L1Object_L2ObjectArray_Iterator = 0; NextState_Object_L1Object_L2ObjectArray_Iterator < 2; NextState_Object_L1Object_L2ObjectArray_Iterator = NextState_Object_L1Object_L2ObjectArray_Iterator + 1)
			NextState_Object_L1Object_L2ObjectArray[NextState_Object_L1Object_L2ObjectArray_Iterator] = 0;
	end
	integer State_Objects_Iterator;
	reg [41 : 0] State_Objects [0 : 1];
	initial
	begin : Init_State_Objects
$readmemh("IOObjectModule_TopLevel_State_Objects.hex", State_Objects);
	end
	integer NextState_Objects_Iterator;
	reg [41 : 0] NextState_Objects [0 : 1];
	initial
	begin : Init_NextState_Objects
		for (NextState_Objects_Iterator = 0; NextState_Objects_Iterator < 2; NextState_Objects_Iterator = NextState_Objects_Iterator + 1)
			NextState_Objects[NextState_Objects_Iterator] = 0;
	end
	reg iInput_L1Object_L2BooleanArray [0 : 1];
	integer iInput_L1Object_L2BooleanArray_i;
	initial
	begin : Init_iInput_L1Object_L2BooleanArray
		for (iInput_L1Object_L2BooleanArray_i = 0; iInput_L1Object_L2BooleanArray_i < 2; iInput_L1Object_L2BooleanArray_i = iInput_L1Object_L2BooleanArray_i + 1)
			iInput_L1Object_L2BooleanArray[iInput_L1Object_L2BooleanArray_i] = 0;
	end
	reg [13 : 0] iInput_L1Object_L2ObjectArray [0 : 1];
	integer iInput_L1Object_L2ObjectArray_i;
	initial
	begin : Init_iInput_L1Object_L2ObjectArray
		for (iInput_L1Object_L2ObjectArray_i = 0; iInput_L1Object_L2ObjectArray_i < 2; iInput_L1Object_L2ObjectArray_i = iInput_L1Object_L2ObjectArray_i + 1)
			iInput_L1Object_L2ObjectArray[iInput_L1Object_L2ObjectArray_i] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_Object_L1Byte <= State_Object_L1ByteDefault;
			State_Object_L1Tuple_Item1 <= State_Object_L1Tuple_Item1Default;
			State_Object_L1Tuple_Item2 <= State_Object_L1Tuple_Item2Default;
		end
		else
		begin
			State_Object_L1Byte <= NextState_Object_L1Byte;
			State_Object_L1Tuple_Item1 <= NextState_Object_L1Tuple_Item1;
			State_Object_L1Tuple_Item2 <= NextState_Object_L1Tuple_Item2;
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Object_L1Object_L2BooleanArray_Iterator = 0; (State_Object_L1Object_L2BooleanArray_Iterator < 2); State_Object_L1Object_L2BooleanArray_Iterator = (State_Object_L1Object_L2BooleanArray_Iterator + 1))
			begin
				State_Object_L1Object_L2BooleanArray[State_Object_L1Object_L2BooleanArray_Iterator] <= State_Object_L1Object_L2BooleanArrayDefault;
			end
		end
		else
		begin
			for (State_Object_L1Object_L2BooleanArray_Iterator = 0; (State_Object_L1Object_L2BooleanArray_Iterator < 2); State_Object_L1Object_L2BooleanArray_Iterator = (State_Object_L1Object_L2BooleanArray_Iterator + 1))
			begin
				State_Object_L1Object_L2BooleanArray[State_Object_L1Object_L2BooleanArray_Iterator] <= NextState_Object_L1Object_L2BooleanArray[State_Object_L1Object_L2BooleanArray_Iterator];
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
			for (State_Object_L1Object_L2ObjectArray_Iterator = 0; (State_Object_L1Object_L2ObjectArray_Iterator < 2); State_Object_L1Object_L2ObjectArray_Iterator = (State_Object_L1Object_L2ObjectArray_Iterator + 1))
			begin
				State_Object_L1Object_L2ObjectArray[State_Object_L1Object_L2ObjectArray_Iterator] <= NextState_Object_L1Object_L2ObjectArray[State_Object_L1Object_L2ObjectArray_Iterator];
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
			for (State_Objects_Iterator = 0; (State_Objects_Iterator < 2); State_Objects_Iterator = (State_Objects_Iterator + 1))
			begin
				State_Objects[State_Objects_Iterator] <= NextState_Objects[State_Objects_Iterator];
			end
		end
	end
	always @ (*)
	begin
		NextState_Object_L1Object_L2BooleanArray_Iterator = 0;
		NextState_Object_L1Object_L2ObjectArray_Iterator = 0;
		NextState_Objects_Iterator = 0;
		for (NextState_Object_L1Object_L2BooleanArray_Iterator = 0; (NextState_Object_L1Object_L2BooleanArray_Iterator < 2); NextState_Object_L1Object_L2BooleanArray_Iterator = (NextState_Object_L1Object_L2BooleanArray_Iterator + 1))
		begin
			NextState_Object_L1Object_L2BooleanArray[NextState_Object_L1Object_L2BooleanArray_Iterator] = State_Object_L1Object_L2BooleanArray[NextState_Object_L1Object_L2BooleanArray_Iterator];
		end
		for (NextState_Object_L1Object_L2ObjectArray_Iterator = 0; (NextState_Object_L1Object_L2ObjectArray_Iterator < 2); NextState_Object_L1Object_L2ObjectArray_Iterator = (NextState_Object_L1Object_L2ObjectArray_Iterator + 1))
		begin
			NextState_Object_L1Object_L2ObjectArray[NextState_Object_L1Object_L2ObjectArray_Iterator] = State_Object_L1Object_L2ObjectArray[NextState_Object_L1Object_L2ObjectArray_Iterator];
		end
		for (NextState_Objects_Iterator = 0; (NextState_Objects_Iterator < 2); NextState_Objects_Iterator = (NextState_Objects_Iterator + 1))
		begin
			NextState_Objects[NextState_Objects_Iterator] = State_Objects[NextState_Objects_Iterator];
		end
		NextState_Object_L1Byte = State_Object_L1Byte;
		NextState_Object_L1Tuple_Item1 = State_Object_L1Tuple_Item1;
		NextState_Object_L1Tuple_Item2 = State_Object_L1Tuple_Item2;
	end
	assign Inputs_Object_L1Byte = Object_L1Byte;
	assign Inputs_Object_L1Object_L2BooleanArray[0] = Object_L1Object_L2BooleanArray0;
	assign Inputs_Object_L1Object_L2BooleanArray[1] = Object_L1Object_L2BooleanArray1;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3Boolean = Object_L1Object_L2ObjectArray0_L3Boolean;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3RTLBitArray[0] = Object_L1Object_L2ObjectArray0_L3RTLBitArray0;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3RTLBitArray[1] = Object_L1Object_L2ObjectArray0_L3RTLBitArray1;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3Tuple_Item1 = Object_L1Object_L2ObjectArray0_L3Tuple_Item1;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3Tuple_Item2 = Object_L1Object_L2ObjectArray0_L3Tuple_Item2;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3TupleArray[0] = Object_L1Object_L2ObjectArray0_L3TupleArray0;
	assign Inputs_Object_L1Object_L2ObjectArray0_L3TupleArray[1] = Object_L1Object_L2ObjectArray0_L3TupleArray1;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3Boolean = Object_L1Object_L2ObjectArray1_L3Boolean;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3RTLBitArray[0] = Object_L1Object_L2ObjectArray1_L3RTLBitArray0;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3RTLBitArray[1] = Object_L1Object_L2ObjectArray1_L3RTLBitArray1;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3Tuple_Item1 = Object_L1Object_L2ObjectArray1_L3Tuple_Item1;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3Tuple_Item2 = Object_L1Object_L2ObjectArray1_L3Tuple_Item2;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3TupleArray[0] = Object_L1Object_L2ObjectArray1_L3TupleArray0;
	assign Inputs_Object_L1Object_L2ObjectArray1_L3TupleArray[1] = Object_L1Object_L2ObjectArray1_L3TupleArray1;
	assign Inputs_Object_L1Tuple_Item1 = Object_L1Tuple_Item1;
	assign Inputs_Object_L1Tuple_Item2 = Object_L1Tuple_Item2;
	assign Inputs_Objects0_L1Byte = Objects0_L1Byte;
	assign Inputs_Objects0_L1Object_L2BooleanArray[0] = Objects0_L1Object_L2BooleanArray0;
	assign Inputs_Objects0_L1Object_L2BooleanArray[1] = Objects0_L1Object_L2BooleanArray1;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3Boolean = Objects0_L1Object_L2ObjectArray0_L3Boolean;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3RTLBitArray[0] = Objects0_L1Object_L2ObjectArray0_L3RTLBitArray0;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3RTLBitArray[1] = Objects0_L1Object_L2ObjectArray0_L3RTLBitArray1;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3Tuple_Item1 = Objects0_L1Object_L2ObjectArray0_L3Tuple_Item1;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3Tuple_Item2 = Objects0_L1Object_L2ObjectArray0_L3Tuple_Item2;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3TupleArray[0] = Objects0_L1Object_L2ObjectArray0_L3TupleArray0;
	assign Inputs_Objects0_L1Object_L2ObjectArray0_L3TupleArray[1] = Objects0_L1Object_L2ObjectArray0_L3TupleArray1;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3Boolean = Objects0_L1Object_L2ObjectArray1_L3Boolean;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3RTLBitArray[0] = Objects0_L1Object_L2ObjectArray1_L3RTLBitArray0;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3RTLBitArray[1] = Objects0_L1Object_L2ObjectArray1_L3RTLBitArray1;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3Tuple_Item1 = Objects0_L1Object_L2ObjectArray1_L3Tuple_Item1;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3Tuple_Item2 = Objects0_L1Object_L2ObjectArray1_L3Tuple_Item2;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3TupleArray[0] = Objects0_L1Object_L2ObjectArray1_L3TupleArray0;
	assign Inputs_Objects0_L1Object_L2ObjectArray1_L3TupleArray[1] = Objects0_L1Object_L2ObjectArray1_L3TupleArray1;
	assign Inputs_Objects0_L1Tuple_Item1 = Objects0_L1Tuple_Item1;
	assign Inputs_Objects0_L1Tuple_Item2 = Objects0_L1Tuple_Item2;
	assign Inputs_Objects1_L1Byte = Objects1_L1Byte;
	assign Inputs_Objects1_L1Object_L2BooleanArray[0] = Objects1_L1Object_L2BooleanArray0;
	assign Inputs_Objects1_L1Object_L2BooleanArray[1] = Objects1_L1Object_L2BooleanArray1;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3Boolean = Objects1_L1Object_L2ObjectArray0_L3Boolean;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3RTLBitArray[0] = Objects1_L1Object_L2ObjectArray0_L3RTLBitArray0;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3RTLBitArray[1] = Objects1_L1Object_L2ObjectArray0_L3RTLBitArray1;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3Tuple_Item1 = Objects1_L1Object_L2ObjectArray0_L3Tuple_Item1;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3Tuple_Item2 = Objects1_L1Object_L2ObjectArray0_L3Tuple_Item2;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3TupleArray[0] = Objects1_L1Object_L2ObjectArray0_L3TupleArray0;
	assign Inputs_Objects1_L1Object_L2ObjectArray0_L3TupleArray[1] = Objects1_L1Object_L2ObjectArray0_L3TupleArray1;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3Boolean = Objects1_L1Object_L2ObjectArray1_L3Boolean;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3RTLBitArray[0] = Objects1_L1Object_L2ObjectArray1_L3RTLBitArray0;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3RTLBitArray[1] = Objects1_L1Object_L2ObjectArray1_L3RTLBitArray1;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3Tuple_Item1 = Objects1_L1Object_L2ObjectArray1_L3Tuple_Item1;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3Tuple_Item2 = Objects1_L1Object_L2ObjectArray1_L3Tuple_Item2;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3TupleArray[0] = Objects1_L1Object_L2ObjectArray1_L3TupleArray0;
	assign Inputs_Objects1_L1Object_L2ObjectArray1_L3TupleArray[1] = Objects1_L1Object_L2ObjectArray1_L3TupleArray1;
	assign Inputs_Objects1_L1Tuple_Item1 = Objects1_L1Tuple_Item1;
	assign Inputs_Objects1_L1Tuple_Item2 = Objects1_L1Tuple_Item2;
	assign oInput_L1Byte = Inputs_Object_L1Byte;
	assign oInput_L1Object_L2BooleanArray0 = Inputs_Object_L1Object_L2BooleanArray[0];
	assign oInput_L1Object_L2BooleanArray1 = Inputs_Object_L1Object_L2BooleanArray[1];
	assign oInput_L1Object_L2ObjectArray0_L3Boolean = Inputs_Object_L1Object_L2ObjectArray0_L3Boolean;
	assign oInput_L1Object_L2ObjectArray0_L3RTLBitArray0 = Inputs_Object_L1Object_L2ObjectArray0_L3RTLBitArray[0];
	assign oInput_L1Object_L2ObjectArray0_L3RTLBitArray1 = Inputs_Object_L1Object_L2ObjectArray0_L3RTLBitArray[1];
	assign oInput_L1Object_L2ObjectArray0_L3Tuple_Item1 = Inputs_Object_L1Object_L2ObjectArray0_L3Tuple_Item1;
	assign oInput_L1Object_L2ObjectArray0_L3Tuple_Item2 = Inputs_Object_L1Object_L2ObjectArray0_L3Tuple_Item2;
	assign oInput_L1Object_L2ObjectArray0_L3TupleArray0 = Inputs_Object_L1Object_L2ObjectArray0_L3TupleArray[0];
	assign oInput_L1Object_L2ObjectArray0_L3TupleArray1 = Inputs_Object_L1Object_L2ObjectArray0_L3TupleArray[1];
	assign oInput_L1Object_L2ObjectArray1_L3Boolean = Inputs_Object_L1Object_L2ObjectArray1_L3Boolean;
	assign oInput_L1Object_L2ObjectArray1_L3RTLBitArray0 = Inputs_Object_L1Object_L2ObjectArray1_L3RTLBitArray[0];
	assign oInput_L1Object_L2ObjectArray1_L3RTLBitArray1 = Inputs_Object_L1Object_L2ObjectArray1_L3RTLBitArray[1];
	assign oInput_L1Object_L2ObjectArray1_L3Tuple_Item1 = Inputs_Object_L1Object_L2ObjectArray1_L3Tuple_Item1;
	assign oInput_L1Object_L2ObjectArray1_L3Tuple_Item2 = Inputs_Object_L1Object_L2ObjectArray1_L3Tuple_Item2;
	assign oInput_L1Object_L2ObjectArray1_L3TupleArray0 = Inputs_Object_L1Object_L2ObjectArray1_L3TupleArray[0];
	assign oInput_L1Object_L2ObjectArray1_L3TupleArray1 = Inputs_Object_L1Object_L2ObjectArray1_L3TupleArray[1];
	assign oInput_L1Tuple_Item1 = Inputs_Object_L1Tuple_Item1;
	assign oInput_L1Tuple_Item2 = Inputs_Object_L1Tuple_Item2;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule