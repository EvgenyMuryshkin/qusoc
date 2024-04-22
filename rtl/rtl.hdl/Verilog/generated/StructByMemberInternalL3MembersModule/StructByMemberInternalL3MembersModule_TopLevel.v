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
// System configuration name is StructByMemberInternalL3MembersModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module StructByMemberInternalL3MembersModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [0:0] iL1_L1OptionalValue,
	input wire iL1_L1RequiredValue,
	input wire [1:0] iL1_L20_L2OptionalValue,
	input wire iL1_L20_L3_L3OptionalValue,
	input wire signed [15:0] iL1_L20_L3_L3RequiredValue,
	input wire iL1_L20_L3Tuple_Item1,
	input wire iL1_L20_L3Tuple_Item2_L3OptionalValue,
	input wire signed [15:0] iL1_L20_L3Tuple_Item2_L3RequiredValue,
	input wire [1:0] iL1_L21_L2OptionalValue,
	input wire iL1_L21_L3_L3OptionalValue,
	input wire signed [15:0] iL1_L21_L3_L3RequiredValue,
	input wire iL1_L21_L3Tuple_Item1,
	input wire iL1_L21_L3Tuple_Item2_L3OptionalValue,
	input wire signed [15:0] iL1_L21_L3Tuple_Item2_L3RequiredValue,
	output wire [0:0] oL1_L1OptionalValue,
	output wire oL1_L1RequiredValue,
	output wire [1:0] oL1_L20_L2OptionalValue,
	output wire oL1_L20_L3_L3OptionalValue,
	output wire signed [15:0] oL1_L20_L3_L3RequiredValue,
	output wire oL1_L20_L3Tuple_Item1,
	output wire oL1_L20_L3Tuple_Item2_L3OptionalValue,
	output wire signed [15:0] oL1_L20_L3Tuple_Item2_L3RequiredValue,
	output wire [1:0] oL1_L21_L2OptionalValue,
	output wire oL1_L21_L3_L3OptionalValue,
	output wire signed [15:0] oL1_L21_L3_L3RequiredValue,
	output wire oL1_L21_L3Tuple_Item1,
	output wire oL1_L21_L3Tuple_Item2_L3OptionalValue,
	output wire signed [15:0] oL1_L21_L3Tuple_Item2_L3RequiredValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [0: 0] Inputs_iL1_L1OptionalValue;
	wire Inputs_iL1_L1RequiredValue;
	wire [0: 0] internalL1_L1OptionalValue;
	wire internalL1_L1RequiredValue;
	wire [36: 0] StructByMemberInternalModule_L76F17L93T18_Object;
	wire [16: 0] StructByMemberInternalModule_L87F25L91T26_Object;
	wire [17: 0] StructByMemberInternalModule_L85F21L92T22_Tuple;
	wire [36 : 0] Inputs_iL1_L2 [0 : 1];
	wire [36 : 0] internalL1_L2 [0 : 1];
	wire [36 : 0] StructByMemberInternalModule_L73F18L94T14_Enumerable [0 : 1];
	assign Inputs_iL1_L1OptionalValue = iL1_L1OptionalValue;
	assign Inputs_iL1_L1RequiredValue = iL1_L1RequiredValue;
	assign Inputs_iL1_L2[0][36] = iL1_L20_L3Tuple_Item1;
	assign Inputs_iL1_L2[0][35:20] = iL1_L20_L3Tuple_Item2_L3RequiredValue;
	assign Inputs_iL1_L2[0][19] = iL1_L20_L3Tuple_Item2_L3OptionalValue;
	assign Inputs_iL1_L2[0][18:3] = iL1_L20_L3_L3RequiredValue;
	assign Inputs_iL1_L2[0][2] = iL1_L20_L3_L3OptionalValue;
	assign Inputs_iL1_L2[0][1:0] = iL1_L20_L2OptionalValue;
	assign Inputs_iL1_L2[1][36] = iL1_L21_L3Tuple_Item1;
	assign Inputs_iL1_L2[1][35:20] = iL1_L21_L3Tuple_Item2_L3RequiredValue;
	assign Inputs_iL1_L2[1][19] = iL1_L21_L3Tuple_Item2_L3OptionalValue;
	assign Inputs_iL1_L2[1][18:3] = iL1_L21_L3_L3RequiredValue;
	assign Inputs_iL1_L2[1][2] = iL1_L21_L3_L3OptionalValue;
	assign Inputs_iL1_L2[1][1:0] = iL1_L21_L2OptionalValue;
	assign internalL1_L1OptionalValue = Inputs_iL1_L1OptionalValue;
	assign internalL1_L1RequiredValue = Inputs_iL1_L1RequiredValue;
	assign internalL1_L2[0] = Inputs_iL1_L2[0];
	assign internalL1_L2[1] = Inputs_iL1_L2[1];
	assign StructByMemberInternalModule_L76F17L93T18_Object[1:0] = internalL1_L2[1][1:0];
	assign StructByMemberInternalModule_L76F17L93T18_Object[2] = internalL1_L2[1][2];
	assign StructByMemberInternalModule_L76F17L93T18_Object[18:3] = internalL1_L2[1][18:3];
	assign StructByMemberInternalModule_L87F25L91T26_Object[0] = internalL1_L2[1][19];
	assign StructByMemberInternalModule_L87F25L91T26_Object[16:1] = internalL1_L2[1][35:20];
	assign StructByMemberInternalModule_L85F21L92T22_Tuple[17] = internalL1_L2[1][36];
	assign StructByMemberInternalModule_L85F21L92T22_Tuple[16:0] = StructByMemberInternalModule_L87F25L91T26_Object;
	assign StructByMemberInternalModule_L76F17L93T18_Object[36:19] = StructByMemberInternalModule_L85F21L92T22_Tuple;
	assign StructByMemberInternalModule_L73F18L94T14_Enumerable[0] = internalL1_L2[0];
	assign StructByMemberInternalModule_L73F18L94T14_Enumerable[1] = StructByMemberInternalModule_L76F17L93T18_Object;
	assign oL1_L1OptionalValue = internalL1_L1OptionalValue;
	assign oL1_L1RequiredValue = internalL1_L1RequiredValue;
	assign oL1_L20_L3Tuple_Item1 = StructByMemberInternalModule_L73F18L94T14_Enumerable[0][36];
	assign oL1_L20_L3Tuple_Item2_L3RequiredValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[0][35:20];
	assign oL1_L20_L3Tuple_Item2_L3OptionalValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[0][19];
	assign oL1_L20_L3_L3RequiredValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[0][18:3];
	assign oL1_L20_L3_L3OptionalValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[0][2];
	assign oL1_L20_L2OptionalValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[0][1:0];
	assign oL1_L21_L3Tuple_Item1 = StructByMemberInternalModule_L73F18L94T14_Enumerable[1][36];
	assign oL1_L21_L3Tuple_Item2_L3RequiredValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[1][35:20];
	assign oL1_L21_L3Tuple_Item2_L3OptionalValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[1][19];
	assign oL1_L21_L3_L3RequiredValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[1][18:3];
	assign oL1_L21_L3_L3OptionalValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[1][2];
	assign oL1_L21_L2OptionalValue = StructByMemberInternalModule_L73F18L94T14_Enumerable[1][1:0];
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule