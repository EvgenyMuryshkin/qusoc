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
// System configuration name is BoardTimerModule_TopLevel_BoardTimerModule_timerModule10, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module BoardTimerModule_TopLevel_BoardTimerModule_timerModule10
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire Restart,
	output wire OutActive
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [3: 0] countTo = 4'b1001;
	wire [2: 0] CapacityBits = 3'b100;
	wire TimerModule_L51F9L53T10_TimerModule_L52F79T80_Expr = 1'b0;
	wire TimerModule_L51F9L53T10_TimerModule_L52F100T101_Expr = 1'b1;
	wire Inputs_Restart;
	reg [3: 0] NextState_counter;
	wire active;
	wire TimerModule_L51F9L53T10_TimerModule_L52F63T81_Source;
	wire [3: 0] TimerModule_L51F9L53T10_TimerModule_L52F33T124_Resize;
	wire [3: 0] TimerModule_L51F9L53T10_TimerModule_L52F33T135_SignChange;
	reg [3: 0] State_counter = 4'b0000;
	wire [3: 0] State_counterDefault = 4'b0000;
	wire TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr;
	wire TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr_1;
	wire TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr_2;
	wire [5: 0] TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr;
	wire signed [5: 0] TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr_1;
	wire signed [5: 0] TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr_2;
	wire TimerModule_L47F24T48_Expr;
	wire signed [4: 0] TimerModule_L47F24T48_ExprLhs;
	wire signed [4: 0] TimerModule_L47F24T48_ExprRhs;
	reg [3: 0] TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup;
	wire TimerModule_L51F9L53T10_TimerModule_L52F34T101_LookupMultiplexerAddress;
	wire [3: 0] TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup1;
	wire [3: 0] TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup2;
	always @ (posedge BoardSignals_Clock)
	begin
		if (((BoardSignals_Reset) == (1)))
		begin
			State_counter <= State_counterDefault;
		end
		else
		begin
			State_counter <= NextState_counter;
		end
	end
	assign TimerModule_L47F24T48_Expr = TimerModule_L47F24T48_ExprLhs == TimerModule_L47F24T48_ExprRhs ? 1'b1 : 1'b0;
	assign TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr = TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr_1 | TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr_2;
	assign TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr = TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr_1 + TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr_2;
	always @ (*)
	begin
		case (TimerModule_L51F9L53T10_TimerModule_L52F34T101_LookupMultiplexerAddress)
			'b0:
			begin
				TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup = TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup1;
			end
			'b1:
			begin
				TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup = TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup2;
			end
			default:
			begin
				TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup = 'b0000;
			end
		endcase
	end
	always @ (*)
	begin
		NextState_counter = State_counter;
		NextState_counter = TimerModule_L51F9L53T10_TimerModule_L52F33T135_SignChange;
	end
	assign TimerModule_L47F24T48_ExprLhs = { {1{1'b0}}, State_counter }/*expand*/;
	assign TimerModule_L47F24T48_ExprRhs = { {1{1'b0}}, countTo }/*expand*/;
	assign TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr_1 = Inputs_Restart;
	assign TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr_2 = active;
	assign TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr_1 = { {2{1'b0}}, State_counter }/*expand*/;
	assign TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr_2 = { {5{1'b0}}, TimerModule_L51F9L53T10_TimerModule_L52F100T101_Expr }/*expand*/;
	assign Inputs_Restart = Restart;
	assign active = TimerModule_L47F24T48_Expr;
	assign TimerModule_L51F9L53T10_TimerModule_L52F63T81_Source = TimerModule_L51F9L53T10_TimerModule_L52F79T80_Expr;
	assign TimerModule_L51F9L53T10_TimerModule_L52F33T124_Resize = TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup;
	assign TimerModule_L51F9L53T10_TimerModule_L52F33T135_SignChange = TimerModule_L51F9L53T10_TimerModule_L52F33T124_Resize;
	assign OutActive = active;
	assign TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup1 = TimerModule_L51F9L53T10_TimerModule_L52F84T101_Expr[3:0]/*truncate*/;
	assign TimerModule_L51F9L53T10_TimerModule_L52F34T101_Lookup2 = { {3{1'b0}}, TimerModule_L51F9L53T10_TimerModule_L52F63T81_Source }/*expand*/;
	assign TimerModule_L51F9L53T10_TimerModule_L52F34T101_LookupMultiplexerAddress = TimerModule_L51F9L53T10_TimerModule_L52F35T59_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
