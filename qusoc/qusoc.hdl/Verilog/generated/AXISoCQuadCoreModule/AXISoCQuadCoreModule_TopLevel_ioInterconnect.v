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
	input wire [73:0] iS2M0,
	input wire [73:0] iS2M1,
	input wire [73:0] iS2M2,
	input wire [73:0] iS2M3,
	input wire [73:0] iS2M4,
	input wire [73:0] iS2M5,
	input wire [73:0] iS2M6,
	output wire [221:0] oM2S0,
	output wire [221:0] oM2S1,
	output wire [221:0] oM2S2,
	output wire [221:0] oM2S3,
	output wire [221:0] oM2S4,
	output wire [221:0] oM2S5,
	output wire [221:0] oM2S6,
	output wire [73:0] oS2M0
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [1: 0] mCount = 2'b01;
	wire signed [3: 0] sCount = 4'b0111;
	wire [454: 0] AXI4InteconnectModule_L44F17L48T18_Object;
	wire [284: 0] AXI4InteconnectModule_L52F17L56T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_0_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_1_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_2_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_3_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_4_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_5_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [221: 0] AXI4InteconnectModule_L69F35L76T24_6_AXI4InteconnectModule_L71F17L75T18_Object;
	wire [73: 0] AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object;
	wire [83: 0] readInterconnect_iLeft0_readInterconnect_iLeft_HardLink;
	wire [52: 0] readInterconnect_iRight0_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight1_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight2_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight3_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight4_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight5_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight6_readInterconnect_iRight_HardLink;
	wire [83: 0] readInterconnect_M2S0_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S1_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S2_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S3_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S4_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S5_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S6_readInterconnect_M2S_HardLink;
	wire [52: 0] readInterconnect_S2M0_readInterconnect_S2M_HardLink;
	wire [137: 0] writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink;
	wire [20: 0] writeInterconnect_iRight0_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight1_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight2_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight3_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight4_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight5_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight6_writeInterconnect_iRight_HardLink;
	wire [137: 0] writeInterconnect_M2S0_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S1_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S2_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S3_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S4_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S5_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S6_writeInterconnect_M2S_HardLink;
	wire [20: 0] writeInterconnect_S2M0_writeInterconnect_S2M_HardLink;
	wire [221 : 0] Inputs_iM2S [0 : 0];
	wire [73 : 0] Inputs_iS2M [0 : 6];
	wire [83 : 0] readInterconnect_iLeft [0 : 0];
	wire [52 : 0] readInterconnect_iRight [0 : 6];
	wire [83 : 0] readInterconnect_M2S [0 : 6];
	wire [52 : 0] readInterconnect_S2M [0 : 0];
	wire [137 : 0] writeInterconnect_iLeft [0 : 0];
	wire [20 : 0] writeInterconnect_iRight [0 : 6];
	wire [137 : 0] writeInterconnect_M2S [0 : 6];
	wire [20 : 0] writeInterconnect_S2M [0 : 0];
	wire [83 : 0] AXI4InteconnectModule_L46F29T67_Enumerable [0 : 0];
	wire [52 : 0] AXI4InteconnectModule_L47F30T68_Enumerable [0 : 6];
	wire [137 : 0] AXI4InteconnectModule_L54F29T67_Enumerable [0 : 0];
	wire [20 : 0] AXI4InteconnectModule_L55F30T68_Enumerable [0 : 6];
	wire [221 : 0] AXI4InteconnectModule_L69F35L76T24_Enumerable [0 : 6];
	wire [73 : 0] AXI4InteconnectModule_L60F35L67T24_Enumerable [0 : 0];
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
		.iRight0 (readInterconnect_iRight0_readInterconnect_iRight_HardLink),
		.iRight1 (readInterconnect_iRight1_readInterconnect_iRight_HardLink),
		.iRight2 (readInterconnect_iRight2_readInterconnect_iRight_HardLink),
		.iRight3 (readInterconnect_iRight3_readInterconnect_iRight_HardLink),
		.iRight4 (readInterconnect_iRight4_readInterconnect_iRight_HardLink),
		.iRight5 (readInterconnect_iRight5_readInterconnect_iRight_HardLink),
		.iRight6 (readInterconnect_iRight6_readInterconnect_iRight_HardLink),
		.M2S0 (readInterconnect_M2S0_readInterconnect_M2S_HardLink),
		.M2S1 (readInterconnect_M2S1_readInterconnect_M2S_HardLink),
		.M2S2 (readInterconnect_M2S2_readInterconnect_M2S_HardLink),
		.M2S3 (readInterconnect_M2S3_readInterconnect_M2S_HardLink),
		.M2S4 (readInterconnect_M2S4_readInterconnect_M2S_HardLink),
		.M2S5 (readInterconnect_M2S5_readInterconnect_M2S_HardLink),
		.M2S6 (readInterconnect_M2S6_readInterconnect_M2S_HardLink),
		.S2M0 (readInterconnect_S2M0_readInterconnect_S2M_HardLink)
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
		.iRight0 (writeInterconnect_iRight0_writeInterconnect_iRight_HardLink),
		.iRight1 (writeInterconnect_iRight1_writeInterconnect_iRight_HardLink),
		.iRight2 (writeInterconnect_iRight2_writeInterconnect_iRight_HardLink),
		.iRight3 (writeInterconnect_iRight3_writeInterconnect_iRight_HardLink),
		.iRight4 (writeInterconnect_iRight4_writeInterconnect_iRight_HardLink),
		.iRight5 (writeInterconnect_iRight5_writeInterconnect_iRight_HardLink),
		.iRight6 (writeInterconnect_iRight6_writeInterconnect_iRight_HardLink),
		.M2S0 (writeInterconnect_M2S0_writeInterconnect_M2S_HardLink),
		.M2S1 (writeInterconnect_M2S1_writeInterconnect_M2S_HardLink),
		.M2S2 (writeInterconnect_M2S2_writeInterconnect_M2S_HardLink),
		.M2S3 (writeInterconnect_M2S3_writeInterconnect_M2S_HardLink),
		.M2S4 (writeInterconnect_M2S4_writeInterconnect_M2S_HardLink),
		.M2S5 (writeInterconnect_M2S5_writeInterconnect_M2S_HardLink),
		.M2S6 (writeInterconnect_M2S6_writeInterconnect_M2S_HardLink),
		.S2M0 (writeInterconnect_S2M0_writeInterconnect_S2M_HardLink)
	);
	assign Inputs_iM2S[0] = iM2S0;
	assign Inputs_iS2M[0] = iS2M0;
	assign Inputs_iS2M[1] = iS2M1;
	assign Inputs_iS2M[2] = iS2M2;
	assign Inputs_iS2M[3] = iS2M3;
	assign Inputs_iS2M[4] = iS2M4;
	assign Inputs_iS2M[5] = iS2M5;
	assign Inputs_iS2M[6] = iS2M6;
	assign AXI4InteconnectModule_L46F29T67_Enumerable[0] = Inputs_iM2S[0][83:0];
	assign AXI4InteconnectModule_L44F17L48T18_Object[83:0] = AXI4InteconnectModule_L46F29T67_Enumerable[0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[0] = Inputs_iS2M[0][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[1] = Inputs_iS2M[1][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[2] = Inputs_iS2M[2][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[3] = Inputs_iS2M[3][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[4] = Inputs_iS2M[4][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[5] = Inputs_iS2M[5][52:0];
	assign AXI4InteconnectModule_L47F30T68_Enumerable[6] = Inputs_iS2M[6][52:0];
	assign AXI4InteconnectModule_L44F17L48T18_Object[454:84] = {
		AXI4InteconnectModule_L47F30T68_Enumerable[6],
		AXI4InteconnectModule_L47F30T68_Enumerable[5],
		AXI4InteconnectModule_L47F30T68_Enumerable[4],
		AXI4InteconnectModule_L47F30T68_Enumerable[3],
		AXI4InteconnectModule_L47F30T68_Enumerable[2],
		AXI4InteconnectModule_L47F30T68_Enumerable[1],
		AXI4InteconnectModule_L47F30T68_Enumerable[0]
	}
	;
	assign readInterconnect_iRight[6] = AXI4InteconnectModule_L44F17L48T18_Object[454:402];
	assign readInterconnect_iRight[5] = AXI4InteconnectModule_L44F17L48T18_Object[401:349];
	assign readInterconnect_iRight[4] = AXI4InteconnectModule_L44F17L48T18_Object[348:296];
	assign readInterconnect_iRight[3] = AXI4InteconnectModule_L44F17L48T18_Object[295:243];
	assign readInterconnect_iRight[2] = AXI4InteconnectModule_L44F17L48T18_Object[242:190];
	assign readInterconnect_iRight[1] = AXI4InteconnectModule_L44F17L48T18_Object[189:137];
	assign readInterconnect_iRight[0] = AXI4InteconnectModule_L44F17L48T18_Object[136:84];
	assign readInterconnect_iLeft[0] = AXI4InteconnectModule_L44F17L48T18_Object[83:0];
	assign AXI4InteconnectModule_L54F29T67_Enumerable[0] = Inputs_iM2S[0][221:84];
	assign AXI4InteconnectModule_L52F17L56T18_Object[137:0] = AXI4InteconnectModule_L54F29T67_Enumerable[0];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[0] = Inputs_iS2M[0][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[1] = Inputs_iS2M[1][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[2] = Inputs_iS2M[2][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[3] = Inputs_iS2M[3][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[4] = Inputs_iS2M[4][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[5] = Inputs_iS2M[5][73:53];
	assign AXI4InteconnectModule_L55F30T68_Enumerable[6] = Inputs_iS2M[6][73:53];
	assign AXI4InteconnectModule_L52F17L56T18_Object[284:138] = {
		AXI4InteconnectModule_L55F30T68_Enumerable[6],
		AXI4InteconnectModule_L55F30T68_Enumerable[5],
		AXI4InteconnectModule_L55F30T68_Enumerable[4],
		AXI4InteconnectModule_L55F30T68_Enumerable[3],
		AXI4InteconnectModule_L55F30T68_Enumerable[2],
		AXI4InteconnectModule_L55F30T68_Enumerable[1],
		AXI4InteconnectModule_L55F30T68_Enumerable[0]
	}
	;
	assign writeInterconnect_iRight[6] = AXI4InteconnectModule_L52F17L56T18_Object[284:264];
	assign writeInterconnect_iRight[5] = AXI4InteconnectModule_L52F17L56T18_Object[263:243];
	assign writeInterconnect_iRight[4] = AXI4InteconnectModule_L52F17L56T18_Object[242:222];
	assign writeInterconnect_iRight[3] = AXI4InteconnectModule_L52F17L56T18_Object[221:201];
	assign writeInterconnect_iRight[2] = AXI4InteconnectModule_L52F17L56T18_Object[200:180];
	assign writeInterconnect_iRight[1] = AXI4InteconnectModule_L52F17L56T18_Object[179:159];
	assign writeInterconnect_iRight[0] = AXI4InteconnectModule_L52F17L56T18_Object[158:138];
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
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[0] = AXI4InteconnectModule_L69F35L76T24_0_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[1] = AXI4InteconnectModule_L69F35L76T24_1_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[2] = AXI4InteconnectModule_L69F35L76T24_2_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[3] = AXI4InteconnectModule_L69F35L76T24_3_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[4] = AXI4InteconnectModule_L69F35L76T24_4_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[5] = AXI4InteconnectModule_L69F35L76T24_5_AXI4InteconnectModule_L71F17L75T18_Object;
	assign AXI4InteconnectModule_L69F35L76T24_Enumerable[6] = AXI4InteconnectModule_L69F35L76T24_6_AXI4InteconnectModule_L71F17L75T18_Object;
	assign oM2S0 = AXI4InteconnectModule_L69F35L76T24_Enumerable[0];
	assign oM2S1 = AXI4InteconnectModule_L69F35L76T24_Enumerable[1];
	assign oM2S2 = AXI4InteconnectModule_L69F35L76T24_Enumerable[2];
	assign oM2S3 = AXI4InteconnectModule_L69F35L76T24_Enumerable[3];
	assign oM2S4 = AXI4InteconnectModule_L69F35L76T24_Enumerable[4];
	assign oM2S5 = AXI4InteconnectModule_L69F35L76T24_Enumerable[5];
	assign oM2S6 = AXI4InteconnectModule_L69F35L76T24_Enumerable[6];
	assign AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object[52:0] = readInterconnect_S2M[0];
	assign AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object[73:53] = writeInterconnect_S2M[0];
	assign AXI4InteconnectModule_L60F35L67T24_Enumerable[0] = AXI4InteconnectModule_L60F35L67T24_0_AXI4InteconnectModule_L62F17L66T18_Object;
	assign oS2M0 = AXI4InteconnectModule_L60F35L67T24_Enumerable[0];
	assign readInterconnect_iLeft0_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[0];
	assign readInterconnect_iRight0_readInterconnect_iRight_HardLink = readInterconnect_iRight[0];
	assign readInterconnect_iRight1_readInterconnect_iRight_HardLink = readInterconnect_iRight[1];
	assign readInterconnect_iRight2_readInterconnect_iRight_HardLink = readInterconnect_iRight[2];
	assign readInterconnect_iRight3_readInterconnect_iRight_HardLink = readInterconnect_iRight[3];
	assign readInterconnect_iRight4_readInterconnect_iRight_HardLink = readInterconnect_iRight[4];
	assign readInterconnect_iRight5_readInterconnect_iRight_HardLink = readInterconnect_iRight[5];
	assign readInterconnect_iRight6_readInterconnect_iRight_HardLink = readInterconnect_iRight[6];
	assign readInterconnect_M2S[0] = readInterconnect_M2S0_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[1] = readInterconnect_M2S1_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[2] = readInterconnect_M2S2_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[3] = readInterconnect_M2S3_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[4] = readInterconnect_M2S4_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[5] = readInterconnect_M2S5_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[6] = readInterconnect_M2S6_readInterconnect_M2S_HardLink;
	assign readInterconnect_S2M[0] = readInterconnect_S2M0_readInterconnect_S2M_HardLink;
	assign writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[0];
	assign writeInterconnect_iRight0_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[0];
	assign writeInterconnect_iRight1_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[1];
	assign writeInterconnect_iRight2_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[2];
	assign writeInterconnect_iRight3_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[3];
	assign writeInterconnect_iRight4_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[4];
	assign writeInterconnect_iRight5_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[5];
	assign writeInterconnect_iRight6_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[6];
	assign writeInterconnect_M2S[0] = writeInterconnect_M2S0_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[1] = writeInterconnect_M2S1_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[2] = writeInterconnect_M2S2_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[3] = writeInterconnect_M2S3_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[4] = writeInterconnect_M2S4_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[5] = writeInterconnect_M2S5_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[6] = writeInterconnect_M2S6_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_S2M[0] = writeInterconnect_S2M0_writeInterconnect_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
