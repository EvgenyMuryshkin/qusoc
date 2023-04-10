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
// System configuration name is NoWE_SP_WF_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module NoWE_SP_WF_RAMModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] Address,
	input wire [7:0] WriteData,
	output wire [7:0] Data
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] Inputs_Address;
	wire [7: 0] Inputs_WriteData;
	wire [7: 0] State_ReadData;
	integer State_Buff_Iterator;
	reg [7 : 0] State_Buff [0 : 255];
	initial
	begin : Init_State_Buff
		for (State_Buff_Iterator = 0; State_Buff_Iterator < 256; State_Buff_Iterator = State_Buff_Iterator + 1)
			State_Buff[State_Buff_Iterator] = 0;
	end
	// inferred single port RAM with write-first behaviour
	reg [7: 0] Inputs_Address_reg;
	always @ (posedge Clock)
	begin
		if (HiSignal)
		begin
			State_Buff[Inputs_Address] <= Inputs_WriteData;
		end
		Inputs_Address_reg <= Inputs_Address[7:0];
	end
	assign State_ReadData = State_Buff[Inputs_Address_reg];
	assign Inputs_Address = Address;
	assign Inputs_WriteData = WriteData;
	assign Data = State_ReadData;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
