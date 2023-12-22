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
// System configuration name is AXI4MemoryModuleB4_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4MemoryModuleB4_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [7:0] M2S_AR_ARID,
	input wire [31:0] M2S_AR_ARADDR,
	input wire [7:0] M2S_AR_ARLEN,
	input wire [2:0] M2S_AR_ARSIZE,
	input wire [1:0] M2S_AR_ARBURST,
	input wire [1:0] M2S_AR_ARLOCK,
	input wire [3:0] M2S_AR_ARCACHE,
	input wire [2:0] M2S_AR_ARPROT,
	input wire [3:0] M2S_AR_ARQOS,
	input wire [7:0] M2S_AR_ARREGION,
	input wire [7:0] M2S_AR_ARUSER,
	input wire M2S_AR_ARVALID,
	input wire M2S_R_RREADY,
	input wire [7:0] M2S_AW_AWID,
	input wire [31:0] M2S_AW_AWADDR,
	input wire [7:0] M2S_AW_AWLEN,
	input wire [2:0] M2S_AW_AWSIZE,
	input wire [1:0] M2S_AW_AWBURST,
	input wire [1:0] M2S_AW_AWLOCK,
	input wire [3:0] M2S_AW_AWCACHE,
	input wire [2:0] M2S_AW_AWPROT,
	input wire [3:0] M2S_AW_AWQOS,
	input wire [7:0] M2S_AW_AWREGION,
	input wire [7:0] M2S_AW_AWUSER,
	input wire M2S_AW_AWVALID,
	input wire [7:0] M2S_W_WID,
	input wire [7:0] M2S_W_WDATA0,
	input wire [7:0] M2S_W_WDATA1,
	input wire [7:0] M2S_W_WDATA2,
	input wire [7:0] M2S_W_WDATA3,
	input wire [3:0] M2S_W_WSTRB,
	input wire M2S_W_WLAST,
	input wire [7:0] M2S_W_WUSER,
	input wire M2S_W_WVALID,
	input wire M2S_B_BREADY,
	output wire S2M_AR_ARREADY,
	output wire [7:0] S2M_R_RID,
	output wire [7:0] S2M_R_RDATA0,
	output wire [7:0] S2M_R_RDATA1,
	output wire [7:0] S2M_R_RDATA2,
	output wire [7:0] S2M_R_RDATA3,
	output wire [1:0] S2M_R_RRESP,
	output wire S2M_R_RLAST,
	output wire [7:0] S2M_R_RUSER,
	output wire S2M_R_RVALID,
	output wire S2M_AW_AWREADY,
	output wire [7:0] S2M_B_BID,
	output wire [1:0] S2M_B_BRESP,
	output wire [7:0] S2M_B_BUSER,
	output wire S2M_B_BVALID,
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
	wire [7: 0] State_wdataDefault = 8'b00000000;
	wire [1: 0] size = 2'b10;
	wire AXI4MemoryModule_L95F29T33_Expr = 1'b1;
	wire AXI4MemoryModule_L96F28T32_Expr = 1'b1;
	wire AXI4MemoryModule_L97F29T33_Expr = 1'b1;
	wire AXI4MemoryModule_L98F28T32_Expr = 1'b1;
	wire AXI4MemoryModule_L99F28T32_Expr = 1'b1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L106F13L109T14_AXI4MemoryModule_L108F38T42_Expr = 1'b1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L112F13L116T14_AXI4MemoryModule_L115F38T42_Expr = 1'b1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L119F13L122T14_AXI4MemoryModule_L120F38T43_Expr = 1'b0;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L119F13L122T14_AXI4MemoryModule_L121F38T43_Expr = 1'b0;
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
	wire [3: 0] Inputs_M2S_W_WSTRB;
	wire Inputs_M2S_W_WLAST;
	wire [7: 0] Inputs_M2S_W_WUSER;
	wire Inputs_M2S_W_WVALID;
	wire Inputs_M2S_B_BREADY;
	reg [31: 0] NextState_raddr;
	reg [31: 0] NextState_waddr;
	reg NextState_waddrSet;
	reg NextState_wdataSet;
	reg [3: 0] NextState_wstrb;
	wire internalDelayedTxWrite;
	wire [31: 0] internalRADDR;
	wire internalSameTxWrite;
	wire [31: 0] internalWADDR;
	wire internalWE;
	wire [3: 0] internalWSTRB;
	wire axiSlave_inARREADY;
	wire axiSlave_inAWREADY;
	wire axiSlave_inBVALID;
	wire axiSlave_inRVALID;
	wire axiSlave_inWREADY;
	wire [221: 0] axiSlave_M2S;
	wire [31: 0] axiSlave_outARADDR;
	wire axiSlave_outARREADYConfirming;
	wire axiSlave_outARVALID;
	wire [31: 0] axiSlave_outAWADDR;
	wire axiSlave_outAWREADYConfirming;
	wire axiSlave_outAWVALID;
	wire axiSlave_outReadTXCompleting;
	wire axiSlave_outWREADYConfirming;
	wire axiSlave_outWriteTXCompleting;
	wire [3: 0] axiSlave_outWSTRB;
	wire axiSlave_outWVALID;
	wire [73: 0] axiSlave_S2M;
	wire [31: 0] AXI4MemoryModule_L84F13L86T26_WhenTrue;
	wire [31: 0] AXI4MemoryModule_L84F13L86T26_WhenFalse;
	wire [31: 0] AXI4MemoryModule_L84F13L86T26_Ternary;
	wire [31: 0] AXI4MemoryModule_L74F13L76T26_WhenTrue;
	wire [31: 0] AXI4MemoryModule_L74F13L76T26_WhenFalse;
	wire [31: 0] AXI4MemoryModule_L74F13L76T26_Ternary;
	wire [31: 0] AXI4MemoryModule_L79F13L81T26_WhenTrue;
	wire [31: 0] AXI4MemoryModule_L79F13L81T26_WhenFalse;
	wire [31: 0] AXI4MemoryModule_L79F13L81T26_Ternary;
	wire [3: 0] AXI4MemoryModule_L69F13L71T26_WhenTrue;
	wire [3: 0] AXI4MemoryModule_L69F13L71T26_WhenFalse;
	wire [3: 0] AXI4MemoryModule_L69F13L71T26_Ternary;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	wire axiSlave_inARREADY_axiSlave_inARREADY_HardLink;
	wire axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink;
	wire axiSlave_inBVALID_axiSlave_inBVALID_HardLink;
	wire [7: 0] axiSlave_inRDATA0_axiSlave_inRDATA_HardLink;
	wire [7: 0] axiSlave_inRDATA1_axiSlave_inRDATA_HardLink;
	wire [7: 0] axiSlave_inRDATA2_axiSlave_inRDATA_HardLink;
	wire [7: 0] axiSlave_inRDATA3_axiSlave_inRDATA_HardLink;
	wire axiSlave_inRVALID_axiSlave_inRVALID_HardLink;
	wire axiSlave_inWREADY_axiSlave_inWREADY_HardLink;
	wire [221: 0] axiSlave_M2S_axiSlave_M2S_HardLink;
	wire [31: 0] axiSlave_outARADDR_axiSlave_outARADDR_HardLink;
	wire axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink;
	wire axiSlave_outARVALID_axiSlave_outARVALID_HardLink;
	wire [31: 0] axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink;
	wire axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink;
	wire axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink;
	wire axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink;
	wire [7: 0] axiSlave_outWDATA0_axiSlave_outWDATA_HardLink;
	wire [7: 0] axiSlave_outWDATA1_axiSlave_outWDATA_HardLink;
	wire [7: 0] axiSlave_outWDATA2_axiSlave_outWDATA_HardLink;
	wire [7: 0] axiSlave_outWDATA3_axiSlave_outWDATA_HardLink;
	wire axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink;
	wire axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink;
	wire [3: 0] axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink;
	wire axiSlave_outWVALID_axiSlave_outWVALID_HardLink;
	wire [73: 0] axiSlave_S2M_axiSlave_S2M_HardLink;
	reg [31: 0] State_raddr = 32'b00000000000000000000000000000000;
	wire [31: 0] State_raddrDefault = 32'b00000000000000000000000000000000;
	reg [31: 0] State_waddr = 32'b00000000000000000000000000000000;
	wire [31: 0] State_waddrDefault = 32'b00000000000000000000000000000000;
	reg State_waddrSet = 1'b0;
	wire State_waddrSetDefault = 1'b0;
	reg State_wdataSet = 1'b0;
	wire State_wdataSetDefault = 1'b0;
	reg [3: 0] State_wstrb = 4'b0000;
	wire [3: 0] State_wstrbDefault = 4'b0000;
	wire AXI4MemoryModule_L65F40T72_Expr;
	wire AXI4MemoryModule_L65F40T72_Expr_1;
	wire AXI4MemoryModule_L65F40T72_Expr_2;
	wire AXI4MemoryModule_L64F37T81_Expr;
	wire AXI4MemoryModule_L64F37T81_Expr_1;
	wire AXI4MemoryModule_L64F37T81_Expr_2;
	wire AXI4MemoryModule_L66F28T73_Expr;
	wire AXI4MemoryModule_L66F28T73_Expr_1;
	wire AXI4MemoryModule_L66F28T73_Expr_2;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1;
	wire AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	wire [7 : 0] Inputs_M2S_W_WDATA [0 : 3];
	integer State_rdata_Iterator;
	wire [7 : 0] State_rdata [0 : 3];
	integer State_wdata_Iterator;
	reg [7 : 0] State_wdata [0 : 3];
	initial
	begin : Init_State_wdata
		for (State_wdata_Iterator = 0; State_wdata_Iterator < 4; State_wdata_Iterator = State_wdata_Iterator + 1)
			State_wdata[State_wdata_Iterator] = 0;
	end
	integer NextState_wdata_Iterator;
	reg [7 : 0] NextState_wdata [0 : 3];
	initial
	begin : Init_NextState_wdata
		for (NextState_wdata_Iterator = 0; NextState_wdata_Iterator < 4; NextState_wdata_Iterator = NextState_wdata_Iterator + 1)
			NextState_wdata[NextState_wdata_Iterator] = 0;
	end
	wire [7 : 0] internalWDATA [0 : 3];
	wire [7 : 0] axiSlave_inRDATA [0 : 3];
	wire [7 : 0] axiSlave_outWDATA [0 : 3];
	reg [7 : 0] State_buff0 [0 : 1023];
	integer State_buff0_i;
	initial
	begin : Init_State_buff0
		for (State_buff0_i = 0; State_buff0_i < 1024; State_buff0_i = State_buff0_i + 1)
			State_buff0[State_buff0_i] = 0;
	end
	reg [7 : 0] State_buff1 [0 : 1023];
	integer State_buff1_i;
	initial
	begin : Init_State_buff1
		for (State_buff1_i = 0; State_buff1_i < 1024; State_buff1_i = State_buff1_i + 1)
			State_buff1[State_buff1_i] = 0;
	end
	reg [7 : 0] State_buff2 [0 : 1023];
	integer State_buff2_i;
	initial
	begin : Init_State_buff2
		for (State_buff2_i = 0; State_buff2_i < 1024; State_buff2_i = State_buff2_i + 1)
			State_buff2[State_buff2_i] = 0;
	end
	reg [7 : 0] State_buff3 [0 : 1023];
	integer State_buff3_i;
	initial
	begin : Init_State_buff3
		for (State_buff3_i = 0; State_buff3_i < 1024; State_buff3_i = State_buff3_i + 1)
			State_buff3[State_buff3_i] = 0;
	end
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	// inferred simple dual port RAM with write-first behaviour
	reg [9: 0] internalRADDR_reg0;
	always @ (posedge Clock)
	begin
		if (AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr)
		begin
			State_buff0[internalWADDR] <= internalWDATA[0];
		end
		internalRADDR_reg0 <= internalRADDR[9:0];
	end
	assign State_rdata[0] = State_buff0[internalRADDR_reg0];
	// inferred simple dual port RAM with write-first behaviour
	reg [9: 0] internalRADDR_reg1;
	always @ (posedge Clock)
	begin
		if (AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr)
		begin
			State_buff1[internalWADDR] <= internalWDATA[1];
		end
		internalRADDR_reg1 <= internalRADDR[9:0];
	end
	assign State_rdata[1] = State_buff1[internalRADDR_reg1];
	// inferred simple dual port RAM with write-first behaviour
	reg [9: 0] internalRADDR_reg2;
	always @ (posedge Clock)
	begin
		if (AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr)
		begin
			State_buff2[internalWADDR] <= internalWDATA[2];
		end
		internalRADDR_reg2 <= internalRADDR[9:0];
	end
	assign State_rdata[2] = State_buff2[internalRADDR_reg2];
	// inferred simple dual port RAM with write-first behaviour
	reg [9: 0] internalRADDR_reg3;
	always @ (posedge Clock)
	begin
		if (AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr)
		begin
			State_buff3[internalWADDR] <= internalWDATA[3];
		end
		internalRADDR_reg3 <= internalRADDR[9:0];
	end
	assign State_rdata[3] = State_buff3[internalRADDR_reg3];
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_raddr <= State_raddrDefault;
			State_waddr <= State_waddrDefault;
			State_waddrSet <= State_waddrSetDefault;
			State_wdataSet <= State_wdataSetDefault;
			State_wstrb <= State_wstrbDefault;
		end
		else
		begin
			State_raddr <= NextState_raddr;
			State_waddr <= NextState_waddr;
			State_waddrSet <= NextState_waddrSet;
			State_wdataSet <= NextState_wdataSet;
			State_wstrb <= NextState_wstrb;
		end
	end
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			for (State_wdata_Iterator = 0; (State_wdata_Iterator < 4); State_wdata_Iterator = (State_wdata_Iterator + 1))
			begin
				State_wdata[State_wdata_Iterator] <= State_wdataDefault;
			end
		end
		else
		begin
			for (State_wdata_Iterator = 0; (State_wdata_Iterator < 4); State_wdata_Iterator = (State_wdata_Iterator + 1))
			begin
				State_wdata[State_wdata_Iterator] <= NextState_wdata[State_wdata_Iterator];
			end
		end
	end
	assign AXI4MemoryModule_L65F40T72_Expr = AXI4MemoryModule_L65F40T72_Expr_1 & AXI4MemoryModule_L65F40T72_Expr_2;
	assign AXI4MemoryModule_L64F37T81_Expr = AXI4MemoryModule_L64F37T81_Expr_1 & AXI4MemoryModule_L64F37T81_Expr_2;
	assign AXI4MemoryModule_L66F28T73_Expr = AXI4MemoryModule_L66F28T73_Expr_1 | AXI4MemoryModule_L66F28T73_Expr_2;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 & AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 & AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 & AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 & AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2;
	AXI4MemoryModuleB4_TopLevel_axiSlave
	AXI4MemoryModuleB4_TopLevel_axiSlave
	(
		// [BEGIN USER MAP FOR axiSlave]
		// [END USER MAP FOR axiSlave]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.inARREADY (axiSlave_inARREADY_axiSlave_inARREADY_HardLink),
		.inAWREADY (axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink),
		.inBVALID (axiSlave_inBVALID_axiSlave_inBVALID_HardLink),
		.inRDATA0 (axiSlave_inRDATA0_axiSlave_inRDATA_HardLink),
		.inRDATA1 (axiSlave_inRDATA1_axiSlave_inRDATA_HardLink),
		.inRDATA2 (axiSlave_inRDATA2_axiSlave_inRDATA_HardLink),
		.inRDATA3 (axiSlave_inRDATA3_axiSlave_inRDATA_HardLink),
		.inRVALID (axiSlave_inRVALID_axiSlave_inRVALID_HardLink),
		.inWREADY (axiSlave_inWREADY_axiSlave_inWREADY_HardLink),
		.M2S (axiSlave_M2S_axiSlave_M2S_HardLink),
		.outARADDR (axiSlave_outARADDR_axiSlave_outARADDR_HardLink),
		.outARREADYConfirming (axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink),
		.outARVALID (axiSlave_outARVALID_axiSlave_outARVALID_HardLink),
		.outAWADDR (axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink),
		.outAWREADYConfirming (axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink),
		.outAWVALID (axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink),
		.outReadTXCompleting (axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink),
		.outWDATA0 (axiSlave_outWDATA0_axiSlave_outWDATA_HardLink),
		.outWDATA1 (axiSlave_outWDATA1_axiSlave_outWDATA_HardLink),
		.outWDATA2 (axiSlave_outWDATA2_axiSlave_outWDATA_HardLink),
		.outWDATA3 (axiSlave_outWDATA3_axiSlave_outWDATA_HardLink),
		.outWREADYConfirming (axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink),
		.outWriteTXCompleting (axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink),
		.outWSTRB (axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink),
		.outWVALID (axiSlave_outWVALID_axiSlave_outWVALID_HardLink),
		.S2M (axiSlave_S2M_axiSlave_S2M_HardLink)
	);
	assign AXI4MemoryModule_L84F13L86T26_Ternary = (axiSlave_outARREADYConfirming ? AXI4MemoryModule_L84F13L86T26_WhenTrue : AXI4MemoryModule_L84F13L86T26_WhenFalse);
	assign AXI4MemoryModule_L74F13L76T26_Ternary = (internalSameTxWrite ? AXI4MemoryModule_L74F13L76T26_WhenTrue : AXI4MemoryModule_L74F13L76T26_WhenFalse);
	assign AXI4MemoryModule_L79F13L81T26_Ternary = (internalSameTxWrite ? AXI4MemoryModule_L79F13L81T26_WhenTrue : AXI4MemoryModule_L79F13L81T26_WhenFalse);
	assign AXI4MemoryModule_L69F13L71T26_Ternary = (internalSameTxWrite ? AXI4MemoryModule_L69F13L71T26_WhenTrue : AXI4MemoryModule_L69F13L71T26_WhenFalse);
	always @ (*)
	begin
		NextState_wdata_Iterator = 0;
		for (NextState_wdata_Iterator = 0; (NextState_wdata_Iterator < 4); NextState_wdata_Iterator = (NextState_wdata_Iterator + 1))
		begin
			NextState_wdata[NextState_wdata_Iterator] = State_wdata[NextState_wdata_Iterator];
		end
		NextState_raddr = State_raddr;
		NextState_waddr = State_waddr;
		NextState_waddrSet = State_waddrSet;
		NextState_wdataSet = State_wdataSet;
		NextState_wstrb = State_wstrb;
		if ((axiSlave_outAWREADYConfirming == 1))
		begin
			NextState_waddr = axiSlave_outAWADDR;
			NextState_waddrSet = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L106F13L109T14_AXI4MemoryModule_L108F38T42_Expr;
		end
		if ((axiSlave_outWREADYConfirming == 1))
		begin
			NextState_wdata[0] = axiSlave_outWDATA[0];
			NextState_wdata[1] = axiSlave_outWDATA[1];
			NextState_wdata[2] = axiSlave_outWDATA[2];
			NextState_wdata[3] = axiSlave_outWDATA[3];
			NextState_wstrb = axiSlave_outWSTRB;
			NextState_wdataSet = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L112F13L116T14_AXI4MemoryModule_L115F38T42_Expr;
		end
		if ((axiSlave_outWriteTXCompleting == 1))
		begin
			NextState_waddrSet = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L119F13L122T14_AXI4MemoryModule_L120F38T43_Expr;
			NextState_wdataSet = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L119F13L122T14_AXI4MemoryModule_L121F38T43_Expr;
		end
		if ((axiSlave_outARREADYConfirming == 1))
		begin
			NextState_raddr = axiSlave_outARADDR;
		end
	end
	assign AXI4MemoryModule_L65F40T72_Expr_1 = State_waddrSet;
	assign AXI4MemoryModule_L65F40T72_Expr_2 = State_wdataSet;
	assign AXI4MemoryModule_L64F37T81_Expr_1 = Inputs_M2S_AW_AWVALID;
	assign AXI4MemoryModule_L64F37T81_Expr_2 = Inputs_M2S_W_WVALID;
	assign AXI4MemoryModule_L66F28T73_Expr_1 = internalSameTxWrite;
	assign AXI4MemoryModule_L66F28T73_Expr_2 = internalDelayedTxWrite;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2 = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2 = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2 = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F21T51_Expr_2 = AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index;
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
	assign Inputs_M2S_W_WDATA[0] = M2S_W_WDATA0;
	assign Inputs_M2S_W_WDATA[1] = M2S_W_WDATA1;
	assign Inputs_M2S_W_WDATA[2] = M2S_W_WDATA2;
	assign Inputs_M2S_W_WDATA[3] = M2S_W_WDATA3;
	assign Inputs_M2S_W_WSTRB = M2S_W_WSTRB;
	assign Inputs_M2S_W_WLAST = M2S_W_WLAST;
	assign Inputs_M2S_W_WUSER = M2S_W_WUSER;
	assign Inputs_M2S_W_WVALID = M2S_W_WVALID;
	assign Inputs_M2S_B_BREADY = M2S_B_BREADY;
	assign internalDelayedTxWrite = AXI4MemoryModule_L65F40T72_Expr;
	assign AXI4MemoryModule_L84F13L86T26_WhenTrue = axiSlave_outARADDR;
	assign AXI4MemoryModule_L84F13L86T26_WhenFalse = State_raddr;
	assign internalRADDR = AXI4MemoryModule_L84F13L86T26_Ternary;
	assign internalSameTxWrite = AXI4MemoryModule_L64F37T81_Expr;
	assign AXI4MemoryModule_L74F13L76T26_WhenTrue = axiSlave_outAWADDR;
	assign AXI4MemoryModule_L74F13L76T26_WhenFalse = State_waddr;
	assign internalWADDR = AXI4MemoryModule_L74F13L76T26_Ternary;
	assign AXI4MemoryModule_L79F13L81T26_WhenTrue = { axiSlave_outWDATA[3], axiSlave_outWDATA[2], axiSlave_outWDATA[1], axiSlave_outWDATA[0] };
	assign AXI4MemoryModule_L79F13L81T26_WhenFalse = { State_wdata[3], State_wdata[2], State_wdata[1], State_wdata[0] };
	assign internalWDATA[0] = AXI4MemoryModule_L79F13L81T26_Ternary[7:0];
	assign internalWDATA[1] = AXI4MemoryModule_L79F13L81T26_Ternary[15:8];
	assign internalWDATA[2] = AXI4MemoryModule_L79F13L81T26_Ternary[23:16];
	assign internalWDATA[3] = AXI4MemoryModule_L79F13L81T26_Ternary[31:24];
	assign internalWE = AXI4MemoryModule_L66F28T73_Expr;
	assign AXI4MemoryModule_L69F13L71T26_WhenTrue = axiSlave_outWSTRB;
	assign AXI4MemoryModule_L69F13L71T26_WhenFalse = State_wstrb;
	assign internalWSTRB = AXI4MemoryModule_L69F13L71T26_Ternary;
	assign axiSlave_inARREADY = AXI4MemoryModule_L95F29T33_Expr;
	assign axiSlave_inAWREADY = AXI4MemoryModule_L97F29T33_Expr;
	assign axiSlave_inBVALID = AXI4MemoryModule_L99F28T32_Expr;
	assign axiSlave_inRDATA[0] = State_rdata[0];
	assign axiSlave_inRDATA[1] = State_rdata[1];
	assign axiSlave_inRDATA[2] = State_rdata[2];
	assign axiSlave_inRDATA[3] = State_rdata[3];
	assign axiSlave_inRVALID = AXI4MemoryModule_L96F28T32_Expr;
	assign axiSlave_inWREADY = AXI4MemoryModule_L98F28T32_Expr;
	assign axiSlave_M2S[221] = Inputs_M2S_B_BREADY;
	assign axiSlave_M2S[220] = Inputs_M2S_W_WVALID;
	assign axiSlave_M2S[219:212] = Inputs_M2S_W_WUSER;
	assign axiSlave_M2S[211] = Inputs_M2S_W_WLAST;
	assign axiSlave_M2S[210:207] = Inputs_M2S_W_WSTRB;
	assign axiSlave_M2S[206:199] = Inputs_M2S_W_WDATA[3];
	assign axiSlave_M2S[198:191] = Inputs_M2S_W_WDATA[2];
	assign axiSlave_M2S[190:183] = Inputs_M2S_W_WDATA[1];
	assign axiSlave_M2S[182:175] = Inputs_M2S_W_WDATA[0];
	assign axiSlave_M2S[174:167] = Inputs_M2S_W_WID;
	assign axiSlave_M2S[166] = Inputs_M2S_AW_AWVALID;
	assign axiSlave_M2S[165:158] = Inputs_M2S_AW_AWUSER;
	assign axiSlave_M2S[157:150] = Inputs_M2S_AW_AWREGION;
	assign axiSlave_M2S[149:146] = Inputs_M2S_AW_AWQOS;
	assign axiSlave_M2S[145:143] = Inputs_M2S_AW_AWPROT;
	assign axiSlave_M2S[142:139] = Inputs_M2S_AW_AWCACHE;
	assign axiSlave_M2S[138:137] = Inputs_M2S_AW_AWLOCK;
	assign axiSlave_M2S[136:135] = Inputs_M2S_AW_AWBURST;
	assign axiSlave_M2S[134:132] = Inputs_M2S_AW_AWSIZE;
	assign axiSlave_M2S[131:124] = Inputs_M2S_AW_AWLEN;
	assign axiSlave_M2S[123:92] = Inputs_M2S_AW_AWADDR;
	assign axiSlave_M2S[91:84] = Inputs_M2S_AW_AWID;
	assign axiSlave_M2S[83] = Inputs_M2S_R_RREADY;
	assign axiSlave_M2S[82] = Inputs_M2S_AR_ARVALID;
	assign axiSlave_M2S[81:74] = Inputs_M2S_AR_ARUSER;
	assign axiSlave_M2S[73:66] = Inputs_M2S_AR_ARREGION;
	assign axiSlave_M2S[65:62] = Inputs_M2S_AR_ARQOS;
	assign axiSlave_M2S[61:59] = Inputs_M2S_AR_ARPROT;
	assign axiSlave_M2S[58:55] = Inputs_M2S_AR_ARCACHE;
	assign axiSlave_M2S[54:53] = Inputs_M2S_AR_ARLOCK;
	assign axiSlave_M2S[52:51] = Inputs_M2S_AR_ARBURST;
	assign axiSlave_M2S[50:48] = Inputs_M2S_AR_ARSIZE;
	assign axiSlave_M2S[47:40] = Inputs_M2S_AR_ARLEN;
	assign axiSlave_M2S[39:8] = Inputs_M2S_AR_ARADDR;
	assign axiSlave_M2S[7:0] = Inputs_M2S_AR_ARID;
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_0_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index = internalWSTRB[0];
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_1_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index = internalWSTRB[1];
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_2_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index = internalWSTRB[2];
	assign AXI4MemoryModule_L104F9L136T10_AXI4MemoryModule_L124F13L128T14_3_AXI4MemoryModule_L125F13L128T14_AXI4MemoryModule_L126F35T51_Index = internalWSTRB[3];
	assign S2M_W_WREADY = axiSlave_S2M[73];
	assign S2M_B_BVALID = axiSlave_S2M[72];
	assign S2M_B_BUSER = axiSlave_S2M[71:64];
	assign S2M_B_BRESP = axiSlave_S2M[63:62];
	assign S2M_B_BID = axiSlave_S2M[61:54];
	assign S2M_AW_AWREADY = axiSlave_S2M[53];
	assign S2M_R_RVALID = axiSlave_S2M[52];
	assign S2M_R_RUSER = axiSlave_S2M[51:44];
	assign S2M_R_RLAST = axiSlave_S2M[43];
	assign S2M_R_RRESP = axiSlave_S2M[42:41];
	assign S2M_R_RDATA3 = axiSlave_S2M[40:33];
	assign S2M_R_RDATA2 = axiSlave_S2M[32:25];
	assign S2M_R_RDATA1 = axiSlave_S2M[24:17];
	assign S2M_R_RDATA0 = axiSlave_S2M[16:9];
	assign S2M_R_RID = axiSlave_S2M[8:1];
	assign S2M_AR_ARREADY = axiSlave_S2M[0];
	assign axiSlave_inARREADY_axiSlave_inARREADY_HardLink = axiSlave_inARREADY;
	assign axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink = axiSlave_inAWREADY;
	assign axiSlave_inBVALID_axiSlave_inBVALID_HardLink = axiSlave_inBVALID;
	assign axiSlave_inRDATA0_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[0];
	assign axiSlave_inRDATA1_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[1];
	assign axiSlave_inRDATA2_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[2];
	assign axiSlave_inRDATA3_axiSlave_inRDATA_HardLink = axiSlave_inRDATA[3];
	assign axiSlave_inRVALID_axiSlave_inRVALID_HardLink = axiSlave_inRVALID;
	assign axiSlave_inWREADY_axiSlave_inWREADY_HardLink = axiSlave_inWREADY;
	assign axiSlave_M2S_axiSlave_M2S_HardLink = axiSlave_M2S;
	assign axiSlave_outARADDR = axiSlave_outARADDR_axiSlave_outARADDR_HardLink;
	assign axiSlave_outARREADYConfirming = axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink;
	assign axiSlave_outARVALID = axiSlave_outARVALID_axiSlave_outARVALID_HardLink;
	assign axiSlave_outAWADDR = axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink;
	assign axiSlave_outAWREADYConfirming = axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink;
	assign axiSlave_outAWVALID = axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink;
	assign axiSlave_outReadTXCompleting = axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink;
	assign axiSlave_outWDATA[0] = axiSlave_outWDATA0_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWDATA[1] = axiSlave_outWDATA1_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWDATA[2] = axiSlave_outWDATA2_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWDATA[3] = axiSlave_outWDATA3_axiSlave_outWDATA_HardLink;
	assign axiSlave_outWREADYConfirming = axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink;
	assign axiSlave_outWriteTXCompleting = axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink;
	assign axiSlave_outWSTRB = axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink;
	assign axiSlave_outWVALID = axiSlave_outWVALID_axiSlave_outWVALID_HardLink;
	assign axiSlave_S2M = axiSlave_S2M_axiSlave_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
