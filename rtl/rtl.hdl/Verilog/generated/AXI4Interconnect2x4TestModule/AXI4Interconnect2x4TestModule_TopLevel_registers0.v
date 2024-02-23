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
// System configuration name is AXI4Interconnect2x4TestModule_TopLevel_registers0, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4Interconnect2x4TestModule_TopLevel_registers0
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [7:0] inWDATA0,
	input wire [7:0] inWDATA1,
	input wire [7:0] inWDATA2,
	input wire [7:0] inWDATA3,
	input wire inWE,
	input wire [221:0] M2S,
	output wire outACK,
	output wire [7:0] outData0,
	output wire [7:0] outData1,
	output wire [7:0] outData2,
	output wire [7:0] outData3,
	output wire outWritten,
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
	wire [7: 0] State_bytesDefault = 8'b00000000;
	wire [1: 0] size = 2'b10;
	wire AXI4RegisterModule_L58F29T33_Expr = 1'b1;
	wire AXI4RegisterModule_L59F28T32_Expr = 1'b1;
	wire AXI4RegisterModule_L60F29T33_Expr = 1'b1;
	wire AXI4RegisterModule_L62F28T32_Expr = 1'b1;
	wire Inputs_inWE;
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
	reg NextState_Written;
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
	reg State_Written = 1'b0;
	wire State_WrittenDefault = 1'b0;
	wire AXI4RegisterModule_L61F28T40_Expr;
	wire AXI4RegisterModule_L61F28T40_Expr_1;
	wire AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr;
	wire AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr_1;
	wire AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr_2;
	wire [7 : 0] Inputs_inWDATA [0 : 3];
	wire [7 : 0] Inputs_M2S_W_W_WDATA [0 : 3];
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
	wire [7 : 0] axiSlave_inRDATA [0 : 3];
	wire [7 : 0] axiSlave_outWDATA [0 : 3];
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_Written <= State_WrittenDefault;
		end
		else
		begin
			State_Written <= NextState_Written;
		end
	end
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
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
	assign AXI4RegisterModule_L61F28T40_Expr = ~AXI4RegisterModule_L61F28T40_Expr_1;
	assign AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr = AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr_1 | AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr_2;
	AXI4Interconnect2x4TestModule_TopLevel_registers0_axiSlave
	AXI4Interconnect2x4TestModule_TopLevel_registers0_axiSlave
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
	always @ (*)
	begin
		NextState_bytes_Iterator = 0;
		for (NextState_bytes_Iterator = 0; (NextState_bytes_Iterator < 4); NextState_bytes_Iterator = (NextState_bytes_Iterator + 1))
		begin
			NextState_bytes[NextState_bytes_Iterator] = State_bytes[NextState_bytes_Iterator];
		end
		NextState_Written = State_Written;
		NextState_Written = AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr;
		if ((Inputs_inWE == 1))
		begin
			NextState_bytes[0] = Inputs_inWDATA[0];
			NextState_bytes[1] = Inputs_inWDATA[1];
			NextState_bytes[2] = Inputs_inWDATA[2];
			NextState_bytes[3] = Inputs_inWDATA[3];
		end
		else if ((axiSlave_outWREADYConfirming == 1))
		begin
			if ((axiSlave_outWSTRB[0] == 1))
			begin
				NextState_bytes[0] = axiSlave_outWDATA[0];
			end
			if ((axiSlave_outWSTRB[1] == 1))
			begin
				NextState_bytes[1] = axiSlave_outWDATA[1];
			end
			if ((axiSlave_outWSTRB[2] == 1))
			begin
				NextState_bytes[2] = axiSlave_outWDATA[2];
			end
			if ((axiSlave_outWSTRB[3] == 1))
			begin
				NextState_bytes[3] = axiSlave_outWDATA[3];
			end
		end
	end
	assign AXI4RegisterModule_L61F28T40_Expr_1 = Inputs_inWE;
	assign AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr_1 = Inputs_inWE;
	assign AXI4RegisterModule_L67F9L82T10_AXI4RegisterModule_L68F33T76_Expr_2 = axiSlave_outWREADYConfirming;
	assign Inputs_inWDATA[0] = inWDATA0;
	assign Inputs_inWDATA[1] = inWDATA1;
	assign Inputs_inWDATA[2] = inWDATA2;
	assign Inputs_inWDATA[3] = inWDATA3;
	assign Inputs_inWE = inWE;
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
	assign axiSlave_inARREADY = AXI4RegisterModule_L58F29T33_Expr;
	assign axiSlave_inAWREADY = AXI4RegisterModule_L60F29T33_Expr;
	assign axiSlave_inBVALID = AXI4RegisterModule_L62F28T32_Expr;
	assign axiSlave_inRDATA[0] = State_bytes[0];
	assign axiSlave_inRDATA[1] = State_bytes[1];
	assign axiSlave_inRDATA[2] = State_bytes[2];
	assign axiSlave_inRDATA[3] = State_bytes[3];
	assign axiSlave_inRVALID = AXI4RegisterModule_L59F28T32_Expr;
	assign axiSlave_inWREADY = AXI4RegisterModule_L61F28T40_Expr;
	assign axiSlave_M2S = M2S;
	assign outACK = Inputs_inWE;
	assign outData0 = State_bytes[0];
	assign outData1 = State_bytes[1];
	assign outData2 = State_bytes[2];
	assign outData3 = State_bytes[3];
	assign outWritten = State_Written;
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
