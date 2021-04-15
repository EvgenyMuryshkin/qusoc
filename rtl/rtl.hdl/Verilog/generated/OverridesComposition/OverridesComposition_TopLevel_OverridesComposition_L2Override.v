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
// System configuration name is OverridesComposition_TopLevel_OverridesComposition_L2Override, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module OverridesComposition_TopLevel_OverridesComposition_L2Override (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  InOverride,
	input wire  [8: 1] InValue,
	output wire [8: 1] OutValue
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  CombinationalOverridesBase_L16F50T51_Expr = 1'b1;
wire  [1:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F41T42_Expr = 2'b11;
wire  [7:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F25T29_Expr = 8'b11110000;
wire  [7:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F25T29_Expr = 8'b11110000;
wire  [1:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F41T42_Expr = 2'b11;
wire  Inputs_InOverride;
wire  [7:0] Inputs_InValue;
wire  [7:0] InternalOffset;
reg  [7:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_result;
wire  [7:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F26T43_Cast;
wire  [7:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
reg  [7:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_result;
wire  [7:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
wire  [7:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F26T43_Cast;
wire  [9:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr;
wire signed  [9:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr_1;
wire signed  [9:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr_2;
wire  [9:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr;
wire signed  [9:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1;
wire signed  [9:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2;
wire signed  [9:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr;
wire signed  [9:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1;
wire signed  [9:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2;
wire signed  [9:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr;
wire signed  [9:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr_1;
wire signed  [9:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr_2;
wire  CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_Expr;
wire signed  [8:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_ExprLhs;
wire signed  [8:0] CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_ExprRhs;
wire  CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_Expr;
wire signed  [8:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_ExprLhs;
wire signed  [8:0] CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_ExprRhs;
reg  [7:0] CombinationalOverridesBase_L14F41T96_Lookup;
wire  CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress;
wire  [7:0] CombinationalOverridesBase_L14F41T96_Lookup1;
wire  [7:0] CombinationalOverridesBase_L14F41T96_Lookup2;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_Expr = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_ExprLhs > CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_ExprRhs ? 1'b1 : 1'b0;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_Expr = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_ExprLhs < CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_ExprRhs ? 1'b1 : 1'b0;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr_1 + CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr_2;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 + CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 - CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr_1 - CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr_2;
always @*
begin
case (CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress)
    'b0:
CombinationalOverridesBase_L14F41T96_Lookup = CombinationalOverridesBase_L14F41T96_Lookup1;
    'b1:
CombinationalOverridesBase_L14F41T96_Lookup = CombinationalOverridesBase_L14F41T96_Lookup2;
  default:
CombinationalOverridesBase_L14F41T96_Lookup = 'b00000000;
endcase

end
always @*
begin
CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_result = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F26T43_Cast;
if ( CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_Expr == 1 ) begin
CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_result = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
end

end
always @*
begin
CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_result = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
if ( CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_Expr == 1 ) begin
CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_result = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F26T43_Cast;
end

end
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_ExprLhs = { {1{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F17T29_ExprRhs = { {1{1'b0}}, CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L21F25T29_Expr }/*expand*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_ExprLhs = { {1{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F17T29_ExprRhs = { {1{1'b0}}, CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L12F25T29_Expr }/*expand*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr_2 = { {8{1'b0}}, CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F41T42_Expr }/*expand*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2 = { {2{1'b0}}, InternalOffset }/*expand*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2 = { {2{1'b0}}, InternalOffset }/*expand*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr_2 = { {8{1'b0}}, CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F41T42_Expr }/*expand*/;
assign Inputs_InOverride = InOverride;
assign Inputs_InValue = InValue;
assign InternalOffset = { {7{1'b0}}, CombinationalOverridesBase_L16F50T51_Expr }/*expand*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F26T43_Cast = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L20F33T42_Expr[7:0]/*truncate*/;
assign CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_CombinationalL2Override_L22F26T52_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr[7:0]/*truncate*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L11F26T52_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr[7:0]/*truncate*/;
assign CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F26T43_Cast = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_CombinationalL2Override_L13F33T42_Expr[7:0]/*truncate*/;
assign OutValue = CombinationalOverridesBase_L14F41T96_Lookup;
assign CombinationalOverridesBase_L14F41T96_Lookup1 = CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalL2Override_L10F9L16T10_result;
assign CombinationalOverridesBase_L14F41T96_Lookup2 = CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalL2Override_L19F9L25T10_result;
assign CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress = Inputs_InOverride;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
