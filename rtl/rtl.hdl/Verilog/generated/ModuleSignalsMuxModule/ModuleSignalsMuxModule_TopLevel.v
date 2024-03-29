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
// System configuration name is ModuleSignalsMuxModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module ModuleSignalsMuxModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [1:0] Addr,
	input wire I1,
	input wire I2,
	output wire [2:0] CombinedO,
	output wire O,
	output wire oAnd,
	output wire oOr,
	output wire oXor
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire [1: 0] Inputs_Addr;
	wire Inputs_I1;
	wire Inputs_I2;
	wire AndGate_I1;
	wire AndGate_I2;
	wire AndGate_O;
	wire OrGate_I1;
	wire OrGate_I2;
	wire OrGate_O;
	wire XorGate_I1;
	wire XorGate_I2;
	wire XorGate_O;
	wire [2: 0] ModuleSignalsMuxModule_L32F41T105_Source;
	wire AndGate_I1_AndGate_I1_HardLink;
	wire AndGate_I2_AndGate_I2_HardLink;
	wire AndGate_O_AndGate_O_HardLink;
	wire OrGate_I1_OrGate_I1_HardLink;
	wire OrGate_I2_OrGate_I2_HardLink;
	wire OrGate_O_OrGate_O_HardLink;
	wire XorGate_I1_XorGate_I1_HardLink;
	wire XorGate_I2_XorGate_I2_HardLink;
	wire XorGate_O_XorGate_O_HardLink;
	reg ModuleSignalsMuxModule_L27F26T46_Mux;
	wire [1: 0] ModuleSignalsMuxModule_L27F26T46_MuxMultiplexerAddress;
	wire ModuleSignalsMuxModule_L27F26T46_Mux1;
	wire ModuleSignalsMuxModule_L27F26T46_Mux2;
	wire ModuleSignalsMuxModule_L27F26T46_Mux3;
	wire ModuleSignalsMuxModule_L32F82T104_Enumerable [0 : 2];
	ModuleSignalsMuxModule_TopLevel_AndGate
	ModuleSignalsMuxModule_TopLevel_AndGate
	(
		// [BEGIN USER MAP FOR AndGate]
		// [END USER MAP FOR AndGate]
		.I1 (AndGate_I1_AndGate_I1_HardLink),
		.I2 (AndGate_I2_AndGate_I2_HardLink),
		.O (AndGate_O_AndGate_O_HardLink)
	);
	ModuleSignalsMuxModule_TopLevel_OrGate
	ModuleSignalsMuxModule_TopLevel_OrGate
	(
		// [BEGIN USER MAP FOR OrGate]
		// [END USER MAP FOR OrGate]
		.I1 (OrGate_I1_OrGate_I1_HardLink),
		.I2 (OrGate_I2_OrGate_I2_HardLink),
		.O (OrGate_O_OrGate_O_HardLink)
	);
	ModuleSignalsMuxModule_TopLevel_XorGate
	ModuleSignalsMuxModule_TopLevel_XorGate
	(
		// [BEGIN USER MAP FOR XorGate]
		// [END USER MAP FOR XorGate]
		.I1 (XorGate_I1_XorGate_I1_HardLink),
		.I2 (XorGate_I2_XorGate_I2_HardLink),
		.O (XorGate_O_XorGate_O_HardLink)
	);
	always @ (*)
	begin
		case (ModuleSignalsMuxModule_L27F26T46_MuxMultiplexerAddress)
			'b00:
			begin
				ModuleSignalsMuxModule_L27F26T46_Mux = ModuleSignalsMuxModule_L27F26T46_Mux1;
			end
			'b01:
			begin
				ModuleSignalsMuxModule_L27F26T46_Mux = ModuleSignalsMuxModule_L27F26T46_Mux2;
			end
			'b10:
			begin
				ModuleSignalsMuxModule_L27F26T46_Mux = ModuleSignalsMuxModule_L27F26T46_Mux3;
			end
			default:
			begin
				ModuleSignalsMuxModule_L27F26T46_Mux = 'b0;
			end
		endcase
	end
	assign Inputs_Addr = Addr;
	assign Inputs_I1 = I1;
	assign Inputs_I2 = I2;
	assign AndGate_I1 = Inputs_I1;
	assign AndGate_I2 = Inputs_I2;
	assign OrGate_I1 = Inputs_I1;
	assign OrGate_I2 = Inputs_I2;
	assign XorGate_I1 = Inputs_I1;
	assign XorGate_I2 = Inputs_I2;
	assign ModuleSignalsMuxModule_L32F82T104_Enumerable[0] = AndGate_O;
	assign ModuleSignalsMuxModule_L32F82T104_Enumerable[1] = OrGate_O;
	assign ModuleSignalsMuxModule_L32F82T104_Enumerable[2] = XorGate_O;
	assign ModuleSignalsMuxModule_L32F41T105_Source = {
		ModuleSignalsMuxModule_L32F82T104_Enumerable[0],
		ModuleSignalsMuxModule_L32F82T104_Enumerable[1],
		ModuleSignalsMuxModule_L32F82T104_Enumerable[2]
	}
	;
	assign CombinedO = ModuleSignalsMuxModule_L32F41T105_Source;
	assign O = ModuleSignalsMuxModule_L27F26T46_Mux;
	assign oAnd = AndGate_O;
	assign oOr = OrGate_O;
	assign oXor = XorGate_O;
	assign AndGate_I1_AndGate_I1_HardLink = AndGate_I1;
	assign AndGate_I2_AndGate_I2_HardLink = AndGate_I2;
	assign AndGate_O = AndGate_O_AndGate_O_HardLink;
	assign OrGate_I1_OrGate_I1_HardLink = OrGate_I1;
	assign OrGate_I2_OrGate_I2_HardLink = OrGate_I2;
	assign OrGate_O = OrGate_O_OrGate_O_HardLink;
	assign XorGate_I1_XorGate_I1_HardLink = XorGate_I1;
	assign XorGate_I2_XorGate_I2_HardLink = XorGate_I2;
	assign XorGate_O = XorGate_O_XorGate_O_HardLink;
	assign ModuleSignalsMuxModule_L27F26T46_Mux1 = AndGate_O;
	assign ModuleSignalsMuxModule_L27F26T46_Mux2 = OrGate_O;
	assign ModuleSignalsMuxModule_L27F26T46_Mux3 = XorGate_O;
	assign ModuleSignalsMuxModule_L27F26T46_MuxMultiplexerAddress = Inputs_Addr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
