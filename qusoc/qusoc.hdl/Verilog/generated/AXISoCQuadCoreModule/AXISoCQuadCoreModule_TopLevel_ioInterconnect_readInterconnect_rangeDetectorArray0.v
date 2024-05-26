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
// System configuration name is AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [31:0] iAddress,
	output wire oActive,
	output wire [3:0] oIndex
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [4: 0] rangeDetectorsCount = 5'b01011;
	wire RangeDetectorArrayModule_L48F13L54T14_0_idx = 1'b0;
	wire RangeDetectorArrayModule_L48F13L54T14_1_idx = 1'b1;
	wire [1: 0] RangeDetectorArrayModule_L48F13L54T14_2_idx = 2'b10;
	wire [1: 0] RangeDetectorArrayModule_L48F13L54T14_3_idx = 2'b11;
	wire [2: 0] RangeDetectorArrayModule_L48F13L54T14_4_idx = 3'b100;
	wire [2: 0] RangeDetectorArrayModule_L48F13L54T14_5_idx = 3'b101;
	wire [2: 0] RangeDetectorArrayModule_L48F13L54T14_6_idx = 3'b110;
	wire [2: 0] RangeDetectorArrayModule_L48F13L54T14_7_idx = 3'b111;
	wire [3: 0] RangeDetectorArrayModule_L48F13L54T14_8_idx = 4'b1000;
	wire [3: 0] RangeDetectorArrayModule_L48F13L54T14_9_idx = 4'b1001;
	wire [3: 0] RangeDetectorArrayModule_L48F13L54T14_10_idx = 4'b1010;
	wire RangeDetectorArrayModule_L56F13L59T14_0_idx = 1'b0;
	wire RangeDetectorArrayModule_L56F13L59T14_1_idx = 1'b1;
	wire [1: 0] RangeDetectorArrayModule_L56F13L59T14_2_idx = 2'b10;
	wire [1: 0] RangeDetectorArrayModule_L56F13L59T14_3_idx = 2'b11;
	wire [2: 0] RangeDetectorArrayModule_L56F13L59T14_4_idx = 3'b100;
	wire [2: 0] RangeDetectorArrayModule_L56F13L59T14_5_idx = 3'b101;
	wire [2: 0] RangeDetectorArrayModule_L56F13L59T14_6_idx = 3'b110;
	wire [2: 0] RangeDetectorArrayModule_L56F13L59T14_7_idx = 3'b111;
	wire [3: 0] RangeDetectorArrayModule_L56F13L59T14_8_idx = 4'b1000;
	wire [3: 0] RangeDetectorArrayModule_L56F13L59T14_9_idx = 4'b1001;
	wire [3: 0] RangeDetectorArrayModule_L56F13L59T14_10_idx = 4'b1010;
	wire [31: 0] Inputs_iAddress;
	wire encoder_HasActive;
	wire [3: 0] encoder_MSBIndex;
	wire [10: 0] encoder_MSBValue;
	wire [31: 0] rangeDetectors0_Value;
	wire rangeDetectors0_IsActive;
	wire [31: 0] rangeDetectors1_Value;
	wire rangeDetectors1_IsActive;
	wire [31: 0] rangeDetectors2_Value;
	wire rangeDetectors2_IsActive;
	wire [31: 0] rangeDetectors3_Value;
	wire rangeDetectors3_IsActive;
	wire [31: 0] rangeDetectors4_Value;
	wire rangeDetectors4_IsActive;
	wire [31: 0] rangeDetectors5_Value;
	wire rangeDetectors5_IsActive;
	wire [31: 0] rangeDetectors6_Value;
	wire rangeDetectors6_IsActive;
	wire [31: 0] rangeDetectors7_Value;
	wire rangeDetectors7_IsActive;
	wire [31: 0] rangeDetectors8_Value;
	wire rangeDetectors8_IsActive;
	wire [31: 0] rangeDetectors9_Value;
	wire rangeDetectors9_IsActive;
	wire [31: 0] rangeDetectors10_Value;
	wire rangeDetectors10_IsActive;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_2_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_3_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_4_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_5_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_6_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_7_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_8_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_9_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [31: 0] RangeDetectorArrayModule_L48F13L54T14_10_RangeDetectorArrayModule_L50F52L53T18_Object;
	wire [10: 0] RangeDetectorArrayModule_L36F36L40T14_Object;
	wire encoder_iValues0_encoder_iValues_HardLink;
	wire encoder_iValues1_encoder_iValues_HardLink;
	wire encoder_iValues2_encoder_iValues_HardLink;
	wire encoder_iValues3_encoder_iValues_HardLink;
	wire encoder_iValues4_encoder_iValues_HardLink;
	wire encoder_iValues5_encoder_iValues_HardLink;
	wire encoder_iValues6_encoder_iValues_HardLink;
	wire encoder_iValues7_encoder_iValues_HardLink;
	wire encoder_iValues8_encoder_iValues_HardLink;
	wire encoder_iValues9_encoder_iValues_HardLink;
	wire encoder_iValues10_encoder_iValues_HardLink;
	wire encoder_HasActive_encoder_HasActive_HardLink;
	wire [3: 0] encoder_MSBIndex_encoder_MSBIndex_HardLink;
	wire [10: 0] encoder_MSBValue_encoder_MSBValue_HardLink;
	wire [31: 0] rangeDetectors0_Value_rangeDetectors0_Value_HardLink;
	wire rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink;
	wire [31: 0] rangeDetectors1_Value_rangeDetectors1_Value_HardLink;
	wire rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink;
	wire [31: 0] rangeDetectors2_Value_rangeDetectors2_Value_HardLink;
	wire rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink;
	wire [31: 0] rangeDetectors3_Value_rangeDetectors3_Value_HardLink;
	wire rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink;
	wire [31: 0] rangeDetectors4_Value_rangeDetectors4_Value_HardLink;
	wire rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink;
	wire [31: 0] rangeDetectors5_Value_rangeDetectors5_Value_HardLink;
	wire rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink;
	wire [31: 0] rangeDetectors6_Value_rangeDetectors6_Value_HardLink;
	wire rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink;
	wire [31: 0] rangeDetectors7_Value_rangeDetectors7_Value_HardLink;
	wire rangeDetectors7_IsActive_rangeDetectors7_IsActive_HardLink;
	wire [31: 0] rangeDetectors8_Value_rangeDetectors8_Value_HardLink;
	wire rangeDetectors8_IsActive_rangeDetectors8_IsActive_HardLink;
	wire [31: 0] rangeDetectors9_Value_rangeDetectors9_Value_HardLink;
	wire rangeDetectors9_IsActive_rangeDetectors9_IsActive_HardLink;
	wire [31: 0] rangeDetectors10_Value_rangeDetectors10_Value_HardLink;
	wire rangeDetectors10_IsActive_rangeDetectors10_IsActive_HardLink;
	wire rangeActive [0 : 10];
	wire encoder_iValues [0 : 10];
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_encoder
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_encoder
	(
		// [BEGIN USER MAP FOR encoder]
		// [END USER MAP FOR encoder]
		.iValues0 (encoder_iValues0_encoder_iValues_HardLink),
		.iValues1 (encoder_iValues1_encoder_iValues_HardLink),
		.iValues2 (encoder_iValues2_encoder_iValues_HardLink),
		.iValues3 (encoder_iValues3_encoder_iValues_HardLink),
		.iValues4 (encoder_iValues4_encoder_iValues_HardLink),
		.iValues5 (encoder_iValues5_encoder_iValues_HardLink),
		.iValues6 (encoder_iValues6_encoder_iValues_HardLink),
		.iValues7 (encoder_iValues7_encoder_iValues_HardLink),
		.iValues8 (encoder_iValues8_encoder_iValues_HardLink),
		.iValues9 (encoder_iValues9_encoder_iValues_HardLink),
		.iValues10 (encoder_iValues10_encoder_iValues_HardLink),
		.HasActive (encoder_HasActive_encoder_HasActive_HardLink),
		.MSBIndex (encoder_MSBIndex_encoder_MSBIndex_HardLink),
		.MSBValue (encoder_MSBValue_encoder_MSBValue_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors0
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors0
	(
		// [BEGIN USER MAP FOR rangeDetectors0]
		// [END USER MAP FOR rangeDetectors0]
		.Value (rangeDetectors0_Value_rangeDetectors0_Value_HardLink),
		.IsActive (rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1
	(
		// [BEGIN USER MAP FOR rangeDetectors1]
		// [END USER MAP FOR rangeDetectors1]
		.Value (rangeDetectors1_Value_rangeDetectors1_Value_HardLink),
		.IsActive (rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors2
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors2
	(
		// [BEGIN USER MAP FOR rangeDetectors2]
		// [END USER MAP FOR rangeDetectors2]
		.Value (rangeDetectors2_Value_rangeDetectors2_Value_HardLink),
		.IsActive (rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors3
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors3
	(
		// [BEGIN USER MAP FOR rangeDetectors3]
		// [END USER MAP FOR rangeDetectors3]
		.Value (rangeDetectors3_Value_rangeDetectors3_Value_HardLink),
		.IsActive (rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors4
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors4
	(
		// [BEGIN USER MAP FOR rangeDetectors4]
		// [END USER MAP FOR rangeDetectors4]
		.Value (rangeDetectors4_Value_rangeDetectors4_Value_HardLink),
		.IsActive (rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors5
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors5
	(
		// [BEGIN USER MAP FOR rangeDetectors5]
		// [END USER MAP FOR rangeDetectors5]
		.Value (rangeDetectors5_Value_rangeDetectors5_Value_HardLink),
		.IsActive (rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors6
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors6
	(
		// [BEGIN USER MAP FOR rangeDetectors6]
		// [END USER MAP FOR rangeDetectors6]
		.Value (rangeDetectors6_Value_rangeDetectors6_Value_HardLink),
		.IsActive (rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors7
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors7
	(
		// [BEGIN USER MAP FOR rangeDetectors7]
		// [END USER MAP FOR rangeDetectors7]
		.Value (rangeDetectors7_Value_rangeDetectors7_Value_HardLink),
		.IsActive (rangeDetectors7_IsActive_rangeDetectors7_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors8
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors8
	(
		// [BEGIN USER MAP FOR rangeDetectors8]
		// [END USER MAP FOR rangeDetectors8]
		.Value (rangeDetectors8_Value_rangeDetectors8_Value_HardLink),
		.IsActive (rangeDetectors8_IsActive_rangeDetectors8_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors9
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors9
	(
		// [BEGIN USER MAP FOR rangeDetectors9]
		// [END USER MAP FOR rangeDetectors9]
		.Value (rangeDetectors9_Value_rangeDetectors9_Value_HardLink),
		.IsActive (rangeDetectors9_IsActive_rangeDetectors9_IsActive_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors10
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors10
	(
		// [BEGIN USER MAP FOR rangeDetectors10]
		// [END USER MAP FOR rangeDetectors10]
		.Value (rangeDetectors10_Value_rangeDetectors10_Value_HardLink),
		.IsActive (rangeDetectors10_IsActive_rangeDetectors10_IsActive_HardLink)
	);
	assign Inputs_iAddress = iAddress;
	assign RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors0_Value = RangeDetectorArrayModule_L48F13L54T14_0_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors1_Value = RangeDetectorArrayModule_L48F13L54T14_1_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_2_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors2_Value = RangeDetectorArrayModule_L48F13L54T14_2_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_3_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors3_Value = RangeDetectorArrayModule_L48F13L54T14_3_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_4_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors4_Value = RangeDetectorArrayModule_L48F13L54T14_4_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_5_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors5_Value = RangeDetectorArrayModule_L48F13L54T14_5_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_6_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors6_Value = RangeDetectorArrayModule_L48F13L54T14_6_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_7_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors7_Value = RangeDetectorArrayModule_L48F13L54T14_7_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_8_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors8_Value = RangeDetectorArrayModule_L48F13L54T14_8_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_9_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors9_Value = RangeDetectorArrayModule_L48F13L54T14_9_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign RangeDetectorArrayModule_L48F13L54T14_10_RangeDetectorArrayModule_L50F52L53T18_Object[31:0] = Inputs_iAddress;
	assign rangeDetectors10_Value = RangeDetectorArrayModule_L48F13L54T14_10_RangeDetectorArrayModule_L50F52L53T18_Object[31:0];
	assign rangeActive[0] = rangeDetectors0_IsActive;
	assign rangeActive[1] = rangeDetectors1_IsActive;
	assign rangeActive[2] = rangeDetectors2_IsActive;
	assign rangeActive[3] = rangeDetectors3_IsActive;
	assign rangeActive[4] = rangeDetectors4_IsActive;
	assign rangeActive[5] = rangeDetectors5_IsActive;
	assign rangeActive[6] = rangeDetectors6_IsActive;
	assign rangeActive[7] = rangeDetectors7_IsActive;
	assign rangeActive[8] = rangeDetectors8_IsActive;
	assign rangeActive[9] = rangeDetectors9_IsActive;
	assign rangeActive[10] = rangeDetectors10_IsActive;
	assign RangeDetectorArrayModule_L36F36L40T14_Object[10:0] = {
		rangeActive[10],
		rangeActive[9],
		rangeActive[8],
		rangeActive[7],
		rangeActive[6],
		rangeActive[5],
		rangeActive[4],
		rangeActive[3],
		rangeActive[2],
		rangeActive[1],
		rangeActive[0]
	}
	;
	assign encoder_iValues[10] = RangeDetectorArrayModule_L36F36L40T14_Object[10];
	assign encoder_iValues[9] = RangeDetectorArrayModule_L36F36L40T14_Object[9];
	assign encoder_iValues[8] = RangeDetectorArrayModule_L36F36L40T14_Object[8];
	assign encoder_iValues[7] = RangeDetectorArrayModule_L36F36L40T14_Object[7];
	assign encoder_iValues[6] = RangeDetectorArrayModule_L36F36L40T14_Object[6];
	assign encoder_iValues[5] = RangeDetectorArrayModule_L36F36L40T14_Object[5];
	assign encoder_iValues[4] = RangeDetectorArrayModule_L36F36L40T14_Object[4];
	assign encoder_iValues[3] = RangeDetectorArrayModule_L36F36L40T14_Object[3];
	assign encoder_iValues[2] = RangeDetectorArrayModule_L36F36L40T14_Object[2];
	assign encoder_iValues[1] = RangeDetectorArrayModule_L36F36L40T14_Object[1];
	assign encoder_iValues[0] = RangeDetectorArrayModule_L36F36L40T14_Object[0];
	assign oActive = encoder_HasActive;
	assign oIndex = encoder_MSBIndex;
	assign encoder_iValues0_encoder_iValues_HardLink = encoder_iValues[0];
	assign encoder_iValues1_encoder_iValues_HardLink = encoder_iValues[1];
	assign encoder_iValues2_encoder_iValues_HardLink = encoder_iValues[2];
	assign encoder_iValues3_encoder_iValues_HardLink = encoder_iValues[3];
	assign encoder_iValues4_encoder_iValues_HardLink = encoder_iValues[4];
	assign encoder_iValues5_encoder_iValues_HardLink = encoder_iValues[5];
	assign encoder_iValues6_encoder_iValues_HardLink = encoder_iValues[6];
	assign encoder_iValues7_encoder_iValues_HardLink = encoder_iValues[7];
	assign encoder_iValues8_encoder_iValues_HardLink = encoder_iValues[8];
	assign encoder_iValues9_encoder_iValues_HardLink = encoder_iValues[9];
	assign encoder_iValues10_encoder_iValues_HardLink = encoder_iValues[10];
	assign encoder_HasActive = encoder_HasActive_encoder_HasActive_HardLink;
	assign encoder_MSBIndex = encoder_MSBIndex_encoder_MSBIndex_HardLink;
	assign encoder_MSBValue = encoder_MSBValue_encoder_MSBValue_HardLink;
	assign rangeDetectors0_Value_rangeDetectors0_Value_HardLink = rangeDetectors0_Value;
	assign rangeDetectors0_IsActive = rangeDetectors0_IsActive_rangeDetectors0_IsActive_HardLink;
	assign rangeDetectors1_Value_rangeDetectors1_Value_HardLink = rangeDetectors1_Value;
	assign rangeDetectors1_IsActive = rangeDetectors1_IsActive_rangeDetectors1_IsActive_HardLink;
	assign rangeDetectors2_Value_rangeDetectors2_Value_HardLink = rangeDetectors2_Value;
	assign rangeDetectors2_IsActive = rangeDetectors2_IsActive_rangeDetectors2_IsActive_HardLink;
	assign rangeDetectors3_Value_rangeDetectors3_Value_HardLink = rangeDetectors3_Value;
	assign rangeDetectors3_IsActive = rangeDetectors3_IsActive_rangeDetectors3_IsActive_HardLink;
	assign rangeDetectors4_Value_rangeDetectors4_Value_HardLink = rangeDetectors4_Value;
	assign rangeDetectors4_IsActive = rangeDetectors4_IsActive_rangeDetectors4_IsActive_HardLink;
	assign rangeDetectors5_Value_rangeDetectors5_Value_HardLink = rangeDetectors5_Value;
	assign rangeDetectors5_IsActive = rangeDetectors5_IsActive_rangeDetectors5_IsActive_HardLink;
	assign rangeDetectors6_Value_rangeDetectors6_Value_HardLink = rangeDetectors6_Value;
	assign rangeDetectors6_IsActive = rangeDetectors6_IsActive_rangeDetectors6_IsActive_HardLink;
	assign rangeDetectors7_Value_rangeDetectors7_Value_HardLink = rangeDetectors7_Value;
	assign rangeDetectors7_IsActive = rangeDetectors7_IsActive_rangeDetectors7_IsActive_HardLink;
	assign rangeDetectors8_Value_rangeDetectors8_Value_HardLink = rangeDetectors8_Value;
	assign rangeDetectors8_IsActive = rangeDetectors8_IsActive_rangeDetectors8_IsActive_HardLink;
	assign rangeDetectors9_Value_rangeDetectors9_Value_HardLink = rangeDetectors9_Value;
	assign rangeDetectors9_IsActive = rangeDetectors9_IsActive_rangeDetectors9_IsActive_HardLink;
	assign rangeDetectors10_Value_rangeDetectors10_Value_HardLink = rangeDetectors10_Value;
	assign rangeDetectors10_IsActive = rangeDetectors10_IsActive_rangeDetectors10_IsActive_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
