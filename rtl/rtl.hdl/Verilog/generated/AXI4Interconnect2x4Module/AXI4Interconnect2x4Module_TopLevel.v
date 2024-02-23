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
// System configuration name is AXI4Interconnect2x4Module_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4Interconnect2x4Module_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] M2S0_R_AR_ARID,
	input wire [31:0] M2S0_R_AR_ARADDR,
	input wire [7:0] M2S0_R_AR_ARLEN,
	input wire [2:0] M2S0_R_AR_ARSIZE,
	input wire [1:0] M2S0_R_AR_ARBURST,
	input wire [1:0] M2S0_R_AR_ARLOCK,
	input wire [3:0] M2S0_R_AR_ARCACHE,
	input wire [2:0] M2S0_R_AR_ARPROT,
	input wire [3:0] M2S0_R_AR_ARQOS,
	input wire [7:0] M2S0_R_AR_ARREGION,
	input wire [7:0] M2S0_R_AR_ARUSER,
	input wire M2S0_R_AR_ARVALID,
	input wire M2S0_R_R_RREADY,
	input wire [7:0] M2S0_W_AW_AWID,
	input wire [31:0] M2S0_W_AW_AWADDR,
	input wire [7:0] M2S0_W_AW_AWLEN,
	input wire [2:0] M2S0_W_AW_AWSIZE,
	input wire [1:0] M2S0_W_AW_AWBURST,
	input wire [1:0] M2S0_W_AW_AWLOCK,
	input wire [3:0] M2S0_W_AW_AWCACHE,
	input wire [2:0] M2S0_W_AW_AWPROT,
	input wire [3:0] M2S0_W_AW_AWQOS,
	input wire [7:0] M2S0_W_AW_AWREGION,
	input wire [7:0] M2S0_W_AW_AWUSER,
	input wire M2S0_W_AW_AWVALID,
	input wire [7:0] M2S0_W_W_WID,
	input wire [7:0] M2S0_W_W_WDATA0,
	input wire [7:0] M2S0_W_W_WDATA1,
	input wire [7:0] M2S0_W_W_WDATA2,
	input wire [7:0] M2S0_W_W_WDATA3,
	input wire [3:0] M2S0_W_W_WSTRB,
	input wire M2S0_W_W_WLAST,
	input wire [7:0] M2S0_W_W_WUSER,
	input wire M2S0_W_W_WVALID,
	input wire M2S0_W_B_BREADY,
	input wire [7:0] M2S1_R_AR_ARID,
	input wire [31:0] M2S1_R_AR_ARADDR,
	input wire [7:0] M2S1_R_AR_ARLEN,
	input wire [2:0] M2S1_R_AR_ARSIZE,
	input wire [1:0] M2S1_R_AR_ARBURST,
	input wire [1:0] M2S1_R_AR_ARLOCK,
	input wire [3:0] M2S1_R_AR_ARCACHE,
	input wire [2:0] M2S1_R_AR_ARPROT,
	input wire [3:0] M2S1_R_AR_ARQOS,
	input wire [7:0] M2S1_R_AR_ARREGION,
	input wire [7:0] M2S1_R_AR_ARUSER,
	input wire M2S1_R_AR_ARVALID,
	input wire M2S1_R_R_RREADY,
	input wire [7:0] M2S1_W_AW_AWID,
	input wire [31:0] M2S1_W_AW_AWADDR,
	input wire [7:0] M2S1_W_AW_AWLEN,
	input wire [2:0] M2S1_W_AW_AWSIZE,
	input wire [1:0] M2S1_W_AW_AWBURST,
	input wire [1:0] M2S1_W_AW_AWLOCK,
	input wire [3:0] M2S1_W_AW_AWCACHE,
	input wire [2:0] M2S1_W_AW_AWPROT,
	input wire [3:0] M2S1_W_AW_AWQOS,
	input wire [7:0] M2S1_W_AW_AWREGION,
	input wire [7:0] M2S1_W_AW_AWUSER,
	input wire M2S1_W_AW_AWVALID,
	input wire [7:0] M2S1_W_W_WID,
	input wire [7:0] M2S1_W_W_WDATA0,
	input wire [7:0] M2S1_W_W_WDATA1,
	input wire [7:0] M2S1_W_W_WDATA2,
	input wire [7:0] M2S1_W_W_WDATA3,
	input wire [3:0] M2S1_W_W_WSTRB,
	input wire M2S1_W_W_WLAST,
	input wire [7:0] M2S1_W_W_WUSER,
	input wire M2S1_W_W_WVALID,
	input wire M2S1_W_B_BREADY,
	input wire [31:0] S2M0_ADDR_HIGH,
	input wire [31:0] S2M0_ADDR_LOW,
	input wire S2M0_S2M_R_AR_ARREADY,
	input wire [7:0] S2M0_S2M_R_R_RID,
	input wire [7:0] S2M0_S2M_R_R_RDATA0,
	input wire [7:0] S2M0_S2M_R_R_RDATA1,
	input wire [7:0] S2M0_S2M_R_R_RDATA2,
	input wire [7:0] S2M0_S2M_R_R_RDATA3,
	input wire [1:0] S2M0_S2M_R_R_RRESP,
	input wire S2M0_S2M_R_R_RLAST,
	input wire [7:0] S2M0_S2M_R_R_RUSER,
	input wire S2M0_S2M_R_R_RVALID,
	input wire S2M0_S2M_W_AW_AWREADY,
	input wire [7:0] S2M0_S2M_W_B_BID,
	input wire [1:0] S2M0_S2M_W_B_BRESP,
	input wire [7:0] S2M0_S2M_W_B_BUSER,
	input wire S2M0_S2M_W_B_BVALID,
	input wire S2M0_S2M_W_W_WREADY,
	input wire [31:0] S2M1_ADDR_HIGH,
	input wire [31:0] S2M1_ADDR_LOW,
	input wire S2M1_S2M_R_AR_ARREADY,
	input wire [7:0] S2M1_S2M_R_R_RID,
	input wire [7:0] S2M1_S2M_R_R_RDATA0,
	input wire [7:0] S2M1_S2M_R_R_RDATA1,
	input wire [7:0] S2M1_S2M_R_R_RDATA2,
	input wire [7:0] S2M1_S2M_R_R_RDATA3,
	input wire [1:0] S2M1_S2M_R_R_RRESP,
	input wire S2M1_S2M_R_R_RLAST,
	input wire [7:0] S2M1_S2M_R_R_RUSER,
	input wire S2M1_S2M_R_R_RVALID,
	input wire S2M1_S2M_W_AW_AWREADY,
	input wire [7:0] S2M1_S2M_W_B_BID,
	input wire [1:0] S2M1_S2M_W_B_BRESP,
	input wire [7:0] S2M1_S2M_W_B_BUSER,
	input wire S2M1_S2M_W_B_BVALID,
	input wire S2M1_S2M_W_W_WREADY,
	input wire [31:0] S2M2_ADDR_HIGH,
	input wire [31:0] S2M2_ADDR_LOW,
	input wire S2M2_S2M_R_AR_ARREADY,
	input wire [7:0] S2M2_S2M_R_R_RID,
	input wire [7:0] S2M2_S2M_R_R_RDATA0,
	input wire [7:0] S2M2_S2M_R_R_RDATA1,
	input wire [7:0] S2M2_S2M_R_R_RDATA2,
	input wire [7:0] S2M2_S2M_R_R_RDATA3,
	input wire [1:0] S2M2_S2M_R_R_RRESP,
	input wire S2M2_S2M_R_R_RLAST,
	input wire [7:0] S2M2_S2M_R_R_RUSER,
	input wire S2M2_S2M_R_R_RVALID,
	input wire S2M2_S2M_W_AW_AWREADY,
	input wire [7:0] S2M2_S2M_W_B_BID,
	input wire [1:0] S2M2_S2M_W_B_BRESP,
	input wire [7:0] S2M2_S2M_W_B_BUSER,
	input wire S2M2_S2M_W_B_BVALID,
	input wire S2M2_S2M_W_W_WREADY,
	input wire [31:0] S2M3_ADDR_HIGH,
	input wire [31:0] S2M3_ADDR_LOW,
	input wire S2M3_S2M_R_AR_ARREADY,
	input wire [7:0] S2M3_S2M_R_R_RID,
	input wire [7:0] S2M3_S2M_R_R_RDATA0,
	input wire [7:0] S2M3_S2M_R_R_RDATA1,
	input wire [7:0] S2M3_S2M_R_R_RDATA2,
	input wire [7:0] S2M3_S2M_R_R_RDATA3,
	input wire [1:0] S2M3_S2M_R_R_RRESP,
	input wire S2M3_S2M_R_R_RLAST,
	input wire [7:0] S2M3_S2M_R_R_RUSER,
	input wire S2M3_S2M_R_R_RVALID,
	input wire S2M3_S2M_W_AW_AWREADY,
	input wire [7:0] S2M3_S2M_W_B_BID,
	input wire [1:0] S2M3_S2M_W_B_BRESP,
	input wire [7:0] S2M3_S2M_W_B_BUSER,
	input wire S2M3_S2M_W_B_BVALID,
	input wire S2M3_S2M_W_W_WREADY,
	output wire HasActiveRead,
	output wire HasActiveWrite
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
	wire signed [3: 0] sCount = 4'b0100;
	wire masterReadEncoderModule_HasActive;
	wire [0: 0] masterReadEncoderModule_MSBIndex;
	wire [1: 0] masterReadEncoderModule_MSBValue;
	wire masterWriteEncoderModule_HasActive;
	wire [0: 0] masterWriteEncoderModule_MSBIndex;
	wire [1: 0] masterWriteEncoderModule_MSBValue;
	wire masterReadEncoderModule_iValues0_masterReadEncoderModule_iValues_HardLink;
	wire masterReadEncoderModule_iValues1_masterReadEncoderModule_iValues_HardLink;
	wire masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink;
	wire [0: 0] masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink;
	wire [1: 0] masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink;
	wire masterWriteEncoderModule_iValues0_masterWriteEncoderModule_iValues_HardLink;
	wire masterWriteEncoderModule_iValues1_masterWriteEncoderModule_iValues_HardLink;
	wire masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink;
	wire [0: 0] masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink;
	wire [1: 0] masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink;
	wire [221 : 0] Inputs_M2S [0 : 1];
	wire [137 : 0] Inputs_S2M [0 : 3];
	wire mARVALID [0 : 1];
	wire mAWVALID [0 : 1];
	wire masterReadEncoderModule_iValues [0 : 1];
	wire masterWriteEncoderModule_iValues [0 : 1];
	wire AXI4InterconnectModule_L56F28T76_Enumerable [0 : 1];
	wire AXI4InterconnectModule_L57F28T76_Enumerable [0 : 1];
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	AXI4Interconnect2x4Module_TopLevel_masterReadEncoderModule
	AXI4Interconnect2x4Module_TopLevel_masterReadEncoderModule
	(
		// [BEGIN USER MAP FOR masterReadEncoderModule]
		// [END USER MAP FOR masterReadEncoderModule]
		.iValues0 (masterReadEncoderModule_iValues0_masterReadEncoderModule_iValues_HardLink),
		.iValues1 (masterReadEncoderModule_iValues1_masterReadEncoderModule_iValues_HardLink),
		.HasActive (masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink),
		.MSBIndex (masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink),
		.MSBValue (masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink)
	);
	AXI4Interconnect2x4Module_TopLevel_masterWriteEncoderModule
	AXI4Interconnect2x4Module_TopLevel_masterWriteEncoderModule
	(
		// [BEGIN USER MAP FOR masterWriteEncoderModule]
		// [END USER MAP FOR masterWriteEncoderModule]
		.iValues0 (masterWriteEncoderModule_iValues0_masterWriteEncoderModule_iValues_HardLink),
		.iValues1 (masterWriteEncoderModule_iValues1_masterWriteEncoderModule_iValues_HardLink),
		.HasActive (masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink),
		.MSBIndex (masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink),
		.MSBValue (masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink)
	);
	assign Inputs_M2S[0][221] = M2S0_W_B_BREADY;
	assign Inputs_M2S[0][220] = M2S0_W_W_WVALID;
	assign Inputs_M2S[0][219:212] = M2S0_W_W_WUSER;
	assign Inputs_M2S[0][211] = M2S0_W_W_WLAST;
	assign Inputs_M2S[0][210:207] = M2S0_W_W_WSTRB;
	assign Inputs_M2S[0][206:199] = M2S0_W_W_WDATA3;
	assign Inputs_M2S[0][198:191] = M2S0_W_W_WDATA2;
	assign Inputs_M2S[0][190:183] = M2S0_W_W_WDATA1;
	assign Inputs_M2S[0][182:175] = M2S0_W_W_WDATA0;
	assign Inputs_M2S[0][174:167] = M2S0_W_W_WID;
	assign Inputs_M2S[0][166] = M2S0_W_AW_AWVALID;
	assign Inputs_M2S[0][165:158] = M2S0_W_AW_AWUSER;
	assign Inputs_M2S[0][157:150] = M2S0_W_AW_AWREGION;
	assign Inputs_M2S[0][149:146] = M2S0_W_AW_AWQOS;
	assign Inputs_M2S[0][145:143] = M2S0_W_AW_AWPROT;
	assign Inputs_M2S[0][142:139] = M2S0_W_AW_AWCACHE;
	assign Inputs_M2S[0][138:137] = M2S0_W_AW_AWLOCK;
	assign Inputs_M2S[0][136:135] = M2S0_W_AW_AWBURST;
	assign Inputs_M2S[0][134:132] = M2S0_W_AW_AWSIZE;
	assign Inputs_M2S[0][131:124] = M2S0_W_AW_AWLEN;
	assign Inputs_M2S[0][123:92] = M2S0_W_AW_AWADDR;
	assign Inputs_M2S[0][91:84] = M2S0_W_AW_AWID;
	assign Inputs_M2S[0][83] = M2S0_R_R_RREADY;
	assign Inputs_M2S[0][82] = M2S0_R_AR_ARVALID;
	assign Inputs_M2S[0][81:74] = M2S0_R_AR_ARUSER;
	assign Inputs_M2S[0][73:66] = M2S0_R_AR_ARREGION;
	assign Inputs_M2S[0][65:62] = M2S0_R_AR_ARQOS;
	assign Inputs_M2S[0][61:59] = M2S0_R_AR_ARPROT;
	assign Inputs_M2S[0][58:55] = M2S0_R_AR_ARCACHE;
	assign Inputs_M2S[0][54:53] = M2S0_R_AR_ARLOCK;
	assign Inputs_M2S[0][52:51] = M2S0_R_AR_ARBURST;
	assign Inputs_M2S[0][50:48] = M2S0_R_AR_ARSIZE;
	assign Inputs_M2S[0][47:40] = M2S0_R_AR_ARLEN;
	assign Inputs_M2S[0][39:8] = M2S0_R_AR_ARADDR;
	assign Inputs_M2S[0][7:0] = M2S0_R_AR_ARID;
	assign Inputs_M2S[1][221] = M2S1_W_B_BREADY;
	assign Inputs_M2S[1][220] = M2S1_W_W_WVALID;
	assign Inputs_M2S[1][219:212] = M2S1_W_W_WUSER;
	assign Inputs_M2S[1][211] = M2S1_W_W_WLAST;
	assign Inputs_M2S[1][210:207] = M2S1_W_W_WSTRB;
	assign Inputs_M2S[1][206:199] = M2S1_W_W_WDATA3;
	assign Inputs_M2S[1][198:191] = M2S1_W_W_WDATA2;
	assign Inputs_M2S[1][190:183] = M2S1_W_W_WDATA1;
	assign Inputs_M2S[1][182:175] = M2S1_W_W_WDATA0;
	assign Inputs_M2S[1][174:167] = M2S1_W_W_WID;
	assign Inputs_M2S[1][166] = M2S1_W_AW_AWVALID;
	assign Inputs_M2S[1][165:158] = M2S1_W_AW_AWUSER;
	assign Inputs_M2S[1][157:150] = M2S1_W_AW_AWREGION;
	assign Inputs_M2S[1][149:146] = M2S1_W_AW_AWQOS;
	assign Inputs_M2S[1][145:143] = M2S1_W_AW_AWPROT;
	assign Inputs_M2S[1][142:139] = M2S1_W_AW_AWCACHE;
	assign Inputs_M2S[1][138:137] = M2S1_W_AW_AWLOCK;
	assign Inputs_M2S[1][136:135] = M2S1_W_AW_AWBURST;
	assign Inputs_M2S[1][134:132] = M2S1_W_AW_AWSIZE;
	assign Inputs_M2S[1][131:124] = M2S1_W_AW_AWLEN;
	assign Inputs_M2S[1][123:92] = M2S1_W_AW_AWADDR;
	assign Inputs_M2S[1][91:84] = M2S1_W_AW_AWID;
	assign Inputs_M2S[1][83] = M2S1_R_R_RREADY;
	assign Inputs_M2S[1][82] = M2S1_R_AR_ARVALID;
	assign Inputs_M2S[1][81:74] = M2S1_R_AR_ARUSER;
	assign Inputs_M2S[1][73:66] = M2S1_R_AR_ARREGION;
	assign Inputs_M2S[1][65:62] = M2S1_R_AR_ARQOS;
	assign Inputs_M2S[1][61:59] = M2S1_R_AR_ARPROT;
	assign Inputs_M2S[1][58:55] = M2S1_R_AR_ARCACHE;
	assign Inputs_M2S[1][54:53] = M2S1_R_AR_ARLOCK;
	assign Inputs_M2S[1][52:51] = M2S1_R_AR_ARBURST;
	assign Inputs_M2S[1][50:48] = M2S1_R_AR_ARSIZE;
	assign Inputs_M2S[1][47:40] = M2S1_R_AR_ARLEN;
	assign Inputs_M2S[1][39:8] = M2S1_R_AR_ARADDR;
	assign Inputs_M2S[1][7:0] = M2S1_R_AR_ARID;
	assign Inputs_S2M[0][137] = S2M0_S2M_W_W_WREADY;
	assign Inputs_S2M[0][136] = S2M0_S2M_W_B_BVALID;
	assign Inputs_S2M[0][135:128] = S2M0_S2M_W_B_BUSER;
	assign Inputs_S2M[0][127:126] = S2M0_S2M_W_B_BRESP;
	assign Inputs_S2M[0][125:118] = S2M0_S2M_W_B_BID;
	assign Inputs_S2M[0][117] = S2M0_S2M_W_AW_AWREADY;
	assign Inputs_S2M[0][116] = S2M0_S2M_R_R_RVALID;
	assign Inputs_S2M[0][115:108] = S2M0_S2M_R_R_RUSER;
	assign Inputs_S2M[0][107] = S2M0_S2M_R_R_RLAST;
	assign Inputs_S2M[0][106:105] = S2M0_S2M_R_R_RRESP;
	assign Inputs_S2M[0][104:97] = S2M0_S2M_R_R_RDATA3;
	assign Inputs_S2M[0][96:89] = S2M0_S2M_R_R_RDATA2;
	assign Inputs_S2M[0][88:81] = S2M0_S2M_R_R_RDATA1;
	assign Inputs_S2M[0][80:73] = S2M0_S2M_R_R_RDATA0;
	assign Inputs_S2M[0][72:65] = S2M0_S2M_R_R_RID;
	assign Inputs_S2M[0][64] = S2M0_S2M_R_AR_ARREADY;
	assign Inputs_S2M[0][63:32] = S2M0_ADDR_LOW;
	assign Inputs_S2M[0][31:0] = S2M0_ADDR_HIGH;
	assign Inputs_S2M[1][137] = S2M1_S2M_W_W_WREADY;
	assign Inputs_S2M[1][136] = S2M1_S2M_W_B_BVALID;
	assign Inputs_S2M[1][135:128] = S2M1_S2M_W_B_BUSER;
	assign Inputs_S2M[1][127:126] = S2M1_S2M_W_B_BRESP;
	assign Inputs_S2M[1][125:118] = S2M1_S2M_W_B_BID;
	assign Inputs_S2M[1][117] = S2M1_S2M_W_AW_AWREADY;
	assign Inputs_S2M[1][116] = S2M1_S2M_R_R_RVALID;
	assign Inputs_S2M[1][115:108] = S2M1_S2M_R_R_RUSER;
	assign Inputs_S2M[1][107] = S2M1_S2M_R_R_RLAST;
	assign Inputs_S2M[1][106:105] = S2M1_S2M_R_R_RRESP;
	assign Inputs_S2M[1][104:97] = S2M1_S2M_R_R_RDATA3;
	assign Inputs_S2M[1][96:89] = S2M1_S2M_R_R_RDATA2;
	assign Inputs_S2M[1][88:81] = S2M1_S2M_R_R_RDATA1;
	assign Inputs_S2M[1][80:73] = S2M1_S2M_R_R_RDATA0;
	assign Inputs_S2M[1][72:65] = S2M1_S2M_R_R_RID;
	assign Inputs_S2M[1][64] = S2M1_S2M_R_AR_ARREADY;
	assign Inputs_S2M[1][63:32] = S2M1_ADDR_LOW;
	assign Inputs_S2M[1][31:0] = S2M1_ADDR_HIGH;
	assign Inputs_S2M[2][137] = S2M2_S2M_W_W_WREADY;
	assign Inputs_S2M[2][136] = S2M2_S2M_W_B_BVALID;
	assign Inputs_S2M[2][135:128] = S2M2_S2M_W_B_BUSER;
	assign Inputs_S2M[2][127:126] = S2M2_S2M_W_B_BRESP;
	assign Inputs_S2M[2][125:118] = S2M2_S2M_W_B_BID;
	assign Inputs_S2M[2][117] = S2M2_S2M_W_AW_AWREADY;
	assign Inputs_S2M[2][116] = S2M2_S2M_R_R_RVALID;
	assign Inputs_S2M[2][115:108] = S2M2_S2M_R_R_RUSER;
	assign Inputs_S2M[2][107] = S2M2_S2M_R_R_RLAST;
	assign Inputs_S2M[2][106:105] = S2M2_S2M_R_R_RRESP;
	assign Inputs_S2M[2][104:97] = S2M2_S2M_R_R_RDATA3;
	assign Inputs_S2M[2][96:89] = S2M2_S2M_R_R_RDATA2;
	assign Inputs_S2M[2][88:81] = S2M2_S2M_R_R_RDATA1;
	assign Inputs_S2M[2][80:73] = S2M2_S2M_R_R_RDATA0;
	assign Inputs_S2M[2][72:65] = S2M2_S2M_R_R_RID;
	assign Inputs_S2M[2][64] = S2M2_S2M_R_AR_ARREADY;
	assign Inputs_S2M[2][63:32] = S2M2_ADDR_LOW;
	assign Inputs_S2M[2][31:0] = S2M2_ADDR_HIGH;
	assign Inputs_S2M[3][137] = S2M3_S2M_W_W_WREADY;
	assign Inputs_S2M[3][136] = S2M3_S2M_W_B_BVALID;
	assign Inputs_S2M[3][135:128] = S2M3_S2M_W_B_BUSER;
	assign Inputs_S2M[3][127:126] = S2M3_S2M_W_B_BRESP;
	assign Inputs_S2M[3][125:118] = S2M3_S2M_W_B_BID;
	assign Inputs_S2M[3][117] = S2M3_S2M_W_AW_AWREADY;
	assign Inputs_S2M[3][116] = S2M3_S2M_R_R_RVALID;
	assign Inputs_S2M[3][115:108] = S2M3_S2M_R_R_RUSER;
	assign Inputs_S2M[3][107] = S2M3_S2M_R_R_RLAST;
	assign Inputs_S2M[3][106:105] = S2M3_S2M_R_R_RRESP;
	assign Inputs_S2M[3][104:97] = S2M3_S2M_R_R_RDATA3;
	assign Inputs_S2M[3][96:89] = S2M3_S2M_R_R_RDATA2;
	assign Inputs_S2M[3][88:81] = S2M3_S2M_R_R_RDATA1;
	assign Inputs_S2M[3][80:73] = S2M3_S2M_R_R_RDATA0;
	assign Inputs_S2M[3][72:65] = S2M3_S2M_R_R_RID;
	assign Inputs_S2M[3][64] = S2M3_S2M_R_AR_ARREADY;
	assign Inputs_S2M[3][63:32] = S2M3_ADDR_LOW;
	assign Inputs_S2M[3][31:0] = S2M3_ADDR_HIGH;
	assign AXI4InterconnectModule_L56F28T76_Enumerable[0] = Inputs_M2S[0][82];
	assign AXI4InterconnectModule_L56F28T76_Enumerable[1] = Inputs_M2S[1][82];
	assign mARVALID[0] = AXI4InterconnectModule_L56F28T76_Enumerable[0];
	assign AXI4InterconnectModule_L57F28T76_Enumerable[0] = Inputs_M2S[0][166];
	assign AXI4InterconnectModule_L57F28T76_Enumerable[1] = Inputs_M2S[1][166];
	assign mAWVALID[0] = AXI4InterconnectModule_L57F28T76_Enumerable[0];
	assign masterReadEncoderModule_iValues[0] = mARVALID[0];
	assign masterReadEncoderModule_iValues[1] = mARVALID[1];
	assign masterWriteEncoderModule_iValues[0] = mAWVALID[0];
	assign masterWriteEncoderModule_iValues[1] = mAWVALID[1];
	assign HasActiveRead = masterReadEncoderModule_HasActive;
	assign HasActiveWrite = masterWriteEncoderModule_HasActive;
	assign masterReadEncoderModule_iValues0_masterReadEncoderModule_iValues_HardLink = masterReadEncoderModule_iValues[0];
	assign masterReadEncoderModule_iValues1_masterReadEncoderModule_iValues_HardLink = masterReadEncoderModule_iValues[1];
	assign masterReadEncoderModule_HasActive = masterReadEncoderModule_HasActive_masterReadEncoderModule_HasActive_HardLink;
	assign masterReadEncoderModule_MSBIndex = masterReadEncoderModule_MSBIndex_masterReadEncoderModule_MSBIndex_HardLink;
	assign masterReadEncoderModule_MSBValue = masterReadEncoderModule_MSBValue_masterReadEncoderModule_MSBValue_HardLink;
	assign masterWriteEncoderModule_iValues0_masterWriteEncoderModule_iValues_HardLink = masterWriteEncoderModule_iValues[0];
	assign masterWriteEncoderModule_iValues1_masterWriteEncoderModule_iValues_HardLink = masterWriteEncoderModule_iValues[1];
	assign masterWriteEncoderModule_HasActive = masterWriteEncoderModule_HasActive_masterWriteEncoderModule_HasActive_HardLink;
	assign masterWriteEncoderModule_MSBIndex = masterWriteEncoderModule_MSBIndex_masterWriteEncoderModule_MSBIndex_HardLink;
	assign masterWriteEncoderModule_MSBValue = masterWriteEncoderModule_MSBValue_masterWriteEncoderModule_MSBValue_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule