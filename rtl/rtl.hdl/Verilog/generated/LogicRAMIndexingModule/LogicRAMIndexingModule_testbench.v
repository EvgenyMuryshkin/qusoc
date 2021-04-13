`timescale 1ns/1ps
`default_nettype none

`define Assert(expected, actual, message) \
if (expected !== actual) begin \
$display("Assert failed"); \
$display(message); \
$display("Expected: 0x%H, Actual: 0x%H", expected, actual); \
/*$finish;*/ \
end

module LogicRAMIndexingModule_testbench;
	reg clk;
	reg reset;

	reg WE;
	reg [1:0] WriteAddr;
	reg [7:0] WriteData;
	reg [1:0] ReadAddr;
	reg [7:0] OpData;

	wire [7:0] MemLhsRhs;
	wire [7:0] MathMemLhs;
	wire [7:0] MathMemRhs;
	wire [7:0] LogicMemLhs;
	wire [7:0] LogicMemRhs;
	wire CmpMemLhs;
	wire CmpMemRhs;

	initial begin
		clk = 1'b0;
		forever clk = #500 ~clk;
	end

	initial begin
		reset = 1'b1;
		@(negedge clk);
		reset = 1'b0;

	end

	initial begin

		WE = 1'b0;
		WriteAddr = 0;
		WriteData = 0;
		ReadAddr = 0;
		OpData = 0;
		@(negedge clk); // reset

		WE = 1'b1;
		WriteAddr = 0;
		WriteData = 102;
		ReadAddr = 0;
		OpData = 0;
		@(negedge clk);
		`Assert(102, MemLhsRhs, "MemLhsRhs: value does not match at clock 1");
		`Assert(102, MathMemLhs, "MathMemLhs: value does not match at clock 1");
		`Assert(102, MathMemRhs, "MathMemRhs: value does not match at clock 1");
		`Assert(102, LogicMemLhs, "LogicMemLhs: value does not match at clock 1");
		`Assert(0, LogicMemRhs, "LogicMemRhs: value does not match at clock 1");
		`Assert(1'b1, CmpMemLhs, "CmpMemLhs: value does not match at clock 1");
		`Assert(1'b0, CmpMemRhs, "CmpMemRhs: value does not match at clock 1");

		WE = 1'b1;
		WriteAddr = 1;
		WriteData = 170;
		ReadAddr = 0;
		OpData = 0;
		@(negedge clk);
		`Assert(16, MemLhsRhs, "MemLhsRhs: value does not match at clock 2");
		`Assert(102, MathMemLhs, "MathMemLhs: value does not match at clock 2");
		`Assert(102, MathMemRhs, "MathMemRhs: value does not match at clock 2");
		`Assert(102, LogicMemLhs, "LogicMemLhs: value does not match at clock 2");
		`Assert(0, LogicMemRhs, "LogicMemRhs: value does not match at clock 2");
		`Assert(1'b1, CmpMemLhs, "CmpMemLhs: value does not match at clock 2");
		`Assert(1'b0, CmpMemRhs, "CmpMemRhs: value does not match at clock 2");

		WE = 1'b1;
		WriteAddr = 2;
		WriteData = 85;
		ReadAddr = 0;
		OpData = 0;
		@(negedge clk);
		`Assert(16, MemLhsRhs, "MemLhsRhs: value does not match at clock 3");
		`Assert(102, MathMemLhs, "MathMemLhs: value does not match at clock 3");
		`Assert(102, MathMemRhs, "MathMemRhs: value does not match at clock 3");
		`Assert(102, LogicMemLhs, "LogicMemLhs: value does not match at clock 3");
		`Assert(0, LogicMemRhs, "LogicMemRhs: value does not match at clock 3");
		`Assert(1'b1, CmpMemLhs, "CmpMemLhs: value does not match at clock 3");
		`Assert(1'b0, CmpMemRhs, "CmpMemRhs: value does not match at clock 3");

		WE = 1'b1;
		WriteAddr = 3;
		WriteData = 255;
		ReadAddr = 0;
		OpData = 0;
		@(negedge clk);
		`Assert(16, MemLhsRhs, "MemLhsRhs: value does not match at clock 4");
		`Assert(102, MathMemLhs, "MathMemLhs: value does not match at clock 4");
		`Assert(102, MathMemRhs, "MathMemRhs: value does not match at clock 4");
		`Assert(102, LogicMemLhs, "LogicMemLhs: value does not match at clock 4");
		`Assert(0, LogicMemRhs, "LogicMemRhs: value does not match at clock 4");
		`Assert(1'b1, CmpMemLhs, "CmpMemLhs: value does not match at clock 4");
		`Assert(1'b0, CmpMemRhs, "CmpMemRhs: value does not match at clock 4");

		WE = 1'b0;
		WriteAddr = 0;
		WriteData = 0;
		ReadAddr = 2;
		OpData = 240;
		@(negedge clk);
		`Assert(255, MemLhsRhs, "MemLhsRhs: value does not match at clock 5");
		`Assert(101, MathMemLhs, "MathMemLhs: value does not match at clock 5");
		`Assert(69, MathMemRhs, "MathMemRhs: value does not match at clock 5");
		`Assert(245, LogicMemLhs, "LogicMemLhs: value does not match at clock 5");
		`Assert(80, LogicMemRhs, "LogicMemRhs: value does not match at clock 5");
		`Assert(1'b0, CmpMemLhs, "CmpMemLhs: value does not match at clock 5");
		`Assert(1'b1, CmpMemRhs, "CmpMemRhs: value does not match at clock 5");

		WE = 1'b0;
		WriteAddr = 0;
		WriteData = 0;
		ReadAddr = 0;
		OpData = 80;
		@(negedge clk);
		`Assert(16, MemLhsRhs, "MemLhsRhs: value does not match at clock 6");
		`Assert(22, MathMemLhs, "MathMemLhs: value does not match at clock 6");
		`Assert(182, MathMemRhs, "MathMemRhs: value does not match at clock 6");
		`Assert(118, LogicMemLhs, "LogicMemLhs: value does not match at clock 6");
		`Assert(64, LogicMemRhs, "LogicMemRhs: value does not match at clock 6");
		`Assert(1'b1, CmpMemLhs, "CmpMemLhs: value does not match at clock 6");
		`Assert(1'b0, CmpMemRhs, "CmpMemRhs: value does not match at clock 6");
	end

	// DUT instantiation
	LogicRAMIndexingModule_TopLevel dut (
		.Clock (clk),
		.Reset (reset),
		.WE (WE),
		.WriteAddr (WriteAddr),
		.WriteData (WriteData),
		.ReadAddr (ReadAddr),
		.OpData (OpData),
		.MemLhsRhs (MemLhsRhs),
		.MathMemLhs (MathMemLhs),
		.MathMemRhs (MathMemRhs),
		.LogicMemLhs (LogicMemLhs),
		.LogicMemRhs (LogicMemRhs),
		.CmpMemLhs (CmpMemLhs),
		.CmpMemRhs (CmpMemRhs)
	);
endmodule
