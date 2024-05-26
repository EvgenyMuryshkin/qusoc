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
// System configuration name is AXISoCQuadCoreModule_TopLevel_ioInterconnect, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_ioInterconnect
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [221:0] iM2S0,
	input wire [221:0] iM2S1,
	input wire [221:0] iM2S2,
	input wire [221:0] iM2S3,
	input wire [73:0] iS2M0,
	input wire [73:0] iS2M1,
	input wire [73:0] iS2M2,
	input wire [73:0] iS2M3,
	input wire [73:0] iS2M4,
	input wire [73:0] iS2M5,
	input wire [73:0] iS2M6,
	input wire [73:0] iS2M7,
	input wire [73:0] iS2M8,
	input wire [73:0] iS2M9,
	input wire [73:0] iS2M10,
	output wire [221:0] oM2S0,
	output wire [221:0] oM2S1,
	output wire [221:0] oM2S2,
	output wire [221:0] oM2S3,
	output wire [221:0] oM2S4,
	output wire [221:0] oM2S5,
	output wire [221:0] oM2S6,
	output wire [221:0] oM2S7,
	output wire [221:0] oM2S8,
	output wire [221:0] oM2S9,
	output wire [221:0] oM2S10,
	output wire [73:0] oS2M0,
	output wire [73:0] oS2M1,
	output wire [73:0] oS2M2,
	output wire [73:0] oS2M3
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [3: 0] mCount = 4'b0100;
	wire signed [4: 0] sCount = 5'b01011;
	wire [918: 0] AXI4InteconnectModule_L44F17L48T18_Object;
	wire [782: 0] AXI4InteconnectModule_L52F17L56T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_0_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_1_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_2_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_3_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_4_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_5_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_6_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_7_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_8_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_9_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_10_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [73: 0] AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object;
	wire [73: 0] AXI4InteconnectModule_L60F35L67T24_1_AXI4InteconnectModule_L62F17L66T18_Object;
	wire [73: 0] AXI4InteconnectModule_L60F35L67T24_2_AXI4InteconnectModule_L62F17L66T18_Object;
	wire [73: 0] AXI4InteconnectModule_L60F35L67T24_3_AXI4InteconnectModule_L62F17L66T18_Object;
	wire [83: 0] readInterconnect_iLeft0_readInterconnect_iLeft_HardLink;
	wire [83: 0] readInterconnect_iLeft1_readInterconnect_iLeft_HardLink;
	wire [83: 0] readInterconnect_iLeft2_readInterconnect_iLeft_HardLink;
	wire [83: 0] readInterconnect_iLeft3_readInterconnect_iLeft_HardLink;
	wire [52: 0] readInterconnect_iRight0_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight1_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight2_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight3_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight4_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight5_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight6_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight7_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight8_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight9_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight10_readInterconnect_iRight_HardLink;
	wire [83: 0] readInterconnect_M2S0_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S1_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S2_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S3_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S4_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S5_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S6_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S7_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S8_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S9_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S10_readInterconnect_M2S_HardLink;
	wire [52: 0] readInterconnect_S2M0_readInterconnect_S2M_HardLink;
	wire [52: 0] readInterconnect_S2M1_readInterconnect_S2M_HardLink;
	wire [52: 0] readInterconnect_S2M2_readInterconnect_S2M_HardLink;
	wire [52: 0] readInterconnect_S2M3_readInterconnect_S2M_HardLink;
	wire [137: 0] writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink;
	wire [137: 0] writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink;
	wire [137: 0] writeInterconnect_iLeft2_writeInterconnect_iLeft_HardLink;
	wire [137: 0] writeInterconnect_iLeft3_writeInterconnect_iLeft_HardLink;
	wire [20: 0] writeInterconnect_iRight0_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight1_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight2_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight3_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight4_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight5_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight6_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight7_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight8_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight9_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight10_writeInterconnect_iRight_HardLink;
	wire [137: 0] writeInterconnect_M2S0_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S1_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S2_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S3_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S4_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S5_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S6_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S7_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S8_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S9_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S10_writeInterconnect_M2S_HardLink;
	wire [20: 0] writeInterconnect_S2M0_writeInterconnect_S2M_HardLink;
	wire [20: 0] writeInterconnect_S2M1_writeInterconnect_S2M_HardLink;
	wire [20: 0] writeInterconnect_S2M2_writeInterconnect_S2M_HardLink;
	wire [20: 0] writeInterconnect_S2M3_writeInterconnect_S2M_HardLink;
	wire [221 : 0] Inputs_iM2S [0 : 3];
	wire [73 : 0] Inputs_iS2M [0 : 10];
	wire [83 : 0] readInterconnect_iLeft [0 : 3];
	wire [52 : 0] readInterconnect_iRight [0 : 10];
	wire [83 : 0] readInterconnect_M2S [0 : 10];
	wire [52 : 0] readInterconnect_S2M [0 : 3];
	wire [137 : 0] writeInterconnect_iLeft [0 : 3];
	wire [20 : 0] writeInterconnect_iRight [0 : 10];
	wire [137 : 0] writeInterconnect_M2S [0 : 10];
	wire [20 : 0] writeInterconnect_S2M [0 : 3];
	wire [83 : 0] AXI4InteconnectModule_L46F29T67_Enumerable [0 : 3];
	wire [52 : 0] AXI4InteconnectModule_L47F30T68_Enumerable [0 : 10];
	wire [137 : 0] AXI4InteconnectModule_L54F29T67_Enumerable [0 : 3];
	wire [20 : 0] AXI4InteconnectModule_L55F30T68_Enumerable [0 : 10];
	wire [221 : 0] AXI4InteconnectModule_L69F35L76T24_Enumerable [0 : 10];
	wire [73 : 0] AXI4InteconnectModule_L60F35L67T24_Enumerable [0 : 3];
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect
	(
		// [BEGIN USER MAP FOR readInterconnect]
		// [END USER MAP FOR readInterconnect]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.iLeft0 (readInterconnect_iLeft0_readInterconnect_iLeft_HardLink),
		.iLeft1 (readInterconnect_iLeft1_readInterconnect_iLeft_HardLink),
		.iLeft2 (readInterconnect_iLeft2_readInterconnect_iLeft_HardLink),
		.iLeft3 (readInterconnect_iLeft3_readInterconnect_iLeft_HardLink),
		.iRight0 (readInterconnect_iRight0_readInterconnect_iRight_HardLink),
		.iRight1 (readInterconnect_iRight1_readInterconnect_iRight_HardLink),
		.iRight2 (readInterconnect_iRight2_readInterconnect_iRight_HardLink),
		.iRight3 (readInterconnect_iRight3_readInterconnect_iRight_HardLink),
		.iRight4 (readInterconnect_iRight4_readInterconnect_iRight_HardLink),
		.iRight5 (readInterconnect_iRight5_readInterconnect_iRight_HardLink),
		.iRight6 (readInterconnect_iRight6_readInterconnect_iRight_HardLink),
		.iRight7 (readInterconnect_iRight7_readInterconnect_iRight_HardLink),
		.iRight8 (readInterconnect_iRight8_readInterconnect_iRight_HardLink),
		.iRight9 (readInterconnect_iRight9_readInterconnect_iRight_HardLink),
		.iRight10 (readInterconnect_iRight10_readInterconnect_iRight_HardLink),
		.M2S0 (readInterconnect_M2S0_readInterconnect_M2S_HardLink),
		.M2S1 (readInterconnect_M2S1_readInterconnect_M2S_HardLink),
		.M2S2 (readInterconnect_M2S2_readInterconnect_M2S_HardLink),
		.M2S3 (readInterconnect_M2S3_readInterconnect_M2S_HardLink),
		.M2S4 (readInterconnect_M2S4_readInterconnect_M2S_HardLink),
		.M2S5 (readInterconnect_M2S5_readInterconnect_M2S_HardLink),
		.M2S6 (readInterconnect_M2S6_readInterconnect_M2S_HardLink),
		.M2S7 (readInterconnect_M2S7_readInterconnect_M2S_HardLink),
		.M2S8 (readInterconnect_M2S8_readInterconnect_M2S_HardLink),
		.M2S9 (readInterconnect_M2S9_readInterconnect_M2S_HardLink),
		.M2S10 (readInterconnect_M2S10_readInterconnect_M2S_HardLink),
		.S2M0 (readInterconnect_S2M0_readInterconnect_S2M_HardLink),
		.S2M1 (readInterconnect_S2M1_readInterconnect_S2M_HardLink),
		.S2M2 (readInterconnect_S2M2_readInterconnect_S2M_HardLink),
		.S2M3 (readInterconnect_S2M3_readInterconnect_S2M_HardLink)
	);
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect
	AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect
	(
		// [BEGIN USER MAP FOR writeInterconnect]
		// [END USER MAP FOR writeInterconnect]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.iLeft0 (writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink),
		.iLeft1 (writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink),
		.iLeft2 (writeInterconnect_iLeft2_writeInterconnect_iLeft_HardLink),
		.iLeft3 (writeInterconnect_iLeft3_writeInterconnect_iLeft_HardLink),
		.iRight0 (writeInterconnect_iRight0_writeInterconnect_iRight_HardLink),
		.iRight1 (writeInterconnect_iRight1_writeInterconnect_iRight_HardLink),
		.iRight2 (writeInterconnect_iRight2_writeInterconnect_iRight_HardLink),
		.iRight3 (writeInterconnect_iRight3_writeInterconnect_iRight_HardLink),
		.iRight4 (writeInterconnect_iRight4_writeInterconnect_iRight_HardLink),
		.iRight5 (writeInterconnect_iRight5_writeInterconnect_iRight_HardLink),
		.iRight6 (writeInterconnect_iRight6_writeInterconnect_iRight_HardLink),
		.iRight7 (writeInterconnect_iRight7_writeInterconnect_iRight_HardLink),
		.iRight8 (writeInterconnect_iRight8_writeInterconnect_iRight_HardLink),
		.iRight9 (writeInterconnect_iRight9_writeInterconnect_iRight_HardLink),
		.iRight10 (writeInterconnect_iRight10_writeInterconnect_iRight_HardLink),
		.M2S0 (writeInterconnect_M2S0_writeInterconnect_M2S_HardLink),
		.M2S1 (writeInterconnect_M2S1_writeInterconnect_M2S_HardLink),
		.M2S2 (writeInterconnect_M2S2_writeInterconnect_M2S_HardLink),
		.M2S3 (writeInterconnect_M2S3_writeInterconnect_M2S_HardLink),
		.M2S4 (writeInterconnect_M2S4_writeInterconnect_M2S_HardLink),
		.M2S5 (writeInterconnect_M2S5_writeInterconnect_M2S_HardLink),
		.M2S6 (writeInterconnect_M2S6_writeInterconnect_M2S_HardLink),
		.M2S7 (writeInterconnect_M2S7_writeInterconnect_M2S_HardLink),
		.M2S8 (writeInterconnect_M2S8_writeInterconnect_M2S_HardLink),
		.M2S9 (writeInterconnect_M2S9_writeInterconnect_M2S_HardLink),
		.M2S10 (writeInterconnect_M2S10_writeInterconnect_M2S_HardLink),
		.S2M0 (writeInterconnect_S2M0_writeInterconnect_S2M_HardLink),
		.S2M1 (writeInterconnect_S2M1_writeInterconnect_S2M_HardLink),
		.S2M2 (writeInterconnect_S2M2_writeInterconnect_S2M_HardLink),
		.S2M3 (writeInterconnect_S2M3_writeInterconnect_S2M_HardLink)
	);
	assign Inputs_iM2S[0] = iM2S0;
	assign Inputs_iM2S[1] = iM2S1;
	assign Inputs_iM2S[2] = iM2S2;
	assign Inputs_iM2S[3] = iM2S3;
	assign Inputs_iS2M[0] = iS2M0;
	assign Inputs_iS2M[1] = iS2M1;
	assign Inputs_iS2M[2] = iS2M2;
	assign Inputs_iS2M[3] = iS2M3;
	assign Inputs_iS2M[4] = iS2M4;
	assign Inputs_iS2M[5] = iS2M5;
	assign Inputs_iS2M[6] = iS2M6;
	assign Inputs_iS2M[7] = iS2M7;
	assign Inputs_iS2M[8] = iS2M8;
	assign Inputs_iS2M[9] = iS2M9;
	assign Inputs_iS2M[10] = iS2M10;
	assign AXI4InteconnectModule_L46F29T67_Enumerable[0] = Inputs_iM2S[0][83:0];
	assign AXI4InteconnectModule_L46F29T67_Enumerable[1] = Inputs_iM2S[1][83:0];
	assign AXI4InteconnectModule_L46F29T67_Enumerable[2] = Inputs_iM2S[2][83:0];
	assign AXI4InteconnectModule_L46F29T67_Enumerable[3] = Inputs_iM2S[3][83:0];
	assign AXI4InteconnectModule_L44F17L48T18_Object[335:0] = {
		AXI4InteconnectModule_L46F29T67_Enumerable[3],
		AXI4InteconnectModule_L46F29T67_Enumerable[2],
		AXI4InteconnectModule_L46F29T67_Enumerable[1],
		AXI4InteconnectModule_L46F29T67_Enumerable[0]
	}
	;
	assign AXI4InteconnectModule_L47F30T68_Enumerable[0] = Inputs_iS2M[0][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[1] = Inputs_iS2M[1][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[2] = Inputs_iS2M[2][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[3] = Inputs_iS2M[3][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[4] = Inputs_iS2M[4][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[5] = Inputs_iS2M[5][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[6] = Inputs_iS2M[6][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[7] = Inputs_iS2M[7][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[8] = Inputs_iS2M[8][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[9] = Inputs_iS2M[9][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[10] = Inputs_iS2M[10][52:0];
	assign AXI4InteconnectModule_L44F17L48T18_Object[918:336] = {
		AXI4InteconnectModule_L47F30T68_Enumerable[10],
		AXI4InteconnectModule_L47F30T68_Enumerable[9],
		AXI4InteconnectModule_L47F30T68_Enumerable[8],
		AXI4InteconnectModule_L47F30T68_Enumerable[7],
		AXI4InteconnectModule_L47F30T68_Enumerable[6],
		AXI4InteconnectModule_L47F30T68_Enumerable[5],
		AXI4InteconnectModule_L47F30T68_Enumerable[4],
		AXI4InteconnectModule_L47F30T68_Enumerable[3],
		AXI4InteconnectModule_L47F30T68_Enumerable[2],
		AXI4InteconnectModule_L47F30T68_Enumerable[1],
		AXI4InteconnectModule_L47F30T68_Enumerable[0]
	}
	;
	assign readInterconnect_iRight[10] = AXI4InteconnectModule_L44F17L48T18_Object[918:866];
	assign readInterconnect_iRight[9] = AXI4InteconnectModule_L44F17L48T18_Object[865:813];
	assign readInterconnect_iRight[8] = AXI4InteconnectModule_L44F17L48T18_Object[812:760];
	assign readInterconnect_iRight[7] = AXI4InteconnectModule_L44F17L48T18_Object[759:707];
	assign readInterconnect_iRight[6] = AXI4InteconnectModule_L44F17L48T18_Object[706:654];
	assign readInterconnect_iRight[5] = AXI4InteconnectModule_L44F17L48T18_Object[653:601];
	assign readInterconnect_iRight[4] = AXI4InteconnectModule_L44F17L48T18_Object[600:548];
	assign readInterconnect_iRight[3] = AXI4InteconnectModule_L44F17L48T18_Object[547:495];
	assign readInterconnect_iRight[2] = AXI4InteconnectModule_L44F17L48T18_Object[494:442];
	assign readInterconnect_iRight[1] = AXI4InteconnectModule_L44F17L48T18_Object[441:389];
	assign readInterconnect_iRight[0] = AXI4InteconnectModule_L44F17L48T18_Object[388:336];
	assign readInterconnect_iLeft[3] = AXI4InteconnectModule_L44F17L48T18_Object[335:252];
	assign readInterconnect_iLeft[2] = AXI4InteconnectModule_L44F17L48T18_Object[251:168];
	assign readInterconnect_iLeft[1] = AXI4InteconnectModule_L44F17L48T18_Object[167:84];
	assign readInterconnect_iLeft[0] = AXI4InteconnectModule_L44F17L48T18_Object[83:0];
	assign AXI4InteconnectModule_L54F29T67_Enumerable[0] = Inputs_iM2S[0][221:84];
	assign AXI4InteconnectModule_L54F29T67_Enumerable[1] = Inputs_iM2S[1][221:84];
	assign AXI4InteconnectModule_L54F29T67_Enumerable[2] = Inputs_iM2S[2][221:84];
	assign AXI4InteconnectModule_L54F29T67_Enumerable[3] = Inputs_iM2S[3][221:84];
	assign AXI4InteconnectModule_L52F17L56T18_Object[551:0] = {
		AXI4InteconnectModule_L54F29T67_Enumerable[3],
		AXI4InteconnectModule_L54F29T67_Enumerable[2],
		AXI4InteconnectModule_L54F29T67_Enumerable[1],
		AXI4InteconnectModule_L54F29T67_Enumerable[0]
	}
	;
	assign AXI4InteconnectModule_L55F30T68_Enumerable[0] = Inputs_iS2M[0][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[1] = Inputs_iS2M[1][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[2] = Inputs_iS2M[2][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[3] = Inputs_iS2M[3][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[4] = Inputs_iS2M[4][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[5] = Inputs_iS2M[5][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[6] = Inputs_iS2M[6][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[7] = Inputs_iS2M[7][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[8] = Inputs_iS2M[8][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[9] = Inputs_iS2M[9][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[10] = Inputs_iS2M[10][73:53];
	assign AXI4InteconnectModule_L52F17L56T18_Object[782:552] = {
		AXI4InteconnectModule_L55F30T68_Enumerable[10],
		AXI4InteconnectModule_L55F30T68_Enumerable[9],
		AXI4InteconnectModule_L55F30T68_Enumerable[8],
		AXI4InteconnectModule_L55F30T68_Enumerable[7],
		AXI4InteconnectModule_L55F30T68_Enumerable[6],
		AXI4InteconnectModule_L55F30T68_Enumerable[5],
		AXI4InteconnectModule_L55F30T68_Enumerable[4],
		AXI4InteconnectModule_L55F30T68_Enumerable[3],
		AXI4InteconnectModule_L55F30T68_Enumerable[2],
		AXI4InteconnectModule_L55F30T68_Enumerable[1],
		AXI4InteconnectModule_L55F30T68_Enumerable[0]
	}
	;
	assign writeInterconnect_iRight[10] = AXI4InteconnectModule_L52F17L56T18_Object[782:762];
	assign writeInterconnect_iRight[9] = AXI4InteconnectModule_L52F17L56T18_Object[761:741];
	assign writeInterconnect_iRight[8] = AXI4InteconnectModule_L52F17L56T18_Object[740:720];
	assign writeInterconnect_iRight[7] = AXI4InteconnectModule_L52F17L56T18_Object[719:699];
	assign writeInterconnect_iRight[6] = AXI4InteconnectModule_L52F17L56T18_Object[698:678];
	assign writeInterconnect_iRight[5] = AXI4InteconnectModule_L52F17L56T18_Object[677:657];
	assign writeInterconnect_iRight[4] = AXI4InteconnectModule_L52F17L56T18_Object[656:636];
	assign writeInterconnect_iRight[3] = AXI4InteconnectModule_L52F17L56T18_Object[635:615];
	assign writeInterconnect_iRight[2] = AXI4InteconnectModule_L52F17L56T18_Object[614:594];
	assign writeInterconnect_iRight[1] = AXI4InteconnectModule_L52F17L56T18_Object[593:573];
	assign writeInterconnect_iRight[0] = AXI4InteconnectModule_L52F17L56T18_Object[572:552];
	assign writeInterconnect_iLeft[3] = AXI4InteconnectModule_L52F17L56T18_Object[551:414];
	assign writeInterconnect_iLeft[2] = AXI4InteconnectModule_L52F17L56T18_Object[413:276];
	assign writeInterconnect_iLeft[1] = AXI4InteconnectModule_L52F17L56T18_Object[275:138];
	assign writeInterconnect_iLeft[0] = AXI4InteconnectModule_L52F17L56T18_Object[137:0];
	assign AXI4InteconnectModule_L69F35L76T24_0_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[0];
	assign AXI4InteconnectModule_L69F35L76T24_0_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[0];
	assign AXI4InteconnectModule_L69F35L76T24_1_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[1];
	assign AXI4InteconnectModule_L69F35L76T24_1_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[1];
	assign AXI4InteconnectModule_L69F35L76T24_2_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[2];
	assign AXI4InteconnectModule_L69F35L76T24_2_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[2];
	assign AXI4InteconnectModule_L69F35L76T24_3_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[3];
	assign AXI4InteconnectModule_L69F35L76T24_3_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[3];
	assign AXI4InteconnectModule_L69F35L76T24_4_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[4];
	assign AXI4InteconnectModule_L69F35L76T24_4_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[4];
	assign AXI4InteconnectModule_L69F35L76T24_5_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[5];
	assign AXI4InteconnectModule_L69F35L76T24_5_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[5];
	assign AXI4InteconnectModule_L69F35L76T24_6_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[6];
	assign AXI4InteconnectModule_L69F35L76T24_6_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[6];
	assign AXI4InteconnectModule_L69F35L76T24_7_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[7];
	assign AXI4InteconnectModule_L69F35L76T24_7_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[7];
	assign AXI4InteconnectModule_L69F35L76T24_8_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[8];
	assign AXI4InteconnectModule_L69F35L76T24_8_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[8];
	assign AXI4InteconnectModule_L69F35L76T24_9_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[9];
	assign AXI4InteconnectModule_L69F35L76T24_9_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[9];
	assign AXI4InteconnectModule_L69F35L76T24_10_AXI4InteconnectModule_L71F17L75T18_Object[83:0] = readInterconnect_M2S[10];
	assign AXI4InteconnectModule_L69F35L76T24_10_AXI4InteconnectModule_L71F17L75T18_Object[221:84] = writeInterconnect_M2S[10];
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[0] = AXI4InteconnectModule_L69F35L76T24_0_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[1] = AXI4InteconnectModule_L69F35L76T24_1_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[2] = AXI4InteconnectModule_L69F35L76T24_2_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[3] = AXI4InteconnectModule_L69F35L76T24_3_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[4] = AXI4InteconnectModule_L69F35L76T24_4_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[5] = AXI4InteconnectModule_L69F35L76T24_5_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[6] = AXI4InteconnectModule_L69F35L76T24_6_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[7] = AXI4InteconnectModule_L69F35L76T24_7_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[8] = AXI4InteconnectModule_L69F35L76T24_8_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[9] = AXI4InteconnectModule_L69F35L76T24_9_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[10] = AXI4InteconnectModule_L69F35L76T24_10_AXI4InteconnectModule_L71F17L75T18_Object;
	assign oM2S0 = AXI4InteconnectModule_L69F35L76T24_Enumerable[0];
	assign oM2S1 = AXI4InteconnectModule_L69F35L76T24_Enumerable[1];
	assign oM2S2 = AXI4InteconnectModule_L69F35L76T24_Enumerable[2];
	assign oM2S3 = AXI4InteconnectModule_L69F35L76T24_Enumerable[3];
	assign oM2S4 = AXI4InteconnectModule_L69F35L76T24_Enumerable[4];
	assign oM2S5 = AXI4InteconnectModule_L69F35L76T24_Enumerable[5];
	assign oM2S6 = AXI4InteconnectModule_L69F35L76T24_Enumerable[6];
	assign oM2S7 = AXI4InteconnectModule_L69F35L76T24_Enumerable[7];
	assign oM2S8 = AXI4InteconnectModule_L69F35L76T24_Enumerable[8];
	assign oM2S9 = AXI4InteconnectModule_L69F35L76T24_Enumerable[9];
	assign oM2S10 = AXI4InteconnectModule_L69F35L76T24_Enumerable[10];
	assign AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object[52:0] = readInterconnect_S2M[0];
	assign AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object[73:53] = writeInterconnect_S2M[0];
	assign AXI4InteconnectModule_L60F35L67T24_1_AXI4InteconnectModule_L62F17L66T18_Object[52:0] = readInterconnect_S2M[1];
	assign AXI4InteconnectModule_L60F35L67T24_1_AXI4InteconnectModule_L62F17L66T18_Object[73:53] = writeInterconnect_S2M[1];
	assign AXI4InteconnectModule_L60F35L67T24_2_AXI4InteconnectModule_L62F17L66T18_Object[52:0] = readInterconnect_S2M[2];
	assign AXI4InteconnectModule_L60F35L67T24_2_AXI4InteconnectModule_L62F17L66T18_Object[73:53] = writeInterconnect_S2M[2];
	assign AXI4InteconnectModule_L60F35L67T24_3_AXI4InteconnectModule_L62F17L66T18_Object[52:0] = readInterconnect_S2M[3];
	assign AXI4InteconnectModule_L60F35L67T24_3_AXI4InteconnectModule_L62F17L66T18_Object[73:53] = writeInterconnect_S2M[3];
	assign AXI4InteconnectModule_L60F35L67T24_Enumerable[0] = AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object;
	assign AXI4InteconnectModule_L60F35L67T24_Enumerable[1] = AXI4InteconnectModule_L60F35L67T24_1_AXI4InteconnectModule_L62F17L66T18_Object;
	assign AXI4InteconnectModule_L60F35L67T24_Enumerable[2] = AXI4InteconnectModule_L60F35L67T24_2_AXI4InteconnectModule_L62F17L66T18_Object;
	assign AXI4InteconnectModule_L60F35L67T24_Enumerable[3] = AXI4InteconnectModule_L60F35L67T24_3_AXI4InteconnectModule_L62F17L66T18_Object;
	assign oS2M0 = AXI4InteconnectModule_L60F35L67T24_Enumerable[0];
	assign oS2M1 = AXI4InteconnectModule_L60F35L67T24_Enumerable[1];
	assign oS2M2 = AXI4InteconnectModule_L60F35L67T24_Enumerable[2];
	assign oS2M3 = AXI4InteconnectModule_L60F35L67T24_Enumerable[3];
	assign readInterconnect_iLeft0_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[0];
	assign readInterconnect_iLeft1_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[1];
	assign readInterconnect_iLeft2_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[2];
	assign readInterconnect_iLeft3_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[3];
	assign readInterconnect_iRight0_readInterconnect_iRight_HardLink = readInterconnect_iRight[0];
	assign readInterconnect_iRight1_readInterconnect_iRight_HardLink = readInterconnect_iRight[1];
	assign readInterconnect_iRight2_readInterconnect_iRight_HardLink = readInterconnect_iRight[2];
	assign readInterconnect_iRight3_readInterconnect_iRight_HardLink = readInterconnect_iRight[3];
	assign readInterconnect_iRight4_readInterconnect_iRight_HardLink = readInterconnect_iRight[4];
	assign readInterconnect_iRight5_readInterconnect_iRight_HardLink = readInterconnect_iRight[5];
	assign readInterconnect_iRight6_readInterconnect_iRight_HardLink = readInterconnect_iRight[6];
	assign readInterconnect_iRight7_readInterconnect_iRight_HardLink = readInterconnect_iRight[7];
	assign readInterconnect_iRight8_readInterconnect_iRight_HardLink = readInterconnect_iRight[8];
	assign readInterconnect_iRight9_readInterconnect_iRight_HardLink = readInterconnect_iRight[9];
	assign readInterconnect_iRight10_readInterconnect_iRight_HardLink = readInterconnect_iRight[10];
	assign readInterconnect_M2S[0] = readInterconnect_M2S0_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[1] = readInterconnect_M2S1_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[2] = readInterconnect_M2S2_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[3] = readInterconnect_M2S3_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[4] = readInterconnect_M2S4_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[5] = readInterconnect_M2S5_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[6] = readInterconnect_M2S6_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[7] = readInterconnect_M2S7_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[8] = readInterconnect_M2S8_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[9] = readInterconnect_M2S9_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[10] = readInterconnect_M2S10_readInterconnect_M2S_HardLink;
	assign readInterconnect_S2M[0] = readInterconnect_S2M0_readInterconnect_S2M_HardLink;
	assign readInterconnect_S2M[1] = readInterconnect_S2M1_readInterconnect_S2M_HardLink;
	assign readInterconnect_S2M[2] = readInterconnect_S2M2_readInterconnect_S2M_HardLink;
	assign readInterconnect_S2M[3] = readInterconnect_S2M3_readInterconnect_S2M_HardLink;
	assign writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[0];
	assign writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[1];
	assign writeInterconnect_iLeft2_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[2];
	assign writeInterconnect_iLeft3_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[3];
	assign writeInterconnect_iRight0_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[0];
	assign writeInterconnect_iRight1_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[1];
	assign writeInterconnect_iRight2_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[2];
	assign writeInterconnect_iRight3_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[3];
	assign writeInterconnect_iRight4_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[4];
	assign writeInterconnect_iRight5_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[5];
	assign writeInterconnect_iRight6_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[6];
	assign writeInterconnect_iRight7_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[7];
	assign writeInterconnect_iRight8_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[8];
	assign writeInterconnect_iRight9_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[9];
	assign writeInterconnect_iRight10_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[10];
	assign writeInterconnect_M2S[0] = writeInterconnect_M2S0_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[1] = writeInterconnect_M2S1_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[2] = writeInterconnect_M2S2_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[3] = writeInterconnect_M2S3_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[4] = writeInterconnect_M2S4_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[5] = writeInterconnect_M2S5_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[6] = writeInterconnect_M2S6_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[7] = writeInterconnect_M2S7_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[8] = writeInterconnect_M2S8_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[9] = writeInterconnect_M2S9_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[10] = writeInterconnect_M2S10_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_S2M[0] = writeInterconnect_S2M0_writeInterconnect_S2M_HardLink;
	assign writeInterconnect_S2M[1] = writeInterconnect_S2M1_writeInterconnect_S2M_HardLink;
	assign writeInterconnect_S2M[2] = writeInterconnect_S2M2_writeInterconnect_S2M_HardLink;
	assign writeInterconnect_S2M[3] = writeInterconnect_S2M3_writeInterconnect_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
