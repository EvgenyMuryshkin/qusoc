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
// System configuration name is LogicRAMIndexingModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module LogicRAMIndexingModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] OpData,
	input wire [1:0] ReadAddr,
	input wire WE,
	input wire [1:0] WriteAddr,
	input wire [7:0] WriteData,
	output wire CmpMemLhs,
	output wire CmpMemRhs,
	output wire [7:0] LogicMemLhs,
	output wire [7:0] LogicMemRhs,
	output wire [7:0] MathMemLhs,
	output wire [7:0] MathMemRhs,
	output wire [7:0] MemLhsRhs
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] State_BuffDefault = 8'b00000000;
	wire [7: 0] Inputs_OpData;
	wire [1: 0] Inputs_ReadAddr;
	wire Inputs_WE;
	wire [1: 0] Inputs_WriteAddr;
	wire [7: 0] Inputs_WriteData;
	wire [7: 0] LogicRAMIndexingModule_L30F36T87_Cast;
	wire [7: 0] LogicRAMIndexingModule_L31F36T87_Cast;
	wire [7: 0] LogicRAMIndexingModule_L27F35T86_Cast;
	wire [7: 0] LogicRAMIndexingModule_L28F35T86_Cast;
	wire [7: 0] LogicRAMIndexingModule_L26F34T85_Cast;
	wire [7: 0] LogicRAMIndexingModule_L30F43T86_Expr;
	wire [7: 0] LogicRAMIndexingModule_L30F43T86_Expr_1;
	wire [7: 0] LogicRAMIndexingModule_L30F43T86_Expr_2;
	wire [7: 0] LogicRAMIndexingModule_L31F43T86_Expr;
	wire [7: 0] LogicRAMIndexingModule_L31F43T86_Expr_1;
	wire [7: 0] LogicRAMIndexingModule_L31F43T86_Expr_2;
	wire signed [9: 0] LogicRAMIndexingModule_L27F42T85_Expr;
	wire signed [9: 0] LogicRAMIndexingModule_L27F42T85_Expr_1;
	wire signed [9: 0] LogicRAMIndexingModule_L27F42T85_Expr_2;
	wire [9: 0] LogicRAMIndexingModule_L28F42T85_Expr;
	wire signed [9: 0] LogicRAMIndexingModule_L28F42T85_Expr_1;
	wire signed [9: 0] LogicRAMIndexingModule_L28F42T85_Expr_2;
	wire [9: 0] LogicRAMIndexingModule_L26F41T84_Expr;
	wire signed [9: 0] LogicRAMIndexingModule_L26F41T84_Expr_1;
	wire signed [9: 0] LogicRAMIndexingModule_L26F41T84_Expr_2;
	wire LogicRAMIndexingModule_L33F34T77_Expr;
	wire signed [8: 0] LogicRAMIndexingModule_L33F34T77_ExprLhs;
	wire signed [8: 0] LogicRAMIndexingModule_L33F34T77_ExprRhs;
	wire LogicRAMIndexingModule_L34F34T77_Expr;
	wire signed [8: 0] LogicRAMIndexingModule_L34F34T77_ExprLhs;
	wire signed [8: 0] LogicRAMIndexingModule_L34F34T77_ExprRhs;
	integer State_Buff_Iterator;
	reg [7 : 0] State_Buff [0 : 3];
	initial
	begin : Init_State_Buff
		for (State_Buff_Iterator = 0; State_Buff_Iterator < 4; State_Buff_Iterator = State_Buff_Iterator + 1)
			State_Buff[State_Buff_Iterator] = 0;
	end
	integer NextState_Buff_Iterator;
	reg [7 : 0] NextState_Buff [0 : 3];
	initial
	begin : Init_NextState_Buff
		for (NextState_Buff_Iterator = 0; NextState_Buff_Iterator < 4; NextState_Buff_Iterator = NextState_Buff_Iterator + 1)
			NextState_Buff[NextState_Buff_Iterator] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Buff_Iterator = 0; (State_Buff_Iterator < 4); State_Buff_Iterator = (State_Buff_Iterator + 1))
			begin
				State_Buff[State_Buff_Iterator] <= State_BuffDefault;
			end
		end
		else
		begin
			for (State_Buff_Iterator = 0; (State_Buff_Iterator < 4); State_Buff_Iterator = (State_Buff_Iterator + 1))
			begin
				State_Buff[State_Buff_Iterator] <= NextState_Buff[State_Buff_Iterator];
			end
		end
	end
	assign LogicRAMIndexingModule_L33F34T77_Expr = LogicRAMIndexingModule_L33F34T77_ExprLhs > LogicRAMIndexingModule_L33F34T77_ExprRhs ? 1'b1 : 1'b0;
	assign LogicRAMIndexingModule_L34F34T77_Expr = LogicRAMIndexingModule_L34F34T77_ExprLhs > LogicRAMIndexingModule_L34F34T77_ExprRhs ? 1'b1 : 1'b0;
	assign LogicRAMIndexingModule_L30F43T86_Expr = LogicRAMIndexingModule_L30F43T86_Expr_1 | LogicRAMIndexingModule_L30F43T86_Expr_2;
	assign LogicRAMIndexingModule_L31F43T86_Expr = LogicRAMIndexingModule_L31F43T86_Expr_1 & LogicRAMIndexingModule_L31F43T86_Expr_2;
	assign LogicRAMIndexingModule_L27F42T85_Expr = LogicRAMIndexingModule_L27F42T85_Expr_1 - LogicRAMIndexingModule_L27F42T85_Expr_2;
	assign LogicRAMIndexingModule_L28F42T85_Expr = LogicRAMIndexingModule_L28F42T85_Expr_1 + LogicRAMIndexingModule_L28F42T85_Expr_2;
	assign LogicRAMIndexingModule_L26F41T84_Expr = LogicRAMIndexingModule_L26F41T84_Expr_1 + LogicRAMIndexingModule_L26F41T84_Expr_2;
	always @ (*)
	begin
		NextState_Buff_Iterator = 0;
		for (NextState_Buff_Iterator = 0; (NextState_Buff_Iterator < 4); NextState_Buff_Iterator = (NextState_Buff_Iterator + 1))
		begin
			NextState_Buff[NextState_Buff_Iterator] = State_Buff[NextState_Buff_Iterator];
		end
		if ((Inputs_WE == 1))
		begin
			NextState_Buff[Inputs_WriteAddr] = Inputs_WriteData;
		end
	end
	assign LogicRAMIndexingModule_L33F34T77_ExprLhs = { 1'b0, State_Buff[Inputs_ReadAddr] };
	assign LogicRAMIndexingModule_L33F34T77_ExprRhs = { 1'b0, Inputs_OpData };
	assign LogicRAMIndexingModule_L34F34T77_ExprLhs = { 1'b0, Inputs_OpData };
	assign LogicRAMIndexingModule_L34F34T77_ExprRhs = { 1'b0, State_Buff[Inputs_ReadAddr] };
	assign LogicRAMIndexingModule_L30F43T86_Expr_1 = State_Buff[Inputs_ReadAddr];
	assign LogicRAMIndexingModule_L30F43T86_Expr_2 = Inputs_OpData;
	assign LogicRAMIndexingModule_L31F43T86_Expr_1 = Inputs_OpData;
	assign LogicRAMIndexingModule_L31F43T86_Expr_2 = State_Buff[Inputs_ReadAddr];
	assign LogicRAMIndexingModule_L27F42T85_Expr_1 = { {2{1'b0}}, State_Buff[Inputs_ReadAddr] };
	assign LogicRAMIndexingModule_L27F42T85_Expr_2 = { {2{1'b0}}, Inputs_OpData };
	assign LogicRAMIndexingModule_L28F42T85_Expr_1 = { {2{1'b0}}, Inputs_OpData };
	assign LogicRAMIndexingModule_L28F42T85_Expr_2 = { {2{1'b0}}, State_Buff[Inputs_ReadAddr] };
	assign LogicRAMIndexingModule_L26F41T84_Expr_1 = { {2{1'b0}}, State_Buff[1] };
	assign LogicRAMIndexingModule_L26F41T84_Expr_2 = { {2{1'b0}}, State_Buff[Inputs_ReadAddr] };
	assign Inputs_OpData = OpData;
	assign Inputs_ReadAddr = ReadAddr;
	assign Inputs_WE = WE;
	assign Inputs_WriteAddr = WriteAddr;
	assign Inputs_WriteData = WriteData;
	assign CmpMemLhs = LogicRAMIndexingModule_L33F34T77_Expr;
	assign CmpMemRhs = LogicRAMIndexingModule_L34F34T77_Expr;
	assign LogicRAMIndexingModule_L30F36T87_Cast = LogicRAMIndexingModule_L30F43T86_Expr;
	assign LogicMemLhs = LogicRAMIndexingModule_L30F36T87_Cast;
	assign LogicRAMIndexingModule_L31F36T87_Cast = LogicRAMIndexingModule_L31F43T86_Expr;
	assign LogicMemRhs = LogicRAMIndexingModule_L31F36T87_Cast;
	assign LogicRAMIndexingModule_L27F35T86_Cast = LogicRAMIndexingModule_L27F42T85_Expr[7:0];
	assign MathMemLhs = LogicRAMIndexingModule_L27F35T86_Cast;
	assign LogicRAMIndexingModule_L28F35T86_Cast = LogicRAMIndexingModule_L28F42T85_Expr[7:0];
	assign MathMemRhs = LogicRAMIndexingModule_L28F35T86_Cast;
	assign LogicRAMIndexingModule_L26F34T85_Cast = LogicRAMIndexingModule_L26F41T84_Expr[7:0];
	assign MemLhsRhs = LogicRAMIndexingModule_L26F34T85_Cast;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
