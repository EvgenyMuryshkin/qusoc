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
// System configuration name is SDP_WF_WSTRB_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module SDP_WF_WSTRB_RAMModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] ReadAddress,
	input wire WE,
	input wire [7:0] WriteAddress,
	input wire [7:0] WriteData0,
	input wire [7:0] WriteData1,
	input wire [7:0] WriteData2,
	input wire [7:0] WriteData3,
	input wire [3:0] WSTRB,
	output wire [7:0] Data0,
	output wire [7:0] Data1,
	output wire [7:0] Data2,
	output wire [7:0] Data3
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] Inputs_ReadAddress;
	wire Inputs_WE;
	wire [7: 0] Inputs_WriteAddress;
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
	// inferred simple dual port RAM with write-first behaviour
	reg [4: 0] Inputs_ReadAddress_reg0;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[0])
		begin
			State_Buff0[Inputs_WriteAddress] <= Inputs_WriteData[0];
		end
		Inputs_ReadAddress_reg0 <= Inputs_ReadAddress[4:0];
	end
	assign State_ReadData[0] = State_Buff0[Inputs_ReadAddress_reg0];
	// inferred simple dual port RAM with write-first behaviour
	reg [4: 0] Inputs_ReadAddress_reg1;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[1])
		begin
			State_Buff1[Inputs_WriteAddress] <= Inputs_WriteData[1];
		end
		Inputs_ReadAddress_reg1 <= Inputs_ReadAddress[4:0];
	end
	assign State_ReadData[1] = State_Buff1[Inputs_ReadAddress_reg1];
	// inferred simple dual port RAM with write-first behaviour
	reg [4: 0] Inputs_ReadAddress_reg2;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[2])
		begin
			State_Buff2[Inputs_WriteAddress] <= Inputs_WriteData[2];
		end
		Inputs_ReadAddress_reg2 <= Inputs_ReadAddress[4:0];
	end
	assign State_ReadData[2] = State_Buff2[Inputs_ReadAddress_reg2];
	// inferred simple dual port RAM with write-first behaviour
	reg [4: 0] Inputs_ReadAddress_reg3;
	always @ (posedge Clock)
	begin
		if (Inputs_WSTRB[3])
		begin
			State_Buff3[Inputs_WriteAddress] <= Inputs_WriteData[3];
		end
		Inputs_ReadAddress_reg3 <= Inputs_ReadAddress[4:0];
	end
	assign State_ReadData[3] = State_Buff3[Inputs_ReadAddress_reg3];
	assign Inputs_ReadAddress = ReadAddress;
	assign Inputs_WE = WE;
	assign Inputs_WriteAddress = WriteAddress;
	assign Inputs_WriteData[0] = WriteData0;
	assign Inputs_WriteData[1] = WriteData1;
	assign Inputs_WriteData[2] = WriteData2;
	assign Inputs_WriteData[3] = WriteData3;
	assign Inputs_WSTRB = WSTRB;
	assign Data0 = State_ReadData[0];
	assign Data1 = State_ReadData[1];
	assign Data2 = State_ReadData[2];
	assign Data3 = State_ReadData[3];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
