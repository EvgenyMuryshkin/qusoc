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
// System configuration name is CompositionModule_TopLevel_Emitter, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module CompositionModule_TopLevel_Emitter
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire Ack,
	input wire IsEnabled,
	output wire [7:0] Data,
	output wire HasData
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire EmitterModule_L22F9L25T10_EmitterModule_L24F54T55_Expr = 1'b1;
	wire Inputs_Ack;
	wire Inputs_IsEnabled;
	reg [7: 0] NextState_Data;
	wire [7: 0] EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast;
	reg [7: 0] State_Data = 8'b00000000;
	wire [7: 0] State_DataDefault = 8'b00000000;
	wire EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr;
	wire EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1;
	wire EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2;
	wire [9: 0] EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr;
	wire signed [9: 0] EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1;
	wire signed [9: 0] EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2;
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_Data <= State_DataDefault;
		end
		else
		begin
			State_Data <= NextState_Data;
		end
	end
	assign EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr = EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1 & EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2;
	assign EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr = EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1 + EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2;
	always @ (*)
	begin
		NextState_Data = State_Data;
		if ((EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr == 1))
		begin
			NextState_Data = EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast;
		end
	end
	assign EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_1 = Inputs_IsEnabled;
	assign EmitterModule_L22F9L25T10_EmitterModule_L23F17T47_Expr_2 = Inputs_Ack;
	assign EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_1 = { {2{1'b0}}, State_Data };
	assign EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr_2 = { {9{1'b0}}, EmitterModule_L22F9L25T10_EmitterModule_L24F54T55_Expr };
	assign Inputs_Ack = Ack;
	assign Inputs_IsEnabled = IsEnabled;
	assign EmitterModule_L22F9L25T10_EmitterModule_L24F34T56_Cast = EmitterModule_L22F9L25T10_EmitterModule_L24F41T55_Expr[7:0];
	assign Data = State_Data;
	assign HasData = Inputs_IsEnabled;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
