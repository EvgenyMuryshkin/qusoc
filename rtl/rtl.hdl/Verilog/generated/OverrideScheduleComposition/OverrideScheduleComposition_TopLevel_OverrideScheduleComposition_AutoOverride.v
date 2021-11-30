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
// System configuration name is OverrideScheduleComposition_TopLevel_OverrideScheduleComposition_AutoOverride, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module OverrideScheduleComposition_TopLevel_OverrideScheduleComposition_AutoOverride
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
	wire [1: 0] CombinationalAutoValueOverride_L9F86T87_Expr = 2'b10;
	wire Inputs_InOverride;
	wire [7: 0] Inputs_InValue;
	wire [7: 0] InternalOffset;
	wire [7: 0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
	wire [7: 0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
	wire [7: 0] CombinationalAutoValueOverride_L9F42T104_Cast;
	wire [9: 0] CombinationalAutoValueOverride_L9F69T87_Expr;
	wire signed [9: 0] CombinationalAutoValueOverride_L9F69T87_Expr_1;
	wire signed [9: 0] CombinationalAutoValueOverride_L9F69T87_Expr_2;
	wire [9: 0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr;
	wire signed [9: 0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1;
	wire signed [9: 0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2;
	wire signed [9: 0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr;
	wire signed [9: 0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1;
	wire signed [9: 0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2;
	reg [7: 0] CombinationalOverridesBase_L14F41T96_Lookup;
	reg [7: 0] CombinationalAutoValueOverride_L9F49T103_Lookup;
	wire CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress;
	wire [7: 0] CombinationalOverridesBase_L14F41T96_Lookup1;
	wire [7: 0] CombinationalOverridesBase_L14F41T96_Lookup2;
	wire CombinationalAutoValueOverride_L9F49T103_LookupMultiplexerAddress;
	wire [7: 0] CombinationalAutoValueOverride_L9F49T103_Lookup1;
	wire [7: 0] CombinationalAutoValueOverride_L9F49T103_Lookup2;
	assign CombinationalAutoValueOverride_L9F69T87_Expr = CombinationalAutoValueOverride_L9F69T87_Expr_1 + CombinationalAutoValueOverride_L9F69T87_Expr_2;
	assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 + CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2;
	assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 - CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2;
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
	always @ (*)
	begin
		case (CombinationalAutoValueOverride_L9F49T103_LookupMultiplexerAddress)
			'b0:
			begin
				CombinationalAutoValueOverride_L9F49T103_Lookup = CombinationalAutoValueOverride_L9F49T103_Lookup1;
			end
			'b1:
			begin
				CombinationalAutoValueOverride_L9F49T103_Lookup = CombinationalAutoValueOverride_L9F49T103_Lookup2;
			end
			default:
			begin
				CombinationalAutoValueOverride_L9F49T103_Lookup = 'b00000000;
			end
		endcase
	end
	assign CombinationalAutoValueOverride_L9F69T87_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
	assign CombinationalAutoValueOverride_L9F69T87_Expr_2 = { {8{1'b0}}, CombinationalAutoValueOverride_L9F86T87_Expr }/*expand*/;
	assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
	assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2 = { {2{1'b0}}, InternalOffset }/*expand*/;
	assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
	assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2 = { {2{1'b0}}, InternalOffset }/*expand*/;
	assign Inputs_InOverride = InOverride;
	assign Inputs_InValue = InValue;
	assign InternalOffset = { {7{1'b0}}, CombinationalOverridesBase_L16F50T51_Expr }/*expand*/;
	assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr[7:0]/*truncate*/;
	assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr[7:0]/*truncate*/;
	assign CombinationalAutoValueOverride_L9F42T104_Cast = CombinationalAutoValueOverride_L9F49T103_Lookup;
	assign OutValue = CombinationalAutoValueOverride_L9F42T104_Cast;
	assign CombinationalOverridesBase_L14F41T96_Lookup1 = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
	assign CombinationalOverridesBase_L14F41T96_Lookup2 = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
	assign CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress = Inputs_InOverride;
	assign CombinationalAutoValueOverride_L9F49T103_Lookup1 = CombinationalOverridesBase_L14F41T96_Lookup;
	assign CombinationalAutoValueOverride_L9F49T103_Lookup2 = CombinationalAutoValueOverride_L9F69T87_Expr[7:0]/*truncate*/;
	assign CombinationalAutoValueOverride_L9F49T103_LookupMultiplexerAddress = Inputs_InOverride;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
