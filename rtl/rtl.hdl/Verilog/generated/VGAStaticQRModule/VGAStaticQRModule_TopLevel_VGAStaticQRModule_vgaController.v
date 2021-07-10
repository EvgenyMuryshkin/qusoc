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
// System configuration name is VGAStaticQRModule_TopLevel_VGAStaticQRModule_vgaController, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module VGAStaticQRModule_TopLevel_VGAStaticQRModule_vgaController (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  BoardSignals_Clock,
	input wire  BoardSignals_Reset,
	input wire  BoardSignals_Running,
	input wire  BoardSignals_Starting,
	input wire  BoardSignals_Started,
	output wire VSync,
	output wire HSync,
	output wire OutVisible,
	output wire [10: 1] OutVPixel,
	output wire [11: 1] OutHPixel,
	output wire [19: 1] OutPixelAddress
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  [4:0] addrBits = 5'b10011;
wire  VGAController_L58F72T76_Expr = 1'b1;
wire  [9:0] VGAController_L35F85T88_Expr = 10'b1100100000;
wire  VGAController_L35F126T127_Expr = 1'b0;
wire  internalVisible;
wire  hSync_Enabled;
wire  hSync_OutVisible;
wire  hSync_OutFP;
wire  hSync_OutSP;
wire  hSync_OutBP;
wire  hSync_OutMax;
wire  [10:0] hSync_OutCounter;
wire  vSync_Enabled;
wire  vSync_OutVisible;
wire  vSync_OutFP;
wire  vSync_OutSP;
wire  vSync_OutBP;
wire  vSync_OutMax;
wire  [9:0] vSync_OutCounter;
wire  VGAController_L35F110T128_Source;
wire  [18:0] VGAController_L35F47T140_SignChange;
wire  [18:0] VGAController_L35F47T158_Resize;
wire  hSyncEnabledhSync_EnabledHardLink;
wire  hSyncOutVisiblehSync_OutVisibleHardLink;
wire  hSyncOutFPhSync_OutFPHardLink;
wire  hSyncOutSPhSync_OutSPHardLink;
wire  hSyncOutBPhSync_OutBPHardLink;
wire  hSyncOutMaxhSync_OutMaxHardLink;
wire  [10:0] hSyncOutCounterhSync_OutCounterHardLink;
wire  vSyncEnabledvSync_EnabledHardLink;
wire  vSyncOutVisiblevSync_OutVisibleHardLink;
wire  vSyncOutFPvSync_OutFPHardLink;
wire  vSyncOutSPvSync_OutSPHardLink;
wire  vSyncOutBPvSync_OutBPHardLink;
wire  vSyncOutMaxvSync_OutMaxHardLink;
wire  [9:0] vSyncOutCountervSync_OutCounterHardLink;
wire  VGAController_L29F33T69_Expr;
wire  VGAController_L29F33T69_Expr_1;
wire  VGAController_L29F33T69_Expr_2;
wire  VGAController_L30F30T42_Expr;
wire  VGAController_L30F30T42_Expr_1;
wire  VGAController_L31F30T42_Expr;
wire  VGAController_L31F30T42_Expr_1;
wire  VGAController_L32F35T71_Expr;
wire  VGAController_L32F35T71_Expr_1;
wire  VGAController_L32F35T71_Expr_2;
wire  [22:0] VGAController_L35F66T107_Expr;
wire signed  [22:0] VGAController_L35F66T107_Expr_1;
wire signed  [22:0] VGAController_L35F66T107_Expr_2;
wire  [20:0] VGAController_L35F66T88_Expr;
wire signed  [20:0] VGAController_L35F66T88_Expr_1;
wire signed  [20:0] VGAController_L35F66T88_Expr_2;
reg  [18:0] VGAController_L35F48T128_Lookup;
wire  VGAController_L35F48T128_LookupMultiplexerAddress;
wire  [18:0] VGAController_L35F48T128_Lookup1;
wire  [18:0] VGAController_L35F48T128_Lookup2;
assign VGAController_L29F33T69_Expr = VGAController_L29F33T69_Expr_1 & VGAController_L29F33T69_Expr_2;
assign VGAController_L30F30T42_Expr = ~VGAController_L30F30T42_Expr_1;
assign VGAController_L31F30T42_Expr = ~VGAController_L31F30T42_Expr_1;
assign VGAController_L32F35T71_Expr = VGAController_L32F35T71_Expr_1 & VGAController_L32F35T71_Expr_2;
assign VGAController_L35F66T107_Expr = VGAController_L35F66T107_Expr_1 + VGAController_L35F66T107_Expr_2;
assign VGAController_L35F66T88_Expr = VGAController_L35F66T88_Expr_1 * VGAController_L35F66T88_Expr_2;
VGAStaticQRModule_TopLevel_VGAStaticQRModule_vgaController_VGAController_hSync VGAStaticQRModule_TopLevel_VGAStaticQRModule_vgaController_VGAController_hSync
(
// [BEGIN USER MAP FOR hSync]
// [END USER MAP FOR hSync]
	.BoardSignals_Clock (BoardSignals_Clock),
	.BoardSignals_Reset (BoardSignals_Reset),
	.BoardSignals_Running (BoardSignals_Running),
	.BoardSignals_Starting (BoardSignals_Starting),
	.BoardSignals_Started (BoardSignals_Started),
	.Enabled (hSyncEnabledhSync_EnabledHardLink),
	.OutVisible (hSyncOutVisiblehSync_OutVisibleHardLink),
	.OutFP (hSyncOutFPhSync_OutFPHardLink),
	.OutSP (hSyncOutSPhSync_OutSPHardLink),
	.OutBP (hSyncOutBPhSync_OutBPHardLink),
	.OutMax (hSyncOutMaxhSync_OutMaxHardLink),
	.OutCounter (hSyncOutCounterhSync_OutCounterHardLink)

);
VGAStaticQRModule_TopLevel_VGAStaticQRModule_vgaController_VGAController_vSync VGAStaticQRModule_TopLevel_VGAStaticQRModule_vgaController_VGAController_vSync
(
// [BEGIN USER MAP FOR vSync]
// [END USER MAP FOR vSync]
	.BoardSignals_Clock (BoardSignals_Clock),
	.BoardSignals_Reset (BoardSignals_Reset),
	.BoardSignals_Running (BoardSignals_Running),
	.BoardSignals_Starting (BoardSignals_Starting),
	.BoardSignals_Started (BoardSignals_Started),
	.Enabled (vSyncEnabledvSync_EnabledHardLink),
	.OutVisible (vSyncOutVisiblevSync_OutVisibleHardLink),
	.OutFP (vSyncOutFPvSync_OutFPHardLink),
	.OutSP (vSyncOutSPvSync_OutSPHardLink),
	.OutBP (vSyncOutBPvSync_OutBPHardLink),
	.OutMax (vSyncOutMaxvSync_OutMaxHardLink),
	.OutCounter (vSyncOutCountervSync_OutCounterHardLink)

);
always @*
begin
case (VGAController_L35F48T128_LookupMultiplexerAddress)
    'b0:
VGAController_L35F48T128_Lookup = VGAController_L35F48T128_Lookup1;
    'b1:
VGAController_L35F48T128_Lookup = VGAController_L35F48T128_Lookup2;
  default:
VGAController_L35F48T128_Lookup = 'b0000000000000000000;
endcase

end
assign VGAController_L29F33T69_Expr_1 = vSync_OutVisible;
assign VGAController_L29F33T69_Expr_2 = hSync_OutVisible;
assign VGAController_L30F30T42_Expr_1 = vSync_OutSP;
assign VGAController_L31F30T42_Expr_1 = hSync_OutSP;
assign VGAController_L32F35T71_Expr_1 = vSync_OutVisible;
assign VGAController_L32F35T71_Expr_2 = hSync_OutVisible;
assign VGAController_L35F66T107_Expr_1 = { {2{1'b0}}, VGAController_L35F66T88_Expr }/*expand*/;
assign VGAController_L35F66T107_Expr_2 = { {12{1'b0}}, hSync_OutCounter }/*expand*/;
assign VGAController_L35F66T88_Expr_1 = { {11{1'b0}}, vSync_OutCounter }/*expand*/;
assign VGAController_L35F66T88_Expr_2 = { {11{1'b0}}, VGAController_L35F85T88_Expr }/*expand*/;
assign internalVisible = VGAController_L29F33T69_Expr;
assign hSync_Enabled = VGAController_L58F72T76_Expr;
assign vSync_Enabled = hSync_OutMax;
assign VSync = VGAController_L30F30T42_Expr;
assign HSync = VGAController_L31F30T42_Expr;
assign OutVisible = VGAController_L32F35T71_Expr;
assign OutVPixel = vSync_OutCounter;
assign OutHPixel = hSync_OutCounter;
assign VGAController_L35F110T128_Source = VGAController_L35F126T127_Expr;
assign VGAController_L35F47T140_SignChange = VGAController_L35F48T128_Lookup;
assign VGAController_L35F47T158_Resize = VGAController_L35F47T140_SignChange;
assign OutPixelAddress = VGAController_L35F47T158_Resize;
assign hSyncEnabledhSync_EnabledHardLink = hSync_Enabled;
assign hSync_OutVisible = hSyncOutVisiblehSync_OutVisibleHardLink;
assign hSync_OutFP = hSyncOutFPhSync_OutFPHardLink;
assign hSync_OutSP = hSyncOutSPhSync_OutSPHardLink;
assign hSync_OutBP = hSyncOutBPhSync_OutBPHardLink;
assign hSync_OutMax = hSyncOutMaxhSync_OutMaxHardLink;
assign hSync_OutCounter = hSyncOutCounterhSync_OutCounterHardLink;
assign vSyncEnabledvSync_EnabledHardLink = vSync_Enabled;
assign vSync_OutVisible = vSyncOutVisiblevSync_OutVisibleHardLink;
assign vSync_OutFP = vSyncOutFPvSync_OutFPHardLink;
assign vSync_OutSP = vSyncOutSPvSync_OutSPHardLink;
assign vSync_OutBP = vSyncOutBPvSync_OutBPHardLink;
assign vSync_OutMax = vSyncOutMaxvSync_OutMaxHardLink;
assign vSync_OutCounter = vSyncOutCountervSync_OutCounterHardLink;
assign VGAController_L35F48T128_Lookup1 = { {18{1'b0}}, VGAController_L35F110T128_Source }/*expand*/;
assign VGAController_L35F48T128_Lookup2 = VGAController_L35F66T107_Expr[18:0]/*truncate*/;
assign VGAController_L35F48T128_LookupMultiplexerAddress = internalVisible;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
