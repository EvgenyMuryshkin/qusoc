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
// System configuration name is Increment_TopLevel_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module Increment_TopLevel_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	output wire [31:0] Counter
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire QuSoCModule_L106F13L119T14_QuSoCModule_L107F34T39_Expr = 1'b0;
	wire QuSoCModule_L106F13L119T14_QuSoCModule_L108F32T33_Expr = 1'b0;
	wire [1: 0] QuSoCModule_L106F13L119T14_QuSoCModule_L110F17L116T18_CombinedModuleIsActive_Size = 2'b10;
	wire QuSoCModule_L77F31T33_Expr = 1'b0;
	wire RISCVModule_Types_L11F30T35_Expr = 1'b0;
	wire QuSoCModule_L85F33T43_Expr = 1'b0;
	wire [31: 0] Increment_generated_L15F104T114_Expr = 32'b10000000000000000000000000000000;
	wire QuSoCModule_L131F9L151T10_QuSoCModule_L139F13L150T14_QuSoCModule_L145F17L149T18_QuSoCModule_L148F42T46_Expr = 1'b1;
	reg NextState_MemReady;
	wire [7: 0] BusCS_Item1;
	wire BusCS_Item2;
	wire [1: 0] CombinedModuleIsActive;
	wire HasActiveModule;
	wire [1: 0] internalMemAccessMode;
	wire internalMemReady;
	wire internalModuleIsReady;
	wire [31: 0] internalModuleReadData;
	wire [31: 0] ModuleCommon_Address;
	wire [1: 0] ModuleCommon_MemAccessMode;
	wire ModuleCommon_RE;
	wire ModuleCommon_WE;
	wire [31: 0] ModuleCommon_WriteValue;
	wire [7: 0] ModuleIndex;
	wire [31: 0] CPU_BaseAddress;
	wire CPU_ExtIRQ;
	wire [31: 0] CPU_MemReadData;
	wire CPU_MemReady;
	wire CPU_IsHalted;
	wire [2: 0] CPU_MemAccessMode;
	wire [31: 0] CPU_MemAddress;
	wire CPU_MemRead;
	wire CPU_MemWrite;
	wire [31: 0] CPU_MemWriteData;
	wire [67: 0] InstructionsRAM_Common;
	wire [31: 0] InstructionsRAM_DeviceAddress;
	wire InstructionsRAM_IsActive;
	wire InstructionsRAM_IsReady;
	wire [31: 0] InstructionsRAM_ReadValue;
	wire [67: 0] CounterModule_Common;
	wire [31: 0] CounterModule_DeviceAddress;
	wire CounterModule_IsActive;
	wire CounterModule_IsReady;
	wire [31: 0] CounterModule_ReadValue;
	wire [31: 0] CounterModule_Value;
	reg QuSoCModule_L106F13L119T14_hasActive;
	reg [7: 0] QuSoCModule_L106F13L119T14_address;
	integer idx;
	wire [1: 0] QuSoCModule_L44F47T98_Source;
	wire [31: 0] CPU_BaseAddress_CPU_BaseAddress_HardLink;
	wire CPU_ExtIRQ_CPU_ExtIRQ_HardLink;
	wire [31: 0] CPU_MemReadData_CPU_MemReadData_HardLink;
	wire CPU_MemReady_CPU_MemReady_HardLink;
	wire CPU_IsHalted_CPU_IsHalted_HardLink;
	wire [2: 0] CPU_MemAccessMode_CPU_MemAccessMode_HardLink;
	wire [31: 0] CPU_MemAddress_CPU_MemAddress_HardLink;
	wire CPU_MemRead_CPU_MemRead_HardLink;
	wire CPU_MemWrite_CPU_MemWrite_HardLink;
	wire [31: 0] CPU_MemWriteData_CPU_MemWriteData_HardLink;
	wire [67: 0] InstructionsRAM_Common_InstructionsRAM_Common_HardLink;
	wire [31: 0] InstructionsRAM_DeviceAddress_InstructionsRAM_DeviceAddress_HardLink;
	wire InstructionsRAM_IsActive_InstructionsRAM_IsActive_HardLink;
	wire InstructionsRAM_IsReady_InstructionsRAM_IsReady_HardLink;
	wire [31: 0] InstructionsRAM_ReadValue_InstructionsRAM_ReadValue_HardLink;
	wire [67: 0] CounterModule_Common_CounterModule_Common_HardLink;
	wire [31: 0] CounterModule_DeviceAddress_CounterModule_DeviceAddress_HardLink;
	wire CounterModule_IsActive_CounterModule_IsActive_HardLink;
	wire CounterModule_IsReady_CounterModule_IsReady_HardLink;
	wire [31: 0] CounterModule_ReadValue_CounterModule_ReadValue_HardLink;
	wire [31: 0] CounterModule_Value_CounterModule_Value_HardLink;
	reg State_MemReady = 1'b0;
	wire State_MemReadyDefault = 1'b0;
	reg QuSoCModule_L126F39T70_Mux;
	reg [31: 0] QuSoCModule_L125F40T73_Mux;
	wire [0: 0] QuSoCModule_L126F39T70_MuxMultiplexerAddress;
	wire QuSoCModule_L126F39T70_Mux1;
	wire QuSoCModule_L126F39T70_Mux2;
	wire [0: 0] QuSoCModule_L125F40T73_MuxMultiplexerAddress;
	wire [31: 0] QuSoCModule_L125F40T73_Mux1;
	wire [31: 0] QuSoCModule_L125F40T73_Mux2;
	wire QuSoCModule_L44F63T97_Enumerable [0 : 1];
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
			State_MemReady <= State_MemReadyDefault;
		end
		else
		begin
			State_MemReady <= NextState_MemReady;
		end
	end
	Increment_TopLevel_TopLevel_CPU
	Increment_TopLevel_TopLevel_CPU
	(
		// [BEGIN USER MAP FOR CPU]
		// [END USER MAP FOR CPU]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.BaseAddress (CPU_BaseAddress_CPU_BaseAddress_HardLink),
		.ExtIRQ (CPU_ExtIRQ_CPU_ExtIRQ_HardLink),
		.MemReadData (CPU_MemReadData_CPU_MemReadData_HardLink),
		.MemReady (CPU_MemReady_CPU_MemReady_HardLink),
		.IsHalted (CPU_IsHalted_CPU_IsHalted_HardLink),
		.MemAccessMode (CPU_MemAccessMode_CPU_MemAccessMode_HardLink),
		.MemAddress (CPU_MemAddress_CPU_MemAddress_HardLink),
		.MemRead (CPU_MemRead_CPU_MemRead_HardLink),
		.MemWrite (CPU_MemWrite_CPU_MemWrite_HardLink),
		.MemWriteData (CPU_MemWriteData_CPU_MemWriteData_HardLink)
	);
	Increment_TopLevel_TopLevel_InstructionsRAM
	Increment_TopLevel_TopLevel_InstructionsRAM
	(
		// [BEGIN USER MAP FOR InstructionsRAM]
		// [END USER MAP FOR InstructionsRAM]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.Common (InstructionsRAM_Common_InstructionsRAM_Common_HardLink),
		.DeviceAddress (InstructionsRAM_DeviceAddress_InstructionsRAM_DeviceAddress_HardLink),
		.IsActive (InstructionsRAM_IsActive_InstructionsRAM_IsActive_HardLink),
		.IsReady (InstructionsRAM_IsReady_InstructionsRAM_IsReady_HardLink),
		.ReadValue (InstructionsRAM_ReadValue_InstructionsRAM_ReadValue_HardLink)
	);
	Increment_TopLevel_TopLevel_CounterModule
	Increment_TopLevel_TopLevel_CounterModule
	(
		// [BEGIN USER MAP FOR CounterModule]
		// [END USER MAP FOR CounterModule]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.Common (CounterModule_Common_CounterModule_Common_HardLink),
		.DeviceAddress (CounterModule_DeviceAddress_CounterModule_DeviceAddress_HardLink),
		.IsActive (CounterModule_IsActive_CounterModule_IsActive_HardLink),
		.IsReady (CounterModule_IsReady_CounterModule_IsReady_HardLink),
		.ReadValue (CounterModule_ReadValue_CounterModule_ReadValue_HardLink),
		.Value (CounterModule_Value_CounterModule_Value_HardLink)
	);
	always @ (*)
	begin
		case (QuSoCModule_L126F39T70_MuxMultiplexerAddress)
			'b0:
			begin
				QuSoCModule_L126F39T70_Mux = QuSoCModule_L126F39T70_Mux1;
			end
			'b1:
			begin
				QuSoCModule_L126F39T70_Mux = QuSoCModule_L126F39T70_Mux2;
			end
			default:
			begin
				QuSoCModule_L126F39T70_Mux = 'b0;
			end
		endcase
	end
	always @ (*)
	begin
		case (QuSoCModule_L125F40T73_MuxMultiplexerAddress)
			'b0:
			begin
				QuSoCModule_L125F40T73_Mux = QuSoCModule_L125F40T73_Mux1;
			end
			'b1:
			begin
				QuSoCModule_L125F40T73_Mux = QuSoCModule_L125F40T73_Mux2;
			end
			default:
			begin
				QuSoCModule_L125F40T73_Mux = 'b00000000000000000000000000000000;
			end
		endcase
	end
	always @ (*)
	begin
		idx = 0;
		QuSoCModule_L106F13L119T14_hasActive = QuSoCModule_L106F13L119T14_QuSoCModule_L107F34T39_Expr;
		QuSoCModule_L106F13L119T14_address = { {7{1'b0}}, QuSoCModule_L106F13L119T14_QuSoCModule_L108F32T33_Expr };
		for (idx = 0; (idx < 2); idx = (idx + 1))
		begin
			QuSoCModule_L106F13L119T14_hasActive = (QuSoCModule_L106F13L119T14_hasActive | CombinedModuleIsActive[idx]);
			if (CombinedModuleIsActive[idx])
			begin
				QuSoCModule_L106F13L119T14_address = idx;
			end
		end
	end
	always @ (*)
	begin
		NextState_MemReady = State_MemReady;
		NextState_MemReady = CPU_MemRead;
		if ((CPU_MemWrite == 1))
		begin
			if ((HasActiveModule == 1))
			begin
				NextState_MemReady = internalModuleIsReady;
			end
			else
			begin
				NextState_MemReady = QuSoCModule_L131F9L151T10_QuSoCModule_L139F13L150T14_QuSoCModule_L145F17L149T18_QuSoCModule_L148F42T46_Expr;
			end
		end
	end
	assign BusCS_Item1 = QuSoCModule_L106F13L119T14_address;
	assign BusCS_Item2 = QuSoCModule_L106F13L119T14_hasActive;
	assign QuSoCModule_L44F63T97_Enumerable[0] = InstructionsRAM_IsActive;
	assign QuSoCModule_L44F63T97_Enumerable[1] = CounterModule_IsActive;
	assign QuSoCModule_L44F47T98_Source = { QuSoCModule_L44F63T97_Enumerable[1], QuSoCModule_L44F63T97_Enumerable[0] };
	assign CombinedModuleIsActive = QuSoCModule_L44F47T98_Source;
	assign HasActiveModule = BusCS_Item2;
	assign internalMemAccessMode = CPU_MemAccessMode[1:0];
	assign internalMemReady = State_MemReady;
	assign internalModuleIsReady = QuSoCModule_L126F39T70_Mux;
	assign internalModuleReadData = QuSoCModule_L125F40T73_Mux;
	assign ModuleCommon_Address = CPU_MemAddress;
	assign ModuleCommon_MemAccessMode = internalMemAccessMode;
	assign ModuleCommon_RE = CPU_MemRead;
	assign ModuleCommon_WE = CPU_MemWrite;
	assign ModuleCommon_WriteValue = CPU_MemWriteData;
	assign ModuleIndex = BusCS_Item1;
	assign CPU_BaseAddress = { {31{1'b0}}, QuSoCModule_L77F31T33_Expr };
	assign CPU_ExtIRQ = RISCVModule_Types_L11F30T35_Expr;
	assign CPU_MemReadData = internalModuleReadData;
	assign CPU_MemReady = internalMemReady;
	assign InstructionsRAM_Common[67:36] = ModuleCommon_WriteValue;
	assign InstructionsRAM_Common[35] = ModuleCommon_WE;
	assign InstructionsRAM_Common[34] = ModuleCommon_RE;
	assign InstructionsRAM_Common[33:32] = ModuleCommon_MemAccessMode;
	assign InstructionsRAM_Common[31:0] = ModuleCommon_Address;
	assign InstructionsRAM_DeviceAddress = { {31{1'b0}}, QuSoCModule_L85F33T43_Expr };
	assign CounterModule_Common[67:36] = ModuleCommon_WriteValue;
	assign CounterModule_Common[35] = ModuleCommon_WE;
	assign CounterModule_Common[34] = ModuleCommon_RE;
	assign CounterModule_Common[33:32] = ModuleCommon_MemAccessMode;
	assign CounterModule_Common[31:0] = ModuleCommon_Address;
	assign CounterModule_DeviceAddress = Increment_generated_L15F104T114_Expr;
	assign Counter = CounterModule_Value;
	assign CPU_BaseAddress_CPU_BaseAddress_HardLink = CPU_BaseAddress;
	assign CPU_ExtIRQ_CPU_ExtIRQ_HardLink = CPU_ExtIRQ;
	assign CPU_MemReadData_CPU_MemReadData_HardLink = CPU_MemReadData;
	assign CPU_MemReady_CPU_MemReady_HardLink = CPU_MemReady;
	assign CPU_IsHalted = CPU_IsHalted_CPU_IsHalted_HardLink;
	assign CPU_MemAccessMode = CPU_MemAccessMode_CPU_MemAccessMode_HardLink;
	assign CPU_MemAddress = CPU_MemAddress_CPU_MemAddress_HardLink;
	assign CPU_MemRead = CPU_MemRead_CPU_MemRead_HardLink;
	assign CPU_MemWrite = CPU_MemWrite_CPU_MemWrite_HardLink;
	assign CPU_MemWriteData = CPU_MemWriteData_CPU_MemWriteData_HardLink;
	assign InstructionsRAM_Common_InstructionsRAM_Common_HardLink = InstructionsRAM_Common;
	assign InstructionsRAM_DeviceAddress_InstructionsRAM_DeviceAddress_HardLink = InstructionsRAM_DeviceAddress;
	assign InstructionsRAM_IsActive = InstructionsRAM_IsActive_InstructionsRAM_IsActive_HardLink;
	assign InstructionsRAM_IsReady = InstructionsRAM_IsReady_InstructionsRAM_IsReady_HardLink;
	assign InstructionsRAM_ReadValue = InstructionsRAM_ReadValue_InstructionsRAM_ReadValue_HardLink;
	assign CounterModule_Common_CounterModule_Common_HardLink = CounterModule_Common;
	assign CounterModule_DeviceAddress_CounterModule_DeviceAddress_HardLink = CounterModule_DeviceAddress;
	assign CounterModule_IsActive = CounterModule_IsActive_CounterModule_IsActive_HardLink;
	assign CounterModule_IsReady = CounterModule_IsReady_CounterModule_IsReady_HardLink;
	assign CounterModule_ReadValue = CounterModule_ReadValue_CounterModule_ReadValue_HardLink;
	assign CounterModule_Value = CounterModule_Value_CounterModule_Value_HardLink;
	assign QuSoCModule_L126F39T70_Mux1 = InstructionsRAM_IsReady;
	assign QuSoCModule_L126F39T70_Mux2 = CounterModule_IsReady;
	assign QuSoCModule_L126F39T70_MuxMultiplexerAddress = ModuleIndex[0];
	assign QuSoCModule_L125F40T73_Mux1 = InstructionsRAM_ReadValue;
	assign QuSoCModule_L125F40T73_Mux2 = CounterModule_ReadValue;
	assign QuSoCModule_L125F40T73_MuxMultiplexerAddress = ModuleIndex[0];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
