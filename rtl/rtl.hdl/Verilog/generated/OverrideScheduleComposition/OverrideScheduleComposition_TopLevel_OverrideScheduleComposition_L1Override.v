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
// System configuration name is OverrideScheduleComposition_TopLevel_OverrideScheduleComposition_L1Override, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module OverrideScheduleComposition_TopLevel_OverrideScheduleComposition_L1Override
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire InOverride,
	input wire [7: 0] InValue,
	output wire [7: 0] OutValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire CombinationalOverridesBase_L16F50T51_Expr = 1'b1;
	wire [1: 0] CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F44T45_Expr = 2'b10;
	wire [1: 0] CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F44T45_Expr = 2'b10;
	wire Inputs_InOverride;
	wire [7: 0] Inputs_InValue;
	wire [7: 0] InternalOffset;
	wire [7: 0] CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F20T46_Cast;
	wire [7: 0] CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F20T46_Cast;
	wire [9: 0] CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr;
	wire signed [9: 0] CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr_1;
	wire signed [9: 0] CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr_2;
	wire signed [9: 0] CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr;
	wire signed [9: 0] CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr_1;
	wire signed [9: 0] CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr_2;
	reg [7: 0] CombinationalOverridesBase_L14F41T96_Lookup;
	wire CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress;
	wire [7: 0] CombinationalOverridesBase_L14F41T96_Lookup1;
	wire [7: 0] CombinationalOverridesBase_L14F41T96_Lookup2;
	assign CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr = CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr_1 + CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr_2;
	assign CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr = CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr_1 - CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr_2;
	always @ (*)
	begin
		case (CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress)
			'b0:
			begin
				CombinationalOverridesBase_L14F41T96_Lookup = CombinationalOverridesBase_L14F41T96_Lookup1;
			end
			'b1:
			begin
				CombinationalOverridesBase_L14F41T96_Lookup = CombinationalOverridesBase_L14F41T96_Lookup2;
			end
			default:
			begin
				CombinationalOverridesBase_L14F41T96_Lookup = 'b00000000;
			end
		endcase
	end
	assign CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
	assign CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr_2 = { {8{1'b0}}, CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F44T45_Expr }/*expand*/;
	assign CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
	assign CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr_2 = { {8{1'b0}}, CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F44T45_Expr }/*expand*/;
	assign Inputs_InOverride = InOverride;
	assign Inputs_InValue = InValue;
	assign InternalOffset = { {7{1'b0}}, CombinationalOverridesBase_L16F50T51_Expr }/*expand*/;
	assign CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F20T46_Cast = CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F27T45_Expr[7:0]/*truncate*/;
	assign CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F20T46_Cast = CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F27T45_Expr[7:0]/*truncate*/;
	assign OutValue = CombinationalOverridesBase_L14F41T96_Lookup;
	assign CombinationalOverridesBase_L14F41T96_Lookup1 = CombinationalOverridesBase_L14F80T96_CombinationalL1Override_L10F9L12T10_CombinationalL1Override_L11F20T46_Cast;
	assign CombinationalOverridesBase_L14F41T96_Lookup2 = CombinationalOverridesBase_L14F61T77_CombinationalL1Override_L15F9L17T10_CombinationalL1Override_L16F20T46_Cast;
	assign CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress = Inputs_InOverride;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
