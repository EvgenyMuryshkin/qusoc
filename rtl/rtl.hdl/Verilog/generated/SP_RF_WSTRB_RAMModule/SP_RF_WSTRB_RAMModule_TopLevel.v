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
// System configuration name is SP_RF_WSTRB_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module SP_RF_WSTRB_RAMModule_TopLevel
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
	wire SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_0_w = 1'b0;
	wire SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_1_w = 1'b1;
	wire [1: 0] SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_2_w = 2'b10;
	wire [1: 0] SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_3_w = 2'b11;
	wire [7: 0] Inputs_Address;
	wire Inputs_WE;
	wire [3: 0] Inputs_WSTRB;
	wire SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_0_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index;
	wire SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_1_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index;
	wire SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_2_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index;
	wire SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_3_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index;
	reg [7: 0] State_ReadDataDefault = 8'b00000000;
	reg [31: 0] State_BuffDefault = 32'b00000000000000000000000000000000;
	wire [7 : 0] Inputs_WriteData [0 : 3];
	integer State_ReadData_Iterator;
	reg [7 : 0] State_ReadData [0 : 3];
	initial
	begin : Init_State_ReadData
		for (State_ReadData_Iterator = 0; State_ReadData_Iterator < 4; State_ReadData_Iterator = State_ReadData_Iterator + 1)
			State_ReadData[State_ReadData_Iterator] = 0;
	end
	integer NextState_ReadData_Iterator;
	reg [7 : 0] NextState_ReadData [0 : 3];
	initial
	begin : Init_NextState_ReadData
		for (NextState_ReadData_Iterator = 0; NextState_ReadData_Iterator < 4; NextState_ReadData_Iterator = NextState_ReadData_Iterator + 1)
			NextState_ReadData[NextState_ReadData_Iterator] = 0;
	end
	integer State_Buff_Iterator;
	reg [31 : 0] State_Buff [0 : 31];
	initial
	begin : Init_State_Buff
$readmemh("SP_RF_WSTRB_RAMModule_TopLevel_State_Buff.hex", State_Buff);
	end
	integer NextState_Buff_Iterator;
	reg [31 : 0] NextState_Buff [0 : 31];
	initial
	begin : Init_NextState_Buff
		for (NextState_Buff_Iterator = 0; NextState_Buff_Iterator < 32; NextState_Buff_Iterator = NextState_Buff_Iterator + 1)
			NextState_Buff[NextState_Buff_Iterator] = 0;
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_ReadData_Iterator = 0; (State_ReadData_Iterator < 4); State_ReadData_Iterator = (State_ReadData_Iterator + 1))
			begin
				State_ReadData[State_ReadData_Iterator] <= State_ReadDataDefault;
			end
		end
		else
		begin
			for (State_ReadData_Iterator = 0; (State_ReadData_Iterator < 4); State_ReadData_Iterator = (State_ReadData_Iterator + 1))
			begin
				State_ReadData[State_ReadData_Iterator] <= NextState_ReadData[State_ReadData_Iterator];
			end
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_Buff_Iterator = 0; (State_Buff_Iterator < 32); State_Buff_Iterator = (State_Buff_Iterator + 1))
			begin
				State_Buff[State_Buff_Iterator] <= State_BuffDefault;
			end
		end
		else
		begin
			for (State_Buff_Iterator = 0; (State_Buff_Iterator < 32); State_Buff_Iterator = (State_Buff_Iterator + 1))
			begin
				State_Buff[State_Buff_Iterator] <= NextState_Buff[State_Buff_Iterator];
			end
		end
	end
	always @ (*)
	begin
		for (NextState_Buff_Iterator = 0; (NextState_Buff_Iterator < 32); NextState_Buff_Iterator = (NextState_Buff_Iterator + 1))
		begin
			NextState_Buff[NextState_Buff_Iterator] = State_Buff[NextState_Buff_Iterator];
		end
		for (NextState_ReadData_Iterator = 0; (NextState_ReadData_Iterator < 4); NextState_ReadData_Iterator = (NextState_ReadData_Iterator + 1))
		begin
			NextState_ReadData[NextState_ReadData_Iterator] = State_ReadData[NextState_ReadData_Iterator];
		end
		if ((SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_0_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index == 1))
		begin
			NextState_Buff[Inputs_Address][7:0] = Inputs_WriteData[0];
		end
		if ((SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_1_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index == 1))
		begin
			NextState_Buff[Inputs_Address][15:8] = Inputs_WriteData[1];
		end
		if ((SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_2_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index == 1))
		begin
			NextState_Buff[Inputs_Address][23:16] = Inputs_WriteData[2];
		end
		if ((SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_3_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index == 1))
		begin
			NextState_Buff[Inputs_Address][31:24] = Inputs_WriteData[3];
		end
		NextState_ReadData[0] = State_Buff[Inputs_Address][7:0];
		NextState_ReadData[1] = State_Buff[Inputs_Address][15:8];
		NextState_ReadData[2] = State_Buff[Inputs_Address][23:16];
		NextState_ReadData[3] = State_Buff[Inputs_Address][31:24];
	end
	assign Inputs_Address = Address;
	assign Inputs_WriteData[0] = WriteData0;
	assign Inputs_WriteData[1] = WriteData1;
	assign Inputs_WriteData[2] = WriteData2;
	assign Inputs_WriteData[3] = WriteData3;
	assign Inputs_WE = WE;
	assign Inputs_WSTRB = WSTRB;
	assign SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_0_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index = Inputs_WSTRB[SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_0_w];
	assign SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_1_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index = Inputs_WSTRB[SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_1_w];
	assign SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_2_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index = Inputs_WSTRB[SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_2_w];
	assign SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_3_SP_RF_WSTRB_RAMModule_L32F13L35T14_SP_RF_WSTRB_RAMModule_L33F21T36_Index = Inputs_WSTRB[SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_3_w];
	assign Data0 = State_ReadData[0];
	assign Data1 = State_ReadData[1];
	assign Data2 = State_ReadData[2];
	assign Data3 = State_ReadData[3];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
