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
// System configuration name is OverrideScheduleComposition_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module OverrideScheduleComposition_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire InOverride,
	input wire [7:0] InValue,
	output wire [7:0] NoOverrideValue,
	output wire [7:0] AutoOverrideValue,
	output wire [7:0] L1Value,
	output wire [7:0] L2Value,
	output wire [7:0] L3Value,
	output wire [7:0] GetValue,
	output wire RawInputs_InOverride,
	output wire [7:0] RawInputs_InValue,
	output wire OverrideInputs_InOverride,
	output wire [7:0] OverrideInputs_InValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire Inputs_InOverride;
	wire [7: 0] Inputs_InValue;
	wire ModulesInputs_InOverride;
	wire [7: 0] ModulesInputs_InValue;
	wire [7: 0] InvertedInput;
	wire NoOverride_InOverride;
	wire [7: 0] NoOverride_InValue;
	wire [7: 0] NoOverride_OutValue;
	wire AutoOverride_InOverride;
	wire [7: 0] AutoOverride_InValue;
	wire [7: 0] AutoOverride_OutValue;
	wire GetOverride_InOverride;
	wire [7: 0] GetOverride_InValue;
	wire [7: 0] GetOverride_OutValue;
	wire L1Override_InOverride;
	wire [7: 0] L1Override_InValue;
	wire [7: 0] L1Override_OutValue;
	wire L2Override_InOverride;
	wire [7: 0] L2Override_InValue;
	wire [7: 0] L2Override_OutValue;
	wire L3Override_InOverride;
	wire [7: 0] L3Override_InValue;
	wire [7: 0] L3Override_OutValue;
	wire NoOverride_InOverride_NoOverride_InOverride_HardLink;
	wire [7: 0] NoOverride_InValue_NoOverride_InValue_HardLink;
	wire [7: 0] NoOverride_OutValue_NoOverride_OutValue_HardLink;
	wire AutoOverride_InOverride_AutoOverride_InOverride_HardLink;
	wire [7: 0] AutoOverride_InValue_AutoOverride_InValue_HardLink;
	wire [7: 0] AutoOverride_OutValue_AutoOverride_OutValue_HardLink;
	wire GetOverride_InOverride_GetOverride_InOverride_HardLink;
	wire [7: 0] GetOverride_InValue_GetOverride_InValue_HardLink;
	wire [7: 0] GetOverride_OutValue_GetOverride_OutValue_HardLink;
	wire L1Override_InOverride_L1Override_InOverride_HardLink;
	wire [7: 0] L1Override_InValue_L1Override_InValue_HardLink;
	wire [7: 0] L1Override_OutValue_L1Override_OutValue_HardLink;
	wire L2Override_InOverride_L2Override_InOverride_HardLink;
	wire [7: 0] L2Override_InValue_L2Override_InValue_HardLink;
	wire [7: 0] L2Override_OutValue_L2Override_OutValue_HardLink;
	wire L3Override_InOverride_L3Override_InOverride_HardLink;
	wire [7: 0] L3Override_InValue_L3Override_InValue_HardLink;
	wire [7: 0] L3Override_OutValue_L3Override_OutValue_HardLink;
	wire OverrideInputsComposition_L14F30T48_Expr;
	wire OverrideInputsComposition_L14F30T48_Expr_1;
	wire [7: 0] OverrideInputsComposition_L7F38T72_Expr;
	wire [7: 0] OverrideInputsComposition_L7F38T72_Expr_1;
	assign OverrideInputsComposition_L14F30T48_Expr = ~OverrideInputsComposition_L14F30T48_Expr_1;
	assign OverrideInputsComposition_L7F38T72_Expr = ~OverrideInputsComposition_L7F38T72_Expr_1;
	OverrideScheduleComposition_TopLevel_NoOverride
	OverrideScheduleComposition_TopLevel_NoOverride
	(
		// [BEGIN USER MAP FOR NoOverride]
		// [END USER MAP FOR NoOverride]
		.InOverride (NoOverride_InOverride_NoOverride_InOverride_HardLink),
		.InValue (NoOverride_InValue_NoOverride_InValue_HardLink),
		.OutValue (NoOverride_OutValue_NoOverride_OutValue_HardLink)
	);
	OverrideScheduleComposition_TopLevel_AutoOverride
	OverrideScheduleComposition_TopLevel_AutoOverride
	(
		// [BEGIN USER MAP FOR AutoOverride]
		// [END USER MAP FOR AutoOverride]
		.InOverride (AutoOverride_InOverride_AutoOverride_InOverride_HardLink),
		.InValue (AutoOverride_InValue_AutoOverride_InValue_HardLink),
		.OutValue (AutoOverride_OutValue_AutoOverride_OutValue_HardLink)
	);
	OverrideScheduleComposition_TopLevel_GetOverride
	OverrideScheduleComposition_TopLevel_GetOverride
	(
		// [BEGIN USER MAP FOR GetOverride]
		// [END USER MAP FOR GetOverride]
		.InOverride (GetOverride_InOverride_GetOverride_InOverride_HardLink),
		.InValue (GetOverride_InValue_GetOverride_InValue_HardLink),
		.OutValue (GetOverride_OutValue_GetOverride_OutValue_HardLink)
	);
	OverrideScheduleComposition_TopLevel_L1Override
	OverrideScheduleComposition_TopLevel_L1Override
	(
		// [BEGIN USER MAP FOR L1Override]
		// [END USER MAP FOR L1Override]
		.InOverride (L1Override_InOverride_L1Override_InOverride_HardLink),
		.InValue (L1Override_InValue_L1Override_InValue_HardLink),
		.OutValue (L1Override_OutValue_L1Override_OutValue_HardLink)
	);
	OverrideScheduleComposition_TopLevel_L2Override
	OverrideScheduleComposition_TopLevel_L2Override
	(
		// [BEGIN USER MAP FOR L2Override]
		// [END USER MAP FOR L2Override]
		.InOverride (L2Override_InOverride_L2Override_InOverride_HardLink),
		.InValue (L2Override_InValue_L2Override_InValue_HardLink),
		.OutValue (L2Override_OutValue_L2Override_OutValue_HardLink)
	);
	OverrideScheduleComposition_TopLevel_L3Override
	OverrideScheduleComposition_TopLevel_L3Override
	(
		// [BEGIN USER MAP FOR L3Override]
		// [END USER MAP FOR L3Override]
		.InOverride (L3Override_InOverride_L3Override_InOverride_HardLink),
		.InValue (L3Override_InValue_L3Override_InValue_HardLink),
		.OutValue (L3Override_OutValue_L3Override_OutValue_HardLink)
	);
	assign OverrideInputsComposition_L14F30T48_Expr_1 = Inputs_InOverride;
	assign OverrideInputsComposition_L7F38T72_Expr_1 = Inputs_InValue;
	assign Inputs_InOverride = InOverride;
	assign Inputs_InValue = InValue;
	assign ModulesInputs_InOverride = OverrideInputsComposition_L14F30T48_Expr;
	assign ModulesInputs_InValue = InvertedInput;
	assign InvertedInput = OverrideInputsComposition_L7F38T72_Expr;
	assign L1Override_InOverride = ModulesInputs_InOverride;
	assign L1Override_InValue = ModulesInputs_InValue;
	assign L2Override_InOverride = ModulesInputs_InOverride;
	assign L2Override_InValue = ModulesInputs_InValue;
	assign L3Override_InOverride = ModulesInputs_InOverride;
	assign L3Override_InValue = ModulesInputs_InValue;
	assign GetOverride_InOverride = ModulesInputs_InOverride;
	assign GetOverride_InValue = ModulesInputs_InValue;
	assign NoOverride_InOverride = Inputs_InOverride;
	assign NoOverride_InValue = Inputs_InValue;
	assign AutoOverride_InOverride = Inputs_InOverride;
	assign AutoOverride_InValue = Inputs_InValue;
	assign NoOverrideValue = NoOverride_OutValue;
	assign AutoOverrideValue = AutoOverride_OutValue;
	assign L1Value = L1Override_OutValue;
	assign L2Value = L2Override_OutValue;
	assign L3Value = L3Override_OutValue;
	assign GetValue = GetOverride_OutValue;
	assign RawInputs_InOverride = Inputs_InOverride;
	assign RawInputs_InValue = Inputs_InValue;
	assign OverrideInputs_InOverride = ModulesInputs_InOverride;
	assign OverrideInputs_InValue = ModulesInputs_InValue;
	assign NoOverride_InOverride_NoOverride_InOverride_HardLink = NoOverride_InOverride;
	assign NoOverride_InValue_NoOverride_InValue_HardLink = NoOverride_InValue;
	assign NoOverride_OutValue = NoOverride_OutValue_NoOverride_OutValue_HardLink;
	assign AutoOverride_InOverride_AutoOverride_InOverride_HardLink = AutoOverride_InOverride;
	assign AutoOverride_InValue_AutoOverride_InValue_HardLink = AutoOverride_InValue;
	assign AutoOverride_OutValue = AutoOverride_OutValue_AutoOverride_OutValue_HardLink;
	assign GetOverride_InOverride_GetOverride_InOverride_HardLink = GetOverride_InOverride;
	assign GetOverride_InValue_GetOverride_InValue_HardLink = GetOverride_InValue;
	assign GetOverride_OutValue = GetOverride_OutValue_GetOverride_OutValue_HardLink;
	assign L1Override_InOverride_L1Override_InOverride_HardLink = L1Override_InOverride;
	assign L1Override_InValue_L1Override_InValue_HardLink = L1Override_InValue;
	assign L1Override_OutValue = L1Override_OutValue_L1Override_OutValue_HardLink;
	assign L2Override_InOverride_L2Override_InOverride_HardLink = L2Override_InOverride;
	assign L2Override_InValue_L2Override_InValue_HardLink = L2Override_InValue;
	assign L2Override_OutValue = L2Override_OutValue_L2Override_OutValue_HardLink;
	assign L3Override_InOverride_L3Override_InOverride_HardLink = L3Override_InOverride;
	assign L3Override_InValue_L3Override_InValue_HardLink = L3Override_InValue;
	assign L3Override_OutValue = L3Override_OutValue_L3Override_OutValue_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
