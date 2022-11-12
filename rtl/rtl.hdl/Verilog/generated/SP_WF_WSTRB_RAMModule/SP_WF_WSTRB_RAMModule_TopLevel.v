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
// System configuration name is SP_WF_WSTRB_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module SP_WF_WSTRB_RAMModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] Address,
	input wire [7:0] WriteData0,
	input wire [7:0] WriteData1,
	input wire [7:0] WriteData2,
	input wire [7:0] WriteData3,
	input wire WE,
	input wire [3:0] WSTRB,
	output wire [31:0] Data
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire SP_WF_WSTRB_RAMModule_L30F9L38T10_SP_WF_WSTRB_RAMModule_L31F13L37T14_0_w = 1'b0;
	wire SP_WF_WSTRB_RAMModule_L30F9L38T10_SP_WF_WSTRB_RAMModule_L31F13L37T14_1_w = 1'b1;
	wire [1: 0] SP_WF_WSTRB_RAMModule_L30F9L38T10_SP_WF_WSTRB_RAMModule_L31F13L37T14_2_w = 2'b10;
	wire [1: 0] SP_WF_WSTRB_RAMModule_L30F9L38T10_SP_WF_WSTRB_RAMModule_L31F13L37T14_3_w = 2'b11;
	wire [7: 0] Inputs_Address;
	wire Inputs_WE;
	wire [3: 0] Inputs_WSTRB;
	wire [7 : 0] Inputs_WriteData [0 : 3];
	integer State_ReadData_Iterator;
	wire [7 : 0] State_ReadData [0 : 3];
	reg [7 : 0] State_Buff0 [0 : 31];
	integer State_Buff0_i;
	initial
	begin : Init_State_Buff0
		for (State_Buff0_i = 0; State_Buff0_i < 32; State_Buff0_i = State_Buff0_i + 1)
			State_Buff0[State_Buff0_i] = 0;
	end
	reg [7 : 0] State_Buff1 [0 : 31];
	integer State_Buff1_i;
	initial
	begin : Init_State_Buff1
		for (State_Buff1_i = 0; State_Buff1_i < 32; State_Buff1_i = State_Buff1_i + 1)
			State_Buff1[State_Buff1_i] = 0;
	end
	reg [7 : 0] State_Buff2 [0 : 31];
	integer State_Buff2_i;
	initial
	begin : Init_State_Buff2
		for (State_Buff2_i = 0; State_Buff2_i < 32; State_Buff2_i = State_Buff2_i + 1)
			State_Buff2[State_Buff2_i] = 0;
	end
	reg [7 : 0] State_Buff3 [0 : 31];
	integer State_Buff3_i;
	initial
	begin : Init_State_Buff3
		for (State_Buff3_i = 0; State_Buff3_i < 32; State_Buff3_i = State_Buff3_i + 1)
			State_Buff3[State_Buff3_i] = 0;
	end
	// inferred single port RAM with write-first behaviour
	reg [4: 0] Inputs_Address_reg0;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[0])
		begin
			State_Buff0[Inputs_Address] <= Inputs_WriteData[0];
		end
		Inputs_Address_reg0 <= Inputs_Address[4:0];
	end
	assign State_ReadData[0] = State_Buff0[Inputs_Address_reg0];
	// inferred single port RAM with write-first behaviour
	reg [4: 0] Inputs_Address_reg1;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[1])
		begin
			State_Buff1[Inputs_Address] <= Inputs_WriteData[1];
		end
		Inputs_Address_reg1 <= Inputs_Address[4:0];
	end
	assign State_ReadData[1] = State_Buff1[Inputs_Address_reg1];
	// inferred single port RAM with write-first behaviour
	reg [4: 0] Inputs_Address_reg2;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[2])
		begin
			State_Buff2[Inputs_Address] <= Inputs_WriteData[2];
		end
		Inputs_Address_reg2 <= Inputs_Address[4:0];
	end
	assign State_ReadData[2] = State_Buff2[Inputs_Address_reg2];
	// inferred single port RAM with write-first behaviour
	reg [4: 0] Inputs_Address_reg3;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[3])
		begin
			State_Buff3[Inputs_Address] <= Inputs_WriteData[3];
		end
		Inputs_Address_reg3 <= Inputs_Address[4:0];
	end
	assign State_ReadData[3] = State_Buff3[Inputs_Address_reg3];
	assign Inputs_Address = Address;
	assign Inputs_WriteData[0] = WriteData0;
	assign Inputs_WriteData[1] = WriteData1;
	assign Inputs_WriteData[2] = WriteData2;
	assign Inputs_WriteData[3] = WriteData3;
	assign Inputs_WE = WE;
	assign Inputs_WSTRB = WSTRB;
	assign Data = { State_ReadData[3], State_ReadData[2], State_ReadData[1], State_ReadData[0] };
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
