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
// System configuration name is AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_encoder, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_encoder
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire iValues0,
	input wire iValues1,
	input wire iValues2,
	input wire iValues3,
	input wire iValues4,
	input wire iValues5,
	input wire iValues6,
	input wire iValues7,
	output wire HasActive,
	output wire [2:0] MSBIndex,
	output wire [7:0] MSBValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [4: 0] inputWidth = 5'b01000;
	wire signed [2: 0] resultWidth = 3'b011;
	wire AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F46T51_Expr = 1'b0;
	wire AXI4EncoderModule_L45F13L54T14_AXI4EncoderModule_L46F31T36_Expr = 1'b0;
	wire [2: 0] internalEncoded;
	wire internalHasActive;
	wire [2: 0] AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize;
	reg [2: 0] AXI4EncoderModule_L30F13L39T14_result;
	integer idx;
	wire [2: 0] AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T41_SignChange;
	wire [2: 0] AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T62_Resize;
	reg AXI4EncoderModule_L45F13L54T14_result;
	integer idx1;
	wire [7: 0] AXI4EncoderModule_L59F40T101_ShiftLeft;
	wire [7: 0] AXI4EncoderModule_L59F40T121_Resize;
	wire [7: 0] AXI4EncoderModule_L59F40T101_Expr;
	wire [7: 0] AXI4EncoderModule_L59F40T101_Expr_1;
	wire Inputs_iValues [0 : 7];
	assign AXI4EncoderModule_L59F40T101_Expr = (AXI4EncoderModule_L59F40T101_Expr_1 << internalEncoded);
	always @ (*)
	begin
		idx = 8;
		AXI4EncoderModule_L30F13L39T14_result = AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize;
		for (idx = 8; (idx > 0); idx = (idx - 1))
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
		for (idx1 = 0; (idx1 < 8); idx1 = (idx1 + 1))
		begin
			if (Inputs_iValues[idx1])
			begin
				AXI4EncoderModule_L45F13L54T14_result = (AXI4EncoderModule_L45F13L54T14_result | Inputs_iValues[idx1]);
			end
		end
	end
	assign AXI4EncoderModule_L59F40T101_Expr_1 = {
		{7{1'b0}},
		internalHasActive
	}
	;
	assign Inputs_iValues[0] = iValues0;
	assign Inputs_iValues[1] = iValues1;
	assign Inputs_iValues[2] = iValues2;
	assign Inputs_iValues[3] = iValues3;
	assign Inputs_iValues[4] = iValues4;
	assign Inputs_iValues[5] = iValues5;
	assign Inputs_iValues[6] = iValues6;
	assign Inputs_iValues[7] = iValues7;
	assign AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F30T73_Resize = {
		{2{1'b0}},
		AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L31F46T51_Expr
	}
	;
	assign AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T41_SignChange = AXI4EncoderModule_L30F13L39T14_result;
	assign AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T62_Resize = AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T41_SignChange;
	assign internalEncoded = AXI4EncoderModule_L30F13L39T14_AXI4EncoderModule_L38F24T62_Resize;
	assign internalHasActive = AXI4EncoderModule_L45F13L54T14_result;
	assign HasActive = internalHasActive;
	assign MSBIndex = internalEncoded;
	assign AXI4EncoderModule_L59F40T101_ShiftLeft = AXI4EncoderModule_L59F40T101_Expr;
	assign AXI4EncoderModule_L59F40T121_Resize = AXI4EncoderModule_L59F40T101_ShiftLeft;
	assign MSBValue = AXI4EncoderModule_L59F40T121_Resize;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
