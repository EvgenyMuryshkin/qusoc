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
// System configuration name is LogicRAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module LogicRAMModule_TopLevel (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  Clock,
	input wire  Reset,
	input wire  [7: 0] Value,
	output wire [7: 0] Avg
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F46T47_Expr = 1'b1;
wire  LogicRAMModule_L25F47T48_Expr = 1'b0;
wire  LogicRAMModule_L25F63T64_Expr = 1'b1;
wire  [1:0] LogicRAMModule_L25F79T80_Expr = 2'b10;
wire  [1:0] LogicRAMModule_L25F95T96_Expr = 2'b11;
wire  [1:0] LogicRAMModule_L25F102T103_Expr = 2'b10;
wire  [7:0] Inputs_Value;
reg  [1:0] NextState_Index;
wire  [1:0] LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F31T54_Index;
reg  [7:0] State_BuffDefault = 8'b00000000;
wire  [7:0] LogicRAMModule_L25F36T49_Index;
wire  [7:0] LogicRAMModule_L25F52T65_Index;
wire  [7:0] LogicRAMModule_L25F68T81_Index;
wire  [7:0] LogicRAMModule_L25F84T97_Index;
wire  [7:0] LogicRAMModule_L25F28T104_Cast;
reg  [1:0] State_Index = 2'b00;
wire  [1:0] State_IndexDefault = 2'b00;
wire  [10:0] LogicRAMModule_L25F35T103_Expr;
wire  [10:0] LogicRAMModule_L25F35T103_Expr_1;
wire  [3:0] LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr;
wire signed  [3:0] LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr_1;
wire signed  [3:0] LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr_2;
wire  [13:0] LogicRAMModule_L25F36T97_Expr;
wire signed  [13:0] LogicRAMModule_L25F36T97_Expr_1;
wire signed  [13:0] LogicRAMModule_L25F36T97_Expr_2;
wire  [11:0] LogicRAMModule_L25F36T81_Expr;
wire signed  [11:0] LogicRAMModule_L25F36T81_Expr_1;
wire signed  [11:0] LogicRAMModule_L25F36T81_Expr_2;
wire  [9:0] LogicRAMModule_L25F36T65_Expr;
wire signed  [9:0] LogicRAMModule_L25F36T65_Expr_1;
wire signed  [9:0] LogicRAMModule_L25F36T65_Expr_2;
integer State_Buff_Iterator;
reg [7:0] State_Buff [0 : 3];
initial
begin : Init_State_Buff
	for (State_Buff_Iterator = 0; State_Buff_Iterator < 4; State_Buff_Iterator = State_Buff_Iterator + 1)
		State_Buff[State_Buff_Iterator] = 0;
end
integer NextState_Buff_Iterator;
reg [7:0] NextState_Buff [0 : 3];
initial
begin : Init_NextState_Buff
	for (NextState_Buff_Iterator = 0; NextState_Buff_Iterator < 4; NextState_Buff_Iterator = NextState_Buff_Iterator + 1)
		NextState_Buff[NextState_Buff_Iterator] = 0;
end
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
State_Index <= State_IndexDefault;
end
else begin
State_Index <= NextState_Index;
end
end
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
for (State_Buff_Iterator = 0; State_Buff_Iterator < 4; State_Buff_Iterator = State_Buff_Iterator + 1)
begin
State_Buff[State_Buff_Iterator] <= State_BuffDefault;
end
end
else begin
for (State_Buff_Iterator = 0; State_Buff_Iterator < 4; State_Buff_Iterator = State_Buff_Iterator + 1)
begin
State_Buff[State_Buff_Iterator] <= NextState_Buff[State_Buff_Iterator];
end
end
end
// Output: LogicRAMModule_L25F35T103_Expr, Width: 11, ShiftBy: 2, Sources: 1
assign LogicRAMModule_L25F35T103_Expr[0] = LogicRAMModule_L25F35T103_Expr_1[2];
assign LogicRAMModule_L25F35T103_Expr[1] = LogicRAMModule_L25F35T103_Expr_1[3];
assign LogicRAMModule_L25F35T103_Expr[2] = LogicRAMModule_L25F35T103_Expr_1[4];
assign LogicRAMModule_L25F35T103_Expr[3] = LogicRAMModule_L25F35T103_Expr_1[5];
assign LogicRAMModule_L25F35T103_Expr[4] = LogicRAMModule_L25F35T103_Expr_1[6];
assign LogicRAMModule_L25F35T103_Expr[5] = LogicRAMModule_L25F35T103_Expr_1[7];
assign LogicRAMModule_L25F35T103_Expr[6] = LogicRAMModule_L25F35T103_Expr_1[8];
assign LogicRAMModule_L25F35T103_Expr[7] = LogicRAMModule_L25F35T103_Expr_1[9];
assign LogicRAMModule_L25F35T103_Expr[8] = LogicRAMModule_L25F35T103_Expr_1[10];
assign LogicRAMModule_L25F35T103_Expr[9] = 0;
assign LogicRAMModule_L25F35T103_Expr[10] = 0;
assign LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr = LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr_1 + LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr_2;
assign LogicRAMModule_L25F36T97_Expr = LogicRAMModule_L25F36T97_Expr_1 + LogicRAMModule_L25F36T97_Expr_2;
assign LogicRAMModule_L25F36T81_Expr = LogicRAMModule_L25F36T81_Expr_1 + LogicRAMModule_L25F36T81_Expr_2;
assign LogicRAMModule_L25F36T65_Expr = LogicRAMModule_L25F36T65_Expr_1 + LogicRAMModule_L25F36T65_Expr_2;
always @*
begin
for (NextState_Buff_Iterator = 0; NextState_Buff_Iterator < 4; NextState_Buff_Iterator = NextState_Buff_Iterator + 1)
begin
NextState_Buff[NextState_Buff_Iterator] = State_Buff[NextState_Buff_Iterator];
end
NextState_Index = State_Index;
NextState_Buff[State_Index] = Inputs_Value;
NextState_Index = LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F31T54_Index;

end
assign LogicRAMModule_L25F35T103_Expr_1 = LogicRAMModule_L25F36T97_Expr[10:0]/*truncate*/;
assign LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr_1 = { {2{1'b0}}, State_Index }/*expand*/;
assign LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr_2 = { {3{1'b0}}, LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F46T47_Expr }/*expand*/;
assign LogicRAMModule_L25F36T97_Expr_1 = { {2{1'b0}}, LogicRAMModule_L25F36T81_Expr }/*expand*/;
assign LogicRAMModule_L25F36T97_Expr_2 = { {6{1'b0}}, LogicRAMModule_L25F84T97_Index }/*expand*/;
assign LogicRAMModule_L25F36T81_Expr_1 = { {2{1'b0}}, LogicRAMModule_L25F36T65_Expr }/*expand*/;
assign LogicRAMModule_L25F36T81_Expr_2 = { {4{1'b0}}, LogicRAMModule_L25F68T81_Index }/*expand*/;
assign LogicRAMModule_L25F36T65_Expr_1 = { {2{1'b0}}, LogicRAMModule_L25F36T49_Index }/*expand*/;
assign LogicRAMModule_L25F36T65_Expr_2 = { {2{1'b0}}, LogicRAMModule_L25F52T65_Index }/*expand*/;
assign Inputs_Value = Value;
assign LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F31T54_Index = LogicRAMModule_L28F9L31T10_LogicRAMModule_L30F32T47_Expr[1:0];
assign LogicRAMModule_L25F28T104_Cast = LogicRAMModule_L25F35T103_Expr[7:0]/*truncate*/;
assign Avg = LogicRAMModule_L25F28T104_Cast;
assign LogicRAMModule_L25F36T49_Index = State_Buff[LogicRAMModule_L25F47T48_Expr];
assign LogicRAMModule_L25F52T65_Index = State_Buff[LogicRAMModule_L25F63T64_Expr];
assign LogicRAMModule_L25F68T81_Index = State_Buff[LogicRAMModule_L25F79T80_Expr];
assign LogicRAMModule_L25F84T97_Index = State_Buff[LogicRAMModule_L25F95T96_Expr];
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
