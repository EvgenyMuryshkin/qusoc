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
// System configuration name is AXISoCQuadCoreModule_TopLevel_cpu2Memory, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXISoCQuadCoreModule_TopLevel_cpu2Memory
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [221:0] M2S,
	output wire [73:0] S2M
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
	wire signed [2: 0] addressLSB = 3'b010;
	wire [1: 0] size = 2'b10;
	wire AXI4MemoryModule_L103F29T33_Expr = 1'b1;
	wire AXI4MemoryModule_L105F29T33_Expr = 1'b1;
	wire AXI4MemoryModule_L107F28T32_Expr = 1'b1;
	wire AXI4MemoryModule_L104F28T32_Expr = 1'b1;
	wire AXI4MemoryModule_L106F28T32_Expr = 1'b1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L114F13L117T14_AXI4MemoryModule_L116F38T42_Expr = 1'b1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L120F13L124T14_AXI4MemoryModule_L123F38T42_Expr = 1'b1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L127F13L130T14_AXI4MemoryModule_L128F38T43_Expr = 1'b0;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L127F13L130T14_AXI4MemoryModule_L129F38T43_Expr = 1'b0;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_w = 1'b0;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_w = 1'b1;
	wire [1: 0] AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_w = 2'b10;
	wire [1: 0] AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_w = 2'b11;
	wire [7: 0] Inputs_M2S_R_AR_ARID;
	wire [31: 0] Inputs_M2S_R_AR_ARADDR;
	wire [7: 0] Inputs_M2S_R_AR_ARLEN;
	wire [2: 0] Inputs_M2S_R_AR_ARSIZE;
	wire [1: 0] Inputs_M2S_R_AR_ARBURST;
	wire [1: 0] Inputs_M2S_R_AR_ARLOCK;
	wire [3: 0] Inputs_M2S_R_AR_ARCACHE;
	wire [2: 0] Inputs_M2S_R_AR_ARPROT;
	wire [3: 0] Inputs_M2S_R_AR_ARQOS;
	wire [7: 0] Inputs_M2S_R_AR_ARREGION;
	wire [7: 0] Inputs_M2S_R_AR_ARUSER;
	wire Inputs_M2S_R_AR_ARVALID;
	wire Inputs_M2S_R_R_RREADY;
	wire [7: 0] Inputs_M2S_W_AW_AWID;
	wire [31: 0] Inputs_M2S_W_AW_AWADDR;
	wire [7: 0] Inputs_M2S_W_AW_AWLEN;
	wire [2: 0] Inputs_M2S_W_AW_AWSIZE;
	wire [1: 0] Inputs_M2S_W_AW_AWBURST;
	wire [1: 0] Inputs_M2S_W_AW_AWLOCK;
	wire [3: 0] Inputs_M2S_W_AW_AWCACHE;
	wire [2: 0] Inputs_M2S_W_AW_AWPROT;
	wire [3: 0] Inputs_M2S_W_AW_AWQOS;
	wire [7: 0] Inputs_M2S_W_AW_AWREGION;
	wire [7: 0] Inputs_M2S_W_AW_AWUSER;
	wire Inputs_M2S_W_AW_AWVALID;
	wire [7: 0] Inputs_M2S_W_W_WID;
	wire [3: 0] Inputs_M2S_W_W_WSTRB;
	wire Inputs_M2S_W_W_WLAST;
	wire [7: 0] Inputs_M2S_W_W_WUSER;
	wire Inputs_M2S_W_W_WVALID;
	wire Inputs_M2S_W_B_BREADY;
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
	wire [31: 0] AXI4MemoryModule_L92F14L94T26_WhenTrue;
	wire [31: 0] AXI4MemoryModule_L92F14L94T26_WhenFalse;
	wire [31: 0] AXI4MemoryModule_L92F14L94T26_Ternary;
	wire [31: 0] AXI4MemoryModule_L82F14L84T26_WhenTrue;
	wire [31: 0] AXI4MemoryModule_L82F14L84T26_WhenFalse;
	wire [31: 0] AXI4MemoryModule_L82F14L84T26_Ternary;
	wire [31: 0] AXI4MemoryModule_L87F13L89T26_WhenTrue;
	wire [31: 0] AXI4MemoryModule_L87F13L89T26_WhenFalse;
	wire [31: 0] AXI4MemoryModule_L87F13L89T26_Ternary;
	wire [3: 0] AXI4MemoryModule_L77F13L79T26_WhenTrue;
	wire [3: 0] AXI4MemoryModule_L77F13L79T26_WhenFalse;
	wire [3: 0] AXI4MemoryModule_L77F13L79T26_Ternary;
	wire [258: 0] AXI4MemoryModule_L99F37L108T14_Object;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
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
	wire AXI4MemoryModule_L73F40T72_Expr;
	wire AXI4MemoryModule_L73F40T72_Expr_1;
	wire AXI4MemoryModule_L73F40T72_Expr_2;
	wire [31: 0] AXI4MemoryModule_L92F13L94T41_Expr;
	wire [31: 0] AXI4MemoryModule_L92F13L94T41_Expr_1;
	wire AXI4MemoryModule_L72F37T85_Expr;
	wire AXI4MemoryModule_L72F37T85_Expr_1;
	wire AXI4MemoryModule_L72F37T85_Expr_2;
	wire [31: 0] AXI4MemoryModule_L82F13L84T41_Expr;
	wire [31: 0] AXI4MemoryModule_L82F13L84T41_Expr_1;
	wire AXI4MemoryModule_L74F28T73_Expr;
	wire AXI4MemoryModule_L74F28T73_Expr_1;
	wire AXI4MemoryModule_L74F28T73_Expr_2;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1;
	wire AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	wire [7 : 0] Inputs_M2S_W_W_WDATA [0 : 3];
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
	reg [7 : 0] State_buff0 [0 : 4095];
	initial
	begin : Init_State_buff0
$readmemh("AXISoCQuadCoreModule_TopLevel_cpu2Memory_State_buff0.hex", State_buff0);
	end
	reg [7 : 0] State_buff1 [0 : 4095];
	initial
	begin : Init_State_buff1
$readmemh("AXISoCQuadCoreModule_TopLevel_cpu2Memory_State_buff1.hex", State_buff1);
	end
	reg [7 : 0] State_buff2 [0 : 4095];
	initial
	begin : Init_State_buff2
$readmemh("AXISoCQuadCoreModule_TopLevel_cpu2Memory_State_buff2.hex", State_buff2);
	end
	reg [7 : 0] State_buff3 [0 : 4095];
	initial
	begin : Init_State_buff3
$readmemh("AXISoCQuadCoreModule_TopLevel_cpu2Memory_State_buff3.hex", State_buff3);
	end
	// inferred simple dual port RAM with write-first behaviour
	reg [11: 0] internalRADDR_reg0;
	always @ (posedge BoardSignals_Clock)
	begin
		if (AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr)
		begin
			State_buff0[internalWADDR] <= internalWDATA[0];
		end
		internalRADDR_reg0 <= internalRADDR[11:0];
	end
	assign State_rdata[0] = State_buff0[internalRADDR_reg0];
	// inferred simple dual port RAM with write-first behaviour
	reg [11: 0] internalRADDR_reg1;
	always @ (posedge BoardSignals_Clock)
	begin
		if (AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr)
		begin
			State_buff1[internalWADDR] <= internalWDATA[1];
		end
		internalRADDR_reg1 <= internalRADDR[11:0];
	end
	assign State_rdata[1] = State_buff1[internalRADDR_reg1];
	// inferred simple dual port RAM with write-first behaviour
	reg [11: 0] internalRADDR_reg2;
	always @ (posedge BoardSignals_Clock)
	begin
		if (AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr)
		begin
			State_buff2[internalWADDR] <= internalWDATA[2];
		end
		internalRADDR_reg2 <= internalRADDR[11:0];
	end
	assign State_rdata[2] = State_buff2[internalRADDR_reg2];
	// inferred simple dual port RAM with write-first behaviour
	reg [11: 0] internalRADDR_reg3;
	always @ (posedge BoardSignals_Clock)
	begin
		if (AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr)
		begin
			State_buff3[internalWADDR] <= internalWDATA[3];
		end
		internalRADDR_reg3 <= internalRADDR[11:0];
	end
	assign State_rdata[3] = State_buff3[internalRADDR_reg3];
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
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
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
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
	assign AXI4MemoryModule_L73F40T72_Expr = AXI4MemoryModule_L73F40T72_Expr_1 & AXI4MemoryModule_L73F40T72_Expr_2;
	// Output: AXI4MemoryModule_L92F13L94T41_Expr, Width: 32, ShiftBy: 2, Sources: 1
	assign AXI4MemoryModule_L92F13L94T41_Expr[0] = AXI4MemoryModule_L92F13L94T41_Expr_1[2];
	assign AXI4MemoryModule_L92F13L94T41_Expr[1] = AXI4MemoryModule_L92F13L94T41_Expr_1[3];
	assign AXI4MemoryModule_L92F13L94T41_Expr[2] = AXI4MemoryModule_L92F13L94T41_Expr_1[4];
	assign AXI4MemoryModule_L92F13L94T41_Expr[3] = AXI4MemoryModule_L92F13L94T41_Expr_1[5];
	assign AXI4MemoryModule_L92F13L94T41_Expr[4] = AXI4MemoryModule_L92F13L94T41_Expr_1[6];
	assign AXI4MemoryModule_L92F13L94T41_Expr[5] = AXI4MemoryModule_L92F13L94T41_Expr_1[7];
	assign AXI4MemoryModule_L92F13L94T41_Expr[6] = AXI4MemoryModule_L92F13L94T41_Expr_1[8];
	assign AXI4MemoryModule_L92F13L94T41_Expr[7] = AXI4MemoryModule_L92F13L94T41_Expr_1[9];
	assign AXI4MemoryModule_L92F13L94T41_Expr[8] = AXI4MemoryModule_L92F13L94T41_Expr_1[10];
	assign AXI4MemoryModule_L92F13L94T41_Expr[9] = AXI4MemoryModule_L92F13L94T41_Expr_1[11];
	assign AXI4MemoryModule_L92F13L94T41_Expr[10] = AXI4MemoryModule_L92F13L94T41_Expr_1[12];
	assign AXI4MemoryModule_L92F13L94T41_Expr[11] = AXI4MemoryModule_L92F13L94T41_Expr_1[13];
	assign AXI4MemoryModule_L92F13L94T41_Expr[12] = AXI4MemoryModule_L92F13L94T41_Expr_1[14];
	assign AXI4MemoryModule_L92F13L94T41_Expr[13] = AXI4MemoryModule_L92F13L94T41_Expr_1[15];
	assign AXI4MemoryModule_L92F13L94T41_Expr[14] = AXI4MemoryModule_L92F13L94T41_Expr_1[16];
	assign AXI4MemoryModule_L92F13L94T41_Expr[15] = AXI4MemoryModule_L92F13L94T41_Expr_1[17];
	assign AXI4MemoryModule_L92F13L94T41_Expr[16] = AXI4MemoryModule_L92F13L94T41_Expr_1[18];
	assign AXI4MemoryModule_L92F13L94T41_Expr[17] = AXI4MemoryModule_L92F13L94T41_Expr_1[19];
	assign AXI4MemoryModule_L92F13L94T41_Expr[18] = AXI4MemoryModule_L92F13L94T41_Expr_1[20];
	assign AXI4MemoryModule_L92F13L94T41_Expr[19] = AXI4MemoryModule_L92F13L94T41_Expr_1[21];
	assign AXI4MemoryModule_L92F13L94T41_Expr[20] = AXI4MemoryModule_L92F13L94T41_Expr_1[22];
	assign AXI4MemoryModule_L92F13L94T41_Expr[21] = AXI4MemoryModule_L92F13L94T41_Expr_1[23];
	assign AXI4MemoryModule_L92F13L94T41_Expr[22] = AXI4MemoryModule_L92F13L94T41_Expr_1[24];
	assign AXI4MemoryModule_L92F13L94T41_Expr[23] = AXI4MemoryModule_L92F13L94T41_Expr_1[25];
	assign AXI4MemoryModule_L92F13L94T41_Expr[24] = AXI4MemoryModule_L92F13L94T41_Expr_1[26];
	assign AXI4MemoryModule_L92F13L94T41_Expr[25] = AXI4MemoryModule_L92F13L94T41_Expr_1[27];
	assign AXI4MemoryModule_L92F13L94T41_Expr[26] = AXI4MemoryModule_L92F13L94T41_Expr_1[28];
	assign AXI4MemoryModule_L92F13L94T41_Expr[27] = AXI4MemoryModule_L92F13L94T41_Expr_1[29];
	assign AXI4MemoryModule_L92F13L94T41_Expr[28] = AXI4MemoryModule_L92F13L94T41_Expr_1[30];
	assign AXI4MemoryModule_L92F13L94T41_Expr[29] = AXI4MemoryModule_L92F13L94T41_Expr_1[31];
	assign AXI4MemoryModule_L92F13L94T41_Expr[30] = 0;
	assign AXI4MemoryModule_L92F13L94T41_Expr[31] = 0;
	assign AXI4MemoryModule_L72F37T85_Expr = AXI4MemoryModule_L72F37T85_Expr_1 & AXI4MemoryModule_L72F37T85_Expr_2;
	// Output: AXI4MemoryModule_L82F13L84T41_Expr, Width: 32, ShiftBy: 2, Sources: 1
	assign AXI4MemoryModule_L82F13L84T41_Expr[0] = AXI4MemoryModule_L82F13L84T41_Expr_1[2];
	assign AXI4MemoryModule_L82F13L84T41_Expr[1] = AXI4MemoryModule_L82F13L84T41_Expr_1[3];
	assign AXI4MemoryModule_L82F13L84T41_Expr[2] = AXI4MemoryModule_L82F13L84T41_Expr_1[4];
	assign AXI4MemoryModule_L82F13L84T41_Expr[3] = AXI4MemoryModule_L82F13L84T41_Expr_1[5];
	assign AXI4MemoryModule_L82F13L84T41_Expr[4] = AXI4MemoryModule_L82F13L84T41_Expr_1[6];
	assign AXI4MemoryModule_L82F13L84T41_Expr[5] = AXI4MemoryModule_L82F13L84T41_Expr_1[7];
	assign AXI4MemoryModule_L82F13L84T41_Expr[6] = AXI4MemoryModule_L82F13L84T41_Expr_1[8];
	assign AXI4MemoryModule_L82F13L84T41_Expr[7] = AXI4MemoryModule_L82F13L84T41_Expr_1[9];
	assign AXI4MemoryModule_L82F13L84T41_Expr[8] = AXI4MemoryModule_L82F13L84T41_Expr_1[10];
	assign AXI4MemoryModule_L82F13L84T41_Expr[9] = AXI4MemoryModule_L82F13L84T41_Expr_1[11];
	assign AXI4MemoryModule_L82F13L84T41_Expr[10] = AXI4MemoryModule_L82F13L84T41_Expr_1[12];
	assign AXI4MemoryModule_L82F13L84T41_Expr[11] = AXI4MemoryModule_L82F13L84T41_Expr_1[13];
	assign AXI4MemoryModule_L82F13L84T41_Expr[12] = AXI4MemoryModule_L82F13L84T41_Expr_1[14];
	assign AXI4MemoryModule_L82F13L84T41_Expr[13] = AXI4MemoryModule_L82F13L84T41_Expr_1[15];
	assign AXI4MemoryModule_L82F13L84T41_Expr[14] = AXI4MemoryModule_L82F13L84T41_Expr_1[16];
	assign AXI4MemoryModule_L82F13L84T41_Expr[15] = AXI4MemoryModule_L82F13L84T41_Expr_1[17];
	assign AXI4MemoryModule_L82F13L84T41_Expr[16] = AXI4MemoryModule_L82F13L84T41_Expr_1[18];
	assign AXI4MemoryModule_L82F13L84T41_Expr[17] = AXI4MemoryModule_L82F13L84T41_Expr_1[19];
	assign AXI4MemoryModule_L82F13L84T41_Expr[18] = AXI4MemoryModule_L82F13L84T41_Expr_1[20];
	assign AXI4MemoryModule_L82F13L84T41_Expr[19] = AXI4MemoryModule_L82F13L84T41_Expr_1[21];
	assign AXI4MemoryModule_L82F13L84T41_Expr[20] = AXI4MemoryModule_L82F13L84T41_Expr_1[22];
	assign AXI4MemoryModule_L82F13L84T41_Expr[21] = AXI4MemoryModule_L82F13L84T41_Expr_1[23];
	assign AXI4MemoryModule_L82F13L84T41_Expr[22] = AXI4MemoryModule_L82F13L84T41_Expr_1[24];
	assign AXI4MemoryModule_L82F13L84T41_Expr[23] = AXI4MemoryModule_L82F13L84T41_Expr_1[25];
	assign AXI4MemoryModule_L82F13L84T41_Expr[24] = AXI4MemoryModule_L82F13L84T41_Expr_1[26];
	assign AXI4MemoryModule_L82F13L84T41_Expr[25] = AXI4MemoryModule_L82F13L84T41_Expr_1[27];
	assign AXI4MemoryModule_L82F13L84T41_Expr[26] = AXI4MemoryModule_L82F13L84T41_Expr_1[28];
	assign AXI4MemoryModule_L82F13L84T41_Expr[27] = AXI4MemoryModule_L82F13L84T41_Expr_1[29];
	assign AXI4MemoryModule_L82F13L84T41_Expr[28] = AXI4MemoryModule_L82F13L84T41_Expr_1[30];
	assign AXI4MemoryModule_L82F13L84T41_Expr[29] = AXI4MemoryModule_L82F13L84T41_Expr_1[31];
	assign AXI4MemoryModule_L82F13L84T41_Expr[30] = 0;
	assign AXI4MemoryModule_L82F13L84T41_Expr[31] = 0;
	assign AXI4MemoryModule_L74F28T73_Expr = AXI4MemoryModule_L74F28T73_Expr_1 | AXI4MemoryModule_L74F28T73_Expr_2;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 & AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 & AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 & AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 & AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2;
	AXISoCQuadCoreModule_TopLevel_cpu2Memory_axiSlave
	AXISoCQuadCoreModule_TopLevel_cpu2Memory_axiSlave
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
	assign AXI4MemoryModule_L92F14L94T26_Ternary = (axiSlave_outARREADYConfirming ? AXI4MemoryModule_L92F14L94T26_WhenTrue : AXI4MemoryModule_L92F14L94T26_WhenFalse);
	assign AXI4MemoryModule_L82F14L84T26_Ternary = (internalSameTxWrite ? AXI4MemoryModule_L82F14L84T26_WhenTrue : AXI4MemoryModule_L82F14L84T26_WhenFalse);
	assign AXI4MemoryModule_L87F13L89T26_Ternary = (internalSameTxWrite ? AXI4MemoryModule_L87F13L89T26_WhenTrue : AXI4MemoryModule_L87F13L89T26_WhenFalse);
	assign AXI4MemoryModule_L77F13L79T26_Ternary = (internalSameTxWrite ? AXI4MemoryModule_L77F13L79T26_WhenTrue : AXI4MemoryModule_L77F13L79T26_WhenFalse);
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
			NextState_waddrSet = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L114F13L117T14_AXI4MemoryModule_L116F38T42_Expr;
		end
		if ((axiSlave_outWREADYConfirming == 1))
		begin
			NextState_wdata[0] = axiSlave_outWDATA[0];
			NextState_wdata[1] = axiSlave_outWDATA[1];
			NextState_wdata[2] = axiSlave_outWDATA[2];
			NextState_wdata[3] = axiSlave_outWDATA[3];
			NextState_wstrb = axiSlave_outWSTRB;
			NextState_wdataSet = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L120F13L124T14_AXI4MemoryModule_L123F38T42_Expr;
		end
		if ((axiSlave_outWriteTXCompleting == 1))
		begin
			NextState_waddrSet = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L127F13L130T14_AXI4MemoryModule_L128F38T43_Expr;
			NextState_wdataSet = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L127F13L130T14_AXI4MemoryModule_L129F38T43_Expr;
		end
		if ((axiSlave_outARREADYConfirming == 1))
		begin
			NextState_raddr = axiSlave_outARADDR;
		end
	end
	assign AXI4MemoryModule_L73F40T72_Expr_1 = State_waddrSet;
	assign AXI4MemoryModule_L73F40T72_Expr_2 = State_wdataSet;
	assign AXI4MemoryModule_L92F13L94T41_Expr_1 = AXI4MemoryModule_L92F14L94T26_Ternary;
	assign AXI4MemoryModule_L72F37T85_Expr_1 = Inputs_M2S_W_AW_AWVALID;
	assign AXI4MemoryModule_L72F37T85_Expr_2 = Inputs_M2S_W_W_WVALID;
	assign AXI4MemoryModule_L82F13L84T41_Expr_1 = AXI4MemoryModule_L82F14L84T26_Ternary;
	assign AXI4MemoryModule_L74F28T73_Expr_1 = internalSameTxWrite;
	assign AXI4MemoryModule_L74F28T73_Expr_2 = internalDelayedTxWrite;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2 = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2 = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2 = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_1 = internalWE;
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F21T51_Expr_2 = AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index;
	assign Inputs_M2S_W_B_BREADY = M2S[221];
	assign Inputs_M2S_W_W_WVALID = M2S[220];
	assign Inputs_M2S_W_W_WUSER = M2S[219:212];
	assign Inputs_M2S_W_W_WLAST = M2S[211];
	assign Inputs_M2S_W_W_WSTRB = M2S[210:207];
	assign Inputs_M2S_W_W_WDATA[3] = M2S[206:199];
	assign Inputs_M2S_W_W_WDATA[2] = M2S[198:191];
	assign Inputs_M2S_W_W_WDATA[1] = M2S[190:183];
	assign Inputs_M2S_W_W_WDATA[0] = M2S[182:175];
	assign Inputs_M2S_W_W_WID = M2S[174:167];
	assign Inputs_M2S_W_AW_AWVALID = M2S[166];
	assign Inputs_M2S_W_AW_AWUSER = M2S[165:158];
	assign Inputs_M2S_W_AW_AWREGION = M2S[157:150];
	assign Inputs_M2S_W_AW_AWQOS = M2S[149:146];
	assign Inputs_M2S_W_AW_AWPROT = M2S[145:143];
	assign Inputs_M2S_W_AW_AWCACHE = M2S[142:139];
	assign Inputs_M2S_W_AW_AWLOCK = M2S[138:137];
	assign Inputs_M2S_W_AW_AWBURST = M2S[136:135];
	assign Inputs_M2S_W_AW_AWSIZE = M2S[134:132];
	assign Inputs_M2S_W_AW_AWLEN = M2S[131:124];
	assign Inputs_M2S_W_AW_AWADDR = M2S[123:92];
	assign Inputs_M2S_W_AW_AWID = M2S[91:84];
	assign Inputs_M2S_R_R_RREADY = M2S[83];
	assign Inputs_M2S_R_AR_ARVALID = M2S[82];
	assign Inputs_M2S_R_AR_ARUSER = M2S[81:74];
	assign Inputs_M2S_R_AR_ARREGION = M2S[73:66];
	assign Inputs_M2S_R_AR_ARQOS = M2S[65:62];
	assign Inputs_M2S_R_AR_ARPROT = M2S[61:59];
	assign Inputs_M2S_R_AR_ARCACHE = M2S[58:55];
	assign Inputs_M2S_R_AR_ARLOCK = M2S[54:53];
	assign Inputs_M2S_R_AR_ARBURST = M2S[52:51];
	assign Inputs_M2S_R_AR_ARSIZE = M2S[50:48];
	assign Inputs_M2S_R_AR_ARLEN = M2S[47:40];
	assign Inputs_M2S_R_AR_ARADDR = M2S[39:8];
	assign Inputs_M2S_R_AR_ARID = M2S[7:0];
	assign internalDelayedTxWrite = AXI4MemoryModule_L73F40T72_Expr;
	assign AXI4MemoryModule_L92F14L94T26_WhenTrue = axiSlave_outARADDR;
	assign AXI4MemoryModule_L92F14L94T26_WhenFalse = State_raddr;
	assign internalRADDR = AXI4MemoryModule_L92F13L94T41_Expr;
	assign internalSameTxWrite = AXI4MemoryModule_L72F37T85_Expr;
	assign AXI4MemoryModule_L82F14L84T26_WhenTrue = axiSlave_outAWADDR;
	assign AXI4MemoryModule_L82F14L84T26_WhenFalse = State_waddr;
	assign internalWADDR = AXI4MemoryModule_L82F13L84T41_Expr;
	assign AXI4MemoryModule_L87F13L89T26_WhenTrue = {
		axiSlave_outWDATA[3],
		axiSlave_outWDATA[2],
		axiSlave_outWDATA[1],
		axiSlave_outWDATA[0]
	}
	;
	assign AXI4MemoryModule_L87F13L89T26_WhenFalse = {
		State_wdata[3],
		State_wdata[2],
		State_wdata[1],
		State_wdata[0]
	}
	;
	assign internalWDATA[0] = AXI4MemoryModule_L87F13L89T26_Ternary[7:0];
	assign internalWDATA[1] = AXI4MemoryModule_L87F13L89T26_Ternary[15:8];
	assign internalWDATA[2] = AXI4MemoryModule_L87F13L89T26_Ternary[23:16];
	assign internalWDATA[3] = AXI4MemoryModule_L87F13L89T26_Ternary[31:24];
	assign internalWE = AXI4MemoryModule_L74F28T73_Expr;
	assign AXI4MemoryModule_L77F13L79T26_WhenTrue = axiSlave_outWSTRB;
	assign AXI4MemoryModule_L77F13L79T26_WhenFalse = State_wstrb;
	assign internalWSTRB = AXI4MemoryModule_L77F13L79T26_Ternary;
	assign AXI4MemoryModule_L99F37L108T14_Object[0] = AXI4MemoryModule_L103F29T33_Expr;
	assign AXI4MemoryModule_L99F37L108T14_Object[1] = AXI4MemoryModule_L105F29T33_Expr;
	assign AXI4MemoryModule_L99F37L108T14_Object[2] = AXI4MemoryModule_L107F28T32_Expr;
	assign AXI4MemoryModule_L99F37L108T14_Object[34:3] = {
		State_rdata[3],
		State_rdata[2],
		State_rdata[1],
		State_rdata[0]
	}
	;
	assign AXI4MemoryModule_L99F37L108T14_Object[35] = AXI4MemoryModule_L104F28T32_Expr;
	assign AXI4MemoryModule_L99F37L108T14_Object[36] = AXI4MemoryModule_L106F28T32_Expr;
	assign AXI4MemoryModule_L99F37L108T14_Object[44:37] = Inputs_M2S_R_AR_ARID;
	assign AXI4MemoryModule_L99F37L108T14_Object[76:45] = Inputs_M2S_R_AR_ARADDR;
	assign AXI4MemoryModule_L99F37L108T14_Object[84:77] = Inputs_M2S_R_AR_ARLEN;
	assign AXI4MemoryModule_L99F37L108T14_Object[87:85] = Inputs_M2S_R_AR_ARSIZE;
	assign AXI4MemoryModule_L99F37L108T14_Object[89:88] = Inputs_M2S_R_AR_ARBURST;
	assign AXI4MemoryModule_L99F37L108T14_Object[91:90] = Inputs_M2S_R_AR_ARLOCK;
	assign AXI4MemoryModule_L99F37L108T14_Object[95:92] = Inputs_M2S_R_AR_ARCACHE;
	assign AXI4MemoryModule_L99F37L108T14_Object[98:96] = Inputs_M2S_R_AR_ARPROT;
	assign AXI4MemoryModule_L99F37L108T14_Object[102:99] = Inputs_M2S_R_AR_ARQOS;
	assign AXI4MemoryModule_L99F37L108T14_Object[110:103] = Inputs_M2S_R_AR_ARREGION;
	assign AXI4MemoryModule_L99F37L108T14_Object[118:111] = Inputs_M2S_R_AR_ARUSER;
	assign AXI4MemoryModule_L99F37L108T14_Object[119] = Inputs_M2S_R_AR_ARVALID;
	assign AXI4MemoryModule_L99F37L108T14_Object[120] = Inputs_M2S_R_R_RREADY;
	assign AXI4MemoryModule_L99F37L108T14_Object[128:121] = Inputs_M2S_W_AW_AWID;
	assign AXI4MemoryModule_L99F37L108T14_Object[160:129] = Inputs_M2S_W_AW_AWADDR;
	assign AXI4MemoryModule_L99F37L108T14_Object[168:161] = Inputs_M2S_W_AW_AWLEN;
	assign AXI4MemoryModule_L99F37L108T14_Object[171:169] = Inputs_M2S_W_AW_AWSIZE;
	assign AXI4MemoryModule_L99F37L108T14_Object[173:172] = Inputs_M2S_W_AW_AWBURST;
	assign AXI4MemoryModule_L99F37L108T14_Object[175:174] = Inputs_M2S_W_AW_AWLOCK;
	assign AXI4MemoryModule_L99F37L108T14_Object[179:176] = Inputs_M2S_W_AW_AWCACHE;
	assign AXI4MemoryModule_L99F37L108T14_Object[182:180] = Inputs_M2S_W_AW_AWPROT;
	assign AXI4MemoryModule_L99F37L108T14_Object[186:183] = Inputs_M2S_W_AW_AWQOS;
	assign AXI4MemoryModule_L99F37L108T14_Object[194:187] = Inputs_M2S_W_AW_AWREGION;
	assign AXI4MemoryModule_L99F37L108T14_Object[202:195] = Inputs_M2S_W_AW_AWUSER;
	assign AXI4MemoryModule_L99F37L108T14_Object[203] = Inputs_M2S_W_AW_AWVALID;
	assign AXI4MemoryModule_L99F37L108T14_Object[211:204] = Inputs_M2S_W_W_WID;
	assign AXI4MemoryModule_L99F37L108T14_Object[243:212] = {
		Inputs_M2S_W_W_WDATA[3],
		Inputs_M2S_W_W_WDATA[2],
		Inputs_M2S_W_W_WDATA[1],
		Inputs_M2S_W_W_WDATA[0]
	}
	;
	assign AXI4MemoryModule_L99F37L108T14_Object[247:244] = Inputs_M2S_W_W_WSTRB;
	assign AXI4MemoryModule_L99F37L108T14_Object[248] = Inputs_M2S_W_W_WLAST;
	assign AXI4MemoryModule_L99F37L108T14_Object[256:249] = Inputs_M2S_W_W_WUSER;
	assign AXI4MemoryModule_L99F37L108T14_Object[257] = Inputs_M2S_W_W_WVALID;
	assign AXI4MemoryModule_L99F37L108T14_Object[258] = Inputs_M2S_W_B_BREADY;
	assign axiSlave_M2S = AXI4MemoryModule_L99F37L108T14_Object[258:37];
	assign axiSlave_inWREADY = AXI4MemoryModule_L99F37L108T14_Object[36];
	assign axiSlave_inRVALID = AXI4MemoryModule_L99F37L108T14_Object[35];
	assign axiSlave_inRDATA[3] = AXI4MemoryModule_L99F37L108T14_Object[34:27];
	assign axiSlave_inRDATA[2] = AXI4MemoryModule_L99F37L108T14_Object[26:19];
	assign axiSlave_inRDATA[1] = AXI4MemoryModule_L99F37L108T14_Object[18:11];
	assign axiSlave_inRDATA[0] = AXI4MemoryModule_L99F37L108T14_Object[10:3];
	assign axiSlave_inBVALID = AXI4MemoryModule_L99F37L108T14_Object[2];
	assign axiSlave_inAWREADY = AXI4MemoryModule_L99F37L108T14_Object[1];
	assign axiSlave_inARREADY = AXI4MemoryModule_L99F37L108T14_Object[0];
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_0_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index = internalWSTRB[0];
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_1_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index = internalWSTRB[1];
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_2_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index = internalWSTRB[2];
	assign AXI4MemoryModule_L112F9L144T10_AXI4MemoryModule_L132F13L136T14_3_AXI4MemoryModule_L133F13L136T14_AXI4MemoryModule_L134F35T51_Index = internalWSTRB[3];
	assign S2M = axiSlave_S2M;
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
