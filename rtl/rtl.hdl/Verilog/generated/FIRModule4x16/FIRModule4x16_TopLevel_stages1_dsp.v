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
// System configuration name is FIRModule4x16_TopLevel_stages1_dsp, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module FIRModule4x16_TopLevel_stages1_dsp
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire BoardSignals_Clock,
	input wire BoardSignals_Reset,
	input wire BoardSignals_Running,
	input wire BoardSignals_Starting,
	input wire BoardSignals_Started,
	input wire [15:0] iIQ,
	input wire [15:0] iFILO,
	input wire [15:0] iCoeff,
	input wire [32:0] iAccum,
	input wire iInternalFeedbackSelector,
	output wire [32:0] oAccum
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [2: 0] firParams_Order = 3'b100;
	wire [2: 0] firParams_DOSize = 3'b100;
	wire [4: 0] firParams_IQSize = 5'b10000;
	wire [4: 0] firParams_CoeffSize = 5'b10000;
	wire [4: 0] firParams_SumSize = 5'b10001;
	wire [5: 0] firParams_MultSize = 6'b100001;
	wire [5: 0] firParams_AccumSize = 6'b100001;
	wire [1: 0] firParams_CoeffRamAddrBits = 2'b10;
	wire [3: 0] firParams_DataRamAddrBits = 4'b1000;
	wire [15: 0] Inputs_iIQ;
	wire [15: 0] Inputs_iFILO;
	wire [15: 0] Inputs_iCoeff;
	wire [32: 0] Inputs_iAccum;
	wire Inputs_iInternalFeedbackSelector;
	reg [15: 0] NextState_IQ1;
	reg [15: 0] NextState_IQ2;
	reg [15: 0] NextState_coeff;
	reg [16: 0] NextState_sum;
	reg [32: 0] NextState_mult;
	reg [32: 0] NextState_accum;
	wire [32: 0] internalAccumInputData;
	wire [16: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index;
	wire [32: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index;
	wire [32: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index;
	reg [15: 0] State_IQ1 = 16'b0000000000000000;
	wire [15: 0] State_IQ1Default = 16'b0000000000000000;
	reg [15: 0] State_IQ2 = 16'b0000000000000000;
	wire [15: 0] State_IQ2Default = 16'b0000000000000000;
	reg [15: 0] State_coeff = 16'b0000000000000000;
	wire [15: 0] State_coeffDefault = 16'b0000000000000000;
	reg [16: 0] State_sum = 17'b00000000000000000;
	wire [16: 0] State_sumDefault = 17'b00000000000000000;
	reg [32: 0] State_mult = 33'b000000000000000000000000000000000;
	wire [32: 0] State_multDefault = 33'b000000000000000000000000000000000;
	reg [32: 0] State_accum = 33'b000000000000000000000000000000000;
	wire [32: 0] State_accumDefault = 33'b000000000000000000000000000000000;
	wire [17: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr;
	wire signed [17: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1;
	wire signed [17: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2;
	wire [33: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr;
	wire signed [33: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1;
	wire signed [33: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2;
	wire [34: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr;
	wire signed [34: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1;
	wire signed [34: 0] FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2;
	reg [32: 0] FIRStageDSPModule_L59F13L61T30_Lookup;
	wire FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress;
	wire [32: 0] FIRStageDSPModule_L59F13L61T30_Lookup1;
	wire [32: 0] FIRStageDSPModule_L59F13L61T30_Lookup2;
	always @ (posedge BoardSignals_Clock)
	begin
		if ((BoardSignals_Reset == 1))
		begin
			State_IQ1 <= State_IQ1Default;
			State_IQ2 <= State_IQ2Default;
			State_coeff <= State_coeffDefault;
			State_sum <= State_sumDefault;
			State_mult <= State_multDefault;
			State_accum <= State_accumDefault;
		end
		else
		begin
			State_IQ1 <= NextState_IQ1;
			State_IQ2 <= NextState_IQ2;
			State_coeff <= NextState_coeff;
			State_sum <= NextState_sum;
			State_mult <= NextState_mult;
			State_accum <= NextState_accum;
		end
	end
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1 + FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2;
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1 * FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2;
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1 + FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2;
	always @ (*)
	begin
		case (FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress)
			'b0:
			begin
				FIRStageDSPModule_L59F13L61T30_Lookup = FIRStageDSPModule_L59F13L61T30_Lookup1;
			end
			'b1:
			begin
				FIRStageDSPModule_L59F13L61T30_Lookup = FIRStageDSPModule_L59F13L61T30_Lookup2;
			end
			default:
			begin
				FIRStageDSPModule_L59F13L61T30_Lookup = 'b000000000000000000000000000000000;
			end
		endcase
	end
	always @ (*)
	begin
		NextState_IQ1 = State_IQ1;
		NextState_IQ2 = State_IQ2;
		NextState_coeff = State_coeff;
		NextState_sum = State_sum;
		NextState_mult = State_mult;
		NextState_accum = State_accum;
		NextState_IQ1 = Inputs_iIQ;
		NextState_IQ2 = State_IQ1;
		NextState_coeff = Inputs_iCoeff;
		NextState_sum = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index;
		NextState_mult = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index;
		NextState_accum = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index;
	end
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1 = { {2{1'b0}}, State_IQ2 };
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2 = { {2{1'b0}}, Inputs_iFILO };
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1 = { {17{1'b0}}, State_sum };
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2 = { {18{1'b0}}, State_coeff };
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1 = { {2{1'b0}}, State_mult };
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2 = { {2{1'b0}}, internalAccumInputData };
	assign Inputs_iIQ = iIQ;
	assign Inputs_iFILO = iFILO;
	assign Inputs_iCoeff = iCoeff;
	assign Inputs_iAccum = iAccum;
	assign Inputs_iInternalFeedbackSelector = iInternalFeedbackSelector;
	assign internalAccumInputData = FIRStageDSPModule_L59F13L61T30_Lookup;
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr[16:0];
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr[32:0];
	assign FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index = FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr[32:0];
	assign oAccum = State_accum;
	assign FIRStageDSPModule_L59F13L61T30_Lookup1 = State_accum;
	assign FIRStageDSPModule_L59F13L61T30_Lookup2 = Inputs_iAccum;
	assign FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress = Inputs_iInternalFeedbackSelector;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
