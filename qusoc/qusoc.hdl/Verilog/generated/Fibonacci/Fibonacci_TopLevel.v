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
// System configuration name is Fibonacci_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module Fibonacci_TopLevel (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  Clock,
	input wire  Reset,
	output wire [31: 0] Counter
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  QuSoCModule_L108F13L121T14_QuSoCModule_L109F34T39_Expr = 1'b0;
wire  QuSoCModule_L108F13L121T14_QuSoCModule_L110F32T33_Expr = 1'b0;
wire  [1:0] QuSoCModule_L108F13L121T14_CombinedModuleIsActive_Size = 2'b10;
wire  QuSoCModule_L79F31T33_Expr = 1'b0;
wire  RISCVModule_Types_L11F30T35_Expr = 1'b0;
wire  QuSoCModule_L87F33T43_Expr = 1'b0;
wire  [31:0] Fibonacci_generated_L15F104T114_Expr = 32'b10000000000000000000000000000000;
wire  QuSoCModule_L133F9L153T10_QuSoCModule_L141F13L152T14_QuSoCModule_L147F17L151T18_QuSoCModule_L150F42T46_Expr = 1'b1;
reg  NextState_MemReady;
wire  [1:0] CombinedModuleIsActive;
wire  [1:0] internalMemAccessMode;
wire  [31:0] ModuleCommon_Address;
wire  [31:0] ModuleCommon_WriteValue;
wire  ModuleCommon_WE;
wire  ModuleCommon_RE;
wire  [1:0] ModuleCommon_MemAccessMode;
wire  [7:0] BusCS_Item1;
wire  BusCS_Item2;
wire  [7:0] ModuleIndex;
wire  HasActiveModule;
wire  [31:0] internalModuleReadData;
wire  internalModuleIsReady;
wire  internalMemReady;
wire  [31:0] CPU_BaseAddress;
wire  [31:0] CPU_MemReadData;
wire  CPU_MemReady;
wire  CPU_ExtIRQ;
wire  CPU_IsHalted;
wire  [31:0] CPU_MemWriteData;
wire  [2:0] CPU_MemAccessMode;
wire  CPU_MemRead;
wire  CPU_MemWrite;
wire  [31:0] CPU_MemAddress;
wire  [31:0] InstructionsRAM_Common_Address;
wire  [31:0] InstructionsRAM_Common_WriteValue;
wire  InstructionsRAM_Common_WE;
wire  InstructionsRAM_Common_RE;
wire  [1:0] InstructionsRAM_Common_MemAccessMode;
wire  [31:0] InstructionsRAM_DeviceAddress;
wire  [31:0] InstructionsRAM_ReadValue;
wire  InstructionsRAM_IsReady;
wire  InstructionsRAM_IsActive;
wire  [31:0] CounterModule_Common_Address;
wire  [31:0] CounterModule_Common_WriteValue;
wire  CounterModule_Common_WE;
wire  CounterModule_Common_RE;
wire  [1:0] CounterModule_Common_MemAccessMode;
wire  [31:0] CounterModule_DeviceAddress;
wire  [31:0] CounterModule_ReadValue;
wire  CounterModule_IsReady;
wire  CounterModule_IsActive;
wire  [31:0] CounterModule_Value;
wire  [1:0] QuSoCModule_L46F47T98_Source;
wire  [1:0] QuSoCModule_L47F46T69_Index;
reg  QuSoCModule_L108F13L121T14_hasActive;
reg  [7:0] QuSoCModule_L108F13L121T14_address;
integer QuSoCModule_L108F13L121T14_idx;
wire  [31:0] CPUBaseAddressCPU_BaseAddressHardLink;
wire  [31:0] CPUMemReadDataCPU_MemReadDataHardLink;
wire  CPUMemReadyCPU_MemReadyHardLink;
wire  CPUExtIRQCPU_ExtIRQHardLink;
wire  CPUIsHaltedCPU_IsHaltedHardLink;
wire  [31:0] CPUMemWriteDataCPU_MemWriteDataHardLink;
wire  [2:0] CPUMemAccessModeCPU_MemAccessModeHardLink;
wire  CPUMemReadCPU_MemReadHardLink;
wire  CPUMemWriteCPU_MemWriteHardLink;
wire  [31:0] CPUMemAddressCPU_MemAddressHardLink;
wire  [31:0] InstructionsRAMCommon_AddressInstructionsRAM_Common_AddressHardLink;
wire  [31:0] InstructionsRAMCommon_WriteValueInstructionsRAM_Common_WriteValueHardLink;
wire  InstructionsRAMCommon_WEInstructionsRAM_Common_WEHardLink;
wire  InstructionsRAMCommon_REInstructionsRAM_Common_REHardLink;
wire  [1:0] InstructionsRAMCommon_MemAccessModeInstructionsRAM_Common_MemAccessModeHardLink;
wire  [31:0] InstructionsRAMDeviceAddressInstructionsRAM_DeviceAddressHardLink;
wire  [31:0] InstructionsRAMReadValueInstructionsRAM_ReadValueHardLink;
wire  InstructionsRAMIsReadyInstructionsRAM_IsReadyHardLink;
wire  InstructionsRAMIsActiveInstructionsRAM_IsActiveHardLink;
wire  [31:0] CounterModuleCommon_AddressCounterModule_Common_AddressHardLink;
wire  [31:0] CounterModuleCommon_WriteValueCounterModule_Common_WriteValueHardLink;
wire  CounterModuleCommon_WECounterModule_Common_WEHardLink;
wire  CounterModuleCommon_RECounterModule_Common_REHardLink;
wire  [1:0] CounterModuleCommon_MemAccessModeCounterModule_Common_MemAccessModeHardLink;
wire  [31:0] CounterModuleDeviceAddressCounterModule_DeviceAddressHardLink;
wire  [31:0] CounterModuleReadValueCounterModule_ReadValueHardLink;
wire  CounterModuleIsReadyCounterModule_IsReadyHardLink;
wire  CounterModuleIsActiveCounterModule_IsActiveHardLink;
wire  [31:0] CounterModuleValueCounterModule_ValueHardLink;
reg  State_MemReady = 1'b0;
wire  State_MemReadyDefault = 1'b0;
wire  [1:0] QuSoCModule_L46F47T109_Expr;
wire  [1:0] QuSoCModule_L46F47T109_Expr_1;
reg  [31:0] QuSoCModule_L127F40T73_Mux;
reg  QuSoCModule_L128F39T70_Mux;
wire  QuSoCModule_L127F40T73_MuxMultiplexerAddress;
wire  [31:0] QuSoCModule_L127F40T73_Mux1;
wire  [31:0] QuSoCModule_L127F40T73_Mux2;
wire  QuSoCModule_L128F39T70_MuxMultiplexerAddress;
wire  QuSoCModule_L128F39T70_Mux1;
wire  QuSoCModule_L128F39T70_Mux2;
wire  BoardSignals_Clock;
wire  BoardSignals_Reset;
wire  BoardSignals_Running;
wire  BoardSignals_Starting;
wire  BoardSignals_Started;
reg  InternalReset = 1'b0;
work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock,BoardSignals_Reset,BoardSignals_Running,BoardSignals_Starting,BoardSignals_Started,Clock,Reset,InternalReset);
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
State_MemReady <= State_MemReadyDefault;
end
else begin
State_MemReady <= NextState_MemReady;
end
end

    genvar LogicalFunctionLogicalFunction1_idx;
    generate
    for (LogicalFunctionLogicalFunction1_idx = 1; LogicalFunctionLogicalFunction1_idx >= 0; LogicalFunctionLogicalFunction1_idx = LogicalFunctionLogicalFunction1_idx - 1)
    begin : LogicalFunctionLogicalFunction1_idxReverse
assign QuSoCModule_L46F47T109_Expr[LogicalFunctionLogicalFunction1_idx] = QuSoCModule_L46F47T109_Expr_1[1 - LogicalFunctionLogicalFunction1_idx];
end
    endgenerate

Fibonacci_TopLevel_Fibonacci_CPU Fibonacci_TopLevel_Fibonacci_CPU
(
// [BEGIN USER MAP FOR CPU]
// [END USER MAP FOR CPU]
	.BoardSignals_Clock (BoardSignals_Clock),
	.BoardSignals_Reset (BoardSignals_Reset),
	.BoardSignals_Running (BoardSignals_Running),
	.BoardSignals_Starting (BoardSignals_Starting),
	.BoardSignals_Started (BoardSignals_Started),
	.BaseAddress (CPUBaseAddressCPU_BaseAddressHardLink),
	.MemReadData (CPUMemReadDataCPU_MemReadDataHardLink),
	.MemReady (CPUMemReadyCPU_MemReadyHardLink),
	.ExtIRQ (CPUExtIRQCPU_ExtIRQHardLink),
	.IsHalted (CPUIsHaltedCPU_IsHaltedHardLink),
	.MemWriteData (CPUMemWriteDataCPU_MemWriteDataHardLink),
	.MemAccessMode (CPUMemAccessModeCPU_MemAccessModeHardLink),
	.MemRead (CPUMemReadCPU_MemReadHardLink),
	.MemWrite (CPUMemWriteCPU_MemWriteHardLink),
	.MemAddress (CPUMemAddressCPU_MemAddressHardLink)

);
Fibonacci_TopLevel_Fibonacci_InstructionsRAM Fibonacci_TopLevel_Fibonacci_InstructionsRAM
(
// [BEGIN USER MAP FOR InstructionsRAM]
// [END USER MAP FOR InstructionsRAM]
	.BoardSignals_Clock (BoardSignals_Clock),
	.BoardSignals_Reset (BoardSignals_Reset),
	.BoardSignals_Running (BoardSignals_Running),
	.BoardSignals_Starting (BoardSignals_Starting),
	.BoardSignals_Started (BoardSignals_Started),
	.Common_Address (InstructionsRAMCommon_AddressInstructionsRAM_Common_AddressHardLink),
	.Common_WriteValue (InstructionsRAMCommon_WriteValueInstructionsRAM_Common_WriteValueHardLink),
	.Common_WE (InstructionsRAMCommon_WEInstructionsRAM_Common_WEHardLink),
	.Common_RE (InstructionsRAMCommon_REInstructionsRAM_Common_REHardLink),
	.Common_MemAccessMode (InstructionsRAMCommon_MemAccessModeInstructionsRAM_Common_MemAccessModeHardLink),
	.DeviceAddress (InstructionsRAMDeviceAddressInstructionsRAM_DeviceAddressHardLink),
	.ReadValue (InstructionsRAMReadValueInstructionsRAM_ReadValueHardLink),
	.IsReady (InstructionsRAMIsReadyInstructionsRAM_IsReadyHardLink),
	.IsActive (InstructionsRAMIsActiveInstructionsRAM_IsActiveHardLink)

);
Fibonacci_TopLevel_Fibonacci_CounterModule Fibonacci_TopLevel_Fibonacci_CounterModule
(
// [BEGIN USER MAP FOR CounterModule]
// [END USER MAP FOR CounterModule]
	.BoardSignals_Clock (BoardSignals_Clock),
	.BoardSignals_Reset (BoardSignals_Reset),
	.BoardSignals_Running (BoardSignals_Running),
	.BoardSignals_Starting (BoardSignals_Starting),
	.BoardSignals_Started (BoardSignals_Started),
	.Common_Address (CounterModuleCommon_AddressCounterModule_Common_AddressHardLink),
	.Common_WriteValue (CounterModuleCommon_WriteValueCounterModule_Common_WriteValueHardLink),
	.Common_WE (CounterModuleCommon_WECounterModule_Common_WEHardLink),
	.Common_RE (CounterModuleCommon_RECounterModule_Common_REHardLink),
	.Common_MemAccessMode (CounterModuleCommon_MemAccessModeCounterModule_Common_MemAccessModeHardLink),
	.DeviceAddress (CounterModuleDeviceAddressCounterModule_DeviceAddressHardLink),
	.ReadValue (CounterModuleReadValueCounterModule_ReadValueHardLink),
	.IsReady (CounterModuleIsReadyCounterModule_IsReadyHardLink),
	.IsActive (CounterModuleIsActiveCounterModule_IsActiveHardLink),
	.Value (CounterModuleValueCounterModule_ValueHardLink)

);
always @*
begin
case (QuSoCModule_L127F40T73_MuxMultiplexerAddress)
    'b0:
QuSoCModule_L127F40T73_Mux = QuSoCModule_L127F40T73_Mux1;
    'b1:
QuSoCModule_L127F40T73_Mux = QuSoCModule_L127F40T73_Mux2;
  default:
QuSoCModule_L127F40T73_Mux = 'b00000000000000000000000000000000;
endcase

end
always @*
begin
case (QuSoCModule_L128F39T70_MuxMultiplexerAddress)
    'b0:
QuSoCModule_L128F39T70_Mux = QuSoCModule_L128F39T70_Mux1;
    'b1:
QuSoCModule_L128F39T70_Mux = QuSoCModule_L128F39T70_Mux2;
  default:
QuSoCModule_L128F39T70_Mux = 'b0;
endcase

end
always @*
begin
QuSoCModule_L108F13L121T14_hasActive = QuSoCModule_L108F13L121T14_QuSoCModule_L109F34T39_Expr;
QuSoCModule_L108F13L121T14_address = { {7{1'b0}}, QuSoCModule_L108F13L121T14_QuSoCModule_L110F32T33_Expr }/*expand*/;
for (QuSoCModule_L108F13L121T14_idx = 0; QuSoCModule_L108F13L121T14_idx < 2; QuSoCModule_L108F13L121T14_idx = QuSoCModule_L108F13L121T14_idx + 1)
begin
QuSoCModule_L108F13L121T14_hasActive = QuSoCModule_L108F13L121T14_hasActive | CombinedModuleIsActive[QuSoCModule_L108F13L121T14_idx];
if (CombinedModuleIsActive[QuSoCModule_L108F13L121T14_idx])
begin
QuSoCModule_L108F13L121T14_address = QuSoCModule_L108F13L121T14_idx;
end
end

end
always @*
begin
NextState_MemReady = State_MemReady;
NextState_MemReady = CPU_MemRead;
if ( CPU_MemWrite == 1 ) begin
if ( HasActiveModule == 1 ) begin
NextState_MemReady = internalModuleIsReady;
end
else begin
NextState_MemReady = QuSoCModule_L133F9L153T10_QuSoCModule_L141F13L152T14_QuSoCModule_L147F17L151T18_QuSoCModule_L150F42T46_Expr;
end
end

end
assign QuSoCModule_L46F47T109_Expr_1 = QuSoCModule_L46F47T98_Source;
assign QuSoCModule_L46F47T98_Source[0] = CounterModule_IsActive;
assign QuSoCModule_L46F47T98_Source[1] = InstructionsRAM_IsActive;
assign CombinedModuleIsActive = QuSoCModule_L46F47T109_Expr;
assign QuSoCModule_L47F46T69_Index = CPU_MemAccessMode[1:0];
assign internalMemAccessMode = QuSoCModule_L47F46T69_Index;
assign ModuleCommon_Address = CPU_MemAddress;
assign ModuleCommon_WriteValue = CPU_MemWriteData;
assign ModuleCommon_WE = CPU_MemWrite;
assign ModuleCommon_RE = CPU_MemRead;
assign ModuleCommon_MemAccessMode = internalMemAccessMode;
assign BusCS_Item1 = QuSoCModule_L108F13L121T14_address;
assign BusCS_Item2 = QuSoCModule_L108F13L121T14_hasActive;
assign ModuleIndex = BusCS_Item1;
assign HasActiveModule = BusCS_Item2;
assign internalModuleReadData = QuSoCModule_L127F40T73_Mux;
assign internalModuleIsReady = QuSoCModule_L128F39T70_Mux;
assign internalMemReady = State_MemReady;
assign CPU_BaseAddress = { {31{1'b0}}, QuSoCModule_L79F31T33_Expr }/*expand*/;
assign CPU_MemReadData = internalModuleReadData;
assign CPU_MemReady = internalMemReady;
assign CPU_ExtIRQ = RISCVModule_Types_L11F30T35_Expr;
assign InstructionsRAM_Common_Address = ModuleCommon_Address;
assign InstructionsRAM_Common_WriteValue = ModuleCommon_WriteValue;
assign InstructionsRAM_Common_WE = ModuleCommon_WE;
assign InstructionsRAM_Common_RE = ModuleCommon_RE;
assign InstructionsRAM_Common_MemAccessMode = ModuleCommon_MemAccessMode;
assign InstructionsRAM_DeviceAddress = { {31{1'b0}}, QuSoCModule_L87F33T43_Expr }/*expand*/;
assign CounterModule_Common_Address = ModuleCommon_Address;
assign CounterModule_Common_WriteValue = ModuleCommon_WriteValue;
assign CounterModule_Common_WE = ModuleCommon_WE;
assign CounterModule_Common_RE = ModuleCommon_RE;
assign CounterModule_Common_MemAccessMode = ModuleCommon_MemAccessMode;
assign CounterModule_DeviceAddress = Fibonacci_generated_L15F104T114_Expr;
assign Counter = CounterModule_Value;
assign CPUBaseAddressCPU_BaseAddressHardLink = CPU_BaseAddress;
assign CPUMemReadDataCPU_MemReadDataHardLink = CPU_MemReadData;
assign CPUMemReadyCPU_MemReadyHardLink = CPU_MemReady;
assign CPUExtIRQCPU_ExtIRQHardLink = CPU_ExtIRQ;
assign CPU_IsHalted = CPUIsHaltedCPU_IsHaltedHardLink;
assign CPU_MemWriteData = CPUMemWriteDataCPU_MemWriteDataHardLink;
assign CPU_MemAccessMode = CPUMemAccessModeCPU_MemAccessModeHardLink;
assign CPU_MemRead = CPUMemReadCPU_MemReadHardLink;
assign CPU_MemWrite = CPUMemWriteCPU_MemWriteHardLink;
assign CPU_MemAddress = CPUMemAddressCPU_MemAddressHardLink;
assign InstructionsRAMCommon_AddressInstructionsRAM_Common_AddressHardLink = InstructionsRAM_Common_Address;
assign InstructionsRAMCommon_WriteValueInstructionsRAM_Common_WriteValueHardLink = InstructionsRAM_Common_WriteValue;
assign InstructionsRAMCommon_WEInstructionsRAM_Common_WEHardLink = InstructionsRAM_Common_WE;
assign InstructionsRAMCommon_REInstructionsRAM_Common_REHardLink = InstructionsRAM_Common_RE;
assign InstructionsRAMCommon_MemAccessModeInstructionsRAM_Common_MemAccessModeHardLink = InstructionsRAM_Common_MemAccessMode;
assign InstructionsRAMDeviceAddressInstructionsRAM_DeviceAddressHardLink = InstructionsRAM_DeviceAddress;
assign InstructionsRAM_ReadValue = InstructionsRAMReadValueInstructionsRAM_ReadValueHardLink;
assign InstructionsRAM_IsReady = InstructionsRAMIsReadyInstructionsRAM_IsReadyHardLink;
assign InstructionsRAM_IsActive = InstructionsRAMIsActiveInstructionsRAM_IsActiveHardLink;
assign CounterModuleCommon_AddressCounterModule_Common_AddressHardLink = CounterModule_Common_Address;
assign CounterModuleCommon_WriteValueCounterModule_Common_WriteValueHardLink = CounterModule_Common_WriteValue;
assign CounterModuleCommon_WECounterModule_Common_WEHardLink = CounterModule_Common_WE;
assign CounterModuleCommon_RECounterModule_Common_REHardLink = CounterModule_Common_RE;
assign CounterModuleCommon_MemAccessModeCounterModule_Common_MemAccessModeHardLink = CounterModule_Common_MemAccessMode;
assign CounterModuleDeviceAddressCounterModule_DeviceAddressHardLink = CounterModule_DeviceAddress;
assign CounterModule_ReadValue = CounterModuleReadValueCounterModule_ReadValueHardLink;
assign CounterModule_IsReady = CounterModuleIsReadyCounterModule_IsReadyHardLink;
assign CounterModule_IsActive = CounterModuleIsActiveCounterModule_IsActiveHardLink;
assign CounterModule_Value = CounterModuleValueCounterModule_ValueHardLink;
assign QuSoCModule_L127F40T73_Mux1 = InstructionsRAM_ReadValue;
assign QuSoCModule_L127F40T73_Mux2 = CounterModule_ReadValue;
assign QuSoCModule_L127F40T73_MuxMultiplexerAddress = ModuleIndex[0];
assign QuSoCModule_L128F39T70_Mux1 = InstructionsRAM_IsReady;
assign QuSoCModule_L128F39T70_Mux2 = CounterModule_IsReady;
assign QuSoCModule_L128F39T70_MuxMultiplexerAddress = ModuleIndex[0];
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
