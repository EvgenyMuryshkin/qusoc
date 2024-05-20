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
// System configuration name is AXIUARTModuleClocksTestModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXIUARTModuleClocksTestModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire iRX,
	input wire [31:0] Master_ARADDR,
	input wire [7:0] Master_ARUSER,
	input wire [31:0] Master_AWADDR,
	input wire Master_BREADY,
	input wire Master_RE,
	input wire Master_RREADY,
	input wire [7:0] Master_WDATA0,
	input wire [7:0] Master_WDATA1,
	input wire [7:0] Master_WDATA2,
	input wire [7:0] Master_WDATA3,
	input wire Master_WE,
	input wire [3:0] Master_WSTRB,
	output wire oCE,
	output wire oRACK,
	output wire [7:0] oRData0,
	output wire [7:0] oRData1,
	output wire [7:0] oRData2,
	output wire [7:0] oRData3,
	output wire signed [31:0] oRXCounter,
	output wire [7:0] oRXData,
	output wire oRXValid,
	output wire oTransmitting,
	output wire oTX,
	output wire signed [31:0] oTXCounter,
	output wire oWACK
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire Inputs_iRX;
	wire [31: 0] Inputs_Master_ARADDR;
	wire [7: 0] Inputs_Master_ARUSER;
	wire [31: 0] Inputs_Master_AWADDR;
	wire Inputs_Master_BREADY;
	wire Inputs_Master_RE;
	wire Inputs_Master_RREADY;
	wire Inputs_Master_WE;
	wire [3: 0] Inputs_Master_WSTRB;
	wire [111: 0] master_Master;
	wire [73: 0] master_S2M;
	wire [221: 0] master_M2S;
	wire master_RACK;
	wire master_WACK;
	wire uart_iRX;
	wire [221: 0] uart_M2S;
	wire uart_oCE;
	wire signed [31: 0] uart_oRXCounter;
	wire [7: 0] uart_oRXData;
	wire uart_oRXValid;
	wire [73: 0] uart_oS2M;
	wire uart_oTransmitting;
	wire uart_oTX;
	wire signed [31: 0] uart_oTXCounter;
	wire [222: 0] AXIUARTTestModule_L36F33L40T14_Object;
	wire [185: 0] AXIUARTTestModule_L42F35L46T14_Object;
	wire [111: 0] master_Master_master_Master_HardLink;
	wire [73: 0] master_S2M_master_S2M_HardLink;
	wire [221: 0] master_M2S_master_M2S_HardLink;
	wire master_RACK_master_RACK_HardLink;
	wire [7: 0] master_RDATA0_master_RDATA_HardLink;
	wire [7: 0] master_RDATA1_master_RDATA_HardLink;
	wire [7: 0] master_RDATA2_master_RDATA_HardLink;
	wire [7: 0] master_RDATA3_master_RDATA_HardLink;
	wire master_WACK_master_WACK_HardLink;
	wire uart_iRX_uart_iRX_HardLink;
	wire [221: 0] uart_M2S_uart_M2S_HardLink;
	wire uart_oCE_uart_oCE_HardLink;
	wire signed [31: 0] uart_oRXCounter_uart_oRXCounter_HardLink;
	wire [7: 0] uart_oRXData_uart_oRXData_HardLink;
	wire uart_oRXValid_uart_oRXValid_HardLink;
	wire [73: 0] uart_oS2M_uart_oS2M_HardLink;
	wire uart_oTransmitting_uart_oTransmitting_HardLink;
	wire uart_oTX_uart_oTX_HardLink;
	wire signed [31: 0] uart_oTXCounter_uart_oTXCounter_HardLink;
	wire [7 : 0] Inputs_Master_WDATA [0 : 3];
	wire [7 : 0] master_RDATA [0 : 3];
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	AXIUARTModuleClocksTestModule_TopLevel_master
	AXIUARTModuleClocksTestModule_TopLevel_master
	(
		// [BEGIN USER MAP FOR master]
		// [END USER MAP FOR master]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.Master (master_Master_master_Master_HardLink),
		.S2M (master_S2M_master_S2M_HardLink),
		.M2S (master_M2S_master_M2S_HardLink),
		.RACK (master_RACK_master_RACK_HardLink),
		.RDATA0 (master_RDATA0_master_RDATA_HardLink),
		.RDATA1 (master_RDATA1_master_RDATA_HardLink),
		.RDATA2 (master_RDATA2_master_RDATA_HardLink),
		.RDATA3 (master_RDATA3_master_RDATA_HardLink),
		.WACK (master_WACK_master_WACK_HardLink)
	);
	AXIUARTModuleClocksTestModule_TopLevel_uart
	AXIUARTModuleClocksTestModule_TopLevel_uart
	(
		// [BEGIN USER MAP FOR uart]
		// [END USER MAP FOR uart]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.iRX (uart_iRX_uart_iRX_HardLink),
		.M2S (uart_M2S_uart_M2S_HardLink),
		.oCE (uart_oCE_uart_oCE_HardLink),
		.oRXCounter (uart_oRXCounter_uart_oRXCounter_HardLink),
		.oRXData (uart_oRXData_uart_oRXData_HardLink),
		.oRXValid (uart_oRXValid_uart_oRXValid_HardLink),
		.oS2M (uart_oS2M_uart_oS2M_HardLink),
		.oTransmitting (uart_oTransmitting_uart_oTransmitting_HardLink),
		.oTX (uart_oTX_uart_oTX_HardLink),
		.oTXCounter (uart_oTXCounter_uart_oTXCounter_HardLink)
	);
	assign Inputs_iRX = iRX;
	assign Inputs_Master_ARADDR = Master_ARADDR;
	assign Inputs_Master_ARUSER = Master_ARUSER;
	assign Inputs_Master_AWADDR = Master_AWADDR;
	assign Inputs_Master_BREADY = Master_BREADY;
	assign Inputs_Master_RE = Master_RE;
	assign Inputs_Master_RREADY = Master_RREADY;
	assign Inputs_Master_WDATA[0] = Master_WDATA0;
	assign Inputs_Master_WDATA[1] = Master_WDATA1;
	assign Inputs_Master_WDATA[2] = Master_WDATA2;
	assign Inputs_Master_WDATA[3] = Master_WDATA3;
	assign Inputs_Master_WE = Master_WE;
	assign Inputs_Master_WSTRB = Master_WSTRB;
	assign AXIUARTTestModule_L36F33L40T14_Object[0] = Inputs_iRX;
	assign AXIUARTTestModule_L36F33L40T14_Object[8:1] = master_M2S[7:0];
	assign AXIUARTTestModule_L36F33L40T14_Object[40:9] = master_M2S[39:8];
	assign AXIUARTTestModule_L36F33L40T14_Object[48:41] = master_M2S[47:40];
	assign AXIUARTTestModule_L36F33L40T14_Object[51:49] = master_M2S[50:48];
	assign AXIUARTTestModule_L36F33L40T14_Object[53:52] = master_M2S[52:51];
	assign AXIUARTTestModule_L36F33L40T14_Object[55:54] = master_M2S[54:53];
	assign AXIUARTTestModule_L36F33L40T14_Object[59:56] = master_M2S[58:55];
	assign AXIUARTTestModule_L36F33L40T14_Object[62:60] = master_M2S[61:59];
	assign AXIUARTTestModule_L36F33L40T14_Object[66:63] = master_M2S[65:62];
	assign AXIUARTTestModule_L36F33L40T14_Object[74:67] = master_M2S[73:66];
	assign AXIUARTTestModule_L36F33L40T14_Object[82:75] = master_M2S[81:74];
	assign AXIUARTTestModule_L36F33L40T14_Object[83] = master_M2S[82];
	assign AXIUARTTestModule_L36F33L40T14_Object[84] = master_M2S[83];
	assign AXIUARTTestModule_L36F33L40T14_Object[92:85] = master_M2S[91:84];
	assign AXIUARTTestModule_L36F33L40T14_Object[124:93] = master_M2S[123:92];
	assign AXIUARTTestModule_L36F33L40T14_Object[132:125] = master_M2S[131:124];
	assign AXIUARTTestModule_L36F33L40T14_Object[135:133] = master_M2S[134:132];
	assign AXIUARTTestModule_L36F33L40T14_Object[137:136] = master_M2S[136:135];
	assign AXIUARTTestModule_L36F33L40T14_Object[139:138] = master_M2S[138:137];
	assign AXIUARTTestModule_L36F33L40T14_Object[143:140] = master_M2S[142:139];
	assign AXIUARTTestModule_L36F33L40T14_Object[146:144] = master_M2S[145:143];
	assign AXIUARTTestModule_L36F33L40T14_Object[150:147] = master_M2S[149:146];
	assign AXIUARTTestModule_L36F33L40T14_Object[158:151] = master_M2S[157:150];
	assign AXIUARTTestModule_L36F33L40T14_Object[166:159] = master_M2S[165:158];
	assign AXIUARTTestModule_L36F33L40T14_Object[167] = master_M2S[166];
	assign AXIUARTTestModule_L36F33L40T14_Object[175:168] = master_M2S[174:167];
	assign AXIUARTTestModule_L36F33L40T14_Object[207:176] = master_M2S[206:175];
	assign AXIUARTTestModule_L36F33L40T14_Object[211:208] = master_M2S[210:207];
	assign AXIUARTTestModule_L36F33L40T14_Object[212] = master_M2S[211];
	assign AXIUARTTestModule_L36F33L40T14_Object[220:213] = master_M2S[219:212];
	assign AXIUARTTestModule_L36F33L40T14_Object[221] = master_M2S[220];
	assign AXIUARTTestModule_L36F33L40T14_Object[222] = master_M2S[221];
	assign uart_M2S = AXIUARTTestModule_L36F33L40T14_Object[222:1];
	assign uart_iRX = AXIUARTTestModule_L36F33L40T14_Object[0];
	assign AXIUARTTestModule_L42F35L46T14_Object[31:0] = Inputs_Master_ARADDR;
	assign AXIUARTTestModule_L42F35L46T14_Object[39:32] = Inputs_Master_ARUSER;
	assign AXIUARTTestModule_L42F35L46T14_Object[71:40] = Inputs_Master_AWADDR;
	assign AXIUARTTestModule_L42F35L46T14_Object[72] = Inputs_Master_BREADY;
	assign AXIUARTTestModule_L42F35L46T14_Object[73] = Inputs_Master_RE;
	assign AXIUARTTestModule_L42F35L46T14_Object[74] = Inputs_Master_RREADY;
	assign AXIUARTTestModule_L42F35L46T14_Object[106:75] = {
		Inputs_Master_WDATA[3],
		Inputs_Master_WDATA[2],
		Inputs_Master_WDATA[1],
		Inputs_Master_WDATA[0]
	}
	;
	assign AXIUARTTestModule_L42F35L46T14_Object[107] = Inputs_Master_WE;
	assign AXIUARTTestModule_L42F35L46T14_Object[111:108] = Inputs_Master_WSTRB;
	assign AXIUARTTestModule_L42F35L46T14_Object[112] = uart_oS2M[0];
	assign AXIUARTTestModule_L42F35L46T14_Object[120:113] = uart_oS2M[8:1];
	assign AXIUARTTestModule_L42F35L46T14_Object[152:121] = uart_oS2M[40:9];
	assign AXIUARTTestModule_L42F35L46T14_Object[154:153] = uart_oS2M[42:41];
	assign AXIUARTTestModule_L42F35L46T14_Object[155] = uart_oS2M[43];
	assign AXIUARTTestModule_L42F35L46T14_Object[163:156] = uart_oS2M[51:44];
	assign AXIUARTTestModule_L42F35L46T14_Object[164] = uart_oS2M[52];
	assign AXIUARTTestModule_L42F35L46T14_Object[165] = uart_oS2M[53];
	assign AXIUARTTestModule_L42F35L46T14_Object[173:166] = uart_oS2M[61:54];
	assign AXIUARTTestModule_L42F35L46T14_Object[175:174] = uart_oS2M[63:62];
	assign AXIUARTTestModule_L42F35L46T14_Object[183:176] = uart_oS2M[71:64];
	assign AXIUARTTestModule_L42F35L46T14_Object[184] = uart_oS2M[72];
	assign AXIUARTTestModule_L42F35L46T14_Object[185] = uart_oS2M[73];
	assign master_S2M = AXIUARTTestModule_L42F35L46T14_Object[185:112];
	assign master_Master = AXIUARTTestModule_L42F35L46T14_Object[111:0];
	assign oCE = uart_oCE;
	assign oRACK = master_RACK;
	assign oRData0 = master_RDATA[0];
	assign oRData1 = master_RDATA[1];
	assign oRData2 = master_RDATA[2];
	assign oRData3 = master_RDATA[3];
	assign oRXCounter = uart_oRXCounter;
	assign oRXData = uart_oRXData;
	assign oRXValid = uart_oRXValid;
	assign oTransmitting = uart_oTransmitting;
	assign oTX = uart_oTX;
	assign oTXCounter = uart_oTXCounter;
	assign oWACK = master_WACK;
	assign master_Master_master_Master_HardLink = master_Master;
	assign master_S2M_master_S2M_HardLink = master_S2M;
	assign master_M2S = master_M2S_master_M2S_HardLink;
	assign master_RACK = master_RACK_master_RACK_HardLink;
	assign master_RDATA[0] = master_RDATA0_master_RDATA_HardLink;
	assign master_RDATA[1] = master_RDATA1_master_RDATA_HardLink;
	assign master_RDATA[2] = master_RDATA2_master_RDATA_HardLink;
	assign master_RDATA[3] = master_RDATA3_master_RDATA_HardLink;
	assign master_WACK = master_WACK_master_WACK_HardLink;
	assign uart_iRX_uart_iRX_HardLink = uart_iRX;
	assign uart_M2S_uart_M2S_HardLink = uart_M2S;
	assign uart_oCE = uart_oCE_uart_oCE_HardLink;
	assign uart_oRXCounter = uart_oRXCounter_uart_oRXCounter_HardLink;
	assign uart_oRXData = uart_oRXData_uart_oRXData_HardLink;
	assign uart_oRXValid = uart_oRXValid_uart_oRXValid_HardLink;
	assign uart_oS2M = uart_oS2M_uart_oS2M_HardLink;
	assign uart_oTransmitting = uart_oTransmitting_uart_oTransmitting_HardLink;
	assign uart_oTX = uart_oTX_uart_oTX_HardLink;
	assign uart_oTXCounter = uart_oTXCounter_uart_oTXCounter_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
