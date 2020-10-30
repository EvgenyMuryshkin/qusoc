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
// System configuration name is BlinkerInf_TopLevel_BlinkerInf_CPU_RISCVModule_Regs, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module BlinkerInf_TopLevel_BlinkerInf_CPU_RISCVModule_Regs (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input  BoardSignals_Clock,
	input  BoardSignals_Reset,
	input  BoardSignals_Running,
	input  BoardSignals_Starting,
	input  BoardSignals_Started,
	input  Read,
	input  [5: 1] RS1Addr,
	input  [5: 1] RS2Addr,
	input  [5: 1] RD,
	input  WE,
	input  [32: 1] WriteData,
	output [32: 1] RS1,
	output [32: 1] RS2,
	output Ready
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  RegistersRAMModule_L25F50T51_Expr = 1'b0;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F48T49_Expr = 1'b0;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L36F31T36_Expr = 1'b0;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F46T47_Expr = 1'b0;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L39F13L41T14_RegistersRAMModule_L40F34T35_Expr = 1'b1;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F31T32_Expr = 1'b1;
wire  [1:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L44F13L47T14_RegistersRAMModule_L45F34T35_Expr = 2'b10;
wire  [1:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F31T32_Expr = 2'b10;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L50F13L54T14_RegistersRAMModule_L51F35T39_Expr = 1'b1;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L50F13L54T14_RegistersRAMModule_L52F34T35_Expr = 1'b0;
wire  Inputs_Read;
wire  [4:0] Inputs_RS1Addr;
wire  [4:0] Inputs_RS2Addr;
wire  [4:0] Inputs_RD;
wire  Inputs_WE;
wire  [31:0] Inputs_WriteData;
reg  [7:0] NextState_Mode;
reg  [31:0] NextState_RS1;
reg  [31:0] NextState_RS2;
reg  NextState_Ready;
wire  [4:0] ReadAddress;
wire  RegistersRAMModule_L28F9L55T10_we;
reg  [31:0] State_ReadData;
reg  [7:0] State_Mode = 8'b00000000;
wire  [7:0] State_ModeDefault = 8'b00000000;
reg  [31:0] State_RS1 = 32'b00000000000000000000000000000000;
wire  [31:0] State_RS1Default = 32'b00000000000000000000000000000000;
reg  [31:0] State_RS2 = 32'b00000000000000000000000000000000;
wire  [31:0] State_RS2Default = 32'b00000000000000000000000000000000;
reg  State_Ready = 1'b0;
wire  State_ReadyDefault = 1'b0;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr_1;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr_2;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr_1;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr_2;
wire  RegistersRAMModule_L25F36T51_Expr;
wire signed  [8:0] RegistersRAMModule_L25F36T51_ExprLhs;
wire signed  [8:0] RegistersRAMModule_L25F36T51_ExprRhs;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_Expr;
wire signed  [5:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_ExprLhs;
wire signed  [5:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_ExprRhs;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_Expr;
wire signed  [8:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_ExprLhs;
wire signed  [8:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_ExprRhs;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_Expr;
wire signed  [8:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_ExprLhs;
wire signed  [8:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_ExprRhs;
wire  RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_Expr;
wire signed  [8:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_ExprLhs;
wire signed  [8:0] RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_ExprRhs;
reg  [4:0] RegistersRAMModule_L25F36T85_Lookup;
wire  RegistersRAMModule_L25F36T85_LookupMultiplexerAddress;
wire  [4:0] RegistersRAMModule_L25F36T85_Lookup1;
wire  [4:0] RegistersRAMModule_L25F36T85_Lookup2;
reg [31:0] State_x [0 : 31];
initial
begin : Init_State_x
	integer i;
	for (i = 0; i < 32; i = i + 1)
		State_x[i] = 0;
end
always @(posedge BoardSignals_Clock)
begin
if ( BoardSignals_Reset == 1 ) begin
State_Mode <= State_ModeDefault;
State_RS1 <= State_RS1Default;
State_RS2 <= State_RS2Default;
State_Ready <= State_ReadyDefault;
end
else begin
State_Mode <= NextState_Mode;
State_RS1 <= NextState_RS1;
State_RS2 <= NextState_RS2;
State_Ready <= NextState_Ready;
end
end
assign RegistersRAMModule_L25F36T51_Expr = RegistersRAMModule_L25F36T51_ExprLhs == RegistersRAMModule_L25F36T51_ExprRhs ? 1'b1 : 1'b0;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_Expr = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_ExprLhs != RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_ExprRhs ? 1'b1 : 1'b0;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_Expr = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_ExprLhs == RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_ExprRhs ? 1'b1 : 1'b0;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_Expr = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_ExprLhs == RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_ExprRhs ? 1'b1 : 1'b0;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_Expr = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_ExprLhs == RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_ExprRhs ? 1'b1 : 1'b0;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr_1 & RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr_2;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr_1 & RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr_2;
always @*
begin
case (RegistersRAMModule_L25F36T85_LookupMultiplexerAddress)
    'b0:
RegistersRAMModule_L25F36T85_Lookup = RegistersRAMModule_L25F36T85_Lookup1;
    'b1:
RegistersRAMModule_L25F36T85_Lookup = RegistersRAMModule_L25F36T85_Lookup2;
  default:
RegistersRAMModule_L25F36T85_Lookup = 'b00000;
endcase

end
always @*
begin
NextState_Mode = State_Mode;
NextState_RS1 = State_RS1;
NextState_RS2 = State_RS2;
NextState_Ready = State_Ready;
if ( RegistersRAMModule_L28F9L55T10_we == 1 ) begin
end
NextState_Ready = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L36F31T36_Expr;
if ( RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr == 1 ) begin
NextState_Mode = { {7{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L39F13L41T14_RegistersRAMModule_L40F34T35_Expr }/*expand*/;
end
if ( RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_Expr == 1 ) begin
NextState_Mode = { {6{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L44F13L47T14_RegistersRAMModule_L45F34T35_Expr }/*expand*/;
NextState_RS1 = State_ReadData;
end
if ( RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_Expr == 1 ) begin
NextState_Ready = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L50F13L54T14_RegistersRAMModule_L51F35T39_Expr;
NextState_Mode = { {7{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L50F13L54T14_RegistersRAMModule_L52F34T35_Expr }/*expand*/;
NextState_RS2 = State_ReadData;
end

end
// inferred simple dual port RAM with read-first behaviour
always @(posedge BoardSignals_Clock) begin
	if (RegistersRAMModule_L28F9L55T10_we)
		State_x[Inputs_RD] <= Inputs_WriteData;
end

always @(posedge BoardSignals_Clock) begin
	State_ReadData <= State_x[ReadAddress];
end

assign RegistersRAMModule_L25F36T51_ExprLhs = { {1{1'b0}}, State_Mode }/*expand*/;
assign RegistersRAMModule_L25F36T51_ExprRhs = { {8{1'b0}}, RegistersRAMModule_L25F50T51_Expr }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_ExprLhs = { {1{1'b0}}, Inputs_RD }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_ExprRhs = { {5{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F48T49_Expr }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_ExprLhs = { {1{1'b0}}, State_Mode }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_ExprRhs = { {8{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F46T47_Expr }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_ExprLhs = { {1{1'b0}}, State_Mode }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F17T32_ExprRhs = { {8{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L43F31T32_Expr }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_ExprLhs = { {1{1'b0}}, State_Mode }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F17T32_ExprRhs = { {7{1'b0}}, RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L49F31T32_Expr }/*expand*/;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr_1 = Inputs_WE;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr_2 = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F35T49_Expr;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr_1 = Inputs_Read;
assign RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F17T47_Expr_2 = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L38F32T47_Expr;
assign Inputs_Read = Read;
assign Inputs_RS1Addr = RS1Addr;
assign Inputs_RS2Addr = RS2Addr;
assign Inputs_RD = RD;
assign Inputs_WE = WE;
assign Inputs_WriteData = WriteData;
assign ReadAddress = RegistersRAMModule_L25F36T85_Lookup;
assign RegistersRAMModule_L28F9L55T10_we = RegistersRAMModule_L28F9L55T10_RegistersRAMModule_L29F22T49_Expr;
assign RS1 = State_RS1;
assign RS2 = State_RS2;
assign Ready = State_Ready;
assign RegistersRAMModule_L25F36T85_Lookup1 = Inputs_RS2Addr;
assign RegistersRAMModule_L25F36T85_Lookup2 = Inputs_RS1Addr;
assign RegistersRAMModule_L25F36T85_LookupMultiplexerAddress = RegistersRAMModule_L25F36T51_Expr;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
