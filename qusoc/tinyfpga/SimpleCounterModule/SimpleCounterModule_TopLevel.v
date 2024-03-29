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
// System configuration name is SimpleCounterModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module SimpleCounterModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	output wire [31:0] Counter
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F49T50_Expr = 1'b1;
	wire SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F34T35_Expr = 1'b0;
	reg [31: 0] NextState_counter;
	wire [9: 0] Addr;
	wire [31: 0] SimpleCounterModule_L29F29T59_Source;
	wire [9: 0] SimpleCounterModule_L29F29T67_Index;
	reg [31: 0] State_counter = 32'b00000000000000000000000000000000;
	wire [31: 0] State_counterDefault = 32'b00000000000000000000000000000000;
	reg [31: 0] State_read;
	wire [33: 0] SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr;
	wire signed [33: 0] SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr_1;
	wire signed [33: 0] SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr_2;
	wire SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_Expr;
	wire signed [32: 0] SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_ExprLhs;
	wire signed [32: 0] SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_ExprRhs;
	reg [31 : 0] State_buff [0 : 511];
	initial
	begin : Init_State_buff
$readmemh("SimpleCounterModule_TopLevel_State_buff.hex", State_buff);
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_counter <= State_counterDefault;
		end
		else
		begin
			State_counter <= NextState_counter;
		end
	end
	assign SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_Expr = SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_ExprLhs == SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_ExprRhs ? 1'b1 : 1'b0;
	assign SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr = SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr_1 + SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr_2;
	always @ (*)
	begin
		NextState_counter = State_counter;
		NextState_counter = SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr[31:0];
		if ((SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_Expr == 1))
		begin
		end
	end
// inferred simple dual port RAM with read-first behaviour
always @(posedge Clock) begin
	if (SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_Expr)
		State_buff[State_counter] <= State_counter;
end

always @(posedge Clock) begin
	State_read <= State_buff[Addr];
end

	assign SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_ExprLhs = { 1'b0, State_counter };
	assign SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F17T35_ExprRhs = { {32{1'b0}}, SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L35F34T35_Expr };
	assign SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr_1 = { {2{1'b0}}, State_counter };
	assign SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F33T50_Expr_2 = { {33{1'b0}}, SimpleCounterModule_L33F9L39T10_SimpleCounterModule_L34F49T50_Expr };
	assign SimpleCounterModule_L29F29T59_Source = State_counter;
	assign SimpleCounterModule_L29F29T67_Index = SimpleCounterModule_L29F29T59_Source[31:22];
	assign Addr = SimpleCounterModule_L29F29T67_Index;
	assign Counter = State_read;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
