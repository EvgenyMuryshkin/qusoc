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
// System configuration name is StructsCombinationalIteratorModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module StructsCombinationalIteratorModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [1:0] addr,
	input wire [3:0] i1_a,
	input wire [3:0] i1_b,
	input wire [3:0] i2_a,
	input wire [3:0] i2_b,
	input wire signed [7:0] s1,
	input wire signed [7:0] s2,
	input wire store,
	output wire [3:0] cStruct0_a,
	output wire [3:0] cStruct0_b,
	output wire [3:0] cStruct1_a,
	output wire [3:0] cStruct1_b,
	output wire [3:0] cStruct2_a,
	output wire [3:0] cStruct2_b,
	output wire [3:0] cStruct3_a,
	output wire [3:0] cStruct3_b,
	output wire [3:0] fStruct0_a,
	output wire [3:0] fStruct0_b,
	output wire [3:0] fStruct1_a,
	output wire [3:0] fStruct1_b,
	output wire [3:0] fStruct2_a,
	output wire [3:0] fStruct2_b,
	output wire [3:0] fStruct3_a,
	output wire [3:0] fStruct3_b,
	output wire signed [7:0] sByte,
	output wire signed [15:0] sOut,
	output wire [11:0] sStruct0_a,
	output wire [11:0] sStruct0_b,
	output wire [11:0] sStruct1_a,
	output wire [11:0] sStruct1_b,
	output wire [11:0] sStruct2_a,
	output wire [11:0] sStruct2_b,
	output wire [11:0] sStruct3_a,
	output wire [11:0] sStruct3_b
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] State_cDefault = 8'b00000000;
	wire [7: 0] State_fDefault = 8'b00000000;
	wire [7: 0] State_i1Default = 8'b00000000;
	wire [7: 0] State_i2Default = 8'b00000000;
	wire [23: 0] State_oDefault = 24'b000000000000000000000000;
	wire [3: 0] StructsCombinationalIteratorModule_L75F9L101T10_StructsCombinationalIteratorModule_L90F13L94T14_StructsCombinationalIteratorModule_L92F71T73_Expr = 4'b1010;
	wire [3: 0] StructsCombinationalIteratorModule_L75F9L101T10_StructsCombinationalIteratorModule_L90F13L94T14_StructsCombinationalIteratorModule_L93F71T73_Expr = 4'b1011;
	wire [1: 0] Inputs_addr;
	wire [3: 0] Inputs_i1_a;
	wire [3: 0] Inputs_i1_b;
	wire [3: 0] Inputs_i2_a;
	wire [3: 0] Inputs_i2_b;
	wire signed [7: 0] Inputs_s1;
	wire signed [7: 0] Inputs_s2;
	wire Inputs_store;
	integer i;
	integer i1;
	integer i2;
	wire signed [7: 0] StructsCombinationalIteratorModule_L69F31T61_Cast;
	wire signed [15: 0] StructsCombinationalIteratorModule_L68F30T60_Cast;
	wire signed [15: 0] StructsCombinationalIteratorModule_L69F39T60_Expr;
	wire signed [15: 0] StructsCombinationalIteratorModule_L69F39T60_Expr_1;
	wire signed [15: 0] StructsCombinationalIteratorModule_L69F39T60_Expr_2;
	wire signed [15: 0] StructsCombinationalIteratorModule_L68F38T59_Expr;
	wire signed [15: 0] StructsCombinationalIteratorModule_L68F38T59_Expr_1;
	wire signed [15: 0] StructsCombinationalIteratorModule_L68F38T59_Expr_2;
	integer State_c_Iterator;
	reg [7 : 0] State_c [0 : 3];
	initial
	begin : Init_State_c
		for (State_c_Iterator = 0; State_c_Iterator < 4; State_c_Iterator = State_c_Iterator + 1)
			State_c[State_c_Iterator] = 0;
	end
	integer NextState_c_Iterator;
	reg [7 : 0] NextState_c [0 : 3];
	initial
	begin : Init_NextState_c
		for (NextState_c_Iterator = 0; NextState_c_Iterator < 4; NextState_c_Iterator = NextState_c_Iterator + 1)
			NextState_c[NextState_c_Iterator] = 0;
	end
	integer State_f_Iterator;
	reg [7 : 0] State_f [0 : 3];
	initial
	begin : Init_State_f
		for (State_f_Iterator = 0; State_f_Iterator < 4; State_f_Iterator = State_f_Iterator + 1)
			State_f[State_f_Iterator] = 0;
	end
	integer NextState_f_Iterator;
	reg [7 : 0] NextState_f [0 : 3];
	initial
	begin : Init_NextState_f
		for (NextState_f_Iterator = 0; NextState_f_Iterator < 4; NextState_f_Iterator = NextState_f_Iterator + 1)
			NextState_f[NextState_f_Iterator] = 0;
	end
	integer State_i1_Iterator;
	reg [7 : 0] State_i1 [0 : 3];
	initial
	begin : Init_State_i1
		for (State_i1_Iterator = 0; State_i1_Iterator < 4; State_i1_Iterator = State_i1_Iterator + 1)
			State_i1[State_i1_Iterator] = 0;
	end
	integer NextState_i1_Iterator;
	reg [7 : 0] NextState_i1 [0 : 3];
	initial
	begin : Init_NextState_i1
		for (NextState_i1_Iterator = 0; NextState_i1_Iterator < 4; NextState_i1_Iterator = NextState_i1_Iterator + 1)
			NextState_i1[NextState_i1_Iterator] = 0;
	end
	integer State_i2_Iterator;
	reg [7 : 0] State_i2 [0 : 3];
	initial
	begin : Init_State_i2
		for (State_i2_Iterator = 0; State_i2_Iterator < 4; State_i2_Iterator = State_i2_Iterator + 1)
			State_i2[State_i2_Iterator] = 0;
	end
	integer NextState_i2_Iterator;
	reg [7 : 0] NextState_i2 [0 : 3];
	initial
	begin : Init_NextState_i2
		for (NextState_i2_Iterator = 0; NextState_i2_Iterator < 4; NextState_i2_Iterator = NextState_i2_Iterator + 1)
			NextState_i2[NextState_i2_Iterator] = 0;
	end
	integer State_o_Iterator;
	reg [23 : 0] State_o [0 : 3];
	initial
	begin : Init_State_o
		for (State_o_Iterator = 0; State_o_Iterator < 4; State_o_Iterator = State_o_Iterator + 1)
			State_o[State_o_Iterator] = 0;
	end
	integer NextState_o_Iterator;
	reg [23 : 0] NextState_o [0 : 3];
	initial
	begin : Init_NextState_o
		for (NextState_o_Iterator = 0; NextState_o_Iterator < 4; NextState_o_Iterator = NextState_o_Iterator + 1)
			NextState_o[NextState_o_Iterator] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_c_Iterator = 0; (State_c_Iterator < 4); State_c_Iterator = (State_c_Iterator + 1))
			begin
				State_c[State_c_Iterator] <= State_cDefault;
			end
		end
		else
		begin
			for (State_c_Iterator = 0; (State_c_Iterator < 4); State_c_Iterator = (State_c_Iterator + 1))
			begin
				State_c[State_c_Iterator] <= NextState_c[State_c_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_f_Iterator = 0; (State_f_Iterator < 4); State_f_Iterator = (State_f_Iterator + 1))
			begin
				State_f[State_f_Iterator] <= State_fDefault;
			end
		end
		else
		begin
			for (State_f_Iterator = 0; (State_f_Iterator < 4); State_f_Iterator = (State_f_Iterator + 1))
			begin
				State_f[State_f_Iterator] <= NextState_f[State_f_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_i1_Iterator = 0; (State_i1_Iterator < 4); State_i1_Iterator = (State_i1_Iterator + 1))
			begin
				State_i1[State_i1_Iterator] <= State_i1Default;
			end
		end
		else
		begin
			for (State_i1_Iterator = 0; (State_i1_Iterator < 4); State_i1_Iterator = (State_i1_Iterator + 1))
			begin
				State_i1[State_i1_Iterator] <= NextState_i1[State_i1_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_i2_Iterator = 0; (State_i2_Iterator < 4); State_i2_Iterator = (State_i2_Iterator + 1))
			begin
				State_i2[State_i2_Iterator] <= State_i2Default;
			end
		end
		else
		begin
			for (State_i2_Iterator = 0; (State_i2_Iterator < 4); State_i2_Iterator = (State_i2_Iterator + 1))
			begin
				State_i2[State_i2_Iterator] <= NextState_i2[State_i2_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_o_Iterator = 0; (State_o_Iterator < 4); State_o_Iterator = (State_o_Iterator + 1))
			begin
				State_o[State_o_Iterator] <= State_oDefault;
			end
		end
		else
		begin
			for (State_o_Iterator = 0; (State_o_Iterator < 4); State_o_Iterator = (State_o_Iterator + 1))
			begin
				State_o[State_o_Iterator] <= NextState_o[State_o_Iterator];
			end
		end
	end
	assign StructsCombinationalIteratorModule_L69F39T60_Expr = StructsCombinationalIteratorModule_L69F39T60_Expr_1 * StructsCombinationalIteratorModule_L69F39T60_Expr_2;
	assign StructsCombinationalIteratorModule_L68F38T59_Expr = StructsCombinationalIteratorModule_L68F38T59_Expr_1 * StructsCombinationalIteratorModule_L68F38T59_Expr_2;
	always @ (*)
	begin
		NextState_c_Iterator = 0;
		NextState_f_Iterator = 0;
		NextState_i1_Iterator = 0;
		NextState_i2_Iterator = 0;
		NextState_o_Iterator = 0;
		i = 0;
		i1 = 0;
		i2 = 0;
		for (NextState_c_Iterator = 0; (NextState_c_Iterator < 4); NextState_c_Iterator = (NextState_c_Iterator + 1))
		begin
			NextState_c[NextState_c_Iterator] = State_c[NextState_c_Iterator];
		end
		for (NextState_f_Iterator = 0; (NextState_f_Iterator < 4); NextState_f_Iterator = (NextState_f_Iterator + 1))
		begin
			NextState_f[NextState_f_Iterator] = State_f[NextState_f_Iterator];
		end
		for (NextState_i1_Iterator = 0; (NextState_i1_Iterator < 4); NextState_i1_Iterator = (NextState_i1_Iterator + 1))
		begin
			NextState_i1[NextState_i1_Iterator] = State_i1[NextState_i1_Iterator];
		end
		for (NextState_i2_Iterator = 0; (NextState_i2_Iterator < 4); NextState_i2_Iterator = (NextState_i2_Iterator + 1))
		begin
			NextState_i2[NextState_i2_Iterator] = State_i2[NextState_i2_Iterator];
		end
		for (NextState_o_Iterator = 0; (NextState_o_Iterator < 4); NextState_o_Iterator = (NextState_o_Iterator + 1))
		begin
			NextState_o[NextState_o_Iterator] = State_o[NextState_o_Iterator];
		end
		if ((Inputs_store == 1))
		begin
			NextState_i1[Inputs_addr] = { Inputs_i1_b, Inputs_i1_a };
			NextState_i2[Inputs_addr] = { Inputs_i2_b, Inputs_i2_a };
		end
		else
		begin
			for (i = 0; (i < 4); i = (i + 1))
			begin
				NextState_o[i][11:0] = ((resize_signed_6_12(resize_signed_4_6(State_i1[i][3:0]))) * (resize_signed_6_12(resize_signed_4_6(State_i2[i][3:0]))));
				NextState_o[i][23:12] = ((resize_unsigned_6_12(resize_unsigned_4_6(State_i1[i][7:4]))) * (resize_unsigned_6_12(resize_unsigned_4_6(State_i2[i][7:4]))));
			end
		end
		for (i1 = 0; (i1 < 4); i1 = (i1 + 1))
		begin
			NextState_c[i1][3:0] = (((Inputs_addr == 0)) ? StructsCombinationalIteratorModule_L75F9L101T10_StructsCombinationalIteratorModule_L90F13L94T14_StructsCombinationalIteratorModule_L92F71T73_Expr : Inputs_i1_a);
			NextState_c[i1][7:4] = (((Inputs_addr != 0)) ? StructsCombinationalIteratorModule_L75F9L101T10_StructsCombinationalIteratorModule_L90F13L94T14_StructsCombinationalIteratorModule_L93F71T73_Expr : Inputs_i1_b);
		end
		for (i2 = 0; (i2 < 4); i2 = (i2 + 1))
		begin
			NextState_f[i2][3:0] = (Inputs_store ? Inputs_i1_b : Inputs_i1_a);
			NextState_f[i2][7:4] = (((~Inputs_store)) ? Inputs_i1_a : Inputs_i1_b);
		end
	end
	assign StructsCombinationalIteratorModule_L69F39T60_Expr_1 = { {8{Inputs_s1[7]}}, Inputs_s1 };
	assign StructsCombinationalIteratorModule_L69F39T60_Expr_2 = { {8{Inputs_s2[7]}}, Inputs_s2 };
	assign StructsCombinationalIteratorModule_L68F38T59_Expr_1 = { {8{Inputs_s1[7]}}, Inputs_s1 };
	assign StructsCombinationalIteratorModule_L68F38T59_Expr_2 = { {8{Inputs_s2[7]}}, Inputs_s2 };
	assign Inputs_addr = addr;
	assign Inputs_i1_a = i1_a;
	assign Inputs_i1_b = i1_b;
	assign Inputs_i2_a = i2_a;
	assign Inputs_i2_b = i2_b;
	assign Inputs_s1 = s1;
	assign Inputs_s2 = s2;
	assign Inputs_store = store;
	assign cStruct0_a = State_c[0][3:0];
	assign cStruct0_b = State_c[0][7:4];
	assign cStruct1_a = State_c[1][3:0];
	assign cStruct1_b = State_c[1][7:4];
	assign cStruct2_a = State_c[2][3:0];
	assign cStruct2_b = State_c[2][7:4];
	assign cStruct3_a = State_c[3][3:0];
	assign cStruct3_b = State_c[3][7:4];
	assign fStruct0_a = State_f[0][3:0];
	assign fStruct0_b = State_f[0][7:4];
	assign fStruct1_a = State_f[1][3:0];
	assign fStruct1_b = State_f[1][7:4];
	assign fStruct2_a = State_f[2][3:0];
	assign fStruct2_b = State_f[2][7:4];
	assign fStruct3_a = State_f[3][3:0];
	assign fStruct3_b = State_f[3][7:4];
	assign StructsCombinationalIteratorModule_L69F31T61_Cast = StructsCombinationalIteratorModule_L69F39T60_Expr[7:0];
	assign sByte = StructsCombinationalIteratorModule_L69F31T61_Cast;
	assign StructsCombinationalIteratorModule_L68F30T60_Cast = StructsCombinationalIteratorModule_L68F38T59_Expr;
	assign sOut = StructsCombinationalIteratorModule_L68F30T60_Cast;
	assign sStruct0_a = State_o[0][11:0];
	assign sStruct0_b = State_o[0][23:12];
	assign sStruct1_a = State_o[1][11:0];
	assign sStruct1_b = State_o[1][23:12];
	assign sStruct2_a = State_o[2][11:0];
	assign sStruct2_b = State_o[2][23:12];
	assign sStruct3_a = State_o[3][11:0];
	assign sStruct3_b = State_o[3][23:12];
	function
	[5: 0] resize_signed_4_6;
		input wire signed [3:0] source;
		begin
			resize_signed_4_6 = { {2{source[3]}}, source };
		end
	endfunction
	function
	[11: 0] resize_signed_6_12;
		input wire signed [5:0] source;
		begin
			resize_signed_6_12 = { {6{source[5]}}, source };
		end
	endfunction
	function
	[5: 0] resize_unsigned_4_6;
		input wire [3:0] source;
		begin
			resize_unsigned_4_6 = { {2{1'b0}}, source };
		end
	endfunction
	function
	[11: 0] resize_unsigned_6_12;
		input wire [5:0] source;
		begin
			resize_unsigned_6_12 = { {6{1'b0}}, source };
		end
	endfunction
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
