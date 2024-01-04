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
// System configuration name is CompositionModule_TopLevel_Receiver, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module CompositionModule_TopLevel_Receiver
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire Ack,
	input wire Bit,
	input wire IsValid,
	output wire [7:0] Data,
	output wire HasData
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [7: 0] ReceiverModule_L10F49T53_Expr = 8'b10000000;
	wire ReceiverModule_L10F56T57_Expr = 1'b0;
	wire [1: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F22T38_Expr = 2'b00;
	wire [1: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L18F21L21T22_ReceiverModule_L20F41T62_Expr = 2'b01;
	wire [1: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F22T43_Expr = 2'b01;
	wire ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F64T65_Expr = 1'b1;
	wire [1: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L29F21L31T22_ReceiverModule_L30F41T66_Expr = 2'b10;
	wire [1: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F22T47_Expr = 2'b10;
	wire [1: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L36F41T57_Expr = 2'b00;
	wire ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L37F42T43_Expr = 1'b0;
	wire [1: 0] ReceiverModule_L8F46T71_Expr = 2'b10;
	wire Inputs_Ack;
	wire Inputs_Bit;
	wire Inputs_IsValid;
	reg [7: 0] NextState_Data;
	reg [1: 0] NextState_FSM;
	wire [7: 0] PartialData;
	wire [7: 0] ReceiverModule_L10F36T57_WhenTrue;
	wire [7: 0] ReceiverModule_L10F36T57_WhenFalse;
	wire [7: 0] ReceiverModule_L10F36T57_Ternary;
	wire [7: 0] ReceiverModule_L10F29T58_Cast;
	wire [7: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast;
	reg [7: 0] State_Data = 8'b00000000;
	wire [7: 0] State_DataDefault = 8'b00000000;
	reg [1: 0] State_FSM = 2'b00;
	wire [1: 0] State_FSMDefault = 2'b00;
	wire [7: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr;
	wire [7: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1;
	wire [7: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2;
	wire [7: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr;
	wire [7: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1;
	wire ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case;
	wire signed [2: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs;
	wire signed [2: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs;
	wire ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case;
	wire signed [2: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs;
	wire signed [2: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs;
	wire ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case;
	wire signed [2: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs;
	wire signed [2: 0] ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs;
	wire ReceiverModule_L8F32T71_Expr;
	wire signed [2: 0] ReceiverModule_L8F32T71_ExprLhs;
	wire signed [2: 0] ReceiverModule_L8F32T71_ExprRhs;
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_Data <= State_DataDefault;
			State_FSM <= State_FSMDefault;
		end
		else
		begin
			State_Data <= NextState_Data;
			State_FSM <= NextState_FSM;
		end
	end
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs == ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs ? 1'b1 : 1'b0;
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs == ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs ? 1'b1 : 1'b0;
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs == ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs ? 1'b1 : 1'b0;
	assign ReceiverModule_L8F32T71_Expr = ReceiverModule_L8F32T71_ExprLhs == ReceiverModule_L8F32T71_ExprRhs ? 1'b1 : 1'b0;
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1 | ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2;
	// Output: ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr, Width: 8, ShiftBy: 1, Sources: 1
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[0] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[1];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[1] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[2];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[2] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[3];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[3] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[4];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[4] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[5];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[5] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[6];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[6] = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1[7];
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr[7] = 0;
	assign ReceiverModule_L10F36T57_Ternary = (Inputs_Bit ? ReceiverModule_L10F36T57_WhenTrue : ReceiverModule_L10F36T57_WhenFalse);
	always @ (*)
	begin
		NextState_Data = State_Data;
		NextState_FSM = State_FSM;
		if ((ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case == 1))
		begin
			if ((Inputs_IsValid == 1))
			begin
				NextState_Data = PartialData;
				NextState_FSM = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L18F21L21T22_ReceiverModule_L20F41T62_Expr;
			end
		end
		else if ((ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case == 1))
		begin
			if ((Inputs_IsValid == 1))
			begin
				NextState_Data = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast;
			end
			else
			begin
				NextState_FSM = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L29F21L31T22_ReceiverModule_L30F41T66_Expr;
			end
		end
		else if ((ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case == 1))
		begin
			if ((Inputs_Ack == 1))
			begin
				NextState_FSM = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L36F41T57_Expr;
				NextState_Data = { {7{1'b0}}, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L37F42T43_Expr };
			end
		end
	end
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs = { 1'b0, State_FSM };
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs = { 1'b0, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F22T38_Expr };
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs = { 1'b0, State_FSM };
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs = { 1'b0, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F22T43_Expr };
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs = { 1'b0, State_FSM };
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs = { 1'b0, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F22T47_Expr };
	assign ReceiverModule_L8F32T71_ExprLhs = { 1'b0, State_FSM };
	assign ReceiverModule_L8F32T71_ExprRhs = { 1'b0, ReceiverModule_L8F46T71_Expr };
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1 = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr;
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2 = PartialData;
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1 = State_Data;
	assign Inputs_Ack = Ack;
	assign Inputs_Bit = Bit;
	assign Inputs_IsValid = IsValid;
	assign ReceiverModule_L10F36T57_WhenTrue = ReceiverModule_L10F49T53_Expr;
	assign ReceiverModule_L10F36T57_WhenFalse = { {7{1'b0}}, ReceiverModule_L10F56T57_Expr };
	assign ReceiverModule_L10F29T58_Cast = ReceiverModule_L10F36T57_Ternary;
	assign PartialData = ReceiverModule_L10F29T58_Cast;
	assign ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast = ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr;
	assign Data = State_Data;
	assign HasData = ReceiverModule_L8F32T71_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
