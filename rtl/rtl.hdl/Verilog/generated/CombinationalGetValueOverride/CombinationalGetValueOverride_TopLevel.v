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
// System configuration name is CombinationalGetValueOverride_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module CombinationalGetValueOverride_TopLevel (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  InOverride,
	input wire  [7: 0] InValue,
	output wire [7: 0] OutValue
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
wire  [1:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F54T55_Expr = 2'b11;
wire  Inputs_InOverride;
wire  [7:0] Inputs_InValue;
wire  [7:0] InternalOffset;
reg  [7:0] CombinationalGetValueOverride_L12F13L19T14_result;
wire  [7:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
wire  [7:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
wire  [7:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast;
wire  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2;
wire  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1;
wire signed  [9:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2;
reg  [7:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup;
wire  CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress;
wire  [7:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup1;
wire  [7:0] CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup2;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 + CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 - CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr = CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1 + CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2;
always @*
begin
case (CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress)
    'b0:
CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup1;
    'b1:
CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup2;
  default:
CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup = 'b00000000;
endcase

end
always @*
begin
CombinationalGetValueOverride_L12F13L19T14_result = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup;
if ( Inputs_InOverride == 1 ) begin
CombinationalGetValueOverride_L12F13L19T14_result = CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast;
end

end
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2 = { {2{1'b0}}, InternalOffset }/*expand*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2 = { {2{1'b0}}, InternalOffset }/*expand*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1 = { {2{1'b0}}, Inputs_InValue }/*expand*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2 = { {8{1'b0}}, CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F54T55_Expr }/*expand*/;
assign Inputs_InOverride = InOverride;
assign Inputs_InValue = InValue;
assign InternalOffset = { {7{1'b0}}, CombinationalOverridesBase_L16F50T51_Expr }/*expand*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr[7:0]/*truncate*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr[7:0]/*truncate*/;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast = CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr[7:0]/*truncate*/;
assign OutValue = CombinationalGetValueOverride_L12F13L19T14_result;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup1 = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Lookup2 = CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
assign CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_LookupMultiplexerAddress = Inputs_InOverride;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
