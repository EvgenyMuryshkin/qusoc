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
// System configuration name is CounterModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module CounterModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire Enabled,
	output wire [7:0] Value
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire CounterModule_L19F65T66_Expr = 1'b1;
	wire Inputs_Enabled;
	reg [7: 0] NextState_Value;
	wire [7: 0] NextValue;
	wire [7: 0] CounterModule_L19F34T80_WhenTrue;
	wire [7: 0] CounterModule_L19F34T80_WhenFalse;
	wire [7: 0] CounterModule_L19F34T80_Ternary;
	wire [7: 0] CounterModule_L19F27T81_Cast;
	reg [7: 0] State_Value = 8'b00000000;
	wire [7: 0] State_ValueDefault = 8'b00000000;
	wire [9: 0] CounterModule_L19F51T66_Expr;
	wire signed [9: 0] CounterModule_L19F51T66_Expr_1;
	wire signed [9: 0] CounterModule_L19F51T66_Expr_2;
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_Value <= State_ValueDefault;
		end
		else
		begin
			State_Value <= NextState_Value;
		end
	end
	assign CounterModule_L19F51T66_Expr = CounterModule_L19F51T66_Expr_1 + CounterModule_L19F51T66_Expr_2;
	assign CounterModule_L19F34T80_Ternary = (Inputs_Enabled ? CounterModule_L19F34T80_WhenTrue : CounterModule_L19F34T80_WhenFalse);
	always @ (*)
	begin
		NextState_Value = State_Value;
		NextState_Value = NextValue;
	end
	assign CounterModule_L19F51T66_Expr_1 = { {2{1'b0}}, State_Value };
	assign CounterModule_L19F51T66_Expr_2 = { {9{1'b0}}, CounterModule_L19F65T66_Expr };
	assign Inputs_Enabled = Enabled;
	assign CounterModule_L19F34T80_WhenTrue = CounterModule_L19F51T66_Expr[7:0];
	assign CounterModule_L19F34T80_WhenFalse = State_Value;
	assign CounterModule_L19F27T81_Cast = CounterModule_L19F34T80_Ternary;
	assign NextValue = CounterModule_L19F27T81_Cast;
	assign Value = State_Value;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
