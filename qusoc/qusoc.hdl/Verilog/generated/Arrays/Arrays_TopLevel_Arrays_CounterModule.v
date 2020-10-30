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
// System configuration name is Arrays_TopLevel_Arrays_CounterModule, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module Arrays_TopLevel_Arrays_CounterModule (
// [BEGIN USER PORTS]
// [END USER PORTS]

	input  BoardSignals_Clock,
	input  BoardSignals_Reset,
	input  BoardSignals_Running,
	input  BoardSignals_Starting,
	input  BoardSignals_Started,
	input  [32: 1] Common_Address,
	input  [32: 1] Common_WriteValue,
	input  Common_WE,
	input  Common_RE,
	input  [2: 1] Common_MemAccessMode,
	input  [32: 1] DeviceAddress,
	output [32: 1] ReadValue,
	output IsReady,
	output IsActive
    );

// [BEGIN USER SIGNALS]
// [END USER SIGNALS]
localparam HiSignal = 1'b1;
localparam LoSignal = 1'b0;
wire  Zero = 1'b0;
wire  One = 1'b1;
wire  true = 1'b1;
wire  false = 1'b0;
wire  [2:0] addressSpan = 3'b100;
wire  [1:0] SoCComponentModule_L47F83T84_Expr = 2'b11;
wire  SoCRegisterModule_L27F41T45_Expr = 1'b1;
wire  [31:0] Inputs_Common_Address;
wire  [31:0] Inputs_Common_WriteValue;
wire  Inputs_Common_WE;
wire  Inputs_Common_RE;
wire  [1:0] Inputs_Common_MemAccessMode;
wire  [31:0] Inputs_DeviceAddress;
reg  [31:0] NextState_Value;
wire  addressMatch;
wire  [31:0] internalAddressBits;
wire  [4:0] internalByteAddress;
wire  internalIsActive;
wire  [31:0] SoCComponentModule_L46F54T92_Source;
wire  [1:0] SoCComponentModule_L47F54T79_Index;
reg  [31:0] State_Value = 32'b00000000000000000000000000000000;
wire  [31:0] State_ValueDefault = 32'b00000000000000000000000000000000;
wire  SoCComponentModule_L45F48T157_Expr;
wire  SoCComponentModule_L45F48T157_Expr_1;
wire  SoCComponentModule_L45F48T157_Expr_2;
wire  [7:0] SoCComponentModule_L47F54T84_Expr;
wire  [7:0] SoCComponentModule_L47F54T84_Expr_1;
wire  SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr;
wire  SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr_1;
wire  SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr_2;
wire  [31:0] SoCRegisterModule_L26F43T77_Expr;
wire  [31:0] SoCRegisterModule_L26F43T77_Expr_1;
wire  [33:0] SoCComponentModule_L45F122T156_Expr;
wire signed  [33:0] SoCComponentModule_L45F122T156_Expr_1;
wire signed  [33:0] SoCComponentModule_L45F122T156_Expr_2;
wire  SoCComponentModule_L45F48T93_Expr;
wire signed  [32:0] SoCComponentModule_L45F48T93_ExprLhs;
wire signed  [32:0] SoCComponentModule_L45F48T93_ExprRhs;
wire  SoCComponentModule_L45F97T157_Expr;
wire signed  [34:0] SoCComponentModule_L45F97T157_ExprLhs;
wire signed  [34:0] SoCComponentModule_L45F97T157_ExprRhs;
always @(posedge BoardSignals_Clock)
begin
if ( BoardSignals_Reset == 1 ) begin
State_Value <= State_ValueDefault;
end
else begin
State_Value <= NextState_Value;
end
end
assign SoCComponentModule_L45F48T93_Expr = SoCComponentModule_L45F48T93_ExprLhs >= SoCComponentModule_L45F48T93_ExprRhs ? 1'b1 : 1'b0;
assign SoCComponentModule_L45F97T157_Expr = SoCComponentModule_L45F97T157_ExprLhs < SoCComponentModule_L45F97T157_ExprRhs ? 1'b1 : 1'b0;
assign SoCComponentModule_L45F48T157_Expr = SoCComponentModule_L45F48T157_Expr_1 & SoCComponentModule_L45F48T157_Expr_2;
assign SoCComponentModule_L47F54T84_Expr[0] = 0;
assign SoCComponentModule_L47F54T84_Expr[1] = 0;
assign SoCComponentModule_L47F54T84_Expr[2] = 0;
assign SoCComponentModule_L47F54T84_Expr[3] = SoCComponentModule_L47F54T84_Expr_1[0];
assign SoCComponentModule_L47F54T84_Expr[4] = SoCComponentModule_L47F54T84_Expr_1[1];
assign SoCComponentModule_L47F54T84_Expr[5] = 0;
assign SoCComponentModule_L47F54T84_Expr[6] = 0;
assign SoCComponentModule_L47F54T84_Expr[7] = 0;
assign SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr = SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr_1 & SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr_2;
assign SoCRegisterModule_L26F43T77_Expr = SoCRegisterModule_L26F43T77_Expr_1 >> internalByteAddress;
assign SoCComponentModule_L45F122T156_Expr = SoCComponentModule_L45F122T156_Expr_1 + SoCComponentModule_L45F122T156_Expr_2;
always @*
begin
NextState_Value = State_Value;
if ( SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr == 1 ) begin
NextState_Value = Inputs_Common_WriteValue;
end

end
assign SoCComponentModule_L45F48T93_ExprLhs = { {1{1'b0}}, Inputs_Common_Address }/*expand*/;
assign SoCComponentModule_L45F48T93_ExprRhs = { {1{1'b0}}, Inputs_DeviceAddress }/*expand*/;
assign SoCComponentModule_L45F97T157_ExprLhs = { {3{1'b0}}, Inputs_Common_Address }/*expand*/;
assign SoCComponentModule_L45F97T157_ExprRhs = { {1{1'b0}}, SoCComponentModule_L45F122T156_Expr }/*expand*/;
assign SoCComponentModule_L45F48T157_Expr_1 = SoCComponentModule_L45F48T93_Expr;
assign SoCComponentModule_L45F48T157_Expr_2 = SoCComponentModule_L45F97T157_Expr;
assign SoCComponentModule_L47F54T84_Expr_1 = { {6{1'b0}}, SoCComponentModule_L47F54T79_Index }/*expand*/;
assign SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr_1 = Inputs_Common_WE;
assign SoCRegisterModule_L30F9L35T10_SoCRegisterModule_L31F17T53_Expr_2 = internalIsActive;
assign SoCRegisterModule_L26F43T77_Expr_1 = State_Value;
assign SoCComponentModule_L45F122T156_Expr_1 = { {2{1'b0}}, Inputs_DeviceAddress }/*expand*/;
assign SoCComponentModule_L45F122T156_Expr_2 = { {31{1'b0}}, addressSpan }/*expand*/;
assign Inputs_Common_Address = Common_Address;
assign Inputs_Common_WriteValue = Common_WriteValue;
assign Inputs_Common_WE = Common_WE;
assign Inputs_Common_RE = Common_RE;
assign Inputs_Common_MemAccessMode = Common_MemAccessMode;
assign Inputs_DeviceAddress = DeviceAddress;
assign addressMatch = SoCComponentModule_L45F48T157_Expr;
assign SoCComponentModule_L46F54T92_Source = Inputs_Common_Address;
assign internalAddressBits = SoCComponentModule_L46F54T92_Source;
assign SoCComponentModule_L47F54T79_Index = internalAddressBits[1:0];
assign internalByteAddress = SoCComponentModule_L47F54T84_Expr[4:0]/*truncate*/;
assign internalIsActive = addressMatch;
assign ReadValue = SoCRegisterModule_L26F43T77_Expr;
assign IsReady = SoCRegisterModule_L27F41T45_Expr;
assign IsActive = internalIsActive;
// [BEGIN USER ARCHITECTURE]
// [END USER ARCHITECTURE]
endmodule
