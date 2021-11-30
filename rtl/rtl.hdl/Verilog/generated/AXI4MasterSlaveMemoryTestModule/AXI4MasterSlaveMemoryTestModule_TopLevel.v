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
// System configuration name is AXI4MasterSlaveMemoryTestModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4MasterSlaveMemoryTestModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [31: 0] AXADDR,
	input wire [31: 0] InData,
	input wire WE,
	input wire RE,
	input wire SWE,
	output wire OutACK,
	output wire [7: 0] OutMasterData0,
	output wire [7: 0] OutMasterData1,
	output wire [7: 0] OutMasterData2,
	output wire [7: 0] OutMasterData3,
	output wire [31: 0] OutMasterWord
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] AXI4MasterSlaveMemoryTestModule_L53F41T54_Expr = 8'b11111111;
	wire [31: 0] Inputs_AXADDR;
	wire [31: 0] Inputs_InData;
	wire Inputs_WE;
	wire Inputs_RE;
	wire Inputs_SWE;
	wire [7: 0] s_M2S_AR_ARID;
	wire [31: 0] s_M2S_AR_ARADDR;
	wire [7: 0] s_M2S_AR_ARLEN;
	wire [2: 0] s_M2S_AR_ARSIZE;
	wire [1: 0] s_M2S_AR_ARBURST;
	wire [1: 0] s_M2S_AR_ARLOCK;
	wire [3: 0] s_M2S_AR_ARCACHE;
	wire [2: 0] s_M2S_AR_ARPROT;
	wire [3: 0] s_M2S_AR_ARQOS;
	wire [7: 0] s_M2S_AR_ARREGION;
	wire [7: 0] s_M2S_AR_ARUSER;
	wire s_M2S_AR_ARVALID;
	wire s_M2S_R_RREADY;
	wire [7: 0] s_M2S_AW_AWID;
	wire [31: 0] s_M2S_AW_AWADDR;
	wire [7: 0] s_M2S_AW_AWLEN;
	wire [2: 0] s_M2S_AW_AWSIZE;
	wire [1: 0] s_M2S_AW_AWBURST;
	wire [1: 0] s_M2S_AW_AWLOCK;
	wire [3: 0] s_M2S_AW_AWCACHE;
	wire [2: 0] s_M2S_AW_AWPROT;
	wire [3: 0] s_M2S_AW_AWQOS;
	wire [7: 0] s_M2S_AW_AWREGION;
	wire [7: 0] s_M2S_AW_AWUSER;
	wire s_M2S_AW_AWVALID;
	wire [7: 0] s_M2S_W_WID;
	wire [7: 0] s_M2S_W_WDATA0;
	wire [7: 0] s_M2S_W_WDATA1;
	wire [7: 0] s_M2S_W_WDATA2;
	wire [7: 0] s_M2S_W_WDATA3;
	wire [3: 0] s_M2S_W_WSTRB;
	wire s_M2S_W_WLAST;
	wire [7: 0] s_M2S_W_WUSER;
	wire s_M2S_W_WVALID;
	wire s_M2S_B_BREADY;
	wire s_S2M_AR_ARREADY;
	wire s_S2M_AW_AWREADY;
	wire [7: 0] s_S2M_B_BID;
	wire [1: 0] s_S2M_B_BRESP;
	wire [7: 0] s_S2M_B_BUSER;
	wire s_S2M_B_BVALID;
	wire [7: 0] s_S2M_R_RID;
	wire [7: 0] s_S2M_R_RDATA0;
	wire [7: 0] s_S2M_R_RDATA1;
	wire [7: 0] s_S2M_R_RDATA2;
	wire [7: 0] s_S2M_R_RDATA3;
	wire [1: 0] s_S2M_R_RRESP;
	wire s_S2M_R_RLAST;
	wire [7: 0] s_S2M_R_RUSER;
	wire s_S2M_R_RVALID;
	wire s_S2M_W_WREADY;
	wire m_S2M_AR_ARREADY;
	wire m_S2M_AW_AWREADY;
	wire [7: 0] m_S2M_B_BID;
	wire [1: 0] m_S2M_B_BRESP;
	wire [7: 0] m_S2M_B_BUSER;
	wire m_S2M_B_BVALID;
	wire [7: 0] m_S2M_R_RID;
	wire [7: 0] m_S2M_R_RDATA0;
	wire [7: 0] m_S2M_R_RDATA1;
	wire [7: 0] m_S2M_R_RDATA2;
	wire [7: 0] m_S2M_R_RDATA3;
	wire [1: 0] m_S2M_R_RRESP;
	wire m_S2M_R_RLAST;
	wire [7: 0] m_S2M_R_RUSER;
	wire m_S2M_R_RVALID;
	wire m_S2M_W_WREADY;
	wire [31: 0] m_AXADDR;
	wire m_RE;
	wire m_WE;
	wire [7: 0] m_WDATA0;
	wire [7: 0] m_WDATA1;
	wire [7: 0] m_WDATA2;
	wire [7: 0] m_WDATA3;
	wire [3: 0] m_WSTRB;
	wire m_InvalidInputs;
	wire m_OutACK;
	wire [7: 0] m_RDATA0;
	wire [7: 0] m_RDATA1;
	wire [7: 0] m_RDATA2;
	wire [7: 0] m_RDATA3;
	wire [7: 0] m_M2S_AR_ARID;
	wire [31: 0] m_M2S_AR_ARADDR;
	wire [7: 0] m_M2S_AR_ARLEN;
	wire [2: 0] m_M2S_AR_ARSIZE;
	wire [1: 0] m_M2S_AR_ARBURST;
	wire [1: 0] m_M2S_AR_ARLOCK;
	wire [3: 0] m_M2S_AR_ARCACHE;
	wire [2: 0] m_M2S_AR_ARPROT;
	wire [3: 0] m_M2S_AR_ARQOS;
	wire [7: 0] m_M2S_AR_ARREGION;
	wire [7: 0] m_M2S_AR_ARUSER;
	wire m_M2S_AR_ARVALID;
	wire m_M2S_R_RREADY;
	wire [7: 0] m_M2S_AW_AWID;
	wire [31: 0] m_M2S_AW_AWADDR;
	wire [7: 0] m_M2S_AW_AWLEN;
	wire [2: 0] m_M2S_AW_AWSIZE;
	wire [1: 0] m_M2S_AW_AWBURST;
	wire [1: 0] m_M2S_AW_AWLOCK;
	wire [3: 0] m_M2S_AW_AWCACHE;
	wire [2: 0] m_M2S_AW_AWPROT;
	wire [3: 0] m_M2S_AW_AWQOS;
	wire [7: 0] m_M2S_AW_AWREGION;
	wire [7: 0] m_M2S_AW_AWUSER;
	wire m_M2S_AW_AWVALID;
	wire [7: 0] m_M2S_W_WID;
	wire [7: 0] m_M2S_W_WDATA0;
	wire [7: 0] m_M2S_W_WDATA1;
	wire [7: 0] m_M2S_W_WDATA2;
	wire [7: 0] m_M2S_W_WDATA3;
	wire [3: 0] m_M2S_W_WSTRB;
	wire m_M2S_W_WLAST;
	wire [7: 0] m_M2S_W_WUSER;
	wire m_M2S_W_WVALID;
	wire m_M2S_B_BREADY;
	wire [31: 0] AXI4MasterSlaveMemoryTestModule_L52F25T55_Source;
	wire [7: 0] AXI4MasterSlaveMemoryTestModule_L53F25T55_Source;
	wire [3: 0] AXI4MasterSlaveMemoryTestModule_L53F25T60_Index;
	reg [7: 0] State_ReadDataDefault = 8'b00000000;
	wire [31: 0] AXI4MasterSlaveMemoryTestModule_L34F45T69_Source;
	wire [7: 0] sM2S_AR_ARIDs_M2S_AR_ARIDHardLink;
	wire [31: 0] sM2S_AR_ARADDRs_M2S_AR_ARADDRHardLink;
	wire [7: 0] sM2S_AR_ARLENs_M2S_AR_ARLENHardLink;
	wire [2: 0] sM2S_AR_ARSIZEs_M2S_AR_ARSIZEHardLink;
	wire [1: 0] sM2S_AR_ARBURSTs_M2S_AR_ARBURSTHardLink;
	wire [1: 0] sM2S_AR_ARLOCKs_M2S_AR_ARLOCKHardLink;
	wire [3: 0] sM2S_AR_ARCACHEs_M2S_AR_ARCACHEHardLink;
	wire [2: 0] sM2S_AR_ARPROTs_M2S_AR_ARPROTHardLink;
	wire [3: 0] sM2S_AR_ARQOSs_M2S_AR_ARQOSHardLink;
	wire [7: 0] sM2S_AR_ARREGIONs_M2S_AR_ARREGIONHardLink;
	wire [7: 0] sM2S_AR_ARUSERs_M2S_AR_ARUSERHardLink;
	wire sM2S_AR_ARVALIDs_M2S_AR_ARVALIDHardLink;
	wire sM2S_R_RREADYs_M2S_R_RREADYHardLink;
	wire [7: 0] sM2S_AW_AWIDs_M2S_AW_AWIDHardLink;
	wire [31: 0] sM2S_AW_AWADDRs_M2S_AW_AWADDRHardLink;
	wire [7: 0] sM2S_AW_AWLENs_M2S_AW_AWLENHardLink;
	wire [2: 0] sM2S_AW_AWSIZEs_M2S_AW_AWSIZEHardLink;
	wire [1: 0] sM2S_AW_AWBURSTs_M2S_AW_AWBURSTHardLink;
	wire [1: 0] sM2S_AW_AWLOCKs_M2S_AW_AWLOCKHardLink;
	wire [3: 0] sM2S_AW_AWCACHEs_M2S_AW_AWCACHEHardLink;
	wire [2: 0] sM2S_AW_AWPROTs_M2S_AW_AWPROTHardLink;
	wire [3: 0] sM2S_AW_AWQOSs_M2S_AW_AWQOSHardLink;
	wire [7: 0] sM2S_AW_AWREGIONs_M2S_AW_AWREGIONHardLink;
	wire [7: 0] sM2S_AW_AWUSERs_M2S_AW_AWUSERHardLink;
	wire sM2S_AW_AWVALIDs_M2S_AW_AWVALIDHardLink;
	wire [7: 0] sM2S_W_WIDs_M2S_W_WIDHardLink;
	wire [7: 0] sM2S_W_WDATA0s_M2S_W_WDATA0HardLink;
	wire [7: 0] sM2S_W_WDATA1s_M2S_W_WDATA1HardLink;
	wire [7: 0] sM2S_W_WDATA2s_M2S_W_WDATA2HardLink;
	wire [7: 0] sM2S_W_WDATA3s_M2S_W_WDATA3HardLink;
	wire [3: 0] sM2S_W_WSTRBs_M2S_W_WSTRBHardLink;
	wire sM2S_W_WLASTs_M2S_W_WLASTHardLink;
	wire [7: 0] sM2S_W_WUSERs_M2S_W_WUSERHardLink;
	wire sM2S_W_WVALIDs_M2S_W_WVALIDHardLink;
	wire sM2S_B_BREADYs_M2S_B_BREADYHardLink;
	wire sS2M_AR_ARREADYs_S2M_AR_ARREADYHardLink;
	wire sS2M_AW_AWREADYs_S2M_AW_AWREADYHardLink;
	wire [7: 0] sS2M_B_BIDs_S2M_B_BIDHardLink;
	wire [1: 0] sS2M_B_BRESPs_S2M_B_BRESPHardLink;
	wire [7: 0] sS2M_B_BUSERs_S2M_B_BUSERHardLink;
	wire sS2M_B_BVALIDs_S2M_B_BVALIDHardLink;
	wire [7: 0] sS2M_R_RIDs_S2M_R_RIDHardLink;
	wire [7: 0] sS2M_R_RDATA0s_S2M_R_RDATA0HardLink;
	wire [7: 0] sS2M_R_RDATA1s_S2M_R_RDATA1HardLink;
	wire [7: 0] sS2M_R_RDATA2s_S2M_R_RDATA2HardLink;
	wire [7: 0] sS2M_R_RDATA3s_S2M_R_RDATA3HardLink;
	wire [1: 0] sS2M_R_RRESPs_S2M_R_RRESPHardLink;
	wire sS2M_R_RLASTs_S2M_R_RLASTHardLink;
	wire [7: 0] sS2M_R_RUSERs_S2M_R_RUSERHardLink;
	wire sS2M_R_RVALIDs_S2M_R_RVALIDHardLink;
	wire sS2M_W_WREADYs_S2M_W_WREADYHardLink;
	wire mS2M_AR_ARREADYm_S2M_AR_ARREADYHardLink;
	wire mS2M_AW_AWREADYm_S2M_AW_AWREADYHardLink;
	wire [7: 0] mS2M_B_BIDm_S2M_B_BIDHardLink;
	wire [1: 0] mS2M_B_BRESPm_S2M_B_BRESPHardLink;
	wire [7: 0] mS2M_B_BUSERm_S2M_B_BUSERHardLink;
	wire mS2M_B_BVALIDm_S2M_B_BVALIDHardLink;
	wire [7: 0] mS2M_R_RIDm_S2M_R_RIDHardLink;
	wire [7: 0] mS2M_R_RDATA0m_S2M_R_RDATA0HardLink;
	wire [7: 0] mS2M_R_RDATA1m_S2M_R_RDATA1HardLink;
	wire [7: 0] mS2M_R_RDATA2m_S2M_R_RDATA2HardLink;
	wire [7: 0] mS2M_R_RDATA3m_S2M_R_RDATA3HardLink;
	wire [1: 0] mS2M_R_RRESPm_S2M_R_RRESPHardLink;
	wire mS2M_R_RLASTm_S2M_R_RLASTHardLink;
	wire [7: 0] mS2M_R_RUSERm_S2M_R_RUSERHardLink;
	wire mS2M_R_RVALIDm_S2M_R_RVALIDHardLink;
	wire mS2M_W_WREADYm_S2M_W_WREADYHardLink;
	wire [31: 0] mAXADDRm_AXADDRHardLink;
	wire mREm_REHardLink;
	wire mWEm_WEHardLink;
	wire [7: 0] mWDATA0m_WDATA0HardLink;
	wire [7: 0] mWDATA1m_WDATA1HardLink;
	wire [7: 0] mWDATA2m_WDATA2HardLink;
	wire [7: 0] mWDATA3m_WDATA3HardLink;
	wire [3: 0] mWSTRBm_WSTRBHardLink;
	wire mInvalidInputsm_InvalidInputsHardLink;
	wire mOutACKm_OutACKHardLink;
	wire [7: 0] mRDATA0m_RDATA0HardLink;
	wire [7: 0] mRDATA1m_RDATA1HardLink;
	wire [7: 0] mRDATA2m_RDATA2HardLink;
	wire [7: 0] mRDATA3m_RDATA3HardLink;
	wire [7: 0] mM2S_AR_ARIDm_M2S_AR_ARIDHardLink;
	wire [31: 0] mM2S_AR_ARADDRm_M2S_AR_ARADDRHardLink;
	wire [7: 0] mM2S_AR_ARLENm_M2S_AR_ARLENHardLink;
	wire [2: 0] mM2S_AR_ARSIZEm_M2S_AR_ARSIZEHardLink;
	wire [1: 0] mM2S_AR_ARBURSTm_M2S_AR_ARBURSTHardLink;
	wire [1: 0] mM2S_AR_ARLOCKm_M2S_AR_ARLOCKHardLink;
	wire [3: 0] mM2S_AR_ARCACHEm_M2S_AR_ARCACHEHardLink;
	wire [2: 0] mM2S_AR_ARPROTm_M2S_AR_ARPROTHardLink;
	wire [3: 0] mM2S_AR_ARQOSm_M2S_AR_ARQOSHardLink;
	wire [7: 0] mM2S_AR_ARREGIONm_M2S_AR_ARREGIONHardLink;
	wire [7: 0] mM2S_AR_ARUSERm_M2S_AR_ARUSERHardLink;
	wire mM2S_AR_ARVALIDm_M2S_AR_ARVALIDHardLink;
	wire mM2S_R_RREADYm_M2S_R_RREADYHardLink;
	wire [7: 0] mM2S_AW_AWIDm_M2S_AW_AWIDHardLink;
	wire [31: 0] mM2S_AW_AWADDRm_M2S_AW_AWADDRHardLink;
	wire [7: 0] mM2S_AW_AWLENm_M2S_AW_AWLENHardLink;
	wire [2: 0] mM2S_AW_AWSIZEm_M2S_AW_AWSIZEHardLink;
	wire [1: 0] mM2S_AW_AWBURSTm_M2S_AW_AWBURSTHardLink;
	wire [1: 0] mM2S_AW_AWLOCKm_M2S_AW_AWLOCKHardLink;
	wire [3: 0] mM2S_AW_AWCACHEm_M2S_AW_AWCACHEHardLink;
	wire [2: 0] mM2S_AW_AWPROTm_M2S_AW_AWPROTHardLink;
	wire [3: 0] mM2S_AW_AWQOSm_M2S_AW_AWQOSHardLink;
	wire [7: 0] mM2S_AW_AWREGIONm_M2S_AW_AWREGIONHardLink;
	wire [7: 0] mM2S_AW_AWUSERm_M2S_AW_AWUSERHardLink;
	wire mM2S_AW_AWVALIDm_M2S_AW_AWVALIDHardLink;
	wire [7: 0] mM2S_W_WIDm_M2S_W_WIDHardLink;
	wire [7: 0] mM2S_W_WDATA0m_M2S_W_WDATA0HardLink;
	wire [7: 0] mM2S_W_WDATA1m_M2S_W_WDATA1HardLink;
	wire [7: 0] mM2S_W_WDATA2m_M2S_W_WDATA2HardLink;
	wire [7: 0] mM2S_W_WDATA3m_M2S_W_WDATA3HardLink;
	wire [3: 0] mM2S_W_WSTRBm_M2S_W_WSTRBHardLink;
	wire mM2S_W_WLASTm_M2S_W_WLASTHardLink;
	wire [7: 0] mM2S_W_WUSERm_M2S_W_WUSERHardLink;
	wire mM2S_W_WVALIDm_M2S_W_WVALIDHardLink;
	wire mM2S_B_BREADYm_M2S_B_BREADYHardLink;
	integer State_ReadData_Iterator;
	reg [7 : 0] State_ReadData [0 : 3];
	initial
	begin : Init_State_ReadData
		for (State_ReadData_Iterator = 0; State_ReadData_Iterator < 4; State_ReadData_Iterator = State_ReadData_Iterator + 1)
			State_ReadData[State_ReadData_Iterator] = 0;
	end
	integer NextState_ReadData_Iterator;
	reg [7 : 0] NextState_ReadData [0 : 3];
	initial
	begin : Init_NextState_ReadData
		for (NextState_ReadData_Iterator = 0; NextState_ReadData_Iterator < 4; NextState_ReadData_Iterator = NextState_ReadData_Iterator + 1)
			NextState_ReadData[NextState_ReadData_Iterator] = 0;
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
		if (((Reset) == (1)))
		begin
			for (State_ReadData_Iterator = 0; ((State_ReadData_Iterator) < (4)); State_ReadData_Iterator = ((State_ReadData_Iterator) + (1)))
			begin
				State_ReadData[State_ReadData_Iterator] <= State_ReadDataDefault;
			end
		end
		else
		begin
			for (State_ReadData_Iterator = 0; ((State_ReadData_Iterator) < (4)); State_ReadData_Iterator = ((State_ReadData_Iterator) + (1)))
			begin
				State_ReadData[State_ReadData_Iterator] <= NextState_ReadData[State_ReadData_Iterator];
			end
		end
	end
	AXI4MasterSlaveMemoryTestModule_TopLevel_AXI4MasterSlaveMemoryTestModule_s
	AXI4MasterSlaveMemoryTestModule_TopLevel_AXI4MasterSlaveMemoryTestModule_s
	(
		// [BEGIN USER MAP FOR s]
		// [END USER MAP FOR s]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S_AR_ARID (sM2S_AR_ARIDs_M2S_AR_ARIDHardLink),
		.M2S_AR_ARADDR (sM2S_AR_ARADDRs_M2S_AR_ARADDRHardLink),
		.M2S_AR_ARLEN (sM2S_AR_ARLENs_M2S_AR_ARLENHardLink),
		.M2S_AR_ARSIZE (sM2S_AR_ARSIZEs_M2S_AR_ARSIZEHardLink),
		.M2S_AR_ARBURST (sM2S_AR_ARBURSTs_M2S_AR_ARBURSTHardLink),
		.M2S_AR_ARLOCK (sM2S_AR_ARLOCKs_M2S_AR_ARLOCKHardLink),
		.M2S_AR_ARCACHE (sM2S_AR_ARCACHEs_M2S_AR_ARCACHEHardLink),
		.M2S_AR_ARPROT (sM2S_AR_ARPROTs_M2S_AR_ARPROTHardLink),
		.M2S_AR_ARQOS (sM2S_AR_ARQOSs_M2S_AR_ARQOSHardLink),
		.M2S_AR_ARREGION (sM2S_AR_ARREGIONs_M2S_AR_ARREGIONHardLink),
		.M2S_AR_ARUSER (sM2S_AR_ARUSERs_M2S_AR_ARUSERHardLink),
		.M2S_AR_ARVALID (sM2S_AR_ARVALIDs_M2S_AR_ARVALIDHardLink),
		.M2S_R_RREADY (sM2S_R_RREADYs_M2S_R_RREADYHardLink),
		.M2S_AW_AWID (sM2S_AW_AWIDs_M2S_AW_AWIDHardLink),
		.M2S_AW_AWADDR (sM2S_AW_AWADDRs_M2S_AW_AWADDRHardLink),
		.M2S_AW_AWLEN (sM2S_AW_AWLENs_M2S_AW_AWLENHardLink),
		.M2S_AW_AWSIZE (sM2S_AW_AWSIZEs_M2S_AW_AWSIZEHardLink),
		.M2S_AW_AWBURST (sM2S_AW_AWBURSTs_M2S_AW_AWBURSTHardLink),
		.M2S_AW_AWLOCK (sM2S_AW_AWLOCKs_M2S_AW_AWLOCKHardLink),
		.M2S_AW_AWCACHE (sM2S_AW_AWCACHEs_M2S_AW_AWCACHEHardLink),
		.M2S_AW_AWPROT (sM2S_AW_AWPROTs_M2S_AW_AWPROTHardLink),
		.M2S_AW_AWQOS (sM2S_AW_AWQOSs_M2S_AW_AWQOSHardLink),
		.M2S_AW_AWREGION (sM2S_AW_AWREGIONs_M2S_AW_AWREGIONHardLink),
		.M2S_AW_AWUSER (sM2S_AW_AWUSERs_M2S_AW_AWUSERHardLink),
		.M2S_AW_AWVALID (sM2S_AW_AWVALIDs_M2S_AW_AWVALIDHardLink),
		.M2S_W_WID (sM2S_W_WIDs_M2S_W_WIDHardLink),
		.M2S_W_WDATA0 (sM2S_W_WDATA0s_M2S_W_WDATA0HardLink),
		.M2S_W_WDATA1 (sM2S_W_WDATA1s_M2S_W_WDATA1HardLink),
		.M2S_W_WDATA2 (sM2S_W_WDATA2s_M2S_W_WDATA2HardLink),
		.M2S_W_WDATA3 (sM2S_W_WDATA3s_M2S_W_WDATA3HardLink),
		.M2S_W_WSTRB (sM2S_W_WSTRBs_M2S_W_WSTRBHardLink),
		.M2S_W_WLAST (sM2S_W_WLASTs_M2S_W_WLASTHardLink),
		.M2S_W_WUSER (sM2S_W_WUSERs_M2S_W_WUSERHardLink),
		.M2S_W_WVALID (sM2S_W_WVALIDs_M2S_W_WVALIDHardLink),
		.M2S_B_BREADY (sM2S_B_BREADYs_M2S_B_BREADYHardLink),
		.S2M_AR_ARREADY (sS2M_AR_ARREADYs_S2M_AR_ARREADYHardLink),
		.S2M_AW_AWREADY (sS2M_AW_AWREADYs_S2M_AW_AWREADYHardLink),
		.S2M_B_BID (sS2M_B_BIDs_S2M_B_BIDHardLink),
		.S2M_B_BRESP (sS2M_B_BRESPs_S2M_B_BRESPHardLink),
		.S2M_B_BUSER (sS2M_B_BUSERs_S2M_B_BUSERHardLink),
		.S2M_B_BVALID (sS2M_B_BVALIDs_S2M_B_BVALIDHardLink),
		.S2M_R_RID (sS2M_R_RIDs_S2M_R_RIDHardLink),
		.S2M_R_RDATA0 (sS2M_R_RDATA0s_S2M_R_RDATA0HardLink),
		.S2M_R_RDATA1 (sS2M_R_RDATA1s_S2M_R_RDATA1HardLink),
		.S2M_R_RDATA2 (sS2M_R_RDATA2s_S2M_R_RDATA2HardLink),
		.S2M_R_RDATA3 (sS2M_R_RDATA3s_S2M_R_RDATA3HardLink),
		.S2M_R_RRESP (sS2M_R_RRESPs_S2M_R_RRESPHardLink),
		.S2M_R_RLAST (sS2M_R_RLASTs_S2M_R_RLASTHardLink),
		.S2M_R_RUSER (sS2M_R_RUSERs_S2M_R_RUSERHardLink),
		.S2M_R_RVALID (sS2M_R_RVALIDs_S2M_R_RVALIDHardLink),
		.S2M_W_WREADY (sS2M_W_WREADYs_S2M_W_WREADYHardLink)
	);
	AXI4MasterSlaveMemoryTestModule_TopLevel_AXI4MasterSlaveMemoryTestModule_m
	AXI4MasterSlaveMemoryTestModule_TopLevel_AXI4MasterSlaveMemoryTestModule_m
	(
		// [BEGIN USER MAP FOR m]
		// [END USER MAP FOR m]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.S2M_AR_ARREADY (mS2M_AR_ARREADYm_S2M_AR_ARREADYHardLink),
		.S2M_AW_AWREADY (mS2M_AW_AWREADYm_S2M_AW_AWREADYHardLink),
		.S2M_B_BID (mS2M_B_BIDm_S2M_B_BIDHardLink),
		.S2M_B_BRESP (mS2M_B_BRESPm_S2M_B_BRESPHardLink),
		.S2M_B_BUSER (mS2M_B_BUSERm_S2M_B_BUSERHardLink),
		.S2M_B_BVALID (mS2M_B_BVALIDm_S2M_B_BVALIDHardLink),
		.S2M_R_RID (mS2M_R_RIDm_S2M_R_RIDHardLink),
		.S2M_R_RDATA0 (mS2M_R_RDATA0m_S2M_R_RDATA0HardLink),
		.S2M_R_RDATA1 (mS2M_R_RDATA1m_S2M_R_RDATA1HardLink),
		.S2M_R_RDATA2 (mS2M_R_RDATA2m_S2M_R_RDATA2HardLink),
		.S2M_R_RDATA3 (mS2M_R_RDATA3m_S2M_R_RDATA3HardLink),
		.S2M_R_RRESP (mS2M_R_RRESPm_S2M_R_RRESPHardLink),
		.S2M_R_RLAST (mS2M_R_RLASTm_S2M_R_RLASTHardLink),
		.S2M_R_RUSER (mS2M_R_RUSERm_S2M_R_RUSERHardLink),
		.S2M_R_RVALID (mS2M_R_RVALIDm_S2M_R_RVALIDHardLink),
		.S2M_W_WREADY (mS2M_W_WREADYm_S2M_W_WREADYHardLink),
		.AXADDR (mAXADDRm_AXADDRHardLink),
		.RE (mREm_REHardLink),
		.WE (mWEm_WEHardLink),
		.WDATA0 (mWDATA0m_WDATA0HardLink),
		.WDATA1 (mWDATA1m_WDATA1HardLink),
		.WDATA2 (mWDATA2m_WDATA2HardLink),
		.WDATA3 (mWDATA3m_WDATA3HardLink),
		.WSTRB (mWSTRBm_WSTRBHardLink),
		.InvalidInputs (mInvalidInputsm_InvalidInputsHardLink),
		.OutACK (mOutACKm_OutACKHardLink),
		.RDATA0 (mRDATA0m_RDATA0HardLink),
		.RDATA1 (mRDATA1m_RDATA1HardLink),
		.RDATA2 (mRDATA2m_RDATA2HardLink),
		.RDATA3 (mRDATA3m_RDATA3HardLink),
		.M2S_AR_ARID (mM2S_AR_ARIDm_M2S_AR_ARIDHardLink),
		.M2S_AR_ARADDR (mM2S_AR_ARADDRm_M2S_AR_ARADDRHardLink),
		.M2S_AR_ARLEN (mM2S_AR_ARLENm_M2S_AR_ARLENHardLink),
		.M2S_AR_ARSIZE (mM2S_AR_ARSIZEm_M2S_AR_ARSIZEHardLink),
		.M2S_AR_ARBURST (mM2S_AR_ARBURSTm_M2S_AR_ARBURSTHardLink),
		.M2S_AR_ARLOCK (mM2S_AR_ARLOCKm_M2S_AR_ARLOCKHardLink),
		.M2S_AR_ARCACHE (mM2S_AR_ARCACHEm_M2S_AR_ARCACHEHardLink),
		.M2S_AR_ARPROT (mM2S_AR_ARPROTm_M2S_AR_ARPROTHardLink),
		.M2S_AR_ARQOS (mM2S_AR_ARQOSm_M2S_AR_ARQOSHardLink),
		.M2S_AR_ARREGION (mM2S_AR_ARREGIONm_M2S_AR_ARREGIONHardLink),
		.M2S_AR_ARUSER (mM2S_AR_ARUSERm_M2S_AR_ARUSERHardLink),
		.M2S_AR_ARVALID (mM2S_AR_ARVALIDm_M2S_AR_ARVALIDHardLink),
		.M2S_R_RREADY (mM2S_R_RREADYm_M2S_R_RREADYHardLink),
		.M2S_AW_AWID (mM2S_AW_AWIDm_M2S_AW_AWIDHardLink),
		.M2S_AW_AWADDR (mM2S_AW_AWADDRm_M2S_AW_AWADDRHardLink),
		.M2S_AW_AWLEN (mM2S_AW_AWLENm_M2S_AW_AWLENHardLink),
		.M2S_AW_AWSIZE (mM2S_AW_AWSIZEm_M2S_AW_AWSIZEHardLink),
		.M2S_AW_AWBURST (mM2S_AW_AWBURSTm_M2S_AW_AWBURSTHardLink),
		.M2S_AW_AWLOCK (mM2S_AW_AWLOCKm_M2S_AW_AWLOCKHardLink),
		.M2S_AW_AWCACHE (mM2S_AW_AWCACHEm_M2S_AW_AWCACHEHardLink),
		.M2S_AW_AWPROT (mM2S_AW_AWPROTm_M2S_AW_AWPROTHardLink),
		.M2S_AW_AWQOS (mM2S_AW_AWQOSm_M2S_AW_AWQOSHardLink),
		.M2S_AW_AWREGION (mM2S_AW_AWREGIONm_M2S_AW_AWREGIONHardLink),
		.M2S_AW_AWUSER (mM2S_AW_AWUSERm_M2S_AW_AWUSERHardLink),
		.M2S_AW_AWVALID (mM2S_AW_AWVALIDm_M2S_AW_AWVALIDHardLink),
		.M2S_W_WID (mM2S_W_WIDm_M2S_W_WIDHardLink),
		.M2S_W_WDATA0 (mM2S_W_WDATA0m_M2S_W_WDATA0HardLink),
		.M2S_W_WDATA1 (mM2S_W_WDATA1m_M2S_W_WDATA1HardLink),
		.M2S_W_WDATA2 (mM2S_W_WDATA2m_M2S_W_WDATA2HardLink),
		.M2S_W_WDATA3 (mM2S_W_WDATA3m_M2S_W_WDATA3HardLink),
		.M2S_W_WSTRB (mM2S_W_WSTRBm_M2S_W_WSTRBHardLink),
		.M2S_W_WLAST (mM2S_W_WLASTm_M2S_W_WLASTHardLink),
		.M2S_W_WUSER (mM2S_W_WUSERm_M2S_W_WUSERHardLink),
		.M2S_W_WVALID (mM2S_W_WVALIDm_M2S_W_WVALIDHardLink),
		.M2S_B_BREADY (mM2S_B_BREADYm_M2S_B_BREADYHardLink)
	);
	always @ (*)
	begin
		for (NextState_ReadData_Iterator = 0; ((NextState_ReadData_Iterator) < (4)); NextState_ReadData_Iterator = ((NextState_ReadData_Iterator) + (1)))
		begin
			NextState_ReadData[NextState_ReadData_Iterator] = State_ReadData[NextState_ReadData_Iterator];
		end
		if (((s_S2M_R_RVALID) == (1)))
		begin
			NextState_ReadData[0] = s_S2M_R_RDATA0;
			NextState_ReadData[1] = s_S2M_R_RDATA1;
			NextState_ReadData[2] = s_S2M_R_RDATA2;
			NextState_ReadData[3] = s_S2M_R_RDATA3;
		end
	end
	assign Inputs_AXADDR = AXADDR;
	assign Inputs_InData = InData;
	assign Inputs_WE = WE;
	assign Inputs_RE = RE;
	assign Inputs_SWE = SWE;
	assign s_M2S_AR_ARID = m_M2S_AR_ARID;
	assign s_M2S_AR_ARADDR = m_M2S_AR_ARADDR;
	assign s_M2S_AR_ARLEN = m_M2S_AR_ARLEN;
	assign s_M2S_AR_ARSIZE = m_M2S_AR_ARSIZE;
	assign s_M2S_AR_ARBURST = m_M2S_AR_ARBURST;
	assign s_M2S_AR_ARLOCK = m_M2S_AR_ARLOCK;
	assign s_M2S_AR_ARCACHE = m_M2S_AR_ARCACHE;
	assign s_M2S_AR_ARPROT = m_M2S_AR_ARPROT;
	assign s_M2S_AR_ARQOS = m_M2S_AR_ARQOS;
	assign s_M2S_AR_ARREGION = m_M2S_AR_ARREGION;
	assign s_M2S_AR_ARUSER = m_M2S_AR_ARUSER;
	assign s_M2S_AR_ARVALID = m_M2S_AR_ARVALID;
	assign s_M2S_R_RREADY = m_M2S_R_RREADY;
	assign s_M2S_AW_AWID = m_M2S_AW_AWID;
	assign s_M2S_AW_AWADDR = m_M2S_AW_AWADDR;
	assign s_M2S_AW_AWLEN = m_M2S_AW_AWLEN;
	assign s_M2S_AW_AWSIZE = m_M2S_AW_AWSIZE;
	assign s_M2S_AW_AWBURST = m_M2S_AW_AWBURST;
	assign s_M2S_AW_AWLOCK = m_M2S_AW_AWLOCK;
	assign s_M2S_AW_AWCACHE = m_M2S_AW_AWCACHE;
	assign s_M2S_AW_AWPROT = m_M2S_AW_AWPROT;
	assign s_M2S_AW_AWQOS = m_M2S_AW_AWQOS;
	assign s_M2S_AW_AWREGION = m_M2S_AW_AWREGION;
	assign s_M2S_AW_AWUSER = m_M2S_AW_AWUSER;
	assign s_M2S_AW_AWVALID = m_M2S_AW_AWVALID;
	assign s_M2S_W_WID = m_M2S_W_WID;
	assign s_M2S_W_WDATA0 = m_M2S_W_WDATA0;
	assign s_M2S_W_WDATA1 = m_M2S_W_WDATA1;
	assign s_M2S_W_WDATA2 = m_M2S_W_WDATA2;
	assign s_M2S_W_WDATA3 = m_M2S_W_WDATA3;
	assign s_M2S_W_WSTRB = m_M2S_W_WSTRB;
	assign s_M2S_W_WLAST = m_M2S_W_WLAST;
	assign s_M2S_W_WUSER = m_M2S_W_WUSER;
	assign s_M2S_W_WVALID = m_M2S_W_WVALID;
	assign s_M2S_B_BREADY = m_M2S_B_BREADY;
	assign AXI4MasterSlaveMemoryTestModule_L52F25T55_Source = Inputs_InData;
	assign AXI4MasterSlaveMemoryTestModule_L53F25T55_Source = AXI4MasterSlaveMemoryTestModule_L53F41T54_Expr;
	assign AXI4MasterSlaveMemoryTestModule_L53F25T60_Index = AXI4MasterSlaveMemoryTestModule_L53F25T55_Source[3:0];
	assign m_S2M_AR_ARREADY = s_S2M_AR_ARREADY;
	assign m_S2M_AW_AWREADY = s_S2M_AW_AWREADY;
	assign m_S2M_B_BID = s_S2M_B_BID;
	assign m_S2M_B_BRESP = s_S2M_B_BRESP;
	assign m_S2M_B_BUSER = s_S2M_B_BUSER;
	assign m_S2M_B_BVALID = s_S2M_B_BVALID;
	assign m_S2M_R_RID = s_S2M_R_RID;
	assign m_S2M_R_RDATA0 = s_S2M_R_RDATA0;
	assign m_S2M_R_RDATA1 = s_S2M_R_RDATA1;
	assign m_S2M_R_RDATA2 = s_S2M_R_RDATA2;
	assign m_S2M_R_RDATA3 = s_S2M_R_RDATA3;
	assign m_S2M_R_RRESP = s_S2M_R_RRESP;
	assign m_S2M_R_RLAST = s_S2M_R_RLAST;
	assign m_S2M_R_RUSER = s_S2M_R_RUSER;
	assign m_S2M_R_RVALID = s_S2M_R_RVALID;
	assign m_S2M_W_WREADY = s_S2M_W_WREADY;
	assign m_AXADDR = Inputs_AXADDR;
	assign m_RE = Inputs_RE;
	assign m_WE = Inputs_WE;
	assign m_WDATA0 = AXI4MasterSlaveMemoryTestModule_L52F25T55_Source[7:0];
	assign m_WDATA1 = AXI4MasterSlaveMemoryTestModule_L52F25T55_Source[15:8];
	assign m_WDATA2 = AXI4MasterSlaveMemoryTestModule_L52F25T55_Source[23:16];
	assign m_WDATA3 = AXI4MasterSlaveMemoryTestModule_L52F25T55_Source[31:24];
	assign m_WSTRB = AXI4MasterSlaveMemoryTestModule_L53F25T60_Index;
	assign OutACK = m_OutACK;
	assign OutMasterData0 = m_RDATA0;
	assign OutMasterData1 = m_RDATA1;
	assign OutMasterData2 = m_RDATA2;
	assign OutMasterData3 = m_RDATA3;
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[0] = m_RDATA0[0];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[1] = m_RDATA0[1];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[2] = m_RDATA0[2];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[3] = m_RDATA0[3];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[4] = m_RDATA0[4];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[5] = m_RDATA0[5];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[6] = m_RDATA0[6];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[7] = m_RDATA0[7];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[8] = m_RDATA1[0];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[9] = m_RDATA1[1];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[10] = m_RDATA1[2];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[11] = m_RDATA1[3];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[12] = m_RDATA1[4];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[13] = m_RDATA1[5];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[14] = m_RDATA1[6];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[15] = m_RDATA1[7];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[16] = m_RDATA2[0];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[17] = m_RDATA2[1];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[18] = m_RDATA2[2];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[19] = m_RDATA2[3];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[20] = m_RDATA2[4];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[21] = m_RDATA2[5];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[22] = m_RDATA2[6];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[23] = m_RDATA2[7];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[24] = m_RDATA3[0];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[25] = m_RDATA3[1];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[26] = m_RDATA3[2];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[27] = m_RDATA3[3];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[28] = m_RDATA3[4];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[29] = m_RDATA3[5];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[30] = m_RDATA3[6];
	assign AXI4MasterSlaveMemoryTestModule_L34F45T69_Source[31] = m_RDATA3[7];
	assign OutMasterWord = AXI4MasterSlaveMemoryTestModule_L34F45T69_Source;
	assign sM2S_AR_ARIDs_M2S_AR_ARIDHardLink = s_M2S_AR_ARID;
	assign sM2S_AR_ARADDRs_M2S_AR_ARADDRHardLink = s_M2S_AR_ARADDR;
	assign sM2S_AR_ARLENs_M2S_AR_ARLENHardLink = s_M2S_AR_ARLEN;
	assign sM2S_AR_ARSIZEs_M2S_AR_ARSIZEHardLink = s_M2S_AR_ARSIZE;
	assign sM2S_AR_ARBURSTs_M2S_AR_ARBURSTHardLink = s_M2S_AR_ARBURST;
	assign sM2S_AR_ARLOCKs_M2S_AR_ARLOCKHardLink = s_M2S_AR_ARLOCK;
	assign sM2S_AR_ARCACHEs_M2S_AR_ARCACHEHardLink = s_M2S_AR_ARCACHE;
	assign sM2S_AR_ARPROTs_M2S_AR_ARPROTHardLink = s_M2S_AR_ARPROT;
	assign sM2S_AR_ARQOSs_M2S_AR_ARQOSHardLink = s_M2S_AR_ARQOS;
	assign sM2S_AR_ARREGIONs_M2S_AR_ARREGIONHardLink = s_M2S_AR_ARREGION;
	assign sM2S_AR_ARUSERs_M2S_AR_ARUSERHardLink = s_M2S_AR_ARUSER;
	assign sM2S_AR_ARVALIDs_M2S_AR_ARVALIDHardLink = s_M2S_AR_ARVALID;
	assign sM2S_R_RREADYs_M2S_R_RREADYHardLink = s_M2S_R_RREADY;
	assign sM2S_AW_AWIDs_M2S_AW_AWIDHardLink = s_M2S_AW_AWID;
	assign sM2S_AW_AWADDRs_M2S_AW_AWADDRHardLink = s_M2S_AW_AWADDR;
	assign sM2S_AW_AWLENs_M2S_AW_AWLENHardLink = s_M2S_AW_AWLEN;
	assign sM2S_AW_AWSIZEs_M2S_AW_AWSIZEHardLink = s_M2S_AW_AWSIZE;
	assign sM2S_AW_AWBURSTs_M2S_AW_AWBURSTHardLink = s_M2S_AW_AWBURST;
	assign sM2S_AW_AWLOCKs_M2S_AW_AWLOCKHardLink = s_M2S_AW_AWLOCK;
	assign sM2S_AW_AWCACHEs_M2S_AW_AWCACHEHardLink = s_M2S_AW_AWCACHE;
	assign sM2S_AW_AWPROTs_M2S_AW_AWPROTHardLink = s_M2S_AW_AWPROT;
	assign sM2S_AW_AWQOSs_M2S_AW_AWQOSHardLink = s_M2S_AW_AWQOS;
	assign sM2S_AW_AWREGIONs_M2S_AW_AWREGIONHardLink = s_M2S_AW_AWREGION;
	assign sM2S_AW_AWUSERs_M2S_AW_AWUSERHardLink = s_M2S_AW_AWUSER;
	assign sM2S_AW_AWVALIDs_M2S_AW_AWVALIDHardLink = s_M2S_AW_AWVALID;
	assign sM2S_W_WIDs_M2S_W_WIDHardLink = s_M2S_W_WID;
	assign sM2S_W_WDATA0s_M2S_W_WDATA0HardLink = s_M2S_W_WDATA0;
	assign sM2S_W_WDATA1s_M2S_W_WDATA1HardLink = s_M2S_W_WDATA1;
	assign sM2S_W_WDATA2s_M2S_W_WDATA2HardLink = s_M2S_W_WDATA2;
	assign sM2S_W_WDATA3s_M2S_W_WDATA3HardLink = s_M2S_W_WDATA3;
	assign sM2S_W_WSTRBs_M2S_W_WSTRBHardLink = s_M2S_W_WSTRB;
	assign sM2S_W_WLASTs_M2S_W_WLASTHardLink = s_M2S_W_WLAST;
	assign sM2S_W_WUSERs_M2S_W_WUSERHardLink = s_M2S_W_WUSER;
	assign sM2S_W_WVALIDs_M2S_W_WVALIDHardLink = s_M2S_W_WVALID;
	assign sM2S_B_BREADYs_M2S_B_BREADYHardLink = s_M2S_B_BREADY;
	assign s_S2M_AR_ARREADY = sS2M_AR_ARREADYs_S2M_AR_ARREADYHardLink;
	assign s_S2M_AW_AWREADY = sS2M_AW_AWREADYs_S2M_AW_AWREADYHardLink;
	assign s_S2M_B_BID = sS2M_B_BIDs_S2M_B_BIDHardLink;
	assign s_S2M_B_BRESP = sS2M_B_BRESPs_S2M_B_BRESPHardLink;
	assign s_S2M_B_BUSER = sS2M_B_BUSERs_S2M_B_BUSERHardLink;
	assign s_S2M_B_BVALID = sS2M_B_BVALIDs_S2M_B_BVALIDHardLink;
	assign s_S2M_R_RID = sS2M_R_RIDs_S2M_R_RIDHardLink;
	assign s_S2M_R_RDATA0 = sS2M_R_RDATA0s_S2M_R_RDATA0HardLink;
	assign s_S2M_R_RDATA1 = sS2M_R_RDATA1s_S2M_R_RDATA1HardLink;
	assign s_S2M_R_RDATA2 = sS2M_R_RDATA2s_S2M_R_RDATA2HardLink;
	assign s_S2M_R_RDATA3 = sS2M_R_RDATA3s_S2M_R_RDATA3HardLink;
	assign s_S2M_R_RRESP = sS2M_R_RRESPs_S2M_R_RRESPHardLink;
	assign s_S2M_R_RLAST = sS2M_R_RLASTs_S2M_R_RLASTHardLink;
	assign s_S2M_R_RUSER = sS2M_R_RUSERs_S2M_R_RUSERHardLink;
	assign s_S2M_R_RVALID = sS2M_R_RVALIDs_S2M_R_RVALIDHardLink;
	assign s_S2M_W_WREADY = sS2M_W_WREADYs_S2M_W_WREADYHardLink;
	assign mS2M_AR_ARREADYm_S2M_AR_ARREADYHardLink = m_S2M_AR_ARREADY;
	assign mS2M_AW_AWREADYm_S2M_AW_AWREADYHardLink = m_S2M_AW_AWREADY;
	assign mS2M_B_BIDm_S2M_B_BIDHardLink = m_S2M_B_BID;
	assign mS2M_B_BRESPm_S2M_B_BRESPHardLink = m_S2M_B_BRESP;
	assign mS2M_B_BUSERm_S2M_B_BUSERHardLink = m_S2M_B_BUSER;
	assign mS2M_B_BVALIDm_S2M_B_BVALIDHardLink = m_S2M_B_BVALID;
	assign mS2M_R_RIDm_S2M_R_RIDHardLink = m_S2M_R_RID;
	assign mS2M_R_RDATA0m_S2M_R_RDATA0HardLink = m_S2M_R_RDATA0;
	assign mS2M_R_RDATA1m_S2M_R_RDATA1HardLink = m_S2M_R_RDATA1;
	assign mS2M_R_RDATA2m_S2M_R_RDATA2HardLink = m_S2M_R_RDATA2;
	assign mS2M_R_RDATA3m_S2M_R_RDATA3HardLink = m_S2M_R_RDATA3;
	assign mS2M_R_RRESPm_S2M_R_RRESPHardLink = m_S2M_R_RRESP;
	assign mS2M_R_RLASTm_S2M_R_RLASTHardLink = m_S2M_R_RLAST;
	assign mS2M_R_RUSERm_S2M_R_RUSERHardLink = m_S2M_R_RUSER;
	assign mS2M_R_RVALIDm_S2M_R_RVALIDHardLink = m_S2M_R_RVALID;
	assign mS2M_W_WREADYm_S2M_W_WREADYHardLink = m_S2M_W_WREADY;
	assign mAXADDRm_AXADDRHardLink = m_AXADDR;
	assign mREm_REHardLink = m_RE;
	assign mWEm_WEHardLink = m_WE;
	assign mWDATA0m_WDATA0HardLink = m_WDATA0;
	assign mWDATA1m_WDATA1HardLink = m_WDATA1;
	assign mWDATA2m_WDATA2HardLink = m_WDATA2;
	assign mWDATA3m_WDATA3HardLink = m_WDATA3;
	assign mWSTRBm_WSTRBHardLink = m_WSTRB;
	assign m_InvalidInputs = mInvalidInputsm_InvalidInputsHardLink;
	assign m_OutACK = mOutACKm_OutACKHardLink;
	assign m_RDATA0 = mRDATA0m_RDATA0HardLink;
	assign m_RDATA1 = mRDATA1m_RDATA1HardLink;
	assign m_RDATA2 = mRDATA2m_RDATA2HardLink;
	assign m_RDATA3 = mRDATA3m_RDATA3HardLink;
	assign m_M2S_AR_ARID = mM2S_AR_ARIDm_M2S_AR_ARIDHardLink;
	assign m_M2S_AR_ARADDR = mM2S_AR_ARADDRm_M2S_AR_ARADDRHardLink;
	assign m_M2S_AR_ARLEN = mM2S_AR_ARLENm_M2S_AR_ARLENHardLink;
	assign m_M2S_AR_ARSIZE = mM2S_AR_ARSIZEm_M2S_AR_ARSIZEHardLink;
	assign m_M2S_AR_ARBURST = mM2S_AR_ARBURSTm_M2S_AR_ARBURSTHardLink;
	assign m_M2S_AR_ARLOCK = mM2S_AR_ARLOCKm_M2S_AR_ARLOCKHardLink;
	assign m_M2S_AR_ARCACHE = mM2S_AR_ARCACHEm_M2S_AR_ARCACHEHardLink;
	assign m_M2S_AR_ARPROT = mM2S_AR_ARPROTm_M2S_AR_ARPROTHardLink;
	assign m_M2S_AR_ARQOS = mM2S_AR_ARQOSm_M2S_AR_ARQOSHardLink;
	assign m_M2S_AR_ARREGION = mM2S_AR_ARREGIONm_M2S_AR_ARREGIONHardLink;
	assign m_M2S_AR_ARUSER = mM2S_AR_ARUSERm_M2S_AR_ARUSERHardLink;
	assign m_M2S_AR_ARVALID = mM2S_AR_ARVALIDm_M2S_AR_ARVALIDHardLink;
	assign m_M2S_R_RREADY = mM2S_R_RREADYm_M2S_R_RREADYHardLink;
	assign m_M2S_AW_AWID = mM2S_AW_AWIDm_M2S_AW_AWIDHardLink;
	assign m_M2S_AW_AWADDR = mM2S_AW_AWADDRm_M2S_AW_AWADDRHardLink;
	assign m_M2S_AW_AWLEN = mM2S_AW_AWLENm_M2S_AW_AWLENHardLink;
	assign m_M2S_AW_AWSIZE = mM2S_AW_AWSIZEm_M2S_AW_AWSIZEHardLink;
	assign m_M2S_AW_AWBURST = mM2S_AW_AWBURSTm_M2S_AW_AWBURSTHardLink;
	assign m_M2S_AW_AWLOCK = mM2S_AW_AWLOCKm_M2S_AW_AWLOCKHardLink;
	assign m_M2S_AW_AWCACHE = mM2S_AW_AWCACHEm_M2S_AW_AWCACHEHardLink;
	assign m_M2S_AW_AWPROT = mM2S_AW_AWPROTm_M2S_AW_AWPROTHardLink;
	assign m_M2S_AW_AWQOS = mM2S_AW_AWQOSm_M2S_AW_AWQOSHardLink;
	assign m_M2S_AW_AWREGION = mM2S_AW_AWREGIONm_M2S_AW_AWREGIONHardLink;
	assign m_M2S_AW_AWUSER = mM2S_AW_AWUSERm_M2S_AW_AWUSERHardLink;
	assign m_M2S_AW_AWVALID = mM2S_AW_AWVALIDm_M2S_AW_AWVALIDHardLink;
	assign m_M2S_W_WID = mM2S_W_WIDm_M2S_W_WIDHardLink;
	assign m_M2S_W_WDATA0 = mM2S_W_WDATA0m_M2S_W_WDATA0HardLink;
	assign m_M2S_W_WDATA1 = mM2S_W_WDATA1m_M2S_W_WDATA1HardLink;
	assign m_M2S_W_WDATA2 = mM2S_W_WDATA2m_M2S_W_WDATA2HardLink;
	assign m_M2S_W_WDATA3 = mM2S_W_WDATA3m_M2S_W_WDATA3HardLink;
	assign m_M2S_W_WSTRB = mM2S_W_WSTRBm_M2S_W_WSTRBHardLink;
	assign m_M2S_W_WLAST = mM2S_W_WLASTm_M2S_W_WLASTHardLink;
	assign m_M2S_W_WUSER = mM2S_W_WUSERm_M2S_W_WUSERHardLink;
	assign m_M2S_W_WVALID = mM2S_W_WVALIDm_M2S_W_WVALIDHardLink;
	assign m_M2S_B_BREADY = mM2S_B_BREADYm_M2S_B_BREADYHardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
