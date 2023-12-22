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
// System configuration name is AXITransactionDetectorModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module AXITransactionDetectorModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire iRestart,
	input wire iTXBegin,
	input wire iTXEnd,
	output wire oTransaction
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F22T49_Expr = 1'b0;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L38F44T72_Expr = 1'b1;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F22T50_Expr = 1'b1;
	wire [1: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L42F44T80_Expr = 2'b10;
	wire [1: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F22T58_Expr = 2'b10;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L46F44T71_Expr = 1'b0;
	wire AXITransactionDetectorModule_L31F53T81_Expr = 1'b1;
	wire Inputs_iRestart;
	wire Inputs_iTXBegin;
	wire Inputs_iTXEnd;
	reg [1: 0] NextState_Status;
	reg [1: 0] State_Status = 2'b00;
	wire [1: 0] State_StatusDefault = 2'b00;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_Case;
	wire signed [2: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_CaseLhs;
	wire signed [2: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_CaseRhs;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_Case;
	wire signed [2: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_CaseLhs;
	wire signed [2: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_CaseRhs;
	wire AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_Case;
	wire signed [2: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_CaseLhs;
	wire signed [2: 0] AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_CaseRhs;
	wire AXITransactionDetectorModule_L31F37T81_Expr;
	wire signed [2: 0] AXITransactionDetectorModule_L31F37T81_ExprLhs;
	wire signed [2: 0] AXITransactionDetectorModule_L31F37T81_ExprRhs;
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_Status <= State_StatusDefault;
		end
		else
		begin
			State_Status <= NextState_Status;
		end
	end
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_Case = AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_CaseLhs == AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_Case = AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_CaseLhs == AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_Case = AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_CaseLhs == AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_CaseRhs ? 1'b1 : 1'b0;
	assign AXITransactionDetectorModule_L31F37T81_Expr = AXITransactionDetectorModule_L31F37T81_ExprLhs == AXITransactionDetectorModule_L31F37T81_ExprRhs ? 1'b1 : 1'b0;
	always @ (*)
	begin
		NextState_Status = State_Status;
		if ((AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_Case == 1))
		begin
			if ((Inputs_iTXBegin == 1))
			begin
				NextState_Status = { 1'b0, AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L38F44T72_Expr };
			end
		end
		else if ((AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_Case == 1))
		begin
			if ((Inputs_iTXEnd == 1))
			begin
				NextState_Status = AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L42F44T80_Expr;
			end
		end
		else if ((AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_Case == 1))
		begin
			if ((Inputs_iRestart == 1))
			begin
				NextState_Status = { 1'b0, AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L46F44T71_Expr };
			end
		end
	end
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_CaseLhs = { 1'b0, State_Status };
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F17L39T27_CaseRhs = { {2{1'b0}}, AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L36F22T49_Expr };
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_CaseLhs = { 1'b0, State_Status };
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F17L43T27_CaseRhs = { {2{1'b0}}, AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L40F22T50_Expr };
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_CaseLhs = { 1'b0, State_Status };
	assign AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F17L47T27_CaseRhs = { 1'b0, AXITransactionDetectorModule_L33F9L49T10_AXITransactionDetectorModule_L34F13L48T14_AXITransactionDetectorModule_L44F22T58_Expr };
	assign AXITransactionDetectorModule_L31F37T81_ExprLhs = { 1'b0, State_Status };
	assign AXITransactionDetectorModule_L31F37T81_ExprRhs = { {2{1'b0}}, AXITransactionDetectorModule_L31F53T81_Expr };
	assign Inputs_iRestart = iRestart;
	assign Inputs_iTXBegin = iTXBegin;
	assign Inputs_iTXEnd = iTXEnd;
	assign oTransaction = AXITransactionDetectorModule_L31F37T81_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
