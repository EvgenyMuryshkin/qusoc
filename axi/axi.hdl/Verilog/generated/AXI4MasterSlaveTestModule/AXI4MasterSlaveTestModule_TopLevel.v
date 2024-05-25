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
// System configuration name is AXI4MasterSlaveTestModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXI4MasterSlaveTestModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire [31:0] InData,
	input wire MRE,
	input wire MWE,
	input wire SWE,
	input wire [3:0] WSTRB,
	output wire BVALID,
	output wire RACK,
	output wire [7:0] RDATA0,
	output wire [7:0] RDATA1,
	output wire [7:0] RDATA2,
	output wire [7:0] RDATA3,
	output wire [31:0] ReadData,
	output wire [31:0] RegisterData,
	output wire RegisterOutACK,
	output wire RegisterOutWritten,
	output wire RVALID,
	output wire WACK
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] State_ReadDataDefault = 8'b00000000;
	wire AXI4MasterSlaveTestModule_L63F30T34_Expr = 1'b1;
	wire AXI4MasterSlaveTestModule_L64F30T34_Expr = 1'b1;
	wire AXI4MasterSlaveTestModule_L65F30T31_Expr = 1'b0;
	wire AXI4MasterSlaveTestModule_L66F30T31_Expr = 1'b0;
	wire AXI4MasterModule_L16F30T31_Expr = 1'b0;
	wire [31: 0] Inputs_InData;
	wire Inputs_MRE;
	wire Inputs_MWE;
	wire Inputs_SWE;
	wire [3: 0] Inputs_WSTRB;
	wire [111: 0] master_Master;
	wire [73: 0] master_S2M;
	wire [221: 0] master_M2S;
	wire master_RACK;
	wire master_WACK;
	wire [221: 0] reg_M2S;
	wire [32: 0] reg_Reg;
	wire reg_outACK;
	wire reg_outWritten;
	wire [73: 0] reg_S2M;
	wire [254: 0] AXI4MasterSlaveTestModule_L46F32L54T14_Object;
	wire [185: 0] AXI4MasterSlaveTestModule_L56F35L70T14_Object;
	wire [31: 0] AXI4MasterSlaveTestModule_L30F40T71_Source;
	wire [31: 0] AXI4MasterSlaveTestModule_L31F44T72_Source;
	wire [111: 0] master_Master_master_Master_HardLink;
	wire [73: 0] master_S2M_master_S2M_HardLink;
	wire [221: 0] master_M2S_master_M2S_HardLink;
	wire master_RACK_master_RACK_HardLink;
	wire [7: 0] master_RDATA0_master_RDATA_HardLink;
	wire [7: 0] master_RDATA1_master_RDATA_HardLink;
	wire [7: 0] master_RDATA2_master_RDATA_HardLink;
	wire [7: 0] master_RDATA3_master_RDATA_HardLink;
	wire master_WACK_master_WACK_HardLink;
	wire [221: 0] reg_M2S_reg_M2S_HardLink;
	wire [32: 0] reg_Reg_reg_Reg_HardLink;
	wire reg_outACK_reg_outACK_HardLink;
	wire [7: 0] reg_outData0_reg_outData_HardLink;
	wire [7: 0] reg_outData1_reg_outData_HardLink;
	wire [7: 0] reg_outData2_reg_outData_HardLink;
	wire [7: 0] reg_outData3_reg_outData_HardLink;
	wire reg_outWritten_reg_outWritten_HardLink;
	wire [73: 0] reg_S2M_reg_S2M_HardLink;
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
	wire [7 : 0] master_RDATA [0 : 3];
	wire [7 : 0] reg_outData [0 : 3];
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
			for (State_ReadData_Iterator = 0; (State_ReadData_Iterator < 4); State_ReadData_Iterator = (State_ReadData_Iterator + 1))
			begin
				State_ReadData[State_ReadData_Iterator] <= State_ReadDataDefault;
			end
		end
		else
		begin
			for (State_ReadData_Iterator = 0; (State_ReadData_Iterator < 4); State_ReadData_Iterator = (State_ReadData_Iterator + 1))
			begin
				State_ReadData[State_ReadData_Iterator] <= NextState_ReadData[State_ReadData_Iterator];
			end
		end
	end
	AXI4MasterSlaveTestModule_TopLevel_master
	AXI4MasterSlaveTestModule_TopLevel_master
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
	AXI4MasterSlaveTestModule_TopLevel_reg
	AXI4MasterSlaveTestModule_TopLevel_reg
	(
		// [BEGIN USER MAP FOR reg]
		// [END USER MAP FOR reg]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S (reg_M2S_reg_M2S_HardLink),
		.Reg (reg_Reg_reg_Reg_HardLink),
		.outACK (reg_outACK_reg_outACK_HardLink),
		.outData0 (reg_outData0_reg_outData_HardLink),
		.outData1 (reg_outData1_reg_outData_HardLink),
		.outData2 (reg_outData2_reg_outData_HardLink),
		.outData3 (reg_outData3_reg_outData_HardLink),
		.outWritten (reg_outWritten_reg_outWritten_HardLink),
		.S2M (reg_S2M_reg_S2M_HardLink)
	);
	always @ (*)
	begin
		NextState_ReadData_Iterator = 0;
		for (NextState_ReadData_Iterator = 0; (NextState_ReadData_Iterator < 4); NextState_ReadData_Iterator = (NextState_ReadData_Iterator + 1))
		begin
			NextState_ReadData[NextState_ReadData_Iterator] = State_ReadData[NextState_ReadData_Iterator];
		end
		if ((reg_S2M[52] == 1))
		begin
			NextState_ReadData[0] = reg_S2M[16:9];
			NextState_ReadData[1] = reg_S2M[24:17];
			NextState_ReadData[2] = reg_S2M[32:25];
			NextState_ReadData[3] = reg_S2M[40:33];
		end
	end
	assign Inputs_InData = InData;
	assign Inputs_MRE = MRE;
	assign Inputs_MWE = MWE;
	assign Inputs_SWE = SWE;
	assign Inputs_WSTRB = WSTRB;
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[7:0] = master_M2S[7:0];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[39:8] = master_M2S[39:8];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[47:40] = master_M2S[47:40];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[50:48] = master_M2S[50:48];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[52:51] = master_M2S[52:51];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[54:53] = master_M2S[54:53];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[58:55] = master_M2S[58:55];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[61:59] = master_M2S[61:59];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[65:62] = master_M2S[65:62];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[73:66] = master_M2S[73:66];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[81:74] = master_M2S[81:74];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[82] = master_M2S[82];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[83] = master_M2S[83];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[91:84] = master_M2S[91:84];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[123:92] = master_M2S[123:92];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[131:124] = master_M2S[131:124];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[134:132] = master_M2S[134:132];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[136:135] = master_M2S[136:135];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[138:137] = master_M2S[138:137];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[142:139] = master_M2S[142:139];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[145:143] = master_M2S[145:143];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[149:146] = master_M2S[149:146];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[157:150] = master_M2S[157:150];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[165:158] = master_M2S[165:158];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[166] = master_M2S[166];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[174:167] = master_M2S[174:167];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[206:175] = master_M2S[206:175];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[210:207] = master_M2S[210:207];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[211] = master_M2S[211];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[219:212] = master_M2S[219:212];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[220] = master_M2S[220];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[221] = master_M2S[221];
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[253:222] = Inputs_InData;
	assign AXI4MasterSlaveTestModule_L46F32L54T14_Object[254] = Inputs_SWE;
	assign reg_Reg = AXI4MasterSlaveTestModule_L46F32L54T14_Object[254:222];
	assign reg_M2S = AXI4MasterSlaveTestModule_L46F32L54T14_Object[221:0];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[31:0] = {
		{31{1'b0}},
		AXI4MasterSlaveTestModule_L65F30T31_Expr
	}
	;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[39:32] = {
		{7{1'b0}},
		AXI4MasterModule_L16F30T31_Expr
	}
	;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[71:40] = {
		{31{1'b0}},
		AXI4MasterSlaveTestModule_L66F30T31_Expr
	}
	;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[72] = AXI4MasterSlaveTestModule_L63F30T34_Expr;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[73] = Inputs_MRE;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[74] = AXI4MasterSlaveTestModule_L64F30T34_Expr;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[106:75] = Inputs_InData;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[107] = Inputs_MWE;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[111:108] = Inputs_WSTRB;
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[112] = reg_S2M[0];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[120:113] = reg_S2M[8:1];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[152:121] = reg_S2M[40:9];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[154:153] = reg_S2M[42:41];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[155] = reg_S2M[43];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[163:156] = reg_S2M[51:44];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[164] = reg_S2M[52];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[165] = reg_S2M[53];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[173:166] = reg_S2M[61:54];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[175:174] = reg_S2M[63:62];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[183:176] = reg_S2M[71:64];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[184] = reg_S2M[72];
	assign AXI4MasterSlaveTestModule_L56F35L70T14_Object[185] = reg_S2M[73];
	assign master_S2M = AXI4MasterSlaveTestModule_L56F35L70T14_Object[185:112];
	assign master_Master = AXI4MasterSlaveTestModule_L56F35L70T14_Object[111:0];
	assign BVALID = reg_S2M[72];
	assign RACK = master_RACK;
	assign RDATA0 = master_RDATA[0];
	assign RDATA1 = master_RDATA[1];
	assign RDATA2 = master_RDATA[2];
	assign RDATA3 = master_RDATA[3];
	assign AXI4MasterSlaveTestModule_L30F40T71_Source = {
		State_ReadData[3],
		State_ReadData[2],
		State_ReadData[1],
		State_ReadData[0]
	}
	;
	assign ReadData = AXI4MasterSlaveTestModule_L30F40T71_Source;
	assign AXI4MasterSlaveTestModule_L31F44T72_Source = {
		reg_outData[3],
		reg_outData[2],
		reg_outData[1],
		reg_outData[0]
	}
	;
	assign RegisterData = AXI4MasterSlaveTestModule_L31F44T72_Source;
	assign RegisterOutACK = reg_outACK;
	assign RegisterOutWritten = reg_outWritten;
	assign RVALID = reg_S2M[52];
	assign WACK = master_WACK;
	assign master_Master_master_Master_HardLink = master_Master;
	assign master_S2M_master_S2M_HardLink = master_S2M;
	assign master_M2S = master_M2S_master_M2S_HardLink;
	assign master_RACK = master_RACK_master_RACK_HardLink;
	assign master_RDATA[0] = master_RDATA0_master_RDATA_HardLink;
	assign master_RDATA[1] = master_RDATA1_master_RDATA_HardLink;
	assign master_RDATA[2] = master_RDATA2_master_RDATA_HardLink;
	assign master_RDATA[3] = master_RDATA3_master_RDATA_HardLink;
	assign master_WACK = master_WACK_master_WACK_HardLink;
	assign reg_M2S_reg_M2S_HardLink = reg_M2S;
	assign reg_Reg_reg_Reg_HardLink = reg_Reg;
	assign reg_outACK = reg_outACK_reg_outACK_HardLink;
	assign reg_outData[0] = reg_outData0_reg_outData_HardLink;
	assign reg_outData[1] = reg_outData1_reg_outData_HardLink;
	assign reg_outData[2] = reg_outData2_reg_outData_HardLink;
	assign reg_outData[3] = reg_outData3_reg_outData_HardLink;
	assign reg_outWritten = reg_outWritten_reg_outWritten_HardLink;
	assign reg_S2M = reg_S2M_reg_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
