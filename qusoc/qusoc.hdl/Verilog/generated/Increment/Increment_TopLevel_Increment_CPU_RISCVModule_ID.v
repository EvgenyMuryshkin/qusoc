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
// System configuration name is Increment_TopLevel_Increment_CPU_RISCVModule_ID, clock frequency is 1Hz, Embedded
// FSM summary
// -- Packages
module Increment_TopLevel_Increment_CPU_RISCVModule_ID
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire [31:0] Instruction,
	output wire [6:0] OpCode,
	output wire [4:0] RD,
	output wire [4:0] RS1,
	output wire [4:0] RS2,
	output wire [2:0] Funct3,
	output wire [6:0] Funct7,
	output wire signed [31:0] RTypeImm,
	output wire signed [31:0] ITypeImm,
	output wire signed [31:0] STypeImm,
	output wire signed [31:0] BTypeImm,
	output wire signed [31:0] UTypeImm,
	output wire signed [31:0] JTypeImm,
	output wire [4:0] SHAMT,
	output wire SHARITH,
	output wire SUB,
	output wire [6:0] OpTypeCode,
	output wire [2:0] OPIMMCode,
	output wire [2:0] OPCode,
	output wire [2:0] BranchTypeCode,
	output wire [2:0] LoadTypeCode,
	output wire [2:0] SysTypeCode,
	output wire [4:0] RetTypeCode,
	output wire [3:0] IRQTypeCode,
	output wire [2:0] SystemCode,
	output wire [11:0] CSRAddress,
	output wire CSRWE
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire InstructionDecoders_L20F42T43_Expr = 1'b0;
	wire InstructionDecoders_L30F134T139_Expr = 1'b0;
	wire InstructionDecoders_L32F136T141_Expr = 1'b0;
	wire [1: 0] InstructionDecoders_L48F54T55_Expr = 2'b11;
	wire [31: 0] Inputs_Instruction;
	wire [31: 0] internalBits;
	wire signed [31: 0] internalITypeImm;
	wire [6: 0] internalOpCode;
	wire [2: 0] internalFunct3;
	wire [6: 0] internalFunct7;
	wire [4: 0] internalRS2;
	wire signed [31: 0] ZeroU32;
	wire [11: 0] InstructionDecoders_L14F51T88_Source;
	wire [11: 0] InstructionDecoders_L14F67T87_Index;
	wire signed [11: 0] InstructionDecoders_L14F51T97_SignChange;
	wire signed [31: 0] InstructionDecoders_L14F51T109_Resize;
	wire [6: 0] InstructionDecoders_L15F49T67_Index;
	wire [2: 0] InstructionDecoders_L16F49T69_Index;
	wire [6: 0] InstructionDecoders_L17F49T69_Index;
	wire [4: 0] InstructionDecoders_L18F46T66_Index;
	wire [4: 0] InstructionDecoders_L22F34T53_Index;
	wire [4: 0] InstructionDecoders_L23F35T55_Index;
	wire [11: 0] InstructionDecoders_L27F40T77_Source;
	wire [11: 0] InstructionDecoders_L27F56T76_Index;
	wire signed [11: 0] InstructionDecoders_L27F40T86_SignChange;
	wire signed [31: 0] InstructionDecoders_L27F40T98_Resize;
	wire [11: 0] InstructionDecoders_L28F40T77_Source;
	wire [11: 0] InstructionDecoders_L28F56T76_Index;
	wire signed [11: 0] InstructionDecoders_L28F40T86_SignChange;
	wire signed [31: 0] InstructionDecoders_L28F40T98_Resize;
	wire [11: 0] InstructionDecoders_L29F40T98_Source;
	wire [6: 0] InstructionDecoders_L29F56T76_Index;
	wire [4: 0] InstructionDecoders_L29F78T97_Index;
	wire signed [11: 0] InstructionDecoders_L29F40T107_SignChange;
	wire signed [31: 0] InstructionDecoders_L29F40T119_Resize;
	wire [12: 0] InstructionDecoders_L30F40T140_Source;
	wire InstructionDecoders_L30F56T72_Index;
	wire InstructionDecoders_L30F74T89_Index;
	wire [5: 0] InstructionDecoders_L30F91T111_Index;
	wire [3: 0] InstructionDecoders_L30F113T132_Index;
	wire signed [12: 0] InstructionDecoders_L30F40T149_SignChange;
	wire signed [31: 0] InstructionDecoders_L30F40T161_Resize;
	wire [31: 0] InstructionDecoders_L31F40T93_Source;
	wire [19: 0] InstructionDecoders_L31F56T76_Index;
	wire [11: 0] InstructionDecoders_L31F78T92_Index;
	wire signed [31: 0] InstructionDecoders_L31F40T102_SignChange;
	wire signed [31: 0] InstructionDecoders_L31F40T114_Resize;
	wire [20: 0] InstructionDecoders_L32F40T142_Source;
	wire InstructionDecoders_L32F56T72_Index;
	wire [7: 0] InstructionDecoders_L32F74T94_Index;
	wire InstructionDecoders_L32F96T112_Index;
	wire [9: 0] InstructionDecoders_L32F114T134_Index;
	wire signed [20: 0] InstructionDecoders_L32F40T151_SignChange;
	wire signed [31: 0] InstructionDecoders_L32F40T163_Resize;
	wire [4: 0] InstructionDecoders_L34F37T59_Index;
	wire InstructionDecoders_L35F32T52_Index;
	wire InstructionDecoders_L36F28T48_Index;
	wire [7: 0] InstructionDecoders_L38F55T75_Cast;
	wire [6: 0] InstructionDecoders_L38F42T75_Cast;
	wire [7: 0] InstructionDecoders_L39F52T72_Cast;
	wire [2: 0] InstructionDecoders_L39F40T72_Cast;
	wire [7: 0] InstructionDecoders_L40F43T63_Cast;
	wire [2: 0] InstructionDecoders_L40F34T63_Cast;
	wire [7: 0] InstructionDecoders_L41F67T87_Cast;
	wire [2: 0] InstructionDecoders_L41F50T87_Cast;
	wire [7: 0] InstructionDecoders_L42F61T81_Cast;
	wire [2: 0] InstructionDecoders_L42F46T81_Cast;
	wire [7: 0] InstructionDecoders_L43F58T75_Cast;
	wire [2: 0] InstructionDecoders_L43F44T75_Cast;
	wire [7: 0] InstructionDecoders_L44F58T78_Cast;
	wire [4: 0] InstructionDecoders_L44F44T78_Cast;
	wire [7: 0] InstructionDecoders_L45F58T78_Cast;
	wire [3: 0] InstructionDecoders_L45F44T78_Cast;
	wire [7: 0] InstructionDecoders_L46F55T75_Cast;
	wire [2: 0] InstructionDecoders_L46F42T75_Cast;
	wire [11: 0] InstructionDecoders_L47F57T77_Index;
	wire [15: 0] InstructionDecoders_L47F49T77_Cast;
	wire [11: 0] InstructionDecoders_L47F39T77_Cast;
	wire [1: 0] InstructionDecoders_L48F30T50_Index;
	wire InstructionDecoders_L48F30T55_Expr;
	wire signed [2: 0] InstructionDecoders_L48F30T55_ExprLhs;
	wire signed [2: 0] InstructionDecoders_L48F30T55_ExprRhs;
	assign InstructionDecoders_L48F30T55_Expr = InstructionDecoders_L48F30T55_ExprLhs != InstructionDecoders_L48F30T55_ExprRhs ? 1'b1 : 1'b0;
	assign InstructionDecoders_L48F30T55_ExprLhs = { 1'b0, InstructionDecoders_L48F30T50_Index };
	assign InstructionDecoders_L48F30T55_ExprRhs = { 1'b0, InstructionDecoders_L48F54T55_Expr };
	assign Inputs_Instruction = Instruction;
	assign internalBits = Inputs_Instruction;
	assign InstructionDecoders_L14F67T87_Index = internalBits[31:20];
	assign InstructionDecoders_L14F51T88_Source = InstructionDecoders_L14F67T87_Index;
	assign InstructionDecoders_L14F51T97_SignChange = InstructionDecoders_L14F51T88_Source;
	assign InstructionDecoders_L14F51T109_Resize = { {20{InstructionDecoders_L14F51T97_SignChange[11]}}, InstructionDecoders_L14F51T97_SignChange };
	assign internalITypeImm = InstructionDecoders_L14F51T109_Resize;
	assign InstructionDecoders_L15F49T67_Index = internalBits[6:0];
	assign internalOpCode = InstructionDecoders_L15F49T67_Index;
	assign InstructionDecoders_L16F49T69_Index = internalBits[14:12];
	assign internalFunct3 = InstructionDecoders_L16F49T69_Index;
	assign InstructionDecoders_L17F49T69_Index = internalBits[31:25];
	assign internalFunct7 = InstructionDecoders_L17F49T69_Index;
	assign InstructionDecoders_L18F46T66_Index = internalBits[24:20];
	assign internalRS2 = InstructionDecoders_L18F46T66_Index;
	assign ZeroU32 = { {31{1'b0}}, InstructionDecoders_L20F42T43_Expr };
	assign OpCode = internalOpCode;
	assign InstructionDecoders_L22F34T53_Index = internalBits[11:7];
	assign RD = InstructionDecoders_L22F34T53_Index;
	assign InstructionDecoders_L23F35T55_Index = internalBits[19:15];
	assign RS1 = InstructionDecoders_L23F35T55_Index;
	assign RS2 = internalRS2;
	assign Funct3 = internalFunct3;
	assign Funct7 = internalFunct7;
	assign InstructionDecoders_L27F56T76_Index = internalBits[31:20];
	assign InstructionDecoders_L27F40T77_Source = InstructionDecoders_L27F56T76_Index;
	assign InstructionDecoders_L27F40T86_SignChange = InstructionDecoders_L27F40T77_Source;
	assign InstructionDecoders_L27F40T98_Resize = { {20{InstructionDecoders_L27F40T86_SignChange[11]}}, InstructionDecoders_L27F40T86_SignChange };
	assign RTypeImm = InstructionDecoders_L27F40T98_Resize;
	assign InstructionDecoders_L28F56T76_Index = internalBits[31:20];
	assign InstructionDecoders_L28F40T77_Source = InstructionDecoders_L28F56T76_Index;
	assign InstructionDecoders_L28F40T86_SignChange = InstructionDecoders_L28F40T77_Source;
	assign InstructionDecoders_L28F40T98_Resize = { {20{InstructionDecoders_L28F40T86_SignChange[11]}}, InstructionDecoders_L28F40T86_SignChange };
	assign ITypeImm = InstructionDecoders_L28F40T98_Resize;
	assign InstructionDecoders_L29F56T76_Index = internalBits[31:25];
	assign InstructionDecoders_L29F78T97_Index = internalBits[11:7];
	assign InstructionDecoders_L29F40T98_Source = { InstructionDecoders_L29F56T76_Index, InstructionDecoders_L29F78T97_Index };
	assign InstructionDecoders_L29F40T107_SignChange = InstructionDecoders_L29F40T98_Source;
	assign InstructionDecoders_L29F40T119_Resize = { {20{InstructionDecoders_L29F40T107_SignChange[11]}}, InstructionDecoders_L29F40T107_SignChange };
	assign STypeImm = InstructionDecoders_L29F40T119_Resize;
	assign InstructionDecoders_L30F56T72_Index = internalBits[31];
	assign InstructionDecoders_L30F74T89_Index = internalBits[7];
	assign InstructionDecoders_L30F91T111_Index = internalBits[30:25];
	assign InstructionDecoders_L30F113T132_Index = internalBits[11:8];
	assign InstructionDecoders_L30F40T140_Source = { InstructionDecoders_L30F56T72_Index, InstructionDecoders_L30F74T89_Index, InstructionDecoders_L30F91T111_Index, InstructionDecoders_L30F113T132_Index, InstructionDecoders_L30F134T139_Expr };
	assign InstructionDecoders_L30F40T149_SignChange = InstructionDecoders_L30F40T140_Source;
	assign InstructionDecoders_L30F40T161_Resize = { {19{InstructionDecoders_L30F40T149_SignChange[12]}}, InstructionDecoders_L30F40T149_SignChange };
	assign BTypeImm = InstructionDecoders_L30F40T161_Resize;
	assign InstructionDecoders_L31F56T76_Index = internalBits[31:12];
	assign InstructionDecoders_L31F78T92_Index = ZeroU32[11:0];
	assign InstructionDecoders_L31F40T93_Source = { InstructionDecoders_L31F56T76_Index, InstructionDecoders_L31F78T92_Index };
	assign InstructionDecoders_L31F40T102_SignChange = InstructionDecoders_L31F40T93_Source;
	assign InstructionDecoders_L31F40T114_Resize = InstructionDecoders_L31F40T102_SignChange;
	assign UTypeImm = InstructionDecoders_L31F40T114_Resize;
	assign InstructionDecoders_L32F56T72_Index = internalBits[31];
	assign InstructionDecoders_L32F74T94_Index = internalBits[19:12];
	assign InstructionDecoders_L32F96T112_Index = internalBits[20];
	assign InstructionDecoders_L32F114T134_Index = internalBits[30:21];
	assign InstructionDecoders_L32F40T142_Source = { InstructionDecoders_L32F56T72_Index, InstructionDecoders_L32F74T94_Index, InstructionDecoders_L32F96T112_Index, InstructionDecoders_L32F114T134_Index, InstructionDecoders_L32F136T141_Expr };
	assign InstructionDecoders_L32F40T151_SignChange = InstructionDecoders_L32F40T142_Source;
	assign InstructionDecoders_L32F40T163_Resize = { {11{InstructionDecoders_L32F40T151_SignChange[20]}}, InstructionDecoders_L32F40T151_SignChange };
	assign JTypeImm = InstructionDecoders_L32F40T163_Resize;
	assign InstructionDecoders_L34F37T59_Index = internalITypeImm[4:0];
	assign SHAMT = InstructionDecoders_L34F37T59_Index;
	assign InstructionDecoders_L35F32T52_Index = internalITypeImm[10];
	assign SHARITH = InstructionDecoders_L35F32T52_Index;
	assign InstructionDecoders_L36F28T48_Index = internalITypeImm[10];
	assign SUB = InstructionDecoders_L36F28T48_Index;
	assign InstructionDecoders_L38F55T75_Cast = { 1'b0, internalOpCode };
	assign InstructionDecoders_L38F42T75_Cast = InstructionDecoders_L38F55T75_Cast[6:0];
	assign OpTypeCode = InstructionDecoders_L38F42T75_Cast;
	assign InstructionDecoders_L39F52T72_Cast = { {5{1'b0}}, internalFunct3 };
	assign InstructionDecoders_L39F40T72_Cast = InstructionDecoders_L39F52T72_Cast[2:0];
	assign OPIMMCode = InstructionDecoders_L39F40T72_Cast;
	assign InstructionDecoders_L40F43T63_Cast = { {5{1'b0}}, internalFunct3 };
	assign InstructionDecoders_L40F34T63_Cast = InstructionDecoders_L40F43T63_Cast[2:0];
	assign OPCode = InstructionDecoders_L40F34T63_Cast;
	assign InstructionDecoders_L41F67T87_Cast = { {5{1'b0}}, internalFunct3 };
	assign InstructionDecoders_L41F50T87_Cast = InstructionDecoders_L41F67T87_Cast[2:0];
	assign BranchTypeCode = InstructionDecoders_L41F50T87_Cast;
	assign InstructionDecoders_L42F61T81_Cast = { {5{1'b0}}, internalFunct3 };
	assign InstructionDecoders_L42F46T81_Cast = InstructionDecoders_L42F61T81_Cast[2:0];
	assign LoadTypeCode = InstructionDecoders_L42F46T81_Cast;
	assign InstructionDecoders_L43F58T75_Cast = { {3{1'b0}}, internalRS2 };
	assign InstructionDecoders_L43F44T75_Cast = InstructionDecoders_L43F58T75_Cast[2:0];
	assign SysTypeCode = InstructionDecoders_L43F44T75_Cast;
	assign InstructionDecoders_L44F58T78_Cast = { 1'b0, internalFunct7 };
	assign InstructionDecoders_L44F44T78_Cast = InstructionDecoders_L44F58T78_Cast[4:0];
	assign RetTypeCode = InstructionDecoders_L44F44T78_Cast;
	assign InstructionDecoders_L45F58T78_Cast = { 1'b0, internalFunct7 };
	assign InstructionDecoders_L45F44T78_Cast = InstructionDecoders_L45F58T78_Cast[3:0];
	assign IRQTypeCode = InstructionDecoders_L45F44T78_Cast;
	assign InstructionDecoders_L46F55T75_Cast = { {5{1'b0}}, internalFunct3 };
	assign InstructionDecoders_L46F42T75_Cast = InstructionDecoders_L46F55T75_Cast[2:0];
	assign SystemCode = InstructionDecoders_L46F42T75_Cast;
	assign InstructionDecoders_L47F57T77_Index = internalBits[31:20];
	assign InstructionDecoders_L47F49T77_Cast = { {4{1'b0}}, InstructionDecoders_L47F57T77_Index };
	assign InstructionDecoders_L47F39T77_Cast = InstructionDecoders_L47F49T77_Cast[11:0];
	assign CSRAddress = InstructionDecoders_L47F39T77_Cast;
	assign InstructionDecoders_L48F30T50_Index = internalBits[31:30];
	assign CSRWE = InstructionDecoders_L48F30T55_Expr;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
