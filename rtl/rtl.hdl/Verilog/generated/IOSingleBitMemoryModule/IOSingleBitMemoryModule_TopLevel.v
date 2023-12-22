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
// System configuration name is IOSingleBitMemoryModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module IOSingleBitMemoryModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [0: 0] iBit,
	output wire [0: 0] oBit,
	output wire [0: 0] oBitInternal,
	output wire [0: 0] oBitState,
	output wire [0: 0] oBitStateInternal
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire Inputs_iBit;
	reg NextState_bit;
	reg NextState_bitInternal;
	wire bit;
	reg State_bit = 1'b0;
	wire State_bitDefault = 1'b0;
	reg State_bitInternal = 1'b0;
	wire State_bitInternalDefault = 1'b0;
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_bit <= State_bitDefault;
			State_bitInternal <= State_bitInternalDefault;
		end
		else
		begin
			State_bit <= NextState_bit;
			State_bitInternal <= NextState_bitInternal;
		end
	end
	always @ (*)
	begin
		NextState_bit = State_bit;
		NextState_bitInternal = State_bitInternal;
		NextState_bit = Inputs_iBit;
		NextState_bitInternal = bit;
	end
	assign Inputs_iBit = iBit;
	assign bit = Inputs_iBit;
	assign oBit = Inputs_iBit;
	assign oBitInternal = bit;
	assign oBitState = State_bit;
	assign oBitStateInternal = State_bitInternal;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
