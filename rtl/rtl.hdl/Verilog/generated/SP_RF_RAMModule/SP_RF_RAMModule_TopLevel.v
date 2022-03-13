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
// System configuration name is SP_RF_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module SP_RF_RAMModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] Address,
	input wire [7:0] WriteData,
	input wire WE,
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
	wire Inputs_WE;
	reg [7: 0] State_ReadData;
	reg [7 : 0] State_Buff [0 : 255];
	integer State_Buff_i;
	initial
	begin : Init_State_Buff
		for (State_Buff_i = 0; State_Buff_i < 256; State_Buff_i = State_Buff_i + 1)
			State_Buff[State_Buff_i] = 0;
	end
// inferred single port RAM with read-first behaviour
always @ (posedge Clock)
begin
	if (Inputs_WE)
		State_Buff[Inputs_Address] <= Inputs_WriteData;

	State_ReadData <= State_Buff[Inputs_Address];
end

	assign Inputs_Address = Address;
	assign Inputs_WriteData = WriteData;
	assign Inputs_WE = WE;
	assign Data = State_ReadData;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
