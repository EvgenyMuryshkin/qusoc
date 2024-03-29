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
// System configuration name is AXI4SoC2x2_TopLevel_interconnect, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4SoC2x2_TopLevel_interconnect
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
	input wire [73:0] iS2M0,
	input wire [73:0] iS2M1,
	output wire [221:0] oM2S0,
	output wire [221:0] oM2S1,
	output wire [73:0] oS2M0,
	output wire [73:0] oS2M1
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [2: 0] mCount = 3'b010;
	wire signed [2: 0] sCount = 3'b010;
	wire [273: 0] AXI4InteconnectModule_L43F17L47T18_Object;
	wire [317: 0] AXI4InteconnectModule_L51F17L55T18_Object;
	wire [221: 0] AXI4InteconnectModule_L68F35L75T24_0_AXI4InteconnectModule_L70F17L74T18_Object;
	wire [221: 0] AXI4InteconnectModule_L68F35L75T24_1_AXI4InteconnectModule_L70F17L74T18_Object;
	wire [73: 0] AXI4InteconnectModule_L59F35L66T24_0_AXI4InteconnectModule_L61F17L65T18_Object;
	wire [73: 0] AXI4InteconnectModule_L59F35L66T24_1_AXI4InteconnectModule_L61F17L65T18_Object;
	wire [83: 0] readInterconnect_iLeft0_readInterconnect_iLeft_HardLink;
	wire [83: 0] readInterconnect_iLeft1_readInterconnect_iLeft_HardLink;
	wire [52: 0] readInterconnect_iRight0_readInterconnect_iRight_HardLink;
	wire [52: 0] readInterconnect_iRight1_readInterconnect_iRight_HardLink;
	wire [83: 0] readInterconnect_M2S0_readInterconnect_M2S_HardLink;
	wire [83: 0] readInterconnect_M2S1_readInterconnect_M2S_HardLink;
	wire [52: 0] readInterconnect_S2M0_readInterconnect_S2M_HardLink;
	wire [52: 0] readInterconnect_S2M1_readInterconnect_S2M_HardLink;
	wire [137: 0] writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink;
	wire [137: 0] writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink;
	wire [20: 0] writeInterconnect_iRight0_writeInterconnect_iRight_HardLink;
	wire [20: 0] writeInterconnect_iRight1_writeInterconnect_iRight_HardLink;
	wire [137: 0] writeInterconnect_M2S0_writeInterconnect_M2S_HardLink;
	wire [137: 0] writeInterconnect_M2S1_writeInterconnect_M2S_HardLink;
	wire [20: 0] writeInterconnect_S2M0_writeInterconnect_S2M_HardLink;
	wire [20: 0] writeInterconnect_S2M1_writeInterconnect_S2M_HardLink;
	wire [221 : 0] Inputs_iM2S [0 : 1];
	wire [73 : 0] Inputs_iS2M [0 : 1];
	wire [83 : 0] readInterconnect_iLeft [0 : 1];
	wire [52 : 0] readInterconnect_iRight [0 : 1];
	wire [83 : 0] readInterconnect_M2S [0 : 1];
	wire [52 : 0] readInterconnect_S2M [0 : 1];
	wire [137 : 0] writeInterconnect_iLeft [0 : 1];
	wire [20 : 0] writeInterconnect_iRight [0 : 1];
	wire [137 : 0] writeInterconnect_M2S [0 : 1];
	wire [20 : 0] writeInterconnect_S2M [0 : 1];
	wire [83 : 0] AXI4InteconnectModule_L45F29T67_Enumerable [0 : 1];
	wire [52 : 0] AXI4InteconnectModule_L46F30T68_Enumerable [0 : 1];
	wire [137 : 0] AXI4InteconnectModule_L53F29T67_Enumerable [0 : 1];
	wire [20 : 0] AXI4InteconnectModule_L54F30T68_Enumerable [0 : 1];
	wire [221 : 0] AXI4InteconnectModule_L68F35L75T24_Enumerable [0 : 1];
	wire [73 : 0] AXI4InteconnectModule_L59F35L66T24_Enumerable [0 : 1];
	AXI4SoC2x2_TopLevel_interconnect_readInterconnect
	AXI4SoC2x2_TopLevel_interconnect_readInterconnect
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
		.iRight0 (readInterconnect_iRight0_readInterconnect_iRight_HardLink),
		.iRight1 (readInterconnect_iRight1_readInterconnect_iRight_HardLink),
		.M2S0 (readInterconnect_M2S0_readInterconnect_M2S_HardLink),
		.M2S1 (readInterconnect_M2S1_readInterconnect_M2S_HardLink),
		.S2M0 (readInterconnect_S2M0_readInterconnect_S2M_HardLink),
		.S2M1 (readInterconnect_S2M1_readInterconnect_S2M_HardLink)
	);
	AXI4SoC2x2_TopLevel_interconnect_writeInterconnect
	AXI4SoC2x2_TopLevel_interconnect_writeInterconnect
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
		.iRight0 (writeInterconnect_iRight0_writeInterconnect_iRight_HardLink),
		.iRight1 (writeInterconnect_iRight1_writeInterconnect_iRight_HardLink),
		.M2S0 (writeInterconnect_M2S0_writeInterconnect_M2S_HardLink),
		.M2S1 (writeInterconnect_M2S1_writeInterconnect_M2S_HardLink),
		.S2M0 (writeInterconnect_S2M0_writeInterconnect_S2M_HardLink),
		.S2M1 (writeInterconnect_S2M1_writeInterconnect_S2M_HardLink)
	);
	assign Inputs_iM2S[0] = iM2S0;
	assign Inputs_iM2S[1] = iM2S1;
	assign Inputs_iS2M[0] = iS2M0;
	assign Inputs_iS2M[1] = iS2M1;
	assign AXI4InteconnectModule_L45F29T67_Enumerable[0] = Inputs_iM2S[0][83:0];
	assign AXI4InteconnectModule_L45F29T67_Enumerable[1] = Inputs_iM2S[1][83:0];
	assign AXI4InteconnectModule_L43F17L47T18_Object[167:0] = {
		AXI4InteconnectModule_L45F29T67_Enumerable[1],
		AXI4InteconnectModule_L45F29T67_Enumerable[0]
	}
	;
	assign AXI4InteconnectModule_L46F30T68_Enumerable[0] = Inputs_iS2M[0][52:0];
	assign AXI4InteconnectModule_L46F30T68_Enumerable[1] = Inputs_iS2M[1][52:0];
	assign AXI4InteconnectModule_L43F17L47T18_Object[273:168] = {
		AXI4InteconnectModule_L46F30T68_Enumerable[1],
		AXI4InteconnectModule_L46F30T68_Enumerable[0]
	}
	;
	assign readInterconnect_iRight[1] = AXI4InteconnectModule_L43F17L47T18_Object[273:221];
	assign readInterconnect_iRight[0] = AXI4InteconnectModule_L43F17L47T18_Object[220:168];
	assign readInterconnect_iLeft[1] = AXI4InteconnectModule_L43F17L47T18_Object[167:84];
	assign readInterconnect_iLeft[0] = AXI4InteconnectModule_L43F17L47T18_Object[83:0];
	assign AXI4InteconnectModule_L53F29T67_Enumerable[0] = Inputs_iM2S[0][221:84];
	assign AXI4InteconnectModule_L53F29T67_Enumerable[1] = Inputs_iM2S[1][221:84];
	assign AXI4InteconnectModule_L51F17L55T18_Object[275:0] = {
		AXI4InteconnectModule_L53F29T67_Enumerable[1],
		AXI4InteconnectModule_L53F29T67_Enumerable[0]
	}
	;
	assign AXI4InteconnectModule_L54F30T68_Enumerable[0] = Inputs_iS2M[0][73:53];
	assign AXI4InteconnectModule_L54F30T68_Enumerable[1] = Inputs_iS2M[1][73:53];
	assign AXI4InteconnectModule_L51F17L55T18_Object[317:276] = {
		AXI4InteconnectModule_L54F30T68_Enumerable[1],
		AXI4InteconnectModule_L54F30T68_Enumerable[0]
	}
	;
	assign writeInterconnect_iRight[1] = AXI4InteconnectModule_L51F17L55T18_Object[317:297];
	assign writeInterconnect_iRight[0] = AXI4InteconnectModule_L51F17L55T18_Object[296:276];
	assign writeInterconnect_iLeft[1] = AXI4InteconnectModule_L51F17L55T18_Object[275:138];
	assign writeInterconnect_iLeft[0] = AXI4InteconnectModule_L51F17L55T18_Object[137:0];
	assign AXI4InteconnectModule_L68F35L75T24_0_AXI4InteconnectModule_L70F17L74T18_Object[83:0] = readInterconnect_M2S[0];
	assign AXI4InteconnectModule_L68F35L75T24_0_AXI4InteconnectModule_L70F17L74T18_Object[221:84] = writeInterconnect_M2S[0];
	assign AXI4InteconnectModule_L68F35L75T24_1_AXI4InteconnectModule_L70F17L74T18_Object[83:0] = readInterconnect_M2S[1];
	assign AXI4InteconnectModule_L68F35L75T24_1_AXI4InteconnectModule_L70F17L74T18_Object[221:84] = writeInterconnect_M2S[1];
	assign AXI4InteconnectModule_L68F35L75T24_Enumerable[0] = AXI4InteconnectModule_L68F35L75T24_0_AXI4InteconnectModule_L70F17L74T18_Object;
	assign AXI4InteconnectModule_L68F35L75T24_Enumerable[1] = AXI4InteconnectModule_L68F35L75T24_1_AXI4InteconnectModule_L70F17L74T18_Object;
	assign oM2S0 = AXI4InteconnectModule_L68F35L75T24_Enumerable[0];
	assign oM2S1 = AXI4InteconnectModule_L68F35L75T24_Enumerable[1];
	assign AXI4InteconnectModule_L59F35L66T24_0_AXI4InteconnectModule_L61F17L65T18_Object[52:0] = readInterconnect_S2M[0];
	assign AXI4InteconnectModule_L59F35L66T24_0_AXI4InteconnectModule_L61F17L65T18_Object[73:53] = writeInterconnect_S2M[0];
	assign AXI4InteconnectModule_L59F35L66T24_1_AXI4InteconnectModule_L61F17L65T18_Object[52:0] = readInterconnect_S2M[1];
	assign AXI4InteconnectModule_L59F35L66T24_1_AXI4InteconnectModule_L61F17L65T18_Object[73:53] = writeInterconnect_S2M[1];
	assign AXI4InteconnectModule_L59F35L66T24_Enumerable[0] = AXI4InteconnectModule_L59F35L66T24_0_AXI4InteconnectModule_L61F17L65T18_Object;
	assign AXI4InteconnectModule_L59F35L66T24_Enumerable[1] = AXI4InteconnectModule_L59F35L66T24_1_AXI4InteconnectModule_L61F17L65T18_Object;
	assign oS2M0 = AXI4InteconnectModule_L59F35L66T24_Enumerable[0];
	assign oS2M1 = AXI4InteconnectModule_L59F35L66T24_Enumerable[1];
	assign readInterconnect_iLeft0_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[0];
	assign readInterconnect_iLeft1_readInterconnect_iLeft_HardLink = readInterconnect_iLeft[1];
	assign readInterconnect_iRight0_readInterconnect_iRight_HardLink = readInterconnect_iRight[0];
	assign readInterconnect_iRight1_readInterconnect_iRight_HardLink = readInterconnect_iRight[1];
	assign readInterconnect_M2S[0] = readInterconnect_M2S0_readInterconnect_M2S_HardLink;
	assign readInterconnect_M2S[1] = readInterconnect_M2S1_readInterconnect_M2S_HardLink;
	assign readInterconnect_S2M[0] = readInterconnect_S2M0_readInterconnect_S2M_HardLink;
	assign readInterconnect_S2M[1] = readInterconnect_S2M1_readInterconnect_S2M_HardLink;
	assign writeInterconnect_iLeft0_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[0];
	assign writeInterconnect_iLeft1_writeInterconnect_iLeft_HardLink = writeInterconnect_iLeft[1];
	assign writeInterconnect_iRight0_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[0];
	assign writeInterconnect_iRight1_writeInterconnect_iRight_HardLink = writeInterconnect_iRight[1];
	assign writeInterconnect_M2S[0] = writeInterconnect_M2S0_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_M2S[1] = writeInterconnect_M2S1_writeInterconnect_M2S_HardLink;
	assign writeInterconnect_S2M[0] = writeInterconnect_S2M0_writeInterconnect_S2M_HardLink;
	assign writeInterconnect_S2M[1] = writeInterconnect_S2M1_writeInterconnect_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
