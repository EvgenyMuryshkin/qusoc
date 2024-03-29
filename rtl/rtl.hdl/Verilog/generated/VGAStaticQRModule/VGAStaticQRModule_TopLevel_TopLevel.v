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
// System configuration name is VGAStaticQRModule_TopLevel_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module VGAStaticQRModule_TopLevel_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	output wire R,
	output wire G,
	output wire B,
	output wire OutVisible,
	output wire VSync,
	output wire HSync
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [4: 0] ramBits = 5'b10001;
	wire [1: 0] VGAStaticQRModule_L85F69T70_Expr = 2'b10;
	wire [1: 0] VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F74T75_Expr = 2'b10;
	wire VGAStaticQRModule_L87F55T56_Expr = 1'b1;
	wire [1: 0] VGAStaticQRModule_L88F55T56_Expr = 2'b10;
	wire [1: 0] VGAStaticQRModule_L89F55T56_Expr = 2'b11;
	reg NextState_Visible;
	reg NextState_HSync;
	reg NextState_VSync;
	reg [18: 0] NextState_PixelAddress;
	wire [1: 0] pixelAddress;
	wire [1: 0] pixelBits;
	wire vgaController_VSync;
	wire vgaController_HSync;
	wire vgaController_OutVisible;
	wire [9: 0] vgaController_OutVPixel;
	wire [10: 0] vgaController_OutHPixel;
	wire [18: 0] vgaController_OutPixelAddress;
	wire [1: 0] VGAStaticQRModule_L85F34T93_Index;
	wire vgaControllerVSyncvgaController_VSyncHardLink;
	wire vgaControllerHSyncvgaController_HSyncHardLink;
	wire vgaControllerOutVisiblevgaController_OutVisibleHardLink;
	wire [9: 0] vgaControllerOutVPixelvgaController_OutVPixelHardLink;
	wire [10: 0] vgaControllerOutHPixelvgaController_OutHPixelHardLink;
	wire [18: 0] vgaControllerOutPixelAddressvgaController_OutPixelAddressHardLink;
	reg State_Visible = 1'b0;
	wire State_VisibleDefault = 1'b0;
	reg State_HSync = 1'b0;
	wire State_HSyncDefault = 1'b0;
	reg State_VSync = 1'b0;
	wire State_VSyncDefault = 1'b0;
	reg [7: 0] State_Pixels = 8'b00000000;
	reg [18: 0] State_PixelAddress = 19'b0000000000000000000;
	wire [18: 0] State_PixelAddressDefault = 19'b0000000000000000000;
	wire [7: 0] VGAStaticQRModule_L85F35T86_Expr;
	wire [7: 0] VGAStaticQRModule_L85F35T86_Expr_1;
	wire [18: 0] VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr;
	wire [18: 0] VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1;
	wire VGAStaticQRModule_L87F26T56_Expr;
	wire VGAStaticQRModule_L87F26T56_Expr_1;
	wire VGAStaticQRModule_L87F26T56_Expr_2;
	wire VGAStaticQRModule_L88F26T56_Expr;
	wire VGAStaticQRModule_L88F26T56_Expr_1;
	wire VGAStaticQRModule_L88F26T56_Expr_2;
	wire VGAStaticQRModule_L89F26T56_Expr;
	wire VGAStaticQRModule_L89F26T56_Expr_1;
	wire VGAStaticQRModule_L89F26T56_Expr_2;
	wire [4: 0] VGAStaticQRModule_L85F69T85_Expr;
	wire signed [4: 0] VGAStaticQRModule_L85F69T85_Expr_1;
	wire signed [4: 0] VGAStaticQRModule_L85F69T85_Expr_2;
	wire VGAStaticQRModule_L87F42T56_Expr;
	wire signed [2: 0] VGAStaticQRModule_L87F42T56_ExprLhs;
	wire signed [2: 0] VGAStaticQRModule_L87F42T56_ExprRhs;
	wire VGAStaticQRModule_L88F42T56_Expr;
	wire signed [2: 0] VGAStaticQRModule_L88F42T56_ExprLhs;
	wire signed [2: 0] VGAStaticQRModule_L88F42T56_ExprRhs;
	wire VGAStaticQRModule_L89F42T56_Expr;
	wire signed [2: 0] VGAStaticQRModule_L89F42T56_ExprLhs;
	wire signed [2: 0] VGAStaticQRModule_L89F42T56_ExprRhs;
	reg [7 : 0] State_QR [0 : 131071];
	initial
	begin : Init_State_QR
$readmemh("VGAStaticQRModule_TopLevel_TopLevel_State_QR.hex", State_QR);
	end
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_Visible <= State_VisibleDefault;
			State_HSync <= State_HSyncDefault;
			State_VSync <= State_VSyncDefault;
			State_PixelAddress <= State_PixelAddressDefault;
		end
		else
		begin
			State_Visible <= NextState_Visible;
			State_HSync <= NextState_HSync;
			State_VSync <= NextState_VSync;
			State_PixelAddress <= NextState_PixelAddress;
		end
	end
	assign VGAStaticQRModule_L87F42T56_Expr = VGAStaticQRModule_L87F42T56_ExprLhs == VGAStaticQRModule_L87F42T56_ExprRhs ? 1'b1 : 1'b0;
	assign VGAStaticQRModule_L88F42T56_Expr = VGAStaticQRModule_L88F42T56_ExprLhs == VGAStaticQRModule_L88F42T56_ExprRhs ? 1'b1 : 1'b0;
	assign VGAStaticQRModule_L89F42T56_Expr = VGAStaticQRModule_L89F42T56_ExprLhs == VGAStaticQRModule_L89F42T56_ExprRhs ? 1'b1 : 1'b0;
	assign VGAStaticQRModule_L85F35T86_Expr = (VGAStaticQRModule_L85F35T86_Expr_1 >> VGAStaticQRModule_L85F69T85_Expr);
	// Output: VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr, Width: 19, ShiftBy: 2, Sources: 1
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[0] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[2];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[1] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[3];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[2] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[4];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[3] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[5];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[4] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[6];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[5] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[7];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[6] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[8];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[7] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[9];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[8] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[10];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[9] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[11];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[10] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[12];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[11] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[13];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[12] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[14];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[13] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[15];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[14] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[16];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[15] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[17];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[16] = VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1[18];
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[17] = 0;
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr[18] = 0;
	assign VGAStaticQRModule_L87F26T56_Expr = VGAStaticQRModule_L87F26T56_Expr_1 & VGAStaticQRModule_L87F26T56_Expr_2;
	assign VGAStaticQRModule_L88F26T56_Expr = VGAStaticQRModule_L88F26T56_Expr_1 & VGAStaticQRModule_L88F26T56_Expr_2;
	assign VGAStaticQRModule_L89F26T56_Expr = VGAStaticQRModule_L89F26T56_Expr_1 & VGAStaticQRModule_L89F26T56_Expr_2;
	assign VGAStaticQRModule_L85F69T85_Expr = VGAStaticQRModule_L85F69T85_Expr_1 * VGAStaticQRModule_L85F69T85_Expr_2;
	VGAStaticQRModule_TopLevel_TopLevel_vgaController
	VGAStaticQRModule_TopLevel_TopLevel_vgaController
	(
		// [BEGIN USER MAP FOR vgaController]
		// [END USER MAP FOR vgaController]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.VSync (vgaControllerVSyncvgaController_VSyncHardLink),
		.HSync (vgaControllerHSyncvgaController_HSyncHardLink),
		.OutVisible (vgaControllerOutVisiblevgaController_OutVisibleHardLink),
		.OutVPixel (vgaControllerOutVPixelvgaController_OutVPixelHardLink),
		.OutHPixel (vgaControllerOutHPixelvgaController_OutHPixelHardLink),
		.OutPixelAddress (vgaControllerOutPixelAddressvgaController_OutPixelAddressHardLink)
	);
	always @ (posedge Clock)
	begin
		State_Pixels <= State_QR[VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr];
	end
	always @ (*)
	begin
		NextState_Visible = State_Visible;
		NextState_HSync = State_HSync;
		NextState_VSync = State_VSync;
		NextState_PixelAddress = State_PixelAddress;
		NextState_PixelAddress = vgaController_OutPixelAddress;
		NextState_Visible = vgaController_OutVisible;
		NextState_HSync = vgaController_HSync;
		NextState_VSync = vgaController_VSync;
	end
	assign VGAStaticQRModule_L87F42T56_ExprLhs = { 1'b0, pixelBits };
	assign VGAStaticQRModule_L87F42T56_ExprRhs = { {2{1'b0}}, VGAStaticQRModule_L87F55T56_Expr };
	assign VGAStaticQRModule_L88F42T56_ExprLhs = { 1'b0, pixelBits };
	assign VGAStaticQRModule_L88F42T56_ExprRhs = { 1'b0, VGAStaticQRModule_L88F55T56_Expr };
	assign VGAStaticQRModule_L89F42T56_ExprLhs = { 1'b0, pixelBits };
	assign VGAStaticQRModule_L89F42T56_ExprRhs = { 1'b0, VGAStaticQRModule_L89F55T56_Expr };
	assign VGAStaticQRModule_L85F35T86_Expr_1 = State_Pixels;
	assign VGAStaticQRModule_L102F9L108T10_VGAStaticQRModule_L103F41T75_Expr_1 = vgaController_OutPixelAddress;
	assign VGAStaticQRModule_L87F26T56_Expr_1 = State_Visible;
	assign VGAStaticQRModule_L87F26T56_Expr_2 = VGAStaticQRModule_L87F42T56_Expr;
	assign VGAStaticQRModule_L88F26T56_Expr_1 = State_Visible;
	assign VGAStaticQRModule_L88F26T56_Expr_2 = VGAStaticQRModule_L88F42T56_Expr;
	assign VGAStaticQRModule_L89F26T56_Expr_1 = State_Visible;
	assign VGAStaticQRModule_L89F26T56_Expr_2 = VGAStaticQRModule_L89F42T56_Expr;
	assign VGAStaticQRModule_L85F69T85_Expr_1 = { {3{1'b0}}, VGAStaticQRModule_L85F69T70_Expr };
	assign VGAStaticQRModule_L85F69T85_Expr_2 = { {3{1'b0}}, pixelAddress };
	assign pixelAddress = State_PixelAddress[1:0];
	assign VGAStaticQRModule_L85F34T93_Index = VGAStaticQRModule_L85F35T86_Expr[1:0];
	assign pixelBits = VGAStaticQRModule_L85F34T93_Index;
	assign R = VGAStaticQRModule_L87F26T56_Expr;
	assign G = VGAStaticQRModule_L88F26T56_Expr;
	assign B = VGAStaticQRModule_L89F26T56_Expr;
	assign OutVisible = State_Visible;
	assign VSync = State_VSync;
	assign HSync = State_HSync;
	assign vgaController_VSync = vgaControllerVSyncvgaController_VSyncHardLink;
	assign vgaController_HSync = vgaControllerHSyncvgaController_HSyncHardLink;
	assign vgaController_OutVisible = vgaControllerOutVisiblevgaController_OutVisibleHardLink;
	assign vgaController_OutVPixel = vgaControllerOutVPixelvgaController_OutVPixelHardLink;
	assign vgaController_OutHPixel = vgaControllerOutHPixelvgaController_OutHPixelHardLink;
	assign vgaController_OutPixelAddress = vgaControllerOutPixelAddressvgaController_OutPixelAddressHardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
