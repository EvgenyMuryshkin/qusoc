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
// System configuration name is AXI4RegisterModuleB4_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4RegisterModuleB4_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7: 0] M2S_AR_ARID,
	input wire [31: 0] M2S_AR_ARADDR,
	input wire [7: 0] M2S_AR_ARLEN,
	input wire [2: 0] M2S_AR_ARSIZE,
	input wire [1: 0] M2S_AR_ARBURST,
	input wire [1: 0] M2S_AR_ARLOCK,
	input wire [3: 0] M2S_AR_ARCACHE,
	input wire [2: 0] M2S_AR_ARPROT,
	input wire [3: 0] M2S_AR_ARQOS,
	input wire [7: 0] M2S_AR_ARREGION,
	input wire [7: 0] M2S_AR_ARUSER,
	input wire M2S_AR_ARVALID,
	input wire M2S_R_RREADY,
	input wire [7: 0] M2S_AW_AWID,
	input wire [31: 0] M2S_AW_AWADDR,
	input wire [7: 0] M2S_AW_AWLEN,
	input wire [2: 0] M2S_AW_AWSIZE,
	input wire [1: 0] M2S_AW_AWBURST,
	input wire [1: 0] M2S_AW_AWLOCK,
	input wire [3: 0] M2S_AW_AWCACHE,
	input wire [2: 0] M2S_AW_AWPROT,
	input wire [3: 0] M2S_AW_AWQOS,
	input wire [7: 0] M2S_AW_AWREGION,
	input wire [7: 0] M2S_AW_AWUSER,
	input wire M2S_AW_AWVALID,
	input wire [7: 0] M2S_W_WID,
	input wire [7: 0] M2S_W_WDATA0,
	input wire [7: 0] M2S_W_WDATA1,
	input wire [7: 0] M2S_W_WDATA2,
	input wire [7: 0] M2S_W_WDATA3,
	input wire [3: 0] M2S_W_WSTRB,
	input wire M2S_W_WLAST,
	input wire [7: 0] M2S_W_WUSER,
	input wire M2S_W_WVALID,
	input wire M2S_B_BREADY,
	input wire WE,
	input wire [7: 0] WDATA0,
	input wire [7: 0] WDATA1,
	input wire [7: 0] WDATA2,
	input wire [7: 0] WDATA3,
	output wire [7: 0] OutData0,
	output wire [7: 0] OutData1,
	output wire [7: 0] OutData2,
	output wire [7: 0] OutData3,
	output wire OutACK,
	output wire S2M_AR_ARREADY,
	output wire S2M_AW_AWREADY,
	output wire [7: 0] S2M_B_BID,
	output wire [1: 0] S2M_B_BRESP,
	output wire [7: 0] S2M_B_BUSER,
	output wire S2M_B_BVALID,
	output wire [7: 0] S2M_R_RID,
	output wire [7: 0] S2M_R_RDATA0,
	output wire [7: 0] S2M_R_RDATA1,
	output wire [7: 0] S2M_R_RDATA2,
	output wire [7: 0] S2M_R_RDATA3,
	output wire [1: 0] S2M_R_RRESP,
	output wire S2M_R_RLAST,
	output wire [7: 0] S2M_R_RUSER,
	output wire S2M_R_RVALID,
	output wire S2M_W_WREADY
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [1: 0] size = 2'b10;
	wire AXI4RegisterModule_L56F24T28_Expr = 1'b1;
	wire AXI4RegisterModule_L58F24T28_Expr = 1'b1;
	wire AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_0_w = 1'b0;
	wire AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_1_w = 1'b1;
	wire [1: 0] AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_2_w = 2'b10;
	wire [1: 0] AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_3_w = 2'b11;
	wire [7: 0] Inputs_M2S_AR_ARID;
	wire [31: 0] Inputs_M2S_AR_ARADDR;
	wire [7: 0] Inputs_M2S_AR_ARLEN;
	wire [2: 0] Inputs_M2S_AR_ARSIZE;
	wire [1: 0] Inputs_M2S_AR_ARBURST;
	wire [1: 0] Inputs_M2S_AR_ARLOCK;
	wire [3: 0] Inputs_M2S_AR_ARCACHE;
	wire [2: 0] Inputs_M2S_AR_ARPROT;
	wire [3: 0] Inputs_M2S_AR_ARQOS;
	wire [7: 0] Inputs_M2S_AR_ARREGION;
	wire [7: 0] Inputs_M2S_AR_ARUSER;
	wire Inputs_M2S_AR_ARVALID;
	wire Inputs_M2S_R_RREADY;
	wire [7: 0] Inputs_M2S_AW_AWID;
	wire [31: 0] Inputs_M2S_AW_AWADDR;
	wire [7: 0] Inputs_M2S_AW_AWLEN;
	wire [2: 0] Inputs_M2S_AW_AWSIZE;
	wire [1: 0] Inputs_M2S_AW_AWBURST;
	wire [1: 0] Inputs_M2S_AW_AWLOCK;
	wire [3: 0] Inputs_M2S_AW_AWCACHE;
	wire [2: 0] Inputs_M2S_AW_AWPROT;
	wire [3: 0] Inputs_M2S_AW_AWQOS;
	wire [7: 0] Inputs_M2S_AW_AWREGION;
	wire [7: 0] Inputs_M2S_AW_AWUSER;
	wire Inputs_M2S_AW_AWVALID;
	wire [7: 0] Inputs_M2S_W_WID;
	wire [7: 0] Inputs_M2S_W_WDATA0;
	wire [7: 0] Inputs_M2S_W_WDATA1;
	wire [7: 0] Inputs_M2S_W_WDATA2;
	wire [7: 0] Inputs_M2S_W_WDATA3;
	wire [3: 0] Inputs_M2S_W_WSTRB;
	wire Inputs_M2S_W_WLAST;
	wire [7: 0] Inputs_M2S_W_WUSER;
	wire Inputs_M2S_W_WVALID;
	wire Inputs_M2S_B_BREADY;
	wire Inputs_WE;
	wire [7: 0] Inputs_WDATA0;
	wire [7: 0] Inputs_WDATA1;
	wire [7: 0] Inputs_WDATA2;
	wire [7: 0] Inputs_WDATA3;
	wire [7: 0] axiSlave_M2S_AR_ARID;
	wire [31: 0] axiSlave_M2S_AR_ARADDR;
	wire [7: 0] axiSlave_M2S_AR_ARLEN;
	wire [2: 0] axiSlave_M2S_AR_ARSIZE;
	wire [1: 0] axiSlave_M2S_AR_ARBURST;
	wire [1: 0] axiSlave_M2S_AR_ARLOCK;
	wire [3: 0] axiSlave_M2S_AR_ARCACHE;
	wire [2: 0] axiSlave_M2S_AR_ARPROT;
	wire [3: 0] axiSlave_M2S_AR_ARQOS;
	wire [7: 0] axiSlave_M2S_AR_ARREGION;
	wire [7: 0] axiSlave_M2S_AR_ARUSER;
	wire axiSlave_M2S_AR_ARVALID;
	wire axiSlave_M2S_R_RREADY;
	wire [7: 0] axiSlave_M2S_AW_AWID;
	wire [31: 0] axiSlave_M2S_AW_AWADDR;
	wire [7: 0] axiSlave_M2S_AW_AWLEN;
	wire [2: 0] axiSlave_M2S_AW_AWSIZE;
	wire [1: 0] axiSlave_M2S_AW_AWBURST;
	wire [1: 0] axiSlave_M2S_AW_AWLOCK;
	wire [3: 0] axiSlave_M2S_AW_AWCACHE;
	wire [2: 0] axiSlave_M2S_AW_AWPROT;
	wire [3: 0] axiSlave_M2S_AW_AWQOS;
	wire [7: 0] axiSlave_M2S_AW_AWREGION;
	wire [7: 0] axiSlave_M2S_AW_AWUSER;
	wire axiSlave_M2S_AW_AWVALID;
	wire [7: 0] axiSlave_M2S_W_WID;
	wire [7: 0] axiSlave_M2S_W_WDATA0;
	wire [7: 0] axiSlave_M2S_W_WDATA1;
	wire [7: 0] axiSlave_M2S_W_WDATA2;
	wire [7: 0] axiSlave_M2S_W_WDATA3;
	wire [3: 0] axiSlave_M2S_W_WSTRB;
	wire axiSlave_M2S_W_WLAST;
	wire [7: 0] axiSlave_M2S_W_WUSER;
	wire axiSlave_M2S_W_WVALID;
	wire axiSlave_M2S_B_BREADY;
	wire [7: 0] axiSlave_RDATA0;
	wire [7: 0] axiSlave_RDATA1;
	wire [7: 0] axiSlave_RDATA2;
	wire [7: 0] axiSlave_RDATA3;
	wire axiSlave_RACK;
	wire axiSlave_WACK;
	wire axiSlave_S2M_AR_ARREADY;
	wire axiSlave_S2M_AW_AWREADY;
	wire [7: 0] axiSlave_S2M_B_BID;
	wire [1: 0] axiSlave_S2M_B_BRESP;
	wire [7: 0] axiSlave_S2M_B_BUSER;
	wire axiSlave_S2M_B_BVALID;
	wire [7: 0] axiSlave_S2M_R_RID;
	wire [7: 0] axiSlave_S2M_R_RDATA0;
	wire [7: 0] axiSlave_S2M_R_RDATA1;
	wire [7: 0] axiSlave_S2M_R_RDATA2;
	wire [7: 0] axiSlave_S2M_R_RDATA3;
	wire [1: 0] axiSlave_S2M_R_RRESP;
	wire axiSlave_S2M_R_RLAST;
	wire [7: 0] axiSlave_S2M_R_RUSER;
	wire axiSlave_S2M_R_RVALID;
	wire axiSlave_S2M_W_WREADY;
	wire [3: 0] axiSlave_WSTRB;
	wire [7: 0] axiSlave_WDATA0;
	wire [7: 0] axiSlave_WDATA1;
	wire [7: 0] axiSlave_WDATA2;
	wire [7: 0] axiSlave_WDATA3;
	wire axiSlave_WVALID;
	wire axiSlave_RVALID;
	wire [31: 0] axiSlave_ARADDR;
	wire [31: 0] axiSlave_AWADDR;
	wire AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_0_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index;
	wire AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_1_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index;
	wire AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_2_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index;
	wire AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_3_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index;
	reg [7: 0] State_bytesDefault = 8'b00000000;
	wire [7: 0] axiSlaveM2S_AR_ARIDaxiSlave_M2S_AR_ARIDHardLink;
	wire [31: 0] axiSlaveM2S_AR_ARADDRaxiSlave_M2S_AR_ARADDRHardLink;
	wire [7: 0] axiSlaveM2S_AR_ARLENaxiSlave_M2S_AR_ARLENHardLink;
	wire [2: 0] axiSlaveM2S_AR_ARSIZEaxiSlave_M2S_AR_ARSIZEHardLink;
	wire [1: 0] axiSlaveM2S_AR_ARBURSTaxiSlave_M2S_AR_ARBURSTHardLink;
	wire [1: 0] axiSlaveM2S_AR_ARLOCKaxiSlave_M2S_AR_ARLOCKHardLink;
	wire [3: 0] axiSlaveM2S_AR_ARCACHEaxiSlave_M2S_AR_ARCACHEHardLink;
	wire [2: 0] axiSlaveM2S_AR_ARPROTaxiSlave_M2S_AR_ARPROTHardLink;
	wire [3: 0] axiSlaveM2S_AR_ARQOSaxiSlave_M2S_AR_ARQOSHardLink;
	wire [7: 0] axiSlaveM2S_AR_ARREGIONaxiSlave_M2S_AR_ARREGIONHardLink;
	wire [7: 0] axiSlaveM2S_AR_ARUSERaxiSlave_M2S_AR_ARUSERHardLink;
	wire axiSlaveM2S_AR_ARVALIDaxiSlave_M2S_AR_ARVALIDHardLink;
	wire axiSlaveM2S_R_RREADYaxiSlave_M2S_R_RREADYHardLink;
	wire [7: 0] axiSlaveM2S_AW_AWIDaxiSlave_M2S_AW_AWIDHardLink;
	wire [31: 0] axiSlaveM2S_AW_AWADDRaxiSlave_M2S_AW_AWADDRHardLink;
	wire [7: 0] axiSlaveM2S_AW_AWLENaxiSlave_M2S_AW_AWLENHardLink;
	wire [2: 0] axiSlaveM2S_AW_AWSIZEaxiSlave_M2S_AW_AWSIZEHardLink;
	wire [1: 0] axiSlaveM2S_AW_AWBURSTaxiSlave_M2S_AW_AWBURSTHardLink;
	wire [1: 0] axiSlaveM2S_AW_AWLOCKaxiSlave_M2S_AW_AWLOCKHardLink;
	wire [3: 0] axiSlaveM2S_AW_AWCACHEaxiSlave_M2S_AW_AWCACHEHardLink;
	wire [2: 0] axiSlaveM2S_AW_AWPROTaxiSlave_M2S_AW_AWPROTHardLink;
	wire [3: 0] axiSlaveM2S_AW_AWQOSaxiSlave_M2S_AW_AWQOSHardLink;
	wire [7: 0] axiSlaveM2S_AW_AWREGIONaxiSlave_M2S_AW_AWREGIONHardLink;
	wire [7: 0] axiSlaveM2S_AW_AWUSERaxiSlave_M2S_AW_AWUSERHardLink;
	wire axiSlaveM2S_AW_AWVALIDaxiSlave_M2S_AW_AWVALIDHardLink;
	wire [7: 0] axiSlaveM2S_W_WIDaxiSlave_M2S_W_WIDHardLink;
	wire [7: 0] axiSlaveM2S_W_WDATA0axiSlave_M2S_W_WDATA0HardLink;
	wire [7: 0] axiSlaveM2S_W_WDATA1axiSlave_M2S_W_WDATA1HardLink;
	wire [7: 0] axiSlaveM2S_W_WDATA2axiSlave_M2S_W_WDATA2HardLink;
	wire [7: 0] axiSlaveM2S_W_WDATA3axiSlave_M2S_W_WDATA3HardLink;
	wire [3: 0] axiSlaveM2S_W_WSTRBaxiSlave_M2S_W_WSTRBHardLink;
	wire axiSlaveM2S_W_WLASTaxiSlave_M2S_W_WLASTHardLink;
	wire [7: 0] axiSlaveM2S_W_WUSERaxiSlave_M2S_W_WUSERHardLink;
	wire axiSlaveM2S_W_WVALIDaxiSlave_M2S_W_WVALIDHardLink;
	wire axiSlaveM2S_B_BREADYaxiSlave_M2S_B_BREADYHardLink;
	wire [7: 0] axiSlaveRDATA0axiSlave_RDATA0HardLink;
	wire [7: 0] axiSlaveRDATA1axiSlave_RDATA1HardLink;
	wire [7: 0] axiSlaveRDATA2axiSlave_RDATA2HardLink;
	wire [7: 0] axiSlaveRDATA3axiSlave_RDATA3HardLink;
	wire axiSlaveRACKaxiSlave_RACKHardLink;
	wire axiSlaveWACKaxiSlave_WACKHardLink;
	wire axiSlaveS2M_AR_ARREADYaxiSlave_S2M_AR_ARREADYHardLink;
	wire axiSlaveS2M_AW_AWREADYaxiSlave_S2M_AW_AWREADYHardLink;
	wire [7: 0] axiSlaveS2M_B_BIDaxiSlave_S2M_B_BIDHardLink;
	wire [1: 0] axiSlaveS2M_B_BRESPaxiSlave_S2M_B_BRESPHardLink;
	wire [7: 0] axiSlaveS2M_B_BUSERaxiSlave_S2M_B_BUSERHardLink;
	wire axiSlaveS2M_B_BVALIDaxiSlave_S2M_B_BVALIDHardLink;
	wire [7: 0] axiSlaveS2M_R_RIDaxiSlave_S2M_R_RIDHardLink;
	wire [7: 0] axiSlaveS2M_R_RDATA0axiSlave_S2M_R_RDATA0HardLink;
	wire [7: 0] axiSlaveS2M_R_RDATA1axiSlave_S2M_R_RDATA1HardLink;
	wire [7: 0] axiSlaveS2M_R_RDATA2axiSlave_S2M_R_RDATA2HardLink;
	wire [7: 0] axiSlaveS2M_R_RDATA3axiSlave_S2M_R_RDATA3HardLink;
	wire [1: 0] axiSlaveS2M_R_RRESPaxiSlave_S2M_R_RRESPHardLink;
	wire axiSlaveS2M_R_RLASTaxiSlave_S2M_R_RLASTHardLink;
	wire [7: 0] axiSlaveS2M_R_RUSERaxiSlave_S2M_R_RUSERHardLink;
	wire axiSlaveS2M_R_RVALIDaxiSlave_S2M_R_RVALIDHardLink;
	wire axiSlaveS2M_W_WREADYaxiSlave_S2M_W_WREADYHardLink;
	wire [3: 0] axiSlaveWSTRBaxiSlave_WSTRBHardLink;
	wire [7: 0] axiSlaveWDATA0axiSlave_WDATA0HardLink;
	wire [7: 0] axiSlaveWDATA1axiSlave_WDATA1HardLink;
	wire [7: 0] axiSlaveWDATA2axiSlave_WDATA2HardLink;
	wire [7: 0] axiSlaveWDATA3axiSlave_WDATA3HardLink;
	wire axiSlaveWVALIDaxiSlave_WVALIDHardLink;
	wire axiSlaveRVALIDaxiSlave_RVALIDHardLink;
	wire [31: 0] axiSlaveARADDRaxiSlave_ARADDRHardLink;
	wire [31: 0] axiSlaveAWADDRaxiSlave_AWADDRHardLink;
	integer State_bytes_Iterator;
	reg [7 : 0] State_bytes [0 : 3];
	initial
	begin : Init_State_bytes
		for (State_bytes_Iterator = 0; State_bytes_Iterator < 4; State_bytes_Iterator = State_bytes_Iterator + 1)
			State_bytes[State_bytes_Iterator] = 0;
	end
	integer NextState_bytes_Iterator;
	reg [7 : 0] NextState_bytes [0 : 3];
	initial
	begin : Init_NextState_bytes
		for (NextState_bytes_Iterator = 0; NextState_bytes_Iterator < 4; NextState_bytes_Iterator = NextState_bytes_Iterator + 1)
			NextState_bytes[NextState_bytes_Iterator] = 0;
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
			for (State_bytes_Iterator = 0; (State_bytes_Iterator < 4); State_bytes_Iterator = (State_bytes_Iterator + 1))
			begin
				State_bytes[State_bytes_Iterator] <= State_bytesDefault;
			end
		end
		else
		begin
			for (State_bytes_Iterator = 0; (State_bytes_Iterator < 4); State_bytes_Iterator = (State_bytes_Iterator + 1))
			begin
				State_bytes[State_bytes_Iterator] <= NextState_bytes[State_bytes_Iterator];
			end
		end
	end
	AXI4RegisterModuleB4_TopLevel_AXI4RegisterModuleB4_axiSlave
	AXI4RegisterModuleB4_TopLevel_AXI4RegisterModuleB4_axiSlave
	(
		// [BEGIN USER MAP FOR axiSlave]
		// [END USER MAP FOR axiSlave]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S_AR_ARID (axiSlaveM2S_AR_ARIDaxiSlave_M2S_AR_ARIDHardLink),
		.M2S_AR_ARADDR (axiSlaveM2S_AR_ARADDRaxiSlave_M2S_AR_ARADDRHardLink),
		.M2S_AR_ARLEN (axiSlaveM2S_AR_ARLENaxiSlave_M2S_AR_ARLENHardLink),
		.M2S_AR_ARSIZE (axiSlaveM2S_AR_ARSIZEaxiSlave_M2S_AR_ARSIZEHardLink),
		.M2S_AR_ARBURST (axiSlaveM2S_AR_ARBURSTaxiSlave_M2S_AR_ARBURSTHardLink),
		.M2S_AR_ARLOCK (axiSlaveM2S_AR_ARLOCKaxiSlave_M2S_AR_ARLOCKHardLink),
		.M2S_AR_ARCACHE (axiSlaveM2S_AR_ARCACHEaxiSlave_M2S_AR_ARCACHEHardLink),
		.M2S_AR_ARPROT (axiSlaveM2S_AR_ARPROTaxiSlave_M2S_AR_ARPROTHardLink),
		.M2S_AR_ARQOS (axiSlaveM2S_AR_ARQOSaxiSlave_M2S_AR_ARQOSHardLink),
		.M2S_AR_ARREGION (axiSlaveM2S_AR_ARREGIONaxiSlave_M2S_AR_ARREGIONHardLink),
		.M2S_AR_ARUSER (axiSlaveM2S_AR_ARUSERaxiSlave_M2S_AR_ARUSERHardLink),
		.M2S_AR_ARVALID (axiSlaveM2S_AR_ARVALIDaxiSlave_M2S_AR_ARVALIDHardLink),
		.M2S_R_RREADY (axiSlaveM2S_R_RREADYaxiSlave_M2S_R_RREADYHardLink),
		.M2S_AW_AWID (axiSlaveM2S_AW_AWIDaxiSlave_M2S_AW_AWIDHardLink),
		.M2S_AW_AWADDR (axiSlaveM2S_AW_AWADDRaxiSlave_M2S_AW_AWADDRHardLink),
		.M2S_AW_AWLEN (axiSlaveM2S_AW_AWLENaxiSlave_M2S_AW_AWLENHardLink),
		.M2S_AW_AWSIZE (axiSlaveM2S_AW_AWSIZEaxiSlave_M2S_AW_AWSIZEHardLink),
		.M2S_AW_AWBURST (axiSlaveM2S_AW_AWBURSTaxiSlave_M2S_AW_AWBURSTHardLink),
		.M2S_AW_AWLOCK (axiSlaveM2S_AW_AWLOCKaxiSlave_M2S_AW_AWLOCKHardLink),
		.M2S_AW_AWCACHE (axiSlaveM2S_AW_AWCACHEaxiSlave_M2S_AW_AWCACHEHardLink),
		.M2S_AW_AWPROT (axiSlaveM2S_AW_AWPROTaxiSlave_M2S_AW_AWPROTHardLink),
		.M2S_AW_AWQOS (axiSlaveM2S_AW_AWQOSaxiSlave_M2S_AW_AWQOSHardLink),
		.M2S_AW_AWREGION (axiSlaveM2S_AW_AWREGIONaxiSlave_M2S_AW_AWREGIONHardLink),
		.M2S_AW_AWUSER (axiSlaveM2S_AW_AWUSERaxiSlave_M2S_AW_AWUSERHardLink),
		.M2S_AW_AWVALID (axiSlaveM2S_AW_AWVALIDaxiSlave_M2S_AW_AWVALIDHardLink),
		.M2S_W_WID (axiSlaveM2S_W_WIDaxiSlave_M2S_W_WIDHardLink),
		.M2S_W_WDATA0 (axiSlaveM2S_W_WDATA0axiSlave_M2S_W_WDATA0HardLink),
		.M2S_W_WDATA1 (axiSlaveM2S_W_WDATA1axiSlave_M2S_W_WDATA1HardLink),
		.M2S_W_WDATA2 (axiSlaveM2S_W_WDATA2axiSlave_M2S_W_WDATA2HardLink),
		.M2S_W_WDATA3 (axiSlaveM2S_W_WDATA3axiSlave_M2S_W_WDATA3HardLink),
		.M2S_W_WSTRB (axiSlaveM2S_W_WSTRBaxiSlave_M2S_W_WSTRBHardLink),
		.M2S_W_WLAST (axiSlaveM2S_W_WLASTaxiSlave_M2S_W_WLASTHardLink),
		.M2S_W_WUSER (axiSlaveM2S_W_WUSERaxiSlave_M2S_W_WUSERHardLink),
		.M2S_W_WVALID (axiSlaveM2S_W_WVALIDaxiSlave_M2S_W_WVALIDHardLink),
		.M2S_B_BREADY (axiSlaveM2S_B_BREADYaxiSlave_M2S_B_BREADYHardLink),
		.RDATA0 (axiSlaveRDATA0axiSlave_RDATA0HardLink),
		.RDATA1 (axiSlaveRDATA1axiSlave_RDATA1HardLink),
		.RDATA2 (axiSlaveRDATA2axiSlave_RDATA2HardLink),
		.RDATA3 (axiSlaveRDATA3axiSlave_RDATA3HardLink),
		.RACK (axiSlaveRACKaxiSlave_RACKHardLink),
		.WACK (axiSlaveWACKaxiSlave_WACKHardLink),
		.S2M_AR_ARREADY (axiSlaveS2M_AR_ARREADYaxiSlave_S2M_AR_ARREADYHardLink),
		.S2M_AW_AWREADY (axiSlaveS2M_AW_AWREADYaxiSlave_S2M_AW_AWREADYHardLink),
		.S2M_B_BID (axiSlaveS2M_B_BIDaxiSlave_S2M_B_BIDHardLink),
		.S2M_B_BRESP (axiSlaveS2M_B_BRESPaxiSlave_S2M_B_BRESPHardLink),
		.S2M_B_BUSER (axiSlaveS2M_B_BUSERaxiSlave_S2M_B_BUSERHardLink),
		.S2M_B_BVALID (axiSlaveS2M_B_BVALIDaxiSlave_S2M_B_BVALIDHardLink),
		.S2M_R_RID (axiSlaveS2M_R_RIDaxiSlave_S2M_R_RIDHardLink),
		.S2M_R_RDATA0 (axiSlaveS2M_R_RDATA0axiSlave_S2M_R_RDATA0HardLink),
		.S2M_R_RDATA1 (axiSlaveS2M_R_RDATA1axiSlave_S2M_R_RDATA1HardLink),
		.S2M_R_RDATA2 (axiSlaveS2M_R_RDATA2axiSlave_S2M_R_RDATA2HardLink),
		.S2M_R_RDATA3 (axiSlaveS2M_R_RDATA3axiSlave_S2M_R_RDATA3HardLink),
		.S2M_R_RRESP (axiSlaveS2M_R_RRESPaxiSlave_S2M_R_RRESPHardLink),
		.S2M_R_RLAST (axiSlaveS2M_R_RLASTaxiSlave_S2M_R_RLASTHardLink),
		.S2M_R_RUSER (axiSlaveS2M_R_RUSERaxiSlave_S2M_R_RUSERHardLink),
		.S2M_R_RVALID (axiSlaveS2M_R_RVALIDaxiSlave_S2M_R_RVALIDHardLink),
		.S2M_W_WREADY (axiSlaveS2M_W_WREADYaxiSlave_S2M_W_WREADYHardLink),
		.WSTRB (axiSlaveWSTRBaxiSlave_WSTRBHardLink),
		.WDATA0 (axiSlaveWDATA0axiSlave_WDATA0HardLink),
		.WDATA1 (axiSlaveWDATA1axiSlave_WDATA1HardLink),
		.WDATA2 (axiSlaveWDATA2axiSlave_WDATA2HardLink),
		.WDATA3 (axiSlaveWDATA3axiSlave_WDATA3HardLink),
		.WVALID (axiSlaveWVALIDaxiSlave_WVALIDHardLink),
		.RVALID (axiSlaveRVALIDaxiSlave_RVALIDHardLink),
		.ARADDR (axiSlaveARADDRaxiSlave_ARADDRHardLink),
		.AWADDR (axiSlaveAWADDRaxiSlave_AWADDRHardLink)
	);
	always @ (*)
	begin
		for (NextState_bytes_Iterator = 0; (NextState_bytes_Iterator < 4); NextState_bytes_Iterator = (NextState_bytes_Iterator + 1))
		begin
			NextState_bytes[NextState_bytes_Iterator] = State_bytes[NextState_bytes_Iterator];
		end
		if ((Inputs_WE == 1))
		begin
			NextState_bytes[0] = Inputs_WDATA0;
			NextState_bytes[1] = Inputs_WDATA1;
			NextState_bytes[2] = Inputs_WDATA2;
			NextState_bytes[3] = Inputs_WDATA3;
		end
		else if ((axiSlave_WVALID == 1))
		begin
			if ((AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_0_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index == 1))
			begin
				NextState_bytes[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_0_w] = axiSlave_WDATA0;
			end
			if ((AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_1_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index == 1))
			begin
				NextState_bytes[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_1_w] = axiSlave_WDATA1;
			end
			if ((AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_2_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index == 1))
			begin
				NextState_bytes[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_2_w] = axiSlave_WDATA2;
			end
			if ((AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_3_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index == 1))
			begin
				NextState_bytes[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_3_w] = axiSlave_WDATA3;
			end
		end
	end
	assign Inputs_M2S_AR_ARID = M2S_AR_ARID;
	assign Inputs_M2S_AR_ARADDR = M2S_AR_ARADDR;
	assign Inputs_M2S_AR_ARLEN = M2S_AR_ARLEN;
	assign Inputs_M2S_AR_ARSIZE = M2S_AR_ARSIZE;
	assign Inputs_M2S_AR_ARBURST = M2S_AR_ARBURST;
	assign Inputs_M2S_AR_ARLOCK = M2S_AR_ARLOCK;
	assign Inputs_M2S_AR_ARCACHE = M2S_AR_ARCACHE;
	assign Inputs_M2S_AR_ARPROT = M2S_AR_ARPROT;
	assign Inputs_M2S_AR_ARQOS = M2S_AR_ARQOS;
	assign Inputs_M2S_AR_ARREGION = M2S_AR_ARREGION;
	assign Inputs_M2S_AR_ARUSER = M2S_AR_ARUSER;
	assign Inputs_M2S_AR_ARVALID = M2S_AR_ARVALID;
	assign Inputs_M2S_R_RREADY = M2S_R_RREADY;
	assign Inputs_M2S_AW_AWID = M2S_AW_AWID;
	assign Inputs_M2S_AW_AWADDR = M2S_AW_AWADDR;
	assign Inputs_M2S_AW_AWLEN = M2S_AW_AWLEN;
	assign Inputs_M2S_AW_AWSIZE = M2S_AW_AWSIZE;
	assign Inputs_M2S_AW_AWBURST = M2S_AW_AWBURST;
	assign Inputs_M2S_AW_AWLOCK = M2S_AW_AWLOCK;
	assign Inputs_M2S_AW_AWCACHE = M2S_AW_AWCACHE;
	assign Inputs_M2S_AW_AWPROT = M2S_AW_AWPROT;
	assign Inputs_M2S_AW_AWQOS = M2S_AW_AWQOS;
	assign Inputs_M2S_AW_AWREGION = M2S_AW_AWREGION;
	assign Inputs_M2S_AW_AWUSER = M2S_AW_AWUSER;
	assign Inputs_M2S_AW_AWVALID = M2S_AW_AWVALID;
	assign Inputs_M2S_W_WID = M2S_W_WID;
	assign Inputs_M2S_W_WDATA0 = M2S_W_WDATA0;
	assign Inputs_M2S_W_WDATA1 = M2S_W_WDATA1;
	assign Inputs_M2S_W_WDATA2 = M2S_W_WDATA2;
	assign Inputs_M2S_W_WDATA3 = M2S_W_WDATA3;
	assign Inputs_M2S_W_WSTRB = M2S_W_WSTRB;
	assign Inputs_M2S_W_WLAST = M2S_W_WLAST;
	assign Inputs_M2S_W_WUSER = M2S_W_WUSER;
	assign Inputs_M2S_W_WVALID = M2S_W_WVALID;
	assign Inputs_M2S_B_BREADY = M2S_B_BREADY;
	assign Inputs_WE = WE;
	assign Inputs_WDATA0 = WDATA0;
	assign Inputs_WDATA1 = WDATA1;
	assign Inputs_WDATA2 = WDATA2;
	assign Inputs_WDATA3 = WDATA3;
	assign axiSlave_M2S_AR_ARID = Inputs_M2S_AR_ARID;
	assign axiSlave_M2S_AR_ARADDR = Inputs_M2S_AR_ARADDR;
	assign axiSlave_M2S_AR_ARLEN = Inputs_M2S_AR_ARLEN;
	assign axiSlave_M2S_AR_ARSIZE = Inputs_M2S_AR_ARSIZE;
	assign axiSlave_M2S_AR_ARBURST = Inputs_M2S_AR_ARBURST;
	assign axiSlave_M2S_AR_ARLOCK = Inputs_M2S_AR_ARLOCK;
	assign axiSlave_M2S_AR_ARCACHE = Inputs_M2S_AR_ARCACHE;
	assign axiSlave_M2S_AR_ARPROT = Inputs_M2S_AR_ARPROT;
	assign axiSlave_M2S_AR_ARQOS = Inputs_M2S_AR_ARQOS;
	assign axiSlave_M2S_AR_ARREGION = Inputs_M2S_AR_ARREGION;
	assign axiSlave_M2S_AR_ARUSER = Inputs_M2S_AR_ARUSER;
	assign axiSlave_M2S_AR_ARVALID = Inputs_M2S_AR_ARVALID;
	assign axiSlave_M2S_R_RREADY = Inputs_M2S_R_RREADY;
	assign axiSlave_M2S_AW_AWID = Inputs_M2S_AW_AWID;
	assign axiSlave_M2S_AW_AWADDR = Inputs_M2S_AW_AWADDR;
	assign axiSlave_M2S_AW_AWLEN = Inputs_M2S_AW_AWLEN;
	assign axiSlave_M2S_AW_AWSIZE = Inputs_M2S_AW_AWSIZE;
	assign axiSlave_M2S_AW_AWBURST = Inputs_M2S_AW_AWBURST;
	assign axiSlave_M2S_AW_AWLOCK = Inputs_M2S_AW_AWLOCK;
	assign axiSlave_M2S_AW_AWCACHE = Inputs_M2S_AW_AWCACHE;
	assign axiSlave_M2S_AW_AWPROT = Inputs_M2S_AW_AWPROT;
	assign axiSlave_M2S_AW_AWQOS = Inputs_M2S_AW_AWQOS;
	assign axiSlave_M2S_AW_AWREGION = Inputs_M2S_AW_AWREGION;
	assign axiSlave_M2S_AW_AWUSER = Inputs_M2S_AW_AWUSER;
	assign axiSlave_M2S_AW_AWVALID = Inputs_M2S_AW_AWVALID;
	assign axiSlave_M2S_W_WID = Inputs_M2S_W_WID;
	assign axiSlave_M2S_W_WDATA0 = Inputs_M2S_W_WDATA0;
	assign axiSlave_M2S_W_WDATA1 = Inputs_M2S_W_WDATA1;
	assign axiSlave_M2S_W_WDATA2 = Inputs_M2S_W_WDATA2;
	assign axiSlave_M2S_W_WDATA3 = Inputs_M2S_W_WDATA3;
	assign axiSlave_M2S_W_WSTRB = Inputs_M2S_W_WSTRB;
	assign axiSlave_M2S_W_WLAST = Inputs_M2S_W_WLAST;
	assign axiSlave_M2S_W_WUSER = Inputs_M2S_W_WUSER;
	assign axiSlave_M2S_W_WVALID = Inputs_M2S_W_WVALID;
	assign axiSlave_M2S_B_BREADY = Inputs_M2S_B_BREADY;
	assign axiSlave_RDATA0 = State_bytes[0];
	assign axiSlave_RDATA1 = State_bytes[1];
	assign axiSlave_RDATA2 = State_bytes[2];
	assign axiSlave_RDATA3 = State_bytes[3];
	assign axiSlave_RACK = AXI4RegisterModule_L56F24T28_Expr;
	assign axiSlave_WACK = AXI4RegisterModule_L58F24T28_Expr;
	assign AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_0_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index = axiSlave_WSTRB[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_0_w];
	assign AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_1_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index = axiSlave_WSTRB[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_1_w];
	assign AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_2_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index = axiSlave_WSTRB[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_2_w];
	assign AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_3_AXI4RegisterModule_L70F17L73T18_AXI4RegisterModule_L71F25T42_Index = axiSlave_WSTRB[AXI4RegisterModule_L62F9L75T10_AXI4RegisterModule_L68F13L74T14_AXI4RegisterModule_L69F17L73T18_3_w];
	assign OutData0 = State_bytes[0];
	assign OutData1 = State_bytes[1];
	assign OutData2 = State_bytes[2];
	assign OutData3 = State_bytes[3];
	assign OutACK = Inputs_WE;
	assign S2M_AR_ARREADY = axiSlave_S2M_AR_ARREADY;
	assign S2M_AW_AWREADY = axiSlave_S2M_AW_AWREADY;
	assign S2M_B_BID = axiSlave_S2M_B_BID;
	assign S2M_B_BRESP = axiSlave_S2M_B_BRESP;
	assign S2M_B_BUSER = axiSlave_S2M_B_BUSER;
	assign S2M_B_BVALID = axiSlave_S2M_B_BVALID;
	assign S2M_R_RID = axiSlave_S2M_R_RID;
	assign S2M_R_RDATA0 = axiSlave_S2M_R_RDATA0;
	assign S2M_R_RDATA1 = axiSlave_S2M_R_RDATA1;
	assign S2M_R_RDATA2 = axiSlave_S2M_R_RDATA2;
	assign S2M_R_RDATA3 = axiSlave_S2M_R_RDATA3;
	assign S2M_R_RRESP = axiSlave_S2M_R_RRESP;
	assign S2M_R_RLAST = axiSlave_S2M_R_RLAST;
	assign S2M_R_RUSER = axiSlave_S2M_R_RUSER;
	assign S2M_R_RVALID = axiSlave_S2M_R_RVALID;
	assign S2M_W_WREADY = axiSlave_S2M_W_WREADY;
	assign axiSlaveM2S_AR_ARIDaxiSlave_M2S_AR_ARIDHardLink = axiSlave_M2S_AR_ARID;
	assign axiSlaveM2S_AR_ARADDRaxiSlave_M2S_AR_ARADDRHardLink = axiSlave_M2S_AR_ARADDR;
	assign axiSlaveM2S_AR_ARLENaxiSlave_M2S_AR_ARLENHardLink = axiSlave_M2S_AR_ARLEN;
	assign axiSlaveM2S_AR_ARSIZEaxiSlave_M2S_AR_ARSIZEHardLink = axiSlave_M2S_AR_ARSIZE;
	assign axiSlaveM2S_AR_ARBURSTaxiSlave_M2S_AR_ARBURSTHardLink = axiSlave_M2S_AR_ARBURST;
	assign axiSlaveM2S_AR_ARLOCKaxiSlave_M2S_AR_ARLOCKHardLink = axiSlave_M2S_AR_ARLOCK;
	assign axiSlaveM2S_AR_ARCACHEaxiSlave_M2S_AR_ARCACHEHardLink = axiSlave_M2S_AR_ARCACHE;
	assign axiSlaveM2S_AR_ARPROTaxiSlave_M2S_AR_ARPROTHardLink = axiSlave_M2S_AR_ARPROT;
	assign axiSlaveM2S_AR_ARQOSaxiSlave_M2S_AR_ARQOSHardLink = axiSlave_M2S_AR_ARQOS;
	assign axiSlaveM2S_AR_ARREGIONaxiSlave_M2S_AR_ARREGIONHardLink = axiSlave_M2S_AR_ARREGION;
	assign axiSlaveM2S_AR_ARUSERaxiSlave_M2S_AR_ARUSERHardLink = axiSlave_M2S_AR_ARUSER;
	assign axiSlaveM2S_AR_ARVALIDaxiSlave_M2S_AR_ARVALIDHardLink = axiSlave_M2S_AR_ARVALID;
	assign axiSlaveM2S_R_RREADYaxiSlave_M2S_R_RREADYHardLink = axiSlave_M2S_R_RREADY;
	assign axiSlaveM2S_AW_AWIDaxiSlave_M2S_AW_AWIDHardLink = axiSlave_M2S_AW_AWID;
	assign axiSlaveM2S_AW_AWADDRaxiSlave_M2S_AW_AWADDRHardLink = axiSlave_M2S_AW_AWADDR;
	assign axiSlaveM2S_AW_AWLENaxiSlave_M2S_AW_AWLENHardLink = axiSlave_M2S_AW_AWLEN;
	assign axiSlaveM2S_AW_AWSIZEaxiSlave_M2S_AW_AWSIZEHardLink = axiSlave_M2S_AW_AWSIZE;
	assign axiSlaveM2S_AW_AWBURSTaxiSlave_M2S_AW_AWBURSTHardLink = axiSlave_M2S_AW_AWBURST;
	assign axiSlaveM2S_AW_AWLOCKaxiSlave_M2S_AW_AWLOCKHardLink = axiSlave_M2S_AW_AWLOCK;
	assign axiSlaveM2S_AW_AWCACHEaxiSlave_M2S_AW_AWCACHEHardLink = axiSlave_M2S_AW_AWCACHE;
	assign axiSlaveM2S_AW_AWPROTaxiSlave_M2S_AW_AWPROTHardLink = axiSlave_M2S_AW_AWPROT;
	assign axiSlaveM2S_AW_AWQOSaxiSlave_M2S_AW_AWQOSHardLink = axiSlave_M2S_AW_AWQOS;
	assign axiSlaveM2S_AW_AWREGIONaxiSlave_M2S_AW_AWREGIONHardLink = axiSlave_M2S_AW_AWREGION;
	assign axiSlaveM2S_AW_AWUSERaxiSlave_M2S_AW_AWUSERHardLink = axiSlave_M2S_AW_AWUSER;
	assign axiSlaveM2S_AW_AWVALIDaxiSlave_M2S_AW_AWVALIDHardLink = axiSlave_M2S_AW_AWVALID;
	assign axiSlaveM2S_W_WIDaxiSlave_M2S_W_WIDHardLink = axiSlave_M2S_W_WID;
	assign axiSlaveM2S_W_WDATA0axiSlave_M2S_W_WDATA0HardLink = axiSlave_M2S_W_WDATA0;
	assign axiSlaveM2S_W_WDATA1axiSlave_M2S_W_WDATA1HardLink = axiSlave_M2S_W_WDATA1;
	assign axiSlaveM2S_W_WDATA2axiSlave_M2S_W_WDATA2HardLink = axiSlave_M2S_W_WDATA2;
	assign axiSlaveM2S_W_WDATA3axiSlave_M2S_W_WDATA3HardLink = axiSlave_M2S_W_WDATA3;
	assign axiSlaveM2S_W_WSTRBaxiSlave_M2S_W_WSTRBHardLink = axiSlave_M2S_W_WSTRB;
	assign axiSlaveM2S_W_WLASTaxiSlave_M2S_W_WLASTHardLink = axiSlave_M2S_W_WLAST;
	assign axiSlaveM2S_W_WUSERaxiSlave_M2S_W_WUSERHardLink = axiSlave_M2S_W_WUSER;
	assign axiSlaveM2S_W_WVALIDaxiSlave_M2S_W_WVALIDHardLink = axiSlave_M2S_W_WVALID;
	assign axiSlaveM2S_B_BREADYaxiSlave_M2S_B_BREADYHardLink = axiSlave_M2S_B_BREADY;
	assign axiSlaveRDATA0axiSlave_RDATA0HardLink = axiSlave_RDATA0;
	assign axiSlaveRDATA1axiSlave_RDATA1HardLink = axiSlave_RDATA1;
	assign axiSlaveRDATA2axiSlave_RDATA2HardLink = axiSlave_RDATA2;
	assign axiSlaveRDATA3axiSlave_RDATA3HardLink = axiSlave_RDATA3;
	assign axiSlaveRACKaxiSlave_RACKHardLink = axiSlave_RACK;
	assign axiSlaveWACKaxiSlave_WACKHardLink = axiSlave_WACK;
	assign axiSlave_S2M_AR_ARREADY = axiSlaveS2M_AR_ARREADYaxiSlave_S2M_AR_ARREADYHardLink;
	assign axiSlave_S2M_AW_AWREADY = axiSlaveS2M_AW_AWREADYaxiSlave_S2M_AW_AWREADYHardLink;
	assign axiSlave_S2M_B_BID = axiSlaveS2M_B_BIDaxiSlave_S2M_B_BIDHardLink;
	assign axiSlave_S2M_B_BRESP = axiSlaveS2M_B_BRESPaxiSlave_S2M_B_BRESPHardLink;
	assign axiSlave_S2M_B_BUSER = axiSlaveS2M_B_BUSERaxiSlave_S2M_B_BUSERHardLink;
	assign axiSlave_S2M_B_BVALID = axiSlaveS2M_B_BVALIDaxiSlave_S2M_B_BVALIDHardLink;
	assign axiSlave_S2M_R_RID = axiSlaveS2M_R_RIDaxiSlave_S2M_R_RIDHardLink;
	assign axiSlave_S2M_R_RDATA0 = axiSlaveS2M_R_RDATA0axiSlave_S2M_R_RDATA0HardLink;
	assign axiSlave_S2M_R_RDATA1 = axiSlaveS2M_R_RDATA1axiSlave_S2M_R_RDATA1HardLink;
	assign axiSlave_S2M_R_RDATA2 = axiSlaveS2M_R_RDATA2axiSlave_S2M_R_RDATA2HardLink;
	assign axiSlave_S2M_R_RDATA3 = axiSlaveS2M_R_RDATA3axiSlave_S2M_R_RDATA3HardLink;
	assign axiSlave_S2M_R_RRESP = axiSlaveS2M_R_RRESPaxiSlave_S2M_R_RRESPHardLink;
	assign axiSlave_S2M_R_RLAST = axiSlaveS2M_R_RLASTaxiSlave_S2M_R_RLASTHardLink;
	assign axiSlave_S2M_R_RUSER = axiSlaveS2M_R_RUSERaxiSlave_S2M_R_RUSERHardLink;
	assign axiSlave_S2M_R_RVALID = axiSlaveS2M_R_RVALIDaxiSlave_S2M_R_RVALIDHardLink;
	assign axiSlave_S2M_W_WREADY = axiSlaveS2M_W_WREADYaxiSlave_S2M_W_WREADYHardLink;
	assign axiSlave_WSTRB = axiSlaveWSTRBaxiSlave_WSTRBHardLink;
	assign axiSlave_WDATA0 = axiSlaveWDATA0axiSlave_WDATA0HardLink;
	assign axiSlave_WDATA1 = axiSlaveWDATA1axiSlave_WDATA1HardLink;
	assign axiSlave_WDATA2 = axiSlaveWDATA2axiSlave_WDATA2HardLink;
	assign axiSlave_WDATA3 = axiSlaveWDATA3axiSlave_WDATA3HardLink;
	assign axiSlave_WVALID = axiSlaveWVALIDaxiSlave_WVALIDHardLink;
	assign axiSlave_RVALID = axiSlaveRVALIDaxiSlave_RVALIDHardLink;
	assign axiSlave_ARADDR = axiSlaveARADDRaxiSlave_ARADDRHardLink;
	assign axiSlave_AWADDR = axiSlaveAWADDRaxiSlave_AWADDRHardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
