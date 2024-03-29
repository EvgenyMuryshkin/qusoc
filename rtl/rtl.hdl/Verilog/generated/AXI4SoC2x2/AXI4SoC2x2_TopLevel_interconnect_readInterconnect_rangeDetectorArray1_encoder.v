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
// System configuration name is AXI4SoC2x2_TopLevel_interconnect_readInterconnect_rangeDetectorArray1_encoder, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4SoC2x2_TopLevel_interconnect_readInterconnect_rangeDetectorArray1_encoder
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire iValues0,
	input wire iValues1,
	output wire HasActive,
	output wire [0:0] MSBIndex,
	output wire [1:0] MSBValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [2: 0] inputWidth = 3'b010;
	wire signed [1: 0] resultWidth = 2'b01;
	wire AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F46T51_Expr = 1'b0;
	wire AXI4EncoderModule_L45F13L54T14_AXI4EncoderModule_L46F31T36_Expr = 1'b0;
	wire [0: 0] internalEncoded;
	wire internalHasActive;
	wire [0: 0] AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize;
	reg [0: 0] AXI4EncoderModule_L30F13L39T14_result;
	integer idx;
	wire [0: 0] AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize;
	reg AXI4EncoderModule_L45F13L54T14_result;
	integer idx1;
	wire [1: 0] AXI4EncoderModule_L59F40T101_ShiftLeft;
	wire [1: 0] AXI4EncoderModule_L59F40T121_Resize;
	wire [1: 0] AXI4EncoderModule_L59F40T101_Expr;
	wire [1: 0] AXI4EncoderModule_L59F40T101_Expr_1;
	wire Inputs_iValues [0 : 1];
	assign AXI4EncoderModule_L59F40T101_Expr = (AXI4EncoderModule_L59F40T101_Expr_1 << internalEncoded);
	always @ (*)
	begin
		idx = 2;
		AXI4EncoderModule_L30F13L39T14_result = AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize;
		for (idx = 2; (idx > 0); idx = (idx - 1))
		begin
			if (Inputs_iValues[(idx - 1)])
			begin
				AXI4EncoderModule_L30F13L39T14_result = (idx - 1);
			end
		end
	end
	always @ (*)
	begin
		idx1 = 0;
		AXI4EncoderModule_L45F13L54T14_result = AXI4EncoderModule_L45F13L54T14_AXI4EncoderModule_L46F31T36_Expr;
		for (idx1 = 0; (idx1 < 2); idx1 = (idx1 + 1))
		begin
			if (Inputs_iValues[idx1])
			begin
				AXI4EncoderModule_L45F13L54T14_result = (AXI4EncoderModule_L45F13L54T14_result | Inputs_iValues[idx1]);
			end
		end
	end
	assign AXI4EncoderModule_L59F40T101_Expr_1 = {
		1'b0,
		internalHasActive
	}
	;
	assign Inputs_iValues[0] = iValues0;
	assign Inputs_iValues[1] = iValues1;
	assign AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize[0] = AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F46T51_Expr;
	assign AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize = AXI4EncoderModule_L30F13L39T14_result;
	assign internalEncoded = AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T51_Resize;
	assign internalHasActive = AXI4EncoderModule_L45F13L54T14_result;
	assign HasActive = internalHasActive;
	assign MSBIndex = internalEncoded;
	assign AXI4EncoderModule_L59F40T101_ShiftLeft = AXI4EncoderModule_L59F40T101_Expr;
	assign AXI4EncoderModule_L59F40T121_Resize = AXI4EncoderModule_L59F40T101_ShiftLeft;
	assign MSBValue = AXI4EncoderModule_L59F40T121_Resize;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
