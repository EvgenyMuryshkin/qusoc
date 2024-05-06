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
// System configuration name is AXISoCDualCoreModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXISoCDualCoreModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	output wire [31:0] oReg0,
	output wire [31:0] oReg1
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [32: 0] AXI4RegisterModuleInputs_Reg = 33'b000000000000000000000000000000000;
	wire [221: 0] AutoIncrementCounter_M2S;
	wire [31: 0] AutoIncrementCounter_oCounter;
	wire AutoIncrementCounter_outWritten;
	wire [73: 0] AutoIncrementCounter_S2M;
	wire [73: 0] CPU0_S2M;
	wire [221: 0] CPU0_M2S;
	wire [73: 0] CPU1_S2M;
	wire [221: 0] CPU1_M2S;
	wire [221: 0] Memory_M2S;
	wire [73: 0] Memory_S2M;
	wire [221: 0] Reg0_M2S;
	wire [32: 0] Reg0_Reg;
	wire Reg0_outACK;
	wire Reg0_outWritten;
	wire [73: 0] Reg0_S2M;
	wire [221: 0] Reg1_M2S;
	wire [32: 0] Reg1_Reg;
	wire Reg1_outACK;
	wire Reg1_outWritten;
	wire [73: 0] Reg1_S2M;
	wire [73: 0] AXISoCDualCoreModule_L46F33L49T14_Object;
	wire [73: 0] AXISoCDualCoreModule_L50F33L53T14_Object;
	wire [221: 0] AXISoCDualCoreModule_L55F35L58T14_Object;
	wire [221: 0] AXISoCDualCoreModule_L59F49L62T14_Object;
	wire [254: 0] AXISoCDualCoreModule_L63F33L66T14_Object;
	wire [254: 0] AXISoCDualCoreModule_L67F33L70T14_Object;
	wire [739: 0] AXISoCDualCoreModule_L72F41L81T14_Object;
	wire [31: 0] AXISoCDualCoreModule_L83F37T66_Source;
	wire [31: 0] AXISoCDualCoreModule_L84F37T66_Source;
	wire [221: 0] AutoIncrementCounter_M2S_AutoIncrementCounter_M2S_HardLink;
	wire [31: 0] AutoIncrementCounter_oCounter_AutoIncrementCounter_oCounter_HardLink;
	wire AutoIncrementCounter_outWritten_AutoIncrementCounter_outWritten_HardLink;
	wire [73: 0] AutoIncrementCounter_S2M_AutoIncrementCounter_S2M_HardLink;
	wire [73: 0] CPU0_S2M_CPU0_S2M_HardLink;
	wire [221: 0] CPU0_M2S_CPU0_M2S_HardLink;
	wire [73: 0] CPU1_S2M_CPU1_S2M_HardLink;
	wire [221: 0] CPU1_M2S_CPU1_M2S_HardLink;
	wire [221: 0] Interconnect_iM2S0_Interconnect_iM2S_HardLink;
	wire [221: 0] Interconnect_iM2S1_Interconnect_iM2S_HardLink;
	wire [73: 0] Interconnect_iS2M0_Interconnect_iS2M_HardLink;
	wire [73: 0] Interconnect_iS2M1_Interconnect_iS2M_HardLink;
	wire [73: 0] Interconnect_iS2M2_Interconnect_iS2M_HardLink;
	wire [73: 0] Interconnect_iS2M3_Interconnect_iS2M_HardLink;
	wire [221: 0] Interconnect_oM2S0_Interconnect_oM2S_HardLink;
	wire [221: 0] Interconnect_oM2S1_Interconnect_oM2S_HardLink;
	wire [221: 0] Interconnect_oM2S2_Interconnect_oM2S_HardLink;
	wire [221: 0] Interconnect_oM2S3_Interconnect_oM2S_HardLink;
	wire [73: 0] Interconnect_oS2M0_Interconnect_oS2M_HardLink;
	wire [73: 0] Interconnect_oS2M1_Interconnect_oS2M_HardLink;
	wire [221: 0] Memory_M2S_Memory_M2S_HardLink;
	wire [73: 0] Memory_S2M_Memory_S2M_HardLink;
	wire [221: 0] Reg0_M2S_Reg0_M2S_HardLink;
	wire [32: 0] Reg0_Reg_Reg0_Reg_HardLink;
	wire Reg0_outACK_Reg0_outACK_HardLink;
	wire [7: 0] Reg0_outData0_Reg0_outData_HardLink;
	wire [7: 0] Reg0_outData1_Reg0_outData_HardLink;
	wire [7: 0] Reg0_outData2_Reg0_outData_HardLink;
	wire [7: 0] Reg0_outData3_Reg0_outData_HardLink;
	wire Reg0_outWritten_Reg0_outWritten_HardLink;
	wire [73: 0] Reg0_S2M_Reg0_S2M_HardLink;
	wire [221: 0] Reg1_M2S_Reg1_M2S_HardLink;
	wire [32: 0] Reg1_Reg_Reg1_Reg_HardLink;
	wire Reg1_outACK_Reg1_outACK_HardLink;
	wire [7: 0] Reg1_outData0_Reg1_outData_HardLink;
	wire [7: 0] Reg1_outData1_Reg1_outData_HardLink;
	wire [7: 0] Reg1_outData2_Reg1_outData_HardLink;
	wire [7: 0] Reg1_outData3_Reg1_outData_HardLink;
	wire Reg1_outWritten_Reg1_outWritten_HardLink;
	wire [73: 0] Reg1_S2M_Reg1_S2M_HardLink;
	wire [221 : 0] Interconnect_iM2S [0 : 1];
	wire [73 : 0] Interconnect_iS2M [0 : 3];
	wire [221 : 0] Interconnect_oM2S [0 : 3];
	wire [73 : 0] Interconnect_oS2M [0 : 1];
	wire [7 : 0] Reg0_outData [0 : 3];
	wire [7 : 0] Reg1_outData [0 : 3];
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	AXISoCDualCoreModule_TopLevel_AutoIncrementCounter
	AXISoCDualCoreModule_TopLevel_AutoIncrementCounter
	(
		// [BEGIN USER MAP FOR AutoIncrementCounter]
		// [END USER MAP FOR AutoIncrementCounter]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S (AutoIncrementCounter_M2S_AutoIncrementCounter_M2S_HardLink),
		.oCounter (AutoIncrementCounter_oCounter_AutoIncrementCounter_oCounter_HardLink),
		.outWritten (AutoIncrementCounter_outWritten_AutoIncrementCounter_outWritten_HardLink),
		.S2M (AutoIncrementCounter_S2M_AutoIncrementCounter_S2M_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_CPU0
	AXISoCDualCoreModule_TopLevel_CPU0
	(
		// [BEGIN USER MAP FOR CPU0]
		// [END USER MAP FOR CPU0]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.S2M (CPU0_S2M_CPU0_S2M_HardLink),
		.M2S (CPU0_M2S_CPU0_M2S_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_CPU1
	AXISoCDualCoreModule_TopLevel_CPU1
	(
		// [BEGIN USER MAP FOR CPU1]
		// [END USER MAP FOR CPU1]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.S2M (CPU1_S2M_CPU1_S2M_HardLink),
		.M2S (CPU1_M2S_CPU1_M2S_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_Interconnect
	AXISoCDualCoreModule_TopLevel_Interconnect
	(
		// [BEGIN USER MAP FOR Interconnect]
		// [END USER MAP FOR Interconnect]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.iM2S0 (Interconnect_iM2S0_Interconnect_iM2S_HardLink),
		.iM2S1 (Interconnect_iM2S1_Interconnect_iM2S_HardLink),
		.iS2M0 (Interconnect_iS2M0_Interconnect_iS2M_HardLink),
		.iS2M1 (Interconnect_iS2M1_Interconnect_iS2M_HardLink),
		.iS2M2 (Interconnect_iS2M2_Interconnect_iS2M_HardLink),
		.iS2M3 (Interconnect_iS2M3_Interconnect_iS2M_HardLink),
		.oM2S0 (Interconnect_oM2S0_Interconnect_oM2S_HardLink),
		.oM2S1 (Interconnect_oM2S1_Interconnect_oM2S_HardLink),
		.oM2S2 (Interconnect_oM2S2_Interconnect_oM2S_HardLink),
		.oM2S3 (Interconnect_oM2S3_Interconnect_oM2S_HardLink),
		.oS2M0 (Interconnect_oS2M0_Interconnect_oS2M_HardLink),
		.oS2M1 (Interconnect_oS2M1_Interconnect_oS2M_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_Memory
	AXISoCDualCoreModule_TopLevel_Memory
	(
		// [BEGIN USER MAP FOR Memory]
		// [END USER MAP FOR Memory]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S (Memory_M2S_Memory_M2S_HardLink),
		.S2M (Memory_S2M_Memory_S2M_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_Reg0
	AXISoCDualCoreModule_TopLevel_Reg0
	(
		// [BEGIN USER MAP FOR Reg0]
		// [END USER MAP FOR Reg0]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S (Reg0_M2S_Reg0_M2S_HardLink),
		.Reg (Reg0_Reg_Reg0_Reg_HardLink),
		.outACK (Reg0_outACK_Reg0_outACK_HardLink),
		.outData0 (Reg0_outData0_Reg0_outData_HardLink),
		.outData1 (Reg0_outData1_Reg0_outData_HardLink),
		.outData2 (Reg0_outData2_Reg0_outData_HardLink),
		.outData3 (Reg0_outData3_Reg0_outData_HardLink),
		.outWritten (Reg0_outWritten_Reg0_outWritten_HardLink),
		.S2M (Reg0_S2M_Reg0_S2M_HardLink)
	);
	AXISoCDualCoreModule_TopLevel_Reg1
	AXISoCDualCoreModule_TopLevel_Reg1
	(
		// [BEGIN USER MAP FOR Reg1]
		// [END USER MAP FOR Reg1]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.M2S (Reg1_M2S_Reg1_M2S_HardLink),
		.Reg (Reg1_Reg_Reg1_Reg_HardLink),
		.outACK (Reg1_outACK_Reg1_outACK_HardLink),
		.outData0 (Reg1_outData0_Reg1_outData_HardLink),
		.outData1 (Reg1_outData1_Reg1_outData_HardLink),
		.outData2 (Reg1_outData2_Reg1_outData_HardLink),
		.outData3 (Reg1_outData3_Reg1_outData_HardLink),
		.outWritten (Reg1_outWritten_Reg1_outWritten_HardLink),
		.S2M (Reg1_S2M_Reg1_S2M_HardLink)
	);
	assign AXISoCDualCoreModule_L46F33L49T14_Object[73:0] = Interconnect_oS2M[0];
	assign CPU0_S2M = AXISoCDualCoreModule_L46F33L49T14_Object[73:0];
	assign AXISoCDualCoreModule_L50F33L53T14_Object[73:0] = Interconnect_oS2M[1];
	assign CPU1_S2M = AXISoCDualCoreModule_L50F33L53T14_Object[73:0];
	assign AXISoCDualCoreModule_L55F35L58T14_Object[221:0] = Interconnect_oM2S[0];
	assign Memory_M2S = AXISoCDualCoreModule_L55F35L58T14_Object[221:0];
	assign AXISoCDualCoreModule_L59F49L62T14_Object[221:0] = Interconnect_oM2S[1];
	assign AutoIncrementCounter_M2S = AXISoCDualCoreModule_L59F49L62T14_Object[221:0];
	assign AXISoCDualCoreModule_L63F33L66T14_Object[221:0] = Interconnect_oM2S[2];
	assign AXISoCDualCoreModule_L63F33L66T14_Object[254:222] = AXI4RegisterModuleInputs_Reg;
	assign Reg0_Reg = AXISoCDualCoreModule_L63F33L66T14_Object[254:222];
	assign Reg0_M2S = AXISoCDualCoreModule_L63F33L66T14_Object[221:0];
	assign AXISoCDualCoreModule_L67F33L70T14_Object[221:0] = Interconnect_oM2S[3];
	assign AXISoCDualCoreModule_L67F33L70T14_Object[254:222] = AXI4RegisterModuleInputs_Reg;
	assign Reg1_Reg = AXISoCDualCoreModule_L67F33L70T14_Object[254:222];
	assign Reg1_M2S = AXISoCDualCoreModule_L67F33L70T14_Object[221:0];
	assign AXISoCDualCoreModule_L72F41L81T14_Object[443:0] = {
		CPU1_M2S,
		CPU0_M2S
	}
	;
	assign AXISoCDualCoreModule_L72F41L81T14_Object[739:444] = {
		Reg1_S2M,
		Reg0_S2M,
		AutoIncrementCounter_S2M,
		Memory_S2M
	}
	;
	assign Interconnect_iS2M[3] = AXISoCDualCoreModule_L72F41L81T14_Object[739:666];
	assign Interconnect_iS2M[2] = AXISoCDualCoreModule_L72F41L81T14_Object[665:592];
	assign Interconnect_iS2M[1] = AXISoCDualCoreModule_L72F41L81T14_Object[591:518];
	assign Interconnect_iS2M[0] = AXISoCDualCoreModule_L72F41L81T14_Object[517:444];
	assign Interconnect_iM2S[1] = AXISoCDualCoreModule_L72F41L81T14_Object[443:222];
	assign Interconnect_iM2S[0] = AXISoCDualCoreModule_L72F41L81T14_Object[221:0];
	assign AXISoCDualCoreModule_L83F37T66_Source = {
		Reg0_outData[3],
		Reg0_outData[2],
		Reg0_outData[1],
		Reg0_outData[0]
	}
	;
	assign oReg0 = AXISoCDualCoreModule_L83F37T66_Source;
	assign AXISoCDualCoreModule_L84F37T66_Source = {
		Reg1_outData[3],
		Reg1_outData[2],
		Reg1_outData[1],
		Reg1_outData[0]
	}
	;
	assign oReg1 = AXISoCDualCoreModule_L84F37T66_Source;
	assign AutoIncrementCounter_M2S_AutoIncrementCounter_M2S_HardLink = AutoIncrementCounter_M2S;
	assign AutoIncrementCounter_oCounter = AutoIncrementCounter_oCounter_AutoIncrementCounter_oCounter_HardLink;
	assign AutoIncrementCounter_outWritten = AutoIncrementCounter_outWritten_AutoIncrementCounter_outWritten_HardLink;
	assign AutoIncrementCounter_S2M = AutoIncrementCounter_S2M_AutoIncrementCounter_S2M_HardLink;
	assign CPU0_S2M_CPU0_S2M_HardLink = CPU0_S2M;
	assign CPU0_M2S = CPU0_M2S_CPU0_M2S_HardLink;
	assign CPU1_S2M_CPU1_S2M_HardLink = CPU1_S2M;
	assign CPU1_M2S = CPU1_M2S_CPU1_M2S_HardLink;
	assign Interconnect_iM2S0_Interconnect_iM2S_HardLink = Interconnect_iM2S[0];
	assign Interconnect_iM2S1_Interconnect_iM2S_HardLink = Interconnect_iM2S[1];
	assign Interconnect_iS2M0_Interconnect_iS2M_HardLink = Interconnect_iS2M[0];
	assign Interconnect_iS2M1_Interconnect_iS2M_HardLink = Interconnect_iS2M[1];
	assign Interconnect_iS2M2_Interconnect_iS2M_HardLink = Interconnect_iS2M[2];
	assign Interconnect_iS2M3_Interconnect_iS2M_HardLink = Interconnect_iS2M[3];
	assign Interconnect_oM2S[0] = Interconnect_oM2S0_Interconnect_oM2S_HardLink;
	assign Interconnect_oM2S[1] = Interconnect_oM2S1_Interconnect_oM2S_HardLink;
	assign Interconnect_oM2S[2] = Interconnect_oM2S2_Interconnect_oM2S_HardLink;
	assign Interconnect_oM2S[3] = Interconnect_oM2S3_Interconnect_oM2S_HardLink;
	assign Interconnect_oS2M[0] = Interconnect_oS2M0_Interconnect_oS2M_HardLink;
	assign Interconnect_oS2M[1] = Interconnect_oS2M1_Interconnect_oS2M_HardLink;
	assign Memory_M2S_Memory_M2S_HardLink = Memory_M2S;
	assign Memory_S2M = Memory_S2M_Memory_S2M_HardLink;
	assign Reg0_M2S_Reg0_M2S_HardLink = Reg0_M2S;
	assign Reg0_Reg_Reg0_Reg_HardLink = Reg0_Reg;
	assign Reg0_outACK = Reg0_outACK_Reg0_outACK_HardLink;
	assign Reg0_outData[0] = Reg0_outData0_Reg0_outData_HardLink;
	assign Reg0_outData[1] = Reg0_outData1_Reg0_outData_HardLink;
	assign Reg0_outData[2] = Reg0_outData2_Reg0_outData_HardLink;
	assign Reg0_outData[3] = Reg0_outData3_Reg0_outData_HardLink;
	assign Reg0_outWritten = Reg0_outWritten_Reg0_outWritten_HardLink;
	assign Reg0_S2M = Reg0_S2M_Reg0_S2M_HardLink;
	assign Reg1_M2S_Reg1_M2S_HardLink = Reg1_M2S;
	assign Reg1_Reg_Reg1_Reg_HardLink = Reg1_Reg;
	assign Reg1_outACK = Reg1_outACK_Reg1_outACK_HardLink;
	assign Reg1_outData[0] = Reg1_outData0_Reg1_outData_HardLink;
	assign Reg1_outData[1] = Reg1_outData1_Reg1_outData_HardLink;
	assign Reg1_outData[2] = Reg1_outData2_Reg1_outData_HardLink;
	assign Reg1_outData[3] = Reg1_outData3_Reg1_outData_HardLink;
	assign Reg1_outWritten = Reg1_outWritten_Reg1_outWritten_HardLink;
	assign Reg1_S2M = Reg1_S2M_Reg1_S2M_HardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule