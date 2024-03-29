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
// System configuration name is NestedLogicRAMIndexingModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module NestedLogicRAMIndexingModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [1:0] ReadAddr,
	input wire WE,
	input wire [1:0] WriteAddr,
	input wire [7:0] WriteData,
	output wire [7:0] oValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] State_Nested_BuffDefault = 8'b00000000;
	wire NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F60T61_Expr = 1'b1;
	wire [1: 0] Inputs_ReadAddr;
	wire Inputs_WE;
	wire [1: 0] Inputs_WriteAddr;
	wire [7: 0] Inputs_WriteData;
	reg [7: 0] NextState_Counter;
	wire [7: 0] NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F37T62_Cast;
	reg [7: 0] State_Counter = 8'b00000000;
	wire [7: 0] State_CounterDefault = 8'b00000000;
	wire [9: 0] NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr;
	wire signed [9: 0] NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr_1;
	wire signed [9: 0] NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr_2;
	integer State_Nested_Buff_Iterator;
	reg [7 : 0] State_Nested_Buff [0 : 3];
	initial
	begin : Init_State_Nested_Buff
		for (State_Nested_Buff_Iterator = 0; State_Nested_Buff_Iterator < 4; State_Nested_Buff_Iterator = State_Nested_Buff_Iterator + 1)
			State_Nested_Buff[State_Nested_Buff_Iterator] = 0;
	end
	integer NextState_Nested_Buff_Iterator;
	reg [7 : 0] NextState_Nested_Buff [0 : 3];
	initial
	begin : Init_NextState_Nested_Buff
		for (NextState_Nested_Buff_Iterator = 0; NextState_Nested_Buff_Iterator < 4; NextState_Nested_Buff_Iterator = NextState_Nested_Buff_Iterator + 1)
			NextState_Nested_Buff[NextState_Nested_Buff_Iterator] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_Counter <= State_CounterDefault;
		end
		else
		begin
			State_Counter <= NextState_Counter;
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Nested_Buff_Iterator = 0; (State_Nested_Buff_Iterator < 4); State_Nested_Buff_Iterator = (State_Nested_Buff_Iterator + 1))
			begin
				State_Nested_Buff[State_Nested_Buff_Iterator] <= State_Nested_BuffDefault;
			end
		end
		else
		begin
			for (State_Nested_Buff_Iterator = 0; (State_Nested_Buff_Iterator < 4); State_Nested_Buff_Iterator = (State_Nested_Buff_Iterator + 1))
			begin
				State_Nested_Buff[State_Nested_Buff_Iterator] <= NextState_Nested_Buff[State_Nested_Buff_Iterator];
			end
		end
	end
	assign NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr = NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr_1 + NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr_2;
	always @ (*)
	begin
		NextState_Nested_Buff_Iterator = 0;
		for (NextState_Nested_Buff_Iterator = 0; (NextState_Nested_Buff_Iterator < 4); NextState_Nested_Buff_Iterator = (NextState_Nested_Buff_Iterator + 1))
		begin
			NextState_Nested_Buff[NextState_Nested_Buff_Iterator] = State_Nested_Buff[NextState_Nested_Buff_Iterator];
		end
		NextState_Counter = State_Counter;
		if ((Inputs_WE == 1))
		begin
			NextState_Counter = NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F37T62_Cast;
			NextState_Nested_Buff[Inputs_WriteAddr] = Inputs_WriteData;
		end
	end
	assign NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr_1 = {
		{2{1'b0}},
		State_Counter
	}
	;
	assign NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr_2 = {
		{9{1'b0}},
		NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F60T61_Expr
	}
	;
	assign Inputs_ReadAddr = ReadAddr;
	assign Inputs_WE = WE;
	assign Inputs_WriteAddr = WriteAddr;
	assign Inputs_WriteData = WriteData;
	assign NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F37T62_Cast = NestedLogicRAMIndexingModule_L30F9L36T10_NestedLogicRAMIndexingModule_L32F13L35T14_NestedLogicRAMIndexingModule_L33F44T61_Expr[7:0];
	assign oValue = State_Nested_Buff[Inputs_ReadAddr];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
