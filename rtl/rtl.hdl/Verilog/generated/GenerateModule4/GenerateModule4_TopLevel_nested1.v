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
// System configuration name is GenerateModule4_TopLevel_nested1, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module GenerateModule4_TopLevel_nested1
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [1:0] iData,
	input wire iBit,
	output wire [2:0] oData,
	output wire oBit
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire GenerateModule_L40F53T54_Expr = 1'b1;
	wire [1: 0] Inputs_iData;
	wire Inputs_iBit;
	wire inverter_inValue;
	wire inverter_outValue;
	wire inverterinValueinverter_inValueHardLink;
	wire inverteroutValueinverter_outValueHardLink;
	wire [3: 0] GenerateModule_L40F37T68_Expr;
	wire [3: 0] GenerateModule_L40F37T68_Expr_1;
	wire [3: 0] GenerateModule_L40F37T68_Expr_2;
	wire [3: 0] GenerateModule_L40F37T54_Expr;
	wire [3: 0] GenerateModule_L40F37T54_Expr_1;
	assign GenerateModule_L40F37T68_Expr = GenerateModule_L40F37T68_Expr_1 | GenerateModule_L40F37T68_Expr_2;
	assign GenerateModule_L40F37T54_Expr[0] = 0;
	assign GenerateModule_L40F37T54_Expr[1] = GenerateModule_L40F37T54_Expr_1[0];
	assign GenerateModule_L40F37T54_Expr[2] = GenerateModule_L40F37T54_Expr_1[1];
	assign GenerateModule_L40F37T54_Expr[3] = 0;
	GenerateModule4_TopLevel_nested1_inverter
	GenerateModule4_TopLevel_nested1_inverter
	(
		// [BEGIN USER MAP FOR inverter]
		// [END USER MAP FOR inverter]
		.inValue (inverterinValueinverter_inValueHardLink),
		.outValue (inverteroutValueinverter_outValueHardLink)
	);
	assign GenerateModule_L40F37T68_Expr_1 = GenerateModule_L40F37T54_Expr;
	assign GenerateModule_L40F37T68_Expr_2 = { {3{1'b0}}, Inputs_iBit };
	assign GenerateModule_L40F37T54_Expr_1 = { {2{1'b0}}, Inputs_iData };
	assign Inputs_iData = iData;
	assign Inputs_iBit = iBit;
	assign inverter_inValue = Inputs_iBit;
	assign oData = GenerateModule_L40F37T68_Expr[2:0];
	assign oBit = inverter_outValue;
	assign inverterinValueinverter_inValueHardLink = inverter_inValue;
	assign inverter_outValue = inverteroutValueinverter_outValueHardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
