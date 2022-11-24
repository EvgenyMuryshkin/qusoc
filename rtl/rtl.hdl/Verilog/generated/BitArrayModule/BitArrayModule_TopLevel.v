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
// System configuration name is BitArrayModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module BitArrayModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [7:0] Value,
	input wire [2:0] Bit,
	output wire ValueBit,
	output wire [7:0] Direct,
	output wire [7:0] ReversedByCall,
	output wire [3:0] High,
	output wire [3:0] Low,
	output wire [7:0] Reversed,
	output wire [3:0] ReversedHigh,
	output wire [3:0] ReversedLow,
	output wire [3:0] Picks,
	output wire [3:0] FromBits1,
	output wire [3:0] FromBits2,
	output wire [7:0] ZeroString,
	output wire [7:0] ValueString,
	output wire [7:0] CtorMux
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire BitArrayModule_L24F57T61_Expr = 1'b1;
	wire BitArrayModule_L24F63T67_Expr = 1'b1;
	wire BitArrayModule_L24F69T74_Expr = 1'b0;
	wire BitArrayModule_L24F76T80_Expr = 1'b1;
	wire BitArrayModule_L25F57T62_Expr = 1'b0;
	wire BitArrayModule_L25F64T68_Expr = 1'b1;
	wire BitArrayModule_L25F70T74_Expr = 1'b1;
	wire BitArrayModule_L25F76T80_Expr = 1'b1;
	wire [7: 0] BitArrayModule_L26F58T68_Expr = 8'b00000000;
	wire [7: 0] BitArrayModule_L27F59T69_Expr = 8'b01000000;
	wire BitArrayModule_L29F53T54_Expr = 1'b0;
	wire [7: 0] BitArrayModule_L29F73T83_Expr = 8'b00000000;
	wire [7: 0] BitArrayModule_L29F103T113_Expr = 8'b01000000;
	wire [7: 0] Inputs_Value;
	wire [2: 0] Inputs_Bit;
	wire [7: 0] Bits;
	wire BitArrayModule_L15F33T49_Index;
	wire [3: 0] BitArrayModule_L18F36T46_Index;
	wire [3: 0] BitArrayModule_L19F35T45_Index;
	wire [7: 0] BitArrayModule_L20F40T50_Index;
	wire [3: 0] BitArrayModule_L21F44T54_Index;
	wire [3: 0] BitArrayModule_L22F43T53_Index;
	wire [1: 0] BitArrayModule_L23F53T62_Index;
	wire [1: 0] BitArrayModule_L23F64T73_Index;
	wire [3: 0] BitArrayModule_L23F37T74_Source;
	wire [3: 0] BitArrayModule_L24F41T81_Source;
	wire [3: 0] BitArrayModule_L25F41T81_Source;
	wire [7: 0] BitArrayModule_L17F46T61_Expr;
	wire [7: 0] BitArrayModule_L17F46T61_Expr_1;
	wire BitArrayModule_L29F39T54_Expr;
	wire signed [3: 0] BitArrayModule_L29F39T54_ExprLhs;
	wire signed [3: 0] BitArrayModule_L29F39T54_ExprRhs;
	reg [7: 0] BitArrayModule_L29F39T114_Lookup;
	wire BitArrayModule_L29F39T114_LookupMultiplexerAddress;
	wire [7: 0] BitArrayModule_L29F39T114_Lookup1;
	wire [7: 0] BitArrayModule_L29F39T114_Lookup2;
	assign BitArrayModule_L29F39T54_Expr = BitArrayModule_L29F39T54_ExprLhs == BitArrayModule_L29F39T54_ExprRhs ? 1'b1 : 1'b0;
	genvar LogicalFunctionLogicalFunction1_idx;
	generate
		for (LogicalFunctionLogicalFunction1_idx = 7; (LogicalFunctionLogicalFunction1_idx >= 0); LogicalFunctionLogicalFunction1_idx = (LogicalFunctionLogicalFunction1_idx - 1))
		begin : LogicalFunctionLogicalFunction1_idxReverse
			assign BitArrayModule_L17F46T61_Expr[LogicalFunctionLogicalFunction1_idx] = BitArrayModule_L17F46T61_Expr_1[7 - LogicalFunctionLogicalFunction1_idx];
		end
	endgenerate
	always @ (*)
	begin
		case (BitArrayModule_L29F39T114_LookupMultiplexerAddress)
			'b0:
			begin
				BitArrayModule_L29F39T114_Lookup = BitArrayModule_L29F39T114_Lookup1;
			end
			'b1:
			begin
				BitArrayModule_L29F39T114_Lookup = BitArrayModule_L29F39T114_Lookup2;
			end
			default:
			begin
				BitArrayModule_L29F39T114_Lookup = 'b00000000;
			end
		endcase
	end
	assign BitArrayModule_L29F39T54_ExprLhs = { 1'b0, Inputs_Bit };
	assign BitArrayModule_L29F39T54_ExprRhs = { {3{1'b0}}, BitArrayModule_L29F53T54_Expr };
	assign BitArrayModule_L17F46T61_Expr_1 = Bits;
	assign Inputs_Value = Value;
	assign Inputs_Bit = Bit;
	assign Bits = Inputs_Value;
	assign BitArrayModule_L15F33T49_Index = Bits[Inputs_Bit];
	assign ValueBit = BitArrayModule_L15F33T49_Index;
	assign Direct = Bits;
	assign ReversedByCall = BitArrayModule_L17F46T61_Expr;
	assign BitArrayModule_L18F36T46_Index = Bits[7:4];
	assign High = BitArrayModule_L18F36T46_Index;
	assign BitArrayModule_L19F35T45_Index = Bits[3:0];
	assign Low = BitArrayModule_L19F35T45_Index;
	assign BitArrayModule_L20F40T50_Index[0] = Bits[7];
	assign BitArrayModule_L20F40T50_Index[1] = Bits[6];
	assign BitArrayModule_L20F40T50_Index[2] = Bits[5];
	assign BitArrayModule_L20F40T50_Index[3] = Bits[4];
	assign BitArrayModule_L20F40T50_Index[4] = Bits[3];
	assign BitArrayModule_L20F40T50_Index[5] = Bits[2];
	assign BitArrayModule_L20F40T50_Index[6] = Bits[1];
	assign BitArrayModule_L20F40T50_Index[7] = Bits[0];
	assign Reversed = BitArrayModule_L20F40T50_Index;
	assign BitArrayModule_L21F44T54_Index[0] = Bits[7];
	assign BitArrayModule_L21F44T54_Index[1] = Bits[6];
	assign BitArrayModule_L21F44T54_Index[2] = Bits[5];
	assign BitArrayModule_L21F44T54_Index[3] = Bits[4];
	assign ReversedHigh = BitArrayModule_L21F44T54_Index;
	assign BitArrayModule_L22F43T53_Index[0] = Bits[3];
	assign BitArrayModule_L22F43T53_Index[1] = Bits[2];
	assign BitArrayModule_L22F43T53_Index[2] = Bits[1];
	assign BitArrayModule_L22F43T53_Index[3] = Bits[0];
	assign ReversedLow = BitArrayModule_L22F43T53_Index;
	assign BitArrayModule_L23F53T62_Index = Bits[6:5];
	assign BitArrayModule_L23F64T73_Index[0] = Bits[1];
	assign BitArrayModule_L23F64T73_Index[1] = Bits[0];
	assign BitArrayModule_L23F37T74_Source = { BitArrayModule_L23F53T62_Index, BitArrayModule_L23F64T73_Index };
	assign Picks = BitArrayModule_L23F37T74_Source;
	assign BitArrayModule_L24F41T81_Source = { BitArrayModule_L24F57T61_Expr, BitArrayModule_L24F63T67_Expr, BitArrayModule_L24F69T74_Expr, BitArrayModule_L24F76T80_Expr };
	assign FromBits1 = BitArrayModule_L24F41T81_Source;
	assign BitArrayModule_L25F41T81_Source = { BitArrayModule_L25F57T62_Expr, BitArrayModule_L25F64T68_Expr, BitArrayModule_L25F70T74_Expr, BitArrayModule_L25F76T80_Expr };
	assign FromBits2 = BitArrayModule_L25F41T81_Source;
	assign ZeroString = BitArrayModule_L26F58T68_Expr;
	assign ValueString = BitArrayModule_L27F59T69_Expr;
	assign CtorMux = BitArrayModule_L29F39T114_Lookup;
	assign BitArrayModule_L29F39T114_Lookup1 = BitArrayModule_L29F103T113_Expr;
	assign BitArrayModule_L29F39T114_Lookup2 = BitArrayModule_L29F73T83_Expr;
	assign BitArrayModule_L29F39T114_LookupMultiplexerAddress = BitArrayModule_L29F39T54_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
