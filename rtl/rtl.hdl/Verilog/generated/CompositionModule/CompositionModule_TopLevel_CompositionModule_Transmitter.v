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
// System configuration name is CompositionModule_TopLevel_CompositionModule_Transmitter, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module CompositionModule_TopLevel_CompositionModule_Transmitter
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire Trigger,
	input wire Ack,
	input wire [7: 0] Data,
	output wire Bit,
	output wire IsReady,
	output wire IsTransmitting,
	output wire IsTransmissionStarted
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F22T41_Expr = 1'b0;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L19F45T46_Expr = 1'b0;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L21F41T68_Expr = 1'b1;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F22T49_Expr = 1'b1;
	wire [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F42T43_Expr = 3'b111;
	wire [1: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L26F21L28T22_TransmitterModule_L27F41T69_Expr = 2'b10;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F68T69_Expr = 1'b1;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F52T53_Expr = 1'b1;
	wire [1: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F22T50_Expr = 2'b10;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L37F41T60_Expr = 1'b0;
	wire TransmitterModule_L9F46T65_Expr = 1'b0;
	wire TransmitterModule_L10F52T79_Expr = 1'b1;
	wire TransmitterModule_L11F59T78_Expr = 1'b0;
	wire TransmitterModule_L11F99T126_Expr = 1'b1;
	wire Inputs_Trigger;
	wire Inputs_Ack;
	wire [7: 0] Inputs_Data;
	reg [1: 0] NextState_FSM;
	reg [7: 0] NextState_Data;
	reg [7: 0] NextState_Counter;
	wire [7: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast;
	wire TransmitterModule_L8F28T41_Index;
	reg [1: 0] State_FSM = 2'b00;
	wire [1: 0] State_FSMDefault = 2'b00;
	reg [7: 0] State_Data = 8'b00000000;
	wire [7: 0] State_DataDefault = 8'b00000000;
	reg [7: 0] State_Counter = 8'b00000000;
	wire [7: 0] State_CounterDefault = 8'b00000000;
	wire [7: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr;
	wire [7: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1;
	wire TransmitterModule_L11F46T126_Expr;
	wire TransmitterModule_L11F46T126_Expr_1;
	wire TransmitterModule_L11F46T126_Expr_2;
	wire [9: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr;
	wire signed [9: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1;
	wire signed [9: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case;
	wire signed [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs;
	wire signed [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case;
	wire signed [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs;
	wire signed [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr;
	wire signed [8: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs;
	wire signed [8: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs;
	wire TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case;
	wire signed [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs;
	wire signed [2: 0] TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs;
	wire TransmitterModule_L9F32T65_Expr;
	wire signed [2: 0] TransmitterModule_L9F32T65_ExprLhs;
	wire signed [2: 0] TransmitterModule_L9F32T65_ExprRhs;
	wire TransmitterModule_L10F39T79_Expr;
	wire signed [2: 0] TransmitterModule_L10F39T79_ExprLhs;
	wire signed [2: 0] TransmitterModule_L10F39T79_ExprRhs;
	wire TransmitterModule_L11F46T78_Expr;
	wire signed [2: 0] TransmitterModule_L11F46T78_ExprLhs;
	wire signed [2: 0] TransmitterModule_L11F46T78_ExprRhs;
	wire TransmitterModule_L11F82T126_Expr;
	wire signed [2: 0] TransmitterModule_L11F82T126_ExprLhs;
	wire signed [2: 0] TransmitterModule_L11F82T126_ExprRhs;
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_FSM <= State_FSMDefault;
			State_Data <= State_DataDefault;
			State_Counter <= State_CounterDefault;
		end
		else
		begin
			State_FSM <= NextState_FSM;
			State_Data <= NextState_Data;
			State_Counter <= NextState_Counter;
		end
	end
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs == TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs == TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs == TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs == TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L9F32T65_Expr = TransmitterModule_L9F32T65_ExprLhs == TransmitterModule_L9F32T65_ExprRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L10F39T79_Expr = TransmitterModule_L10F39T79_ExprLhs == TransmitterModule_L10F39T79_ExprRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L11F46T78_Expr = TransmitterModule_L11F46T78_ExprLhs == TransmitterModule_L11F46T78_ExprRhs ? 1'b1 : 1'b0;
	assign TransmitterModule_L11F82T126_Expr = TransmitterModule_L11F82T126_ExprLhs == TransmitterModule_L11F82T126_ExprRhs ? 1'b1 : 1'b0;
	// Output: TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr, Width: 8, ShiftBy: 1, Sources: 1
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[0] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[1];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[1] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[2];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[2] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[3];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[3] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[4];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[4] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[5];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[5] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[6];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[6] = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1[7];
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr[7] = 0;
	assign TransmitterModule_L11F46T126_Expr = TransmitterModule_L11F46T126_Expr_1 & TransmitterModule_L11F46T126_Expr_2;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1 + TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2;
	always @ (*)
	begin
		NextState_FSM = State_FSM;
		NextState_Data = State_Data;
		NextState_Counter = State_Counter;
		if ((TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case == 1))
		begin
			if ((Inputs_Trigger == 1))
			begin
				NextState_Counter = { {7{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L19F45T46_Expr }/*expand*/;
				NextState_Data = Inputs_Data;
				NextState_FSM = { {1{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L21F41T68_Expr }/*expand*/;
			end
		end
		else if ((TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case == 1))
		begin
			if ((TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr == 1))
			begin
				NextState_FSM = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L26F21L28T22_TransmitterModule_L27F41T69_Expr;
			end
			else
			begin
				NextState_Counter = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast;
			end
			NextState_Data = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr;
		end
		else if ((TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case == 1))
		begin
			if ((Inputs_Ack == 1))
			begin
				NextState_FSM = { {1{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L37F41T60_Expr }/*expand*/;
			end
		end
	end
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs = { {1{1'b0}}, State_FSM }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs = { {2{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F22T41_Expr }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs = { {1{1'b0}}, State_FSM }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs = { {2{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F22T49_Expr }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs = { {1{1'b0}}, State_Counter }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs = { {6{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F42T43_Expr }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs = { {1{1'b0}}, State_FSM }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs = { {1{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F22T50_Expr }/*expand*/;
	assign TransmitterModule_L9F32T65_ExprLhs = { {1{1'b0}}, State_FSM }/*expand*/;
	assign TransmitterModule_L9F32T65_ExprRhs = { {2{1'b0}}, TransmitterModule_L9F46T65_Expr }/*expand*/;
	assign TransmitterModule_L10F39T79_ExprLhs = { {1{1'b0}}, State_FSM }/*expand*/;
	assign TransmitterModule_L10F39T79_ExprRhs = { {2{1'b0}}, TransmitterModule_L10F52T79_Expr }/*expand*/;
	assign TransmitterModule_L11F46T78_ExprLhs = { {1{1'b0}}, State_FSM }/*expand*/;
	assign TransmitterModule_L11F46T78_ExprRhs = { {2{1'b0}}, TransmitterModule_L11F59T78_Expr }/*expand*/;
	assign TransmitterModule_L11F82T126_ExprLhs = { {1{1'b0}}, NextState_FSM }/*expand*/;
	assign TransmitterModule_L11F82T126_ExprRhs = { {2{1'b0}}, TransmitterModule_L11F99T126_Expr }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1 = State_Data;
	assign TransmitterModule_L11F46T126_Expr_1 = TransmitterModule_L11F46T78_Expr;
	assign TransmitterModule_L11F46T126_Expr_2 = TransmitterModule_L11F82T126_Expr;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1 = { {2{1'b0}}, State_Counter }/*expand*/;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2 = { {9{1'b0}}, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F68T69_Expr }/*expand*/;
	assign Inputs_Trigger = Trigger;
	assign Inputs_Ack = Ack;
	assign Inputs_Data = Data;
	assign TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast = TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr[7:0]/*truncate*/;
	assign TransmitterModule_L8F28T41_Index = State_Data[0];
	assign Bit = TransmitterModule_L8F28T41_Index;
	assign IsReady = TransmitterModule_L9F32T65_Expr;
	assign IsTransmitting = TransmitterModule_L10F39T79_Expr;
	assign IsTransmissionStarted = TransmitterModule_L11F46T126_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
