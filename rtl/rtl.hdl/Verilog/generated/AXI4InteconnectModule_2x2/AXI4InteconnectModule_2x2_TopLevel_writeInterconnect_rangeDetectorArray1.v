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
// System configuration name is AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [31:0] iAddress,
	output wire oActive,
	output wire [0:0] oIndex
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [2: 0] rangeDetectorsCount = 3'b010;
	wire RangeDetectorArrayModule_L49F13L55T14_0_idx = 1'b0;
	wire RangeDetectorArrayModule_L49F13L55T14_1_idx = 1'b1;
	wire RangeDetectorArrayModule_L57F13L60T14_0_idx = 1'b0;
	wire RangeDetectorArrayModule_L57F13L60T14_1_idx = 1'b1;
	wire [31: 0] Inputs_iAddress;
	wire encoder_HasActive;
	wire [0: 0] encoder_MSBIndex;
	wire [1: 0] encoder_MSBValue;
	wire [31: 0] rangeDetectors0_Value;
	wire rangeDetectors0_IsActive;
	wire [31: 0] rangeDetectors1_Value;
	wire rangeDetectors1_IsActive;
	wire [31: 0] RangeDetectorArrayModule_L49F13L55T14_0_RangeDetectorArrayModule_L51F52L54T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L49F13L55T14_1_RangeDetectorArrayModule_L51F52L54T18_Object;
	wire [1: 0] RangeDetectorArrayModule_L37F36L41T14_Object;
	wire encoder_iValues0_encoder_iValues_HardLink;
	wire encoder_iValues1_encoder_iValues_HardLink;
	wire encoder_HasActive_encoder_HasActive_HardLink;
	wire [0: 0] encoder_MSBIndex_encoder_MSBIndex_HardLink;
	wire [1: 0] encoder_MSBValue_encoder_MSBValue_HardLink;
	wire [31: 0] rangeDetectors0_Value_rangeDetectors0_Value_HardLink;
	wire rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink;
	wire [31: 0] rangeDetectors1_Value_rangeDetectors1_Value_HardLink;
	wire rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink;
	wire rangeActive [0 : 1];
	wire encoder_iValues [0 : 1];
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1_encoder
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1_encoder
	(
		// [BEGIN USER MAP FOR encoder]
		// [END USER MAP FOR encoder]
		.iValues0 (encoder_iValues0_encoder_iValues_HardLink),
		.iValues1 (encoder_iValues1_encoder_iValues_HardLink),
		.HasActive (encoder_HasActive_encoder_HasActive_HardLink),
		.MSBIndex (encoder_MSBIndex_encoder_MSBIndex_HardLink),
		.MSBValue (encoder_MSBValue_encoder_MSBValue_HardLink)
	);
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1_rangeDetectors0
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1_rangeDetectors0
	(
		// [BEGIN USER MAP FOR rangeDetectors0]
		// [END USER MAP FOR rangeDetectors0]
		.Value (rangeDetectors0_Value_rangeDetectors0_Value_HardLink),
		.IsActive (rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink)
	);
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1_rangeDetectors1
	AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_rangeDetectorArray1_rangeDetectors1
	(
		// [BEGIN USER MAP FOR rangeDetectors1]
		// [END USER MAP FOR rangeDetectors1]
		.Value (rangeDetectors1_Value_rangeDetectors1_Value_HardLink),
		.IsActive (rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink)
	);
	assign Inputs_iAddress = iAddress;
	assign RangeDetectorArrayModule_L49F13L55T14_0_RangeDetectorArrayModule_L51F52L54T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors0_Value = RangeDetectorArrayModule_L49F13L55T14_0_RangeDetectorArrayModule_L51F52L54T18_Object[31:0];
	assign RangeDetectorArrayModule_L49F13L55T14_1_RangeDetectorArrayModule_L51F52L54T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors1_Value = RangeDetectorArrayModule_L49F13L55T14_1_RangeDetectorArrayModule_L51F52L54T18_Object[31:0];
	assign rangeActive[0] = rangeDetectors0_IsActive;
	assign rangeActive[1] = rangeDetectors1_IsActive;
	assign RangeDetectorArrayModule_L37F36L41T14_Object[1:0] = {
		rangeActive[1],
		rangeActive[0]
	}
	;
	assign encoder_iValues[1] = RangeDetectorArrayModule_L37F36L41T14_Object[1];
	assign encoder_iValues[0] = RangeDetectorArrayModule_L37F36L41T14_Object[0];
	assign oActive = encoder_HasActive;
	assign oIndex = encoder_MSBIndex;
	assign encoder_iValues0_encoder_iValues_HardLink = encoder_iValues[0];
	assign encoder_iValues1_encoder_iValues_HardLink = encoder_iValues[1];
	assign encoder_HasActive = encoder_HasActive_encoder_HasActive_HardLink;
	assign encoder_MSBIndex = encoder_MSBIndex_encoder_MSBIndex_HardLink;
	assign encoder_MSBValue = encoder_MSBValue_encoder_MSBValue_HardLink;
	assign rangeDetectors0_Value_rangeDetectors0_Value_HardLink = rangeDetectors0_Value;
	assign rangeDetectors0_IsActive = rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink;
	assign rangeDetectors1_Value_rangeDetectors1_Value_HardLink = rangeDetectors1_Value;
	assign rangeDetectors1_IsActive = rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
