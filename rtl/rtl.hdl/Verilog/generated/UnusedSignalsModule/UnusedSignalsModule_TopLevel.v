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
// System configuration name is UnusedSignalsModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module UnusedSignalsModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire iObject_Tuple_Item1,
	input wire iObject_Tuple_Item2,
	input wire iObject_UnusedValue,
	input wire iObject_UnusedValueArray0,
	input wire iObject_UnusedValueArray1,
	input wire iObject_UnusedValueArray2,
	input wire iObject_UnusedValueArray3,
	input wire iObject_UsedValue,
	input wire iObject_UsedValueArray0,
	input wire iObject_UsedValueArray1,
	input wire iObject_UsedValueArray2,
	input wire iObject_UsedValueArray3,
	input wire iUnusedTuple_Item1,
	input wire iUnusedTuple_Item2,
	input wire iUnusedValue,
	input wire iUnusedValueArray0,
	input wire iUnusedValueArray1,
	input wire iUnusedValueArray2,
	input wire iUnusedValueArray3,
	input wire iUsedTuple_Item1,
	input wire iUsedTuple_Item2,
	input wire iUsedValue,
	input wire iUsedValueArray0,
	input wire iUsedValueArray1,
	input wire iUsedValueArray2,
	input wire iUsedValueArray3,
	output wire oInputArray0,
	output wire oInputArray1,
	output wire oInputArray2,
	output wire oInputArray3,
	output wire oInputArrayValue,
	output wire oInputClassArrayValue,
	output wire oInputClassValue,
	output wire oInputValue,
	output wire oInternal,
	output wire oStateValue
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	reg NextState_UnusedState;
	reg NextState_UsedState;
	wire unusedInternal;
	wire usedInternal;
	wire Inputs_iObject_Tuple_Item1;
	wire Inputs_iObject_Tuple_Item2;
	wire Inputs_iObject_UnusedValue;
	wire Inputs_iObject_UsedValue;
	wire Inputs_iUnusedTuple_Item1;
	wire Inputs_iUnusedTuple_Item2;
	wire Inputs_iUnusedValue;
	wire Inputs_iUsedTuple_Item1;
	wire Inputs_iUsedTuple_Item2;
	wire Inputs_iUsedValue;
	reg State_UnusedState = 1'b0;
	wire State_UnusedStateDefault = 1'b0;
	reg State_UsedState = 1'b0;
	wire State_UsedStateDefault = 1'b0;
	wire Inputs_iObject_UnusedValueArray [0 : 3];
	wire Inputs_iObject_UsedValueArray [0 : 3];
	wire Inputs_iUnusedValueArray [0 : 3];
	wire Inputs_iUsedValueArray [0 : 3];
	always @ (posedge Clock)
	begin
		if ((Reset == 1))
		begin
			State_UnusedState <= State_UnusedStateDefault;
			State_UsedState <= State_UsedStateDefault;
		end
		else
		begin
			State_UnusedState <= NextState_UnusedState;
			State_UsedState <= NextState_UsedState;
		end
	end
	always @ (*)
	begin
		NextState_UnusedState = State_UnusedState;
		NextState_UsedState = State_UsedState;
	end
	assign Inputs_iObject_Tuple_Item1 = iObject_Tuple_Item1;
	assign Inputs_iObject_Tuple_Item2 = iObject_Tuple_Item2;
	assign Inputs_iObject_UnusedValue = iObject_UnusedValue;
	assign Inputs_iObject_UnusedValueArray[0] = iObject_UnusedValueArray0;
	assign Inputs_iObject_UnusedValueArray[1] = iObject_UnusedValueArray1;
	assign Inputs_iObject_UnusedValueArray[2] = iObject_UnusedValueArray2;
	assign Inputs_iObject_UnusedValueArray[3] = iObject_UnusedValueArray3;
	assign Inputs_iObject_UsedValue = iObject_UsedValue;
	assign Inputs_iObject_UsedValueArray[0] = iObject_UsedValueArray0;
	assign Inputs_iObject_UsedValueArray[1] = iObject_UsedValueArray1;
	assign Inputs_iObject_UsedValueArray[2] = iObject_UsedValueArray2;
	assign Inputs_iObject_UsedValueArray[3] = iObject_UsedValueArray3;
	assign Inputs_iUnusedTuple_Item1 = iUnusedTuple_Item1;
	assign Inputs_iUnusedTuple_Item2 = iUnusedTuple_Item2;
	assign Inputs_iUnusedValue = iUnusedValue;
	assign Inputs_iUnusedValueArray[0] = iUnusedValueArray0;
	assign Inputs_iUnusedValueArray[1] = iUnusedValueArray1;
	assign Inputs_iUnusedValueArray[2] = iUnusedValueArray2;
	assign Inputs_iUnusedValueArray[3] = iUnusedValueArray3;
	assign Inputs_iUsedTuple_Item1 = iUsedTuple_Item1;
	assign Inputs_iUsedTuple_Item2 = iUsedTuple_Item2;
	assign Inputs_iUsedValue = iUsedValue;
	assign Inputs_iUsedValueArray[0] = iUsedValueArray0;
	assign Inputs_iUsedValueArray[1] = iUsedValueArray1;
	assign Inputs_iUsedValueArray[2] = iUsedValueArray2;
	assign Inputs_iUsedValueArray[3] = iUsedValueArray3;
	assign unusedInternal = Inputs_iUsedValue;
	assign usedInternal = Inputs_iUsedValue;
	assign oInputArray0 = Inputs_iUsedValueArray[0];
	assign oInputArray1 = Inputs_iUsedValueArray[1];
	assign oInputArray2 = Inputs_iUsedValueArray[2];
	assign oInputArray3 = Inputs_iUsedValueArray[3];
	assign oInputArrayValue = Inputs_iUsedValueArray[1];
	assign oInputClassArrayValue = Inputs_iUsedValue;
	assign oInputClassValue = Inputs_iUsedValue;
	assign oInputValue = Inputs_iUsedValue;
	assign oInternal = usedInternal;
	assign oStateValue = State_UsedState;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
