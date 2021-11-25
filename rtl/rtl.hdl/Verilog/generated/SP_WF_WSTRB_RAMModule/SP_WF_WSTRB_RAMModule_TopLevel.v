always @(posedge Clock)
begin
if ( Reset == 1 ) begin
for (State_ReadData_Iterator = 0; State_ReadData_Iterator < 4; State_ReadData_Iterator = State_ReadData_Iterator + 1)
begin
State_ReadData[State_ReadData_Iterator] <= State_ReadDataDefault;
end
end
else begin
for (State_ReadData_Iterator = 0; State_ReadData_Iterator < 4; State_ReadData_Iterator = State_ReadData_Iterator + 1)
begin
State_ReadData[State_ReadData_Iterator] <= NextState_ReadData[State_ReadData_Iterator];
end
end
end
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
for (State_Buff_Iterator = 0; State_Buff_Iterator < 256; State_Buff_Iterator = State_Buff_Iterator + 1)
begin
State_Buff[State_Buff_Iterator] <= State_BuffDefault;
end
end
else begin
for (State_Buff_Iterator = 0; State_Buff_Iterator < 256; State_Buff_Iterator = State_Buff_Iterator + 1)
begin
State_Buff[State_Buff_Iterator] <= NextState_Buff[State_Buff_Iterator];
end
end
end
always @*
begin
for (NextState_Buff_Iterator = 0; NextState_Buff_Iterator < 256; NextState_Buff_Iterator = NextState_Buff_Iterator + 1)
begin
NextState_Buff[NextState_Buff_Iterator] = State_Buff[NextState_Buff_Iterator];
end
for (NextState_ReadData_Iterator = 0; NextState_ReadData_Iterator < 4; NextState_ReadData_Iterator = NextState_ReadData_Iterator + 1)
begin
NextState_ReadData[NextState_ReadData_Iterator] = State_ReadData[NextState_ReadData_Iterator];
end
if ( Inputs_WE == 1 ) begin
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index == 1 ) begin
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w] = Inputs_WriteData0[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w];
end
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index == 1 ) begin
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w] = Inputs_WriteData1[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w];
end
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index == 1 ) begin
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w] = Inputs_WriteData2[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w];
end
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index == 1 ) begin
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w] = Inputs_WriteData3[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w];
end
end
NextState_ReadData[0] = NextState_Buff(Inputs_ReadAddress)[7:0]/*truncate*/;
NextState_ReadData[1] = NextState_Buff(Inputs_ReadAddress)[8:1]/*truncate*/;
NextState_ReadData[2] = NextState_Buff(Inputs_ReadAddress)[9:2]/*truncate*/;
NextState_ReadData[3] = NextState_Buff(Inputs_ReadAddress)[10:3]/*truncate*/;

end
assign Inputs_ReadAddress = ReadAddress;
assign Inputs_WriteAddress = WriteAddress;
assign Inputs_WriteData0 = WriteData0;
assign Inputs_WriteData1 = WriteData1;
assign Inputs_WriteData2 = WriteData2;
assign Inputs_WriteData3 = WriteData3;
assign Inputs_WE = WE;
assign Inputs_WSTRB = WSTRB;
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = Inputs_WSTRB[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w];
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = Inputs_WSTRB[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w];
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = Inputs_WSTRB[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w];
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = Inputs_WSTRB[SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w];
assign SP_WF_WSTRB_RAMModule_L28F36T67_Source = State_ReadData;
assign Data = SP_WF_WSTRB_RAMModule_L28F36T67_Source;
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index = NextState_Buff[Inputs_WriteAddress];
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index = NextState_Buff[Inputs_WriteAddress];
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index = NextState_Buff[Inputs_WriteAddress];
assign SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index = NextState_Buff[Inputs_WriteAddress];
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
// System configuration name is SP_WF_WSTRB_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
wire Zero = 1'b0;
wire One = 1'b1;
wire true = 1'b1;
wire false = 1'b0;
wire SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w = 1'b0;
wire SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w = 1'b1;
wire [1 : 0] SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w = 2'b10;
wire [1 : 0] SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w = 2'b11;
wire [7 : 0] Inputs_ReadAddress;
wire [7 : 0] Inputs_WriteAddress;
wire [7 : 0] Inputs_WriteData0;
wire [7 : 0] Inputs_WriteData1;
wire [7 : 0] Inputs_WriteData2;
wire [7 : 0] Inputs_WriteData3;
wire Inputs_WE;
wire [3 : 0] Inputs_WSTRB;
wire SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index;
wire [31 : 0] SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index;
wire SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index;
wire [31 : 0] SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index;
wire SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index;
wire [31 : 0] SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index;
wire SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index;
wire [31 : 0] SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index;
reg [7 : 0] State_ReadDataDefault = 8'b00000000;
reg [31 : 0] State_BuffDefault = 32'b00000000000000000000000000000000;
wire [31 : 0] SP_WF_WSTRB_RAMModule_L28F36T67_Source;
integer State_ReadData_Iterator
reg [7 : 0] [0 : 3];
for (State_ReadData_Iterator = 0; State_ReadData_Iterator < 4; State_ReadData_Iterator = State_ReadData_Iterator + 1)
	State_ReadData[State_ReadData_Iterator] = 0;
initial
begin : Init_State_ReadData
end
integer NextState_ReadData_Iterator
reg [7 : 0] [0 : 3];
for (NextState_ReadData_Iterator = 0; NextState_ReadData_Iterator < 4; NextState_ReadData_Iterator = NextState_ReadData_Iterator + 1)
	NextState_ReadData[NextState_ReadData_Iterator] = 0;
initial
begin : Init_NextState_ReadData
end
integer State_Buff_Iterator
reg [31 : 0] [0 : 255];
initial
begin : Init_State_Buff
$readmemh("SP_WF_WSTRB_RAMModule_TopLevel_State_Buff.hex", State_Buff);
end
integer NextState_Buff_Iterator
reg [31 : 0] [0 : 255];
for (NextState_Buff_Iterator = 0; NextState_Buff_Iterator < 256; NextState_Buff_Iterator = NextState_Buff_Iterator + 1)
	NextState_Buff[NextState_Buff_Iterator] = 0;
initial
begin : Init_NextState_Buff
end
module SP_WF_WSTRB_RAMModule_TopLevel (
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [0] Clock,
	input wire [0] Reset,
	input wire [7 : 0] ReadAddress,
	input wire [7 : 0] WriteAddress,
	input wire [7 : 0] WriteData0,
	input wire [7 : 0] WriteData1,
	input wire [7 : 0] WriteData2,
	input wire [7 : 0] WriteData3,
	input wire [0] WE,
	input wire [3 : 0] WSTRB,
	output wire [31 : 0] Data
)
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'1;
	localparam LoSignal = 1'0;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
