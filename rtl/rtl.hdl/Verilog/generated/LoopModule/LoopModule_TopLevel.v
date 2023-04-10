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
// System configuration name is LoopModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module LoopModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [7:0] InData,
	output wire [7:0] Encode,
	output wire [7:0] EncodeInv,
	output wire OutAnd,
	output wire OutOr,
	output wire [7:0] OutTupleAddress,
	output wire OutTupleIsValid,
	output wire OutXor
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire LoopModule_L85F13L96T14_LoopModule_L86F32T37_Expr = 1'b0;
	wire LoopModule_L85F13L96T14_LoopModule_L87F31T32_Expr = 1'b0;
	wire [3: 0] LoopModule_L85F13L96T14_LoopModule_L88F17L93T18_Inputs_InData_Size = 4'b1000;
	wire LoopModule_L55F13L64T14_LoopModule_L56F31T32_Expr = 1'b0;
	wire [3: 0] LoopModule_L55F13L64T14_LoopModule_L57F17L61T18_Inputs_InData_Size = 4'b1000;
	wire LoopModule_L70F13L79T14_LoopModule_L71F30T31_Expr = 1'b0;
	wire [3: 0] LoopModule_L70F13L79T14_LoopModule_L72F17L76T18_Inputs_InData_Size = 4'b1000;
	wire LoopModule_L29F13L36T14_LoopModule_L30F31T35_Expr = 1'b1;
	wire [3: 0] LoopModule_L29F13L36T14_LoopModule_L31F17L34T18_Inputs_InData_Size = 4'b1000;
	wire [3: 0] LoopModule_L16F13L23T14_LoopModule_L18F17L21T18_Inputs_InData_Size = 4'b1000;
	wire [3: 0] LoopModule_L42F13L49T14_LoopModule_L44F17L47T18_Inputs_InData_Size = 4'b1000;
	wire [7: 0] Inputs_InData;
	wire [7: 0] Tuple_Item1;
	wire Tuple_Item2;
	reg LoopModule_L85F13L96T14_isValid;
	reg [7: 0] LoopModule_L85F13L96T14_result;
	integer idx;
	reg [7: 0] LoopModule_L55F13L64T14_result;
	integer idx1;
	reg signed [31: 0] LoopModule_L70F13L79T14_result;
	integer idx2;
	wire [7: 0] LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast;
	reg LoopModule_L29F13L36T14_result;
	integer idx3;
	reg LoopModule_L16F13L23T14_result;
	integer idx4;
	reg LoopModule_L42F13L49T14_result;
	integer idx5;
	always @ (*)
	begin
		idx = 0;
		LoopModule_L85F13L96T14_isValid = LoopModule_L85F13L96T14_LoopModule_L86F32T37_Expr;
		LoopModule_L85F13L96T14_result = { {7{1'b0}}, LoopModule_L85F13L96T14_LoopModule_L87F31T32_Expr };
		for (idx = 0; (idx < 8); idx = (idx + 1))
		begin
			LoopModule_L85F13L96T14_isValid = (LoopModule_L85F13L96T14_isValid | Inputs_InData[idx]);
			if (Inputs_InData[idx])
			begin
				LoopModule_L85F13L96T14_result = idx;
			end
		end
	end
	always @ (*)
	begin
		idx1 = 0;
		LoopModule_L55F13L64T14_result = { {7{1'b0}}, LoopModule_L55F13L64T14_LoopModule_L56F31T32_Expr };
		for (idx1 = 0; (idx1 < 8); idx1 = (idx1 + 1))
		begin
			if (Inputs_InData[idx1])
			begin
				LoopModule_L55F13L64T14_result = idx1;
			end
		end
	end
	always @ (*)
	begin
		idx2 = 8;
		LoopModule_L70F13L79T14_result = { {31{1'b0}}, LoopModule_L70F13L79T14_LoopModule_L71F30T31_Expr };
		for (idx2 = 8; (idx2 > 0); idx2 = (idx2 - 1))
		begin
			if (Inputs_InData[(idx2 - 1)])
			begin
				LoopModule_L70F13L79T14_result = (idx2 - 1);
			end
		end
	end
	always @ (*)
	begin
		idx3 = 0;
		LoopModule_L29F13L36T14_result = LoopModule_L29F13L36T14_LoopModule_L30F31T35_Expr;
		for (idx3 = 0; (idx3 < 8); idx3 = (idx3 + 1))
		begin
			LoopModule_L29F13L36T14_result = (LoopModule_L29F13L36T14_result & Inputs_InData[idx3]);
		end
	end
	always @ (*)
	begin
		idx4 = 1;
		LoopModule_L16F13L23T14_result = Inputs_InData[0];
		for (idx4 = 1; (idx4 < 8); idx4 = (idx4 + 1))
		begin
			LoopModule_L16F13L23T14_result = (LoopModule_L16F13L23T14_result | Inputs_InData[idx4]);
		end
	end
	always @ (*)
	begin
		idx5 = 1;
		LoopModule_L42F13L49T14_result = Inputs_InData[0];
		for (idx5 = 1; (idx5 < 8); idx5 = (idx5 + 1))
		begin
			LoopModule_L42F13L49T14_result = (LoopModule_L42F13L49T14_result ^ Inputs_InData[idx5]);
		end
	end
	assign Inputs_InData = InData;
	assign Tuple_Item1 = LoopModule_L85F13L96T14_result;
	assign Tuple_Item2 = LoopModule_L85F13L96T14_isValid;
	assign Encode = LoopModule_L55F13L64T14_result;
	assign LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast = LoopModule_L70F13L79T14_result[7:0];
	assign EncodeInv = LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast;
	assign OutAnd = LoopModule_L29F13L36T14_result;
	assign OutOr = LoopModule_L16F13L23T14_result;
	assign OutTupleAddress = Tuple_Item1;
	assign OutTupleIsValid = Tuple_Item2;
	assign OutXor = LoopModule_L42F13L49T14_result;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
