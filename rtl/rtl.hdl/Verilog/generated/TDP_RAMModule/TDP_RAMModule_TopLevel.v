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
// System configuration name is TDP_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module TDP_RAMModule_TopLevel (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input wire  Clock,
	input wire  Reset,
	input wire  [7: 0] Addr_A,
	input wire  [7: 0] WriteData_A,
	input wire  WE_A,
	input wire  [7: 0] Addr_B,
	input wire  [7: 0] WriteData_B,
	input wire  WE_B,
	output wire [7: 0] OutDataA,
	output wire [7: 0] OutDataB,
	output wire OutCorrupted
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  [7:0] Inputs_Addr_A;
wire  [7:0] Inputs_WriteData_A;
wire  Inputs_WE_A;
wire  [7:0] Inputs_Addr_B;
wire  [7:0] Inputs_WriteData_B;
wire  Inputs_WE_B;
reg  NextState_SameAddressWrite;
reg  State_SameAddressWrite = 1'b0;
wire  State_SameAddressWriteDefault = 1'b0;
reg  [7:0] State_DataA;
reg  [7:0] State_DataB;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2;
wire  TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr;
wire signed  [8:0] TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs;
wire signed  [8:0] TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs;
reg [7:0] State_Buff [0 : 255];
initial
begin : Init_State_Buff
	integer i;
	for (i = 0; i < 256; i = i + 1)
		State_Buff[i] = 0;
end
always @(posedge Clock)
begin
if ( Reset == 1 ) begin
State_SameAddressWrite <= State_SameAddressWriteDefault;
end
else begin
State_SameAddressWrite <= NextState_SameAddressWrite;
end
end
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs == TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs ? 1'b1 : 1'b0;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1 | TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1 & TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1 & TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2;
always @*
begin
NextState_SameAddressWrite = State_SameAddressWrite;
NextState_SameAddressWrite = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr;
if ( Inputs_WE_A == 1 ) begin
end
if ( Inputs_WE_B == 1 ) begin
end

end
always @ (posedge Clock)
begin
	// Port A
	if (Inputs_WE_A)
	begin
		State_Buff[Inputs_Addr_A] <= Inputs_WriteData_A;
		State_DataA <= Inputs_WriteData_A;
	end
	else
	begin
		State_DataA <= State_Buff[Inputs_Addr_A];
	end
end

always @ (posedge Clock)
begin
	// Port B
	if (Inputs_WE_B)
	begin
		State_Buff[Inputs_Addr_B] <= Inputs_WriteData_B;
		State_DataB <= Inputs_WriteData_B;
	end
	else
	begin
		State_DataB <= State_Buff[Inputs_Addr_B];
	end
end


assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs = { {1{1'b0}}, Inputs_Addr_A }/*expand*/;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs = { {1{1'b0}}, Inputs_Addr_B }/*expand*/;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1 = State_SameAddressWrite;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2 = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1 = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2 = TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1 = Inputs_WE_A;
assign TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2 = Inputs_WE_B;
assign Inputs_Addr_A = Addr_A;
assign Inputs_WriteData_A = WriteData_A;
assign Inputs_WE_A = WE_A;
assign Inputs_Addr_B = Addr_B;
assign Inputs_WriteData_B = WriteData_B;
assign Inputs_WE_B = WE_B;
assign OutDataA = State_DataA;
assign OutDataB = State_DataB;
assign OutCorrupted = State_SameAddressWrite;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
