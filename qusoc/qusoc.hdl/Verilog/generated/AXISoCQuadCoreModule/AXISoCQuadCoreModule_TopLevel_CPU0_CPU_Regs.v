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
// System configuration name is AXISoCQuadCoreModule_TopLevel_CPU0_CPU_Regs, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_CPU0_CPU_Regs
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [4:0] RD,
	input wire Read,
	input wire [4:0] RS1Addr,
	input wire [4:0] RS2Addr,
	input wire WE,
	input wire [31:0] WriteData,
	output wire Ready,
	output wire [31:0] RS1,
	output wire [31:0] RS2
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F45T46_Expr = 1'b0;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F48T49_Expr = 1'b0;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L34F31T36_Expr = 1'b0;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F46T47_Expr = 1'b0;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L37F13L39T14_RegistersRAMModule_L38F34T35_Expr = 1'b1;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F31T32_Expr = 1'b1;
	wire [1: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L42F13L45T14_RegistersRAMModule_L43F34T35_Expr = 2'b10;
	wire [1: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F31T32_Expr = 2'b10;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L48F13L52T14_RegistersRAMModule_L49F35T39_Expr = 1'b1;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L48F13L52T14_RegistersRAMModule_L50F34T35_Expr = 1'b0;
	wire [4: 0] Inputs_RD;
	wire Inputs_Read;
	wire [4: 0] Inputs_RS1Addr;
	wire [4: 0] Inputs_RS2Addr;
	wire Inputs_WE;
	wire [31: 0] Inputs_WriteData;
	reg [7: 0] NextState_Mode;
	reg NextState_Ready;
	reg [31: 0] NextState_RS1;
	reg [31: 0] NextState_RS2;
	wire [4: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_WhenTrue;
	wire [4: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_WhenFalse;
	wire [4: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_Ternary;
	reg [4: 0] RegistersRAMModule_L25F9L53T10_readAddress;
	reg RegistersRAMModule_L25F9L53T10_we;
	reg [7: 0] State_Mode = 8'b00000000;
	wire [7: 0] State_ModeDefault = 8'b00000000;
	reg [31: 0] State_ReadData;
	reg State_Ready = 1'b0;
	wire State_ReadyDefault = 1'b0;
	reg [31: 0] State_RS1 = 32'b00000000000000000000000000000000;
	wire [31: 0] State_RS1Default = 32'b00000000000000000000000000000000;
	reg [31: 0] State_RS2 = 32'b00000000000000000000000000000000;
	wire [31: 0] State_RS2Default = 32'b00000000000000000000000000000000;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr_1;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr_2;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr_1;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr_2;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_Expr;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_ExprLhs;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_ExprRhs;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_Expr;
	wire signed [5: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_ExprLhs;
	wire signed [5: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_ExprRhs;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_Expr;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_ExprLhs;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_ExprRhs;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_Expr;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_ExprLhs;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_ExprRhs;
	wire RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_Expr;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_ExprLhs;
	wire signed [8: 0] RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_ExprRhs;
	integer State_x_Iterator;
	reg [31 : 0] State_x [0 : 31];
	initial
	begin : Init_State_x
		for (State_x_Iterator = 0; State_x_Iterator < 32; State_x_Iterator = State_x_Iterator + 1)
			State_x[State_x_Iterator] = 0;
	end
	// inferred simple dual port RAM with read-first behaviour
	always @ (posedge BoardSignals_Clock)
	begin
		if (RegistersRAMModule_L25F9L53T10_we)
		begin
			State_x[Inputs_RD] <= Inputs_WriteData;
		end
		State_ReadData <= State_x[RegistersRAMModule_L25F9L53T10_readAddress];
	end
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_Mode <= State_ModeDefault;
			State_Ready <= State_ReadyDefault;
			State_RS1 <= State_RS1Default;
			State_RS2 <= State_RS2Default;
		end
		else
		begin
			State_Mode <= NextState_Mode;
			State_Ready <= NextState_Ready;
			State_RS1 <= NextState_RS1;
			State_RS2 <= NextState_RS2;
		end
	end
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_ExprLhs == RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_ExprRhs ? 1'b1 : 1'b0;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_ExprLhs != RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_ExprRhs ? 1'b1 : 1'b0;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_ExprLhs == RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_ExprRhs ? 1'b1 : 1'b0;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_ExprLhs == RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_ExprRhs ? 1'b1 : 1'b0;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_ExprLhs == RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_ExprRhs ? 1'b1 : 1'b0;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr_1 & RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr_2;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr_1 & RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr_2;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_Ternary = (RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_Expr ? RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_WhenTrue : RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_WhenFalse);
	always @ (*)
	begin
		NextState_Mode = State_Mode;
		NextState_Ready = State_Ready;
		NextState_RS1 = State_RS1;
		NextState_RS2 = State_RS2;
		RegistersRAMModule_L25F9L53T10_readAddress = {
			{4{1'b0}},
			Zero
		}
		;
		RegistersRAMModule_L25F9L53T10_we = Zero;
		RegistersRAMModule_L25F9L53T10_readAddress = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_Ternary;
		RegistersRAMModule_L25F9L53T10_we = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr;
		NextState_Ready = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L34F31T36_Expr;
		if ((RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr == 1))
		begin
			NextState_Mode = {
				{7{1'b0}},
				RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L37F13L39T14_RegistersRAMModule_L38F34T35_Expr
			}
			;
		end
		if ((RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_Expr == 1))
		begin
			NextState_Mode = {
				{6{1'b0}},
				RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L42F13L45T14_RegistersRAMModule_L43F34T35_Expr
			}
			;
			NextState_RS1 = State_ReadData;
		end
		if ((RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_Expr == 1))
		begin
			NextState_Ready = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L48F13L52T14_RegistersRAMModule_L49F35T39_Expr;
			NextState_Mode = {
				{7{1'b0}},
				RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L48F13L52T14_RegistersRAMModule_L50F34T35_Expr
			}
			;
			NextState_RS2 = State_ReadData;
		end
	end
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_ExprLhs = {
		1'b0,
		State_Mode
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T46_ExprRhs = {
		{8{1'b0}},
		RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F45T46_Expr
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_ExprLhs = {
		1'b0,
		Inputs_RD
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_ExprRhs = {
		{5{1'b0}},
		RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F48T49_Expr
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_ExprLhs = {
		1'b0,
		State_Mode
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_ExprRhs = {
		{8{1'b0}},
		RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F46T47_Expr
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_ExprLhs = {
		1'b0,
		State_Mode
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F17T32_ExprRhs = {
		{8{1'b0}},
		RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L41F31T32_Expr
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_ExprLhs = {
		1'b0,
		State_Mode
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F17T32_ExprRhs = {
		{7{1'b0}},
		RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L47F31T32_Expr
	}
	;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr_1 = Inputs_WE;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F22T49_Expr_2 = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L27F35T49_Expr;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr_1 = Inputs_Read;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F17T47_Expr_2 = RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L36F32T47_Expr;
	assign Inputs_RD = RD;
	assign Inputs_Read = Read;
	assign Inputs_RS1Addr = RS1Addr;
	assign Inputs_RS2Addr = RS2Addr;
	assign Inputs_WE = WE;
	assign Inputs_WriteData = WriteData;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_WhenTrue = Inputs_RS1Addr;
	assign RegistersRAMModule_L25F9L53T10_RegistersRAMModule_L26F31T80_WhenFalse = Inputs_RS2Addr;
	assign Ready = State_Ready;
	assign RS1 = State_RS1;
	assign RS2 = State_RS2;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
