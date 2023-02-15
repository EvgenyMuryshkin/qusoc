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
// System configuration name is IOTupleModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module IOTupleModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire iTuple_Item1,
	input wire [7:0] iTuple_Item2,
	input wire [3:0] iTuple_Item3,
	input wire iTuple_Item4_L1Flag,
	input wire iTuple_Item4_L2_L2Flag,
	input wire [7:0] iTuple_Item4_L2Tuple_Item1,
	input wire iTuple_Item4_L2Tuple_Item2_L2Flag,
	output wire oiTuple_Item1,
	output wire [7:0] oiTuple_Item2,
	output wire [3:0] oiTuple_Item3,
	output wire oiTuple_Item4_L1Flag,
	output wire oiTuple_Item4_L2_L2Flag,
	output wire [7:0] oiTuple_Item4_L2Tuple_Item1,
	output wire oiTuple_Item4_L2Tuple_Item2_L2Flag
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
	wire [3: 0] Inputs_iTuple_Item3;
	wire Inputs_iTuple_Item4_L1Flag;
	wire Inputs_iTuple_Item4_L2_L2Flag;
	wire [7: 0] Inputs_iTuple_Item4_L2Tuple_Item1;
	wire Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
	reg NextState_sTuple_Item1;
	reg [7: 0] NextState_sTuple_Item2;
	reg [3: 0] NextState_sTuple_Item3;
	reg NextState_sTuple_Item4_L1Flag;
	reg NextState_sTuple_Item4_L2_L2Flag;
	reg [7: 0] NextState_sTuple_Item4_L2Tuple_Item1;
	reg NextState_sTuple_Item4_L2Tuple_Item2_L2Flag;
	reg NextState_sahTuple_Item1;
	reg [7: 0] NextState_sahTuple_Item2;
	reg [3: 0] NextState_sahTuple_Item3;
	reg NextState_sahTuple_Item4_L1Flag;
	reg NextState_sahTuple_Item4_L2_L2Flag;
	reg [7: 0] NextState_sahTuple_Item4_L2Tuple_Item1;
	reg NextState_sahTuple_Item4_L2Tuple_Item2_L2Flag;
	reg State_sTuple_Item1 = 1'b0;
	wire State_sTuple_Item1Default = 1'b0;
	reg [7: 0] State_sTuple_Item2 = 8'b00000000;
	wire [7: 0] State_sTuple_Item2Default = 8'b00000000;
	reg [3: 0] State_sTuple_Item3 = 4'b0000;
	wire [3: 0] State_sTuple_Item3Default = 4'b0000;
	reg State_sTuple_Item4_L1Flag = 1'b0;
	wire State_sTuple_Item4_L1FlagDefault = 1'b0;
	reg State_sTuple_Item4_L2_L2Flag = 1'b0;
	wire State_sTuple_Item4_L2_L2FlagDefault = 1'b0;
	reg [7: 0] State_sTuple_Item4_L2Tuple_Item1 = 8'b00000000;
	wire [7: 0] State_sTuple_Item4_L2Tuple_Item1Default = 8'b00101010;
	reg State_sTuple_Item4_L2Tuple_Item2_L2Flag = 1'b0;
	wire State_sTuple_Item4_L2Tuple_Item2_L2FlagDefault = 1'b0;
	reg State_sahTuple_Item1 = 1'b0;
	wire State_sahTuple_Item1Default = 1'b0;
	reg [7: 0] State_sahTuple_Item2 = 8'b00000000;
	wire [7: 0] State_sahTuple_Item2Default = 8'b00000000;
	reg [3: 0] State_sahTuple_Item3 = 4'b0000;
	wire [3: 0] State_sahTuple_Item3Default = 4'b0000;
	reg State_sahTuple_Item4_L1Flag = 1'b0;
	wire State_sahTuple_Item4_L1FlagDefault = 1'b0;
	reg State_sahTuple_Item4_L2_L2Flag = 1'b0;
	wire State_sahTuple_Item4_L2_L2FlagDefault = 1'b0;
	reg [7: 0] State_sahTuple_Item4_L2Tuple_Item1 = 8'b00000000;
	wire [7: 0] State_sahTuple_Item4_L2Tuple_Item1Default = 8'b00101010;
	reg State_sahTuple_Item4_L2Tuple_Item2_L2Flag = 1'b0;
	wire State_sahTuple_Item4_L2Tuple_Item2_L2FlagDefault = 1'b0;
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_sTuple_Item1 <= State_sTuple_Item1Default;
			State_sTuple_Item2 <= State_sTuple_Item2Default;
			State_sTuple_Item3 <= State_sTuple_Item3Default;
			State_sTuple_Item4_L1Flag <= State_sTuple_Item4_L1FlagDefault;
			State_sTuple_Item4_L2_L2Flag <= State_sTuple_Item4_L2_L2FlagDefault;
			State_sTuple_Item4_L2Tuple_Item1 <= State_sTuple_Item4_L2Tuple_Item1Default;
			State_sTuple_Item4_L2Tuple_Item2_L2Flag <= State_sTuple_Item4_L2Tuple_Item2_L2FlagDefault;
			State_sahTuple_Item1 <= State_sahTuple_Item1Default;
			State_sahTuple_Item2 <= State_sahTuple_Item2Default;
			State_sahTuple_Item3 <= State_sahTuple_Item3Default;
			State_sahTuple_Item4_L1Flag <= State_sahTuple_Item4_L1FlagDefault;
			State_sahTuple_Item4_L2_L2Flag <= State_sahTuple_Item4_L2_L2FlagDefault;
			State_sahTuple_Item4_L2Tuple_Item1 <= State_sahTuple_Item4_L2Tuple_Item1Default;
			State_sahTuple_Item4_L2Tuple_Item2_L2Flag <= State_sahTuple_Item4_L2Tuple_Item2_L2FlagDefault;
		end
		else
		begin
			State_sTuple_Item1 <= NextState_sTuple_Item1;
			State_sTuple_Item2 <= NextState_sTuple_Item2;
			State_sTuple_Item3 <= NextState_sTuple_Item3;
			State_sTuple_Item4_L1Flag <= NextState_sTuple_Item4_L1Flag;
			State_sTuple_Item4_L2_L2Flag <= NextState_sTuple_Item4_L2_L2Flag;
			State_sTuple_Item4_L2Tuple_Item1 <= NextState_sTuple_Item4_L2Tuple_Item1;
			State_sTuple_Item4_L2Tuple_Item2_L2Flag <= NextState_sTuple_Item4_L2Tuple_Item2_L2Flag;
			State_sahTuple_Item1 <= NextState_sahTuple_Item1;
			State_sahTuple_Item2 <= NextState_sahTuple_Item2;
			State_sahTuple_Item3 <= NextState_sahTuple_Item3;
			State_sahTuple_Item4_L1Flag <= NextState_sahTuple_Item4_L1Flag;
			State_sahTuple_Item4_L2_L2Flag <= NextState_sahTuple_Item4_L2_L2Flag;
			State_sahTuple_Item4_L2Tuple_Item1 <= NextState_sahTuple_Item4_L2Tuple_Item1;
			State_sahTuple_Item4_L2Tuple_Item2_L2Flag <= NextState_sahTuple_Item4_L2Tuple_Item2_L2Flag;
		end
	end
	always @ (*)
	begin
		NextState_sTuple_Item1 = State_sTuple_Item1;
		NextState_sTuple_Item2 = State_sTuple_Item2;
		NextState_sTuple_Item3 = State_sTuple_Item3;
		NextState_sTuple_Item4_L1Flag = State_sTuple_Item4_L1Flag;
		NextState_sTuple_Item4_L2_L2Flag = State_sTuple_Item4_L2_L2Flag;
		NextState_sTuple_Item4_L2Tuple_Item1 = State_sTuple_Item4_L2Tuple_Item1;
		NextState_sTuple_Item4_L2Tuple_Item2_L2Flag = State_sTuple_Item4_L2Tuple_Item2_L2Flag;
		NextState_sahTuple_Item1 = State_sahTuple_Item1;
		NextState_sahTuple_Item2 = State_sahTuple_Item2;
		NextState_sahTuple_Item3 = State_sahTuple_Item3;
		NextState_sahTuple_Item4_L1Flag = State_sahTuple_Item4_L1Flag;
		NextState_sahTuple_Item4_L2_L2Flag = State_sahTuple_Item4_L2_L2Flag;
		NextState_sahTuple_Item4_L2Tuple_Item1 = State_sahTuple_Item4_L2Tuple_Item1;
		NextState_sahTuple_Item4_L2Tuple_Item2_L2Flag = State_sahTuple_Item4_L2Tuple_Item2_L2Flag;
	end
	assign Inputs_iTuple_Item1 = iTuple_Item1;
	assign Inputs_iTuple_Item2 = iTuple_Item2;
	assign Inputs_iTuple_Item3 = iTuple_Item3;
	assign Inputs_iTuple_Item4_L1Flag = iTuple_Item4_L1Flag;
	assign Inputs_iTuple_Item4_L2_L2Flag = iTuple_Item4_L2_L2Flag;
	assign Inputs_iTuple_Item4_L2Tuple_Item1 = iTuple_Item4_L2Tuple_Item1;
	assign Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag = iTuple_Item4_L2Tuple_Item2_L2Flag;
	assign oiTuple_Item1 = Inputs_iTuple_Item1;
	assign oiTuple_Item2 = Inputs_iTuple_Item2;
	assign oiTuple_Item3 = Inputs_iTuple_Item3;
	assign oiTuple_Item4_L1Flag = Inputs_iTuple_Item4_L1Flag;
	assign oiTuple_Item4_L2_L2Flag = Inputs_iTuple_Item4_L2_L2Flag;
	assign oiTuple_Item4_L2Tuple_Item1 = Inputs_iTuple_Item4_L2Tuple_Item1;
	assign oiTuple_Item4_L2Tuple_Item2_L2Flag = Inputs_iTuple_Item4_L2Tuple_Item2_L2Flag;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
