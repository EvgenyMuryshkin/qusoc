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
// System configuration name is AXILikeInteconnectModule_TopLevel_DuplexMux, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module AXILikeInteconnectModule_TopLevel_DuplexMux
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [9:0] iLeft0,
	input wire [9:0] iLeft1,
	input wire [9:0] iLeft2,
	input wire [9:0] iLeft3,
	input wire [9:0] iLeft4,
	input wire [9:0] iLeft5,
	input wire [9:0] iLeft6,
	input wire [9:0] iLeft7,
	input wire [2:0] iLeftAddr,
	input wire iLeftAddrValid,
	input wire [9:0] iRight0,
	input wire [9:0] iRight1,
	input wire [9:0] iRight2,
	input wire [9:0] iRight3,
	input wire [1:0] iRightAddr,
	input wire iRightAddrValid,
	output wire [9:0] oLeft0,
	output wire [9:0] oLeft1,
	output wire [9:0] oLeft2,
	output wire [9:0] oLeft3,
	output wire [9:0] oMuxLeftData,
	output wire [9:0] oMuxRightData,
	output wire [9:0] oRight0,
	output wire [9:0] oRight1,
	output wire [9:0] oRight2,
	output wire [9:0] oRight3,
	output wire [9:0] oRight4,
	output wire [9:0] oRight5,
	output wire [9:0] oRight6,
	output wire [9:0] oRight7
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire signed [4: 0] leftCount = 5'b01000;
	wire signed [3: 0] rightCount = 4'b0100;
	wire [0: 0] Prefilled0 = 1'b0;
	wire [0: 0] Prefilled1 = 1'b1;
	wire [1: 0] Prefilled2 = 2'b10;
	wire [1: 0] Prefilled3 = 2'b11;
	wire [2: 0] Prefilled4 = 3'b100;
	wire [2: 0] Prefilled5 = 3'b101;
	wire [2: 0] Prefilled6 = 3'b110;
	wire [2: 0] Prefilled7 = 3'b111;
	wire [2: 0] Inputs_iLeftAddr;
	wire Inputs_iLeftAddrValid;
	wire [1: 0] Inputs_iRightAddr;
	wire Inputs_iRightAddrValid;
	reg mEmptyLeftData_IsActive;
	reg [7: 0] mEmptyLeftData_Payload_Data;
	reg mEmptyLeftData_Payload_DataFlag;
	reg mEmptyRightData_IsActive;
	reg [7: 0] mEmptyRightData_Payload_Data;
	reg mEmptyRightData_Payload_DataFlag;
	reg mMuxLeftData_IsActive;
	reg [7: 0] mMuxLeftData_Payload_Data;
	reg mMuxLeftData_Payload_DataFlag;
	reg mMuxRightData_IsActive;
	reg [7: 0] mMuxRightData_Payload_Data;
	reg mMuxRightData_Payload_DataFlag;
	wire FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr;
	wire FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr_1;
	wire FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr_2;
	wire FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr;
	wire FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr_1;
	wire FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr_2;
	wire FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr;
	wire FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr_1;
	wire FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr_2;
	wire FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr;
	wire FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr_1;
	wire FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr;
	wire FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr_1;
	wire FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr_2;
	wire FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_Expr;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_ExprLhs;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_ExprRhs;
	wire FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_Expr;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_ExprLhs;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_ExprRhs;
	wire FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_Expr;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_ExprLhs;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_ExprRhs;
	wire FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_Expr;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_ExprLhs;
	wire signed [2: 0] FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_Expr;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_ExprLhs;
	wire signed [3: 0] FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_ExprRhs;
	wire [9 : 0] Inputs_iLeft [0 : 7];
	wire [9 : 0] Inputs_iRight [0 : 3];
	reg [9 : 0] mOutLeftData [0 : 3];
	integer mOutLeftData_i;
	initial
	begin : Init_mOutLeftData
		for (mOutLeftData_i = 0; mOutLeftData_i < 4; mOutLeftData_i = mOutLeftData_i + 1)
			mOutLeftData[mOutLeftData_i] = 0;
	end
	reg [9 : 0] mOutRightData [0 : 7];
	integer mOutRightData_i;
	initial
	begin : Init_mOutRightData
		for (mOutRightData_i = 0; mOutRightData_i < 8; mOutRightData_i = mOutRightData_i + 1)
			mOutRightData[mOutRightData_i] = 0;
	end
	assign FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_Expr = FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_ExprLhs == FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_Expr = FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_ExprLhs == FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_Expr = FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_ExprLhs == FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_Expr = FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_ExprLhs == FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_Expr = FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_ExprLhs == FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_ExprRhs ? 1'b1 : 1'b0;
	assign FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr = FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr_1 & FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr_2;
	assign FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr = FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr_1 & FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr_2;
	assign FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr = FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr_1 & FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr_2;
	assign FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr = FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr_1 & FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr_2;
	assign FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr = FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr_1 & FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr_2;
	always @ (*)
	begin
		if ((Inputs_iLeftAddrValid == 1))
		begin
			mMuxLeftData_Payload_DataFlag = Inputs_iLeft[Inputs_iLeftAddr][9];
			mMuxLeftData_Payload_Data = Inputs_iLeft[Inputs_iLeftAddr][8:1];
			mMuxLeftData_IsActive = Inputs_iLeft[Inputs_iLeftAddr][0];
		end
		else
		begin
			mMuxLeftData_IsActive = mEmptyLeftData_IsActive;
			mMuxLeftData_Payload_Data = mEmptyLeftData_Payload_Data;
			mMuxLeftData_Payload_DataFlag = mEmptyLeftData_Payload_DataFlag;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr == 1))
		begin
			mOutLeftData[0][9] = mMuxLeftData_Payload_DataFlag;
			mOutLeftData[0][8:1] = mMuxLeftData_Payload_Data;
			mOutLeftData[0][0] = mMuxLeftData_IsActive;
		end
		else
		begin
			mOutLeftData[0][9] = mEmptyLeftData_Payload_DataFlag;
			mOutLeftData[0][8:1] = mEmptyLeftData_Payload_Data;
			mOutLeftData[0][0] = mEmptyLeftData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr == 1))
		begin
			mOutLeftData[1][9] = mMuxLeftData_Payload_DataFlag;
			mOutLeftData[1][8:1] = mMuxLeftData_Payload_Data;
			mOutLeftData[1][0] = mMuxLeftData_IsActive;
		end
		else
		begin
			mOutLeftData[1][9] = mEmptyLeftData_Payload_DataFlag;
			mOutLeftData[1][8:1] = mEmptyLeftData_Payload_Data;
			mOutLeftData[1][0] = mEmptyLeftData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr == 1))
		begin
			mOutLeftData[2][9] = mMuxLeftData_Payload_DataFlag;
			mOutLeftData[2][8:1] = mMuxLeftData_Payload_Data;
			mOutLeftData[2][0] = mMuxLeftData_IsActive;
		end
		else
		begin
			mOutLeftData[2][9] = mEmptyLeftData_Payload_DataFlag;
			mOutLeftData[2][8:1] = mEmptyLeftData_Payload_Data;
			mOutLeftData[2][0] = mEmptyLeftData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr == 1))
		begin
			mOutLeftData[3][9] = mMuxLeftData_Payload_DataFlag;
			mOutLeftData[3][8:1] = mMuxLeftData_Payload_Data;
			mOutLeftData[3][0] = mMuxLeftData_IsActive;
		end
		else
		begin
			mOutLeftData[3][9] = mEmptyLeftData_Payload_DataFlag;
			mOutLeftData[3][8:1] = mEmptyLeftData_Payload_Data;
			mOutLeftData[3][0] = mEmptyLeftData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((Inputs_iRightAddrValid == 1))
		begin
			mMuxRightData_Payload_DataFlag = Inputs_iRight[Inputs_iRightAddr][9];
			mMuxRightData_Payload_Data = Inputs_iRight[Inputs_iRightAddr][8:1];
			mMuxRightData_IsActive = Inputs_iRight[Inputs_iRightAddr][0];
		end
		else
		begin
			mMuxRightData_IsActive = mEmptyRightData_IsActive;
			mMuxRightData_Payload_Data = mEmptyRightData_Payload_Data;
			mMuxRightData_Payload_DataFlag = mEmptyRightData_Payload_DataFlag;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[0][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[0][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[0][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[0][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[0][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[0][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[1][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[1][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[1][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[1][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[1][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[1][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[2][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[2][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[2][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[2][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[2][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[2][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[3][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[3][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[3][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[3][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[3][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[3][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[4][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[4][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[4][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[4][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[4][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[4][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[5][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[5][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[5][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[5][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[5][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[5][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[6][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[6][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[6][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[6][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[6][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[6][0] = mEmptyRightData_IsActive;
		end
	end
	always @ (*)
	begin
		if ((FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr == 1))
		begin
			mOutRightData[7][9] = mMuxRightData_Payload_DataFlag;
			mOutRightData[7][8:1] = mMuxRightData_Payload_Data;
			mOutRightData[7][0] = mMuxRightData_IsActive;
		end
		else
		begin
			mOutRightData[7][9] = mEmptyRightData_Payload_DataFlag;
			mOutRightData[7][8:1] = mEmptyRightData_Payload_Data;
			mOutRightData[7][0] = mEmptyRightData_IsActive;
		end
	end
	assign FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_ExprLhs = { 1'b0, Inputs_iRightAddr };
	assign FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_ExprRhs = { {2{1'b0}}, Prefilled0 };
	assign FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_ExprLhs = { 1'b0, Inputs_iRightAddr };
	assign FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_ExprRhs = { {2{1'b0}}, Prefilled1 };
	assign FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_ExprLhs = { 1'b0, Inputs_iRightAddr };
	assign FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_ExprRhs = { 1'b0, Prefilled2 };
	assign FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_ExprLhs = { 1'b0, Inputs_iRightAddr };
	assign FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_ExprRhs = { 1'b0, Prefilled3 };
	assign FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_ExprRhs = { {3{1'b0}}, Prefilled0 };
	assign FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_ExprRhs = { {3{1'b0}}, Prefilled1 };
	assign FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_ExprRhs = { {2{1'b0}}, Prefilled2 };
	assign FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_ExprRhs = { {2{1'b0}}, Prefilled3 };
	assign FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_ExprRhs = { 1'b0, Prefilled4 };
	assign FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_ExprRhs = { 1'b0, Prefilled5 };
	assign FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_ExprRhs = { 1'b0, Prefilled6 };
	assign FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_ExprLhs = { 1'b0, Inputs_iLeftAddr };
	assign FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_ExprRhs = { 1'b0, Prefilled7 };
	assign FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr_1 = Inputs_iRightAddrValid;
	assign FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F21T78_Expr_2 = FullDuplexMuxModule_L94F13L104T14_0_FullDuplexMuxModule_L96F47T78_Expr;
	assign FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr_1 = Inputs_iRightAddrValid;
	assign FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F21T78_Expr_2 = FullDuplexMuxModule_L94F13L104T14_1_FullDuplexMuxModule_L96F47T78_Expr;
	assign FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr_1 = Inputs_iRightAddrValid;
	assign FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F21T78_Expr_2 = FullDuplexMuxModule_L94F13L104T14_2_FullDuplexMuxModule_L96F47T78_Expr;
	assign FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr_1 = Inputs_iRightAddrValid;
	assign FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F21T78_Expr_2 = FullDuplexMuxModule_L94F13L104T14_3_FullDuplexMuxModule_L96F47T78_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_0_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_1_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_2_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_3_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_4_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_5_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_6_FullDuplexMuxModule_L120F46T75_Expr;
	assign FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr_1 = Inputs_iLeftAddrValid;
	assign FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F21T75_Expr_2 = FullDuplexMuxModule_L118F13L128T14_7_FullDuplexMuxModule_L120F46T75_Expr;
	assign Inputs_iLeft[0] = iLeft0;
	assign Inputs_iLeft[1] = iLeft1;
	assign Inputs_iLeft[2] = iLeft2;
	assign Inputs_iLeft[3] = iLeft3;
	assign Inputs_iLeft[4] = iLeft4;
	assign Inputs_iLeft[5] = iLeft5;
	assign Inputs_iLeft[6] = iLeft6;
	assign Inputs_iLeft[7] = iLeft7;
	assign Inputs_iLeftAddr = iLeftAddr;
	assign Inputs_iLeftAddrValid = iLeftAddrValid;
	assign Inputs_iRight[0] = iRight0;
	assign Inputs_iRight[1] = iRight1;
	assign Inputs_iRight[2] = iRight2;
	assign Inputs_iRight[3] = iRight3;
	assign Inputs_iRightAddr = iRightAddr;
	assign Inputs_iRightAddrValid = iRightAddrValid;
	assign oLeft0 = mOutLeftData[0];
	assign oLeft1 = mOutLeftData[1];
	assign oLeft2 = mOutLeftData[2];
	assign oLeft3 = mOutLeftData[3];
	assign oMuxLeftData[9] = mMuxLeftData_Payload_DataFlag;
	assign oMuxLeftData[8:1] = mMuxLeftData_Payload_Data;
	assign oMuxLeftData[0] = mMuxLeftData_IsActive;
	assign oMuxRightData[9] = mMuxRightData_Payload_DataFlag;
	assign oMuxRightData[8:1] = mMuxRightData_Payload_Data;
	assign oMuxRightData[0] = mMuxRightData_IsActive;
	assign oRight0 = mOutRightData[0];
	assign oRight1 = mOutRightData[1];
	assign oRight2 = mOutRightData[2];
	assign oRight3 = mOutRightData[3];
	assign oRight4 = mOutRightData[4];
	assign oRight5 = mOutRightData[5];
	assign oRight6 = mOutRightData[6];
	assign oRight7 = mOutRightData[7];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
