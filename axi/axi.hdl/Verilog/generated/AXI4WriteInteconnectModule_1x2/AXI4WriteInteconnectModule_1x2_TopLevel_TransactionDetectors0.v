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
// System configuration name is AXI4WriteInteconnectModule_1x2_TopLevel_TransactionDetectors0, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXI4WriteInteconnectModule_1x2_TopLevel_TransactionDetectors0
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire iRestart,
	input wire iTXBegin,
	input wire iTXEnd,
	output wire oTransaction,
	output wire oWaitForRestart
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [1: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F22T46_Expr = 2'b00;
	wire [1: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L39F44T69_Expr = 2'b01;
	wire [1: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F22T47_Expr = 2'b01;
	wire [1: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L43F44T77_Expr = 2'b10;
	wire [1: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F22T55_Expr = 2'b10;
	wire [1: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L47F44T68_Expr = 2'b00;
	wire [1: 0] TransactionDetectorModule_L30F53T78_Expr = 2'b01;
	wire [1: 0] TransactionDetectorModule_L31F56T89_Expr = 2'b10;
	wire Inputs_iRestart;
	wire Inputs_iTXBegin;
	wire Inputs_iTXEnd;
	reg [1: 0] NextState_Status;
	reg [1: 0] State_Status = 2'b00;
	wire [1: 0] State_StatusDefault = 2'b00;
	wire TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case;
	wire signed [2: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs;
	wire signed [2: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs;
	wire TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case;
	wire signed [2: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs;
	wire signed [2: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs;
	wire TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case;
	wire signed [2: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs;
	wire signed [2: 0] TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs;
	wire TransactionDetectorModule_L30F37T78_Expr;
	wire signed [2: 0] TransactionDetectorModule_L30F37T78_ExprLhs;
	wire signed [2: 0] TransactionDetectorModule_L30F37T78_ExprRhs;
	wire TransactionDetectorModule_L31F40T89_Expr;
	wire signed [2: 0] TransactionDetectorModule_L31F40T89_ExprLhs;
	wire signed [2: 0] TransactionDetectorModule_L31F40T89_ExprRhs;
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_Status <= State_StatusDefault;
		end
		else
		begin
			State_Status <= NextState_Status;
		end
	end
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case = TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs == TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs ? 1'b1 : 1'b0;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case = TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs == TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs ? 1'b1 : 1'b0;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case = TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs == TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs ? 1'b1 : 1'b0;
	assign TransactionDetectorModule_L30F37T78_Expr = TransactionDetectorModule_L30F37T78_ExprLhs == TransactionDetectorModule_L30F37T78_ExprRhs ? 1'b1 : 1'b0;
	assign TransactionDetectorModule_L31F40T89_Expr = TransactionDetectorModule_L31F40T89_ExprLhs == TransactionDetectorModule_L31F40T89_ExprRhs ? 1'b1 : 1'b0;
	always @ (*)
	begin
		NextState_Status = State_Status;
		if ((TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case == 1))
		begin
			if ((Inputs_iTXBegin == 1))
			begin
				NextState_Status = TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L39F44T69_Expr;
			end
		end
		else if ((TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case == 1))
		begin
			if ((Inputs_iTXEnd == 1))
			begin
				NextState_Status = TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L43F44T77_Expr;
			end
		end
		else if ((TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case == 1))
		begin
			if ((Inputs_iRestart == 1))
			begin
				NextState_Status = TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L47F44T68_Expr;
			end
		end
	end
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs = {
		1'b0,
		State_Status
	}
	;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs = {
		1'b0,
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F22T46_Expr
	}
	;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs = {
		1'b0,
		State_Status
	}
	;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs = {
		1'b0,
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F22T47_Expr
	}
	;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs = {
		1'b0,
		State_Status
	}
	;
	assign TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs = {
		1'b0,
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F22T55_Expr
	}
	;
	assign TransactionDetectorModule_L30F37T78_ExprLhs = {
		1'b0,
		State_Status
	}
	;
	assign TransactionDetectorModule_L30F37T78_ExprRhs = {
		1'b0,
		TransactionDetectorModule_L30F53T78_Expr
	}
	;
	assign TransactionDetectorModule_L31F40T89_ExprLhs = {
		1'b0,
		State_Status
	}
	;
	assign TransactionDetectorModule_L31F40T89_ExprRhs = {
		1'b0,
		TransactionDetectorModule_L31F56T89_Expr
	}
	;
	assign Inputs_iRestart = iRestart;
	assign Inputs_iTXBegin = iTXBegin;
	assign Inputs_iTXEnd = iTXEnd;
	assign oTransaction = TransactionDetectorModule_L30F37T78_Expr;
	assign oWaitForRestart = TransactionDetectorModule_L31F40T89_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
