`timescale 1ns/1ps
`default_nettype none

`define Assert(expected, actual, message) \
if (expected !== actual) begin \
$display("Assert failed"); \
$display(message); \
$display("Expected: 0x%H, Actual: 0x%H", expected, actual); \
/*$finish;*/ \
end

module FIRModule4x16_testbench;
	reg clk;
	reg reset;

	reg iCOEF_V;
	reg [15:0] iCOEFF;
	reg [3:0] iDO;
	reg iIQ_V;
	reg [31:0] iIQ_i;
	reg [31:0] iIQ_q;

	wire oCOEF_RDY;
	wire oIQ_V;
	wire [47:0] oIQ_i;
	wire [47:0] oIQ_q;

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

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk); // reset

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 1");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 1");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 1");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 1");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000000100;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 2");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 2");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 2");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 2");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000001000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 3");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 3");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 3");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 3");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000001100;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 4");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 4");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 4");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 4");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000010000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 5");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 5");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 5");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 5");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000010100;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 6");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 6");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 6");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 6");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000011000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 7");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 7");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 7");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 7");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000011100;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 8");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 8");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 8");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 8");

		iCOEF_V = 1'b1;
		iCOEFF = 16'b0000000000100000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b0, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 9");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 9");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 9");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 9");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b0;
		iIQ_i = 16'b0000000000000000;
		iIQ_q = 16'b0000000000000000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 10");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 10");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 10");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 10");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000000100;
		iIQ_q = 16'b0000000000001000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 11");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 11");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 11");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 11");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000001000;
		iIQ_q = 16'b0000000000010000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 12");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 12");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 12");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 12");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000001100;
		iIQ_q = 16'b0000000000011000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 13");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 13");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 13");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 13");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000010000;
		iIQ_q = 16'b0000000000100000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 14");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 14");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 14");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 14");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000010100;
		iIQ_q = 16'b0000000000101000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 15");
		`Assert(1'b0, oIQ_V, "oIQ_V: value does not match at clock 15");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 15");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 15");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000011000;
		iIQ_q = 16'b0000000000110000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 16");
		`Assert(1'b1, oIQ_V, "oIQ_V: value does not match at clock 16");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 16");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 16");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000011100;
		iIQ_q = 16'b0000000000111000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 17");
		`Assert(1'b1, oIQ_V, "oIQ_V: value does not match at clock 17");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 17");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 17");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000100000;
		iIQ_q = 16'b0000000001000000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 18");
		`Assert(1'b1, oIQ_V, "oIQ_V: value does not match at clock 18");
		`Assert(24'b000000000000000000000000, oIQ_i, "oIQ_i: value does not match at clock 18");
		`Assert(24'b000000000000000000000000, oIQ_q, "oIQ_q: value does not match at clock 18");

		iCOEF_V = 1'b0;
		iCOEFF = 16'b0000000000000000;
		iDO = 4'b0000;
		iIQ_V = 1'b1;
		iIQ_i = 16'b0000000000100100;
		iIQ_q = 16'b0000000001001000;
		@(negedge clk);
		`Assert(1'b1, oCOEF_RDY, "oCOEF_RDY: value does not match at clock 19");
		`Assert(1'b1, oIQ_V, "oIQ_V: value does not match at clock 19");
		`Assert(24'b000000000000000000001001, oIQ_i, "oIQ_i: value does not match at clock 19");
		`Assert(24'b000000000000000000010010, oIQ_q, "oIQ_q: value does not match at clock 19");
	end

	// DUT instantiation
	FIRModule4x16_TopLevel_TopLevel dut (
		.Clock (clk),
		.Reset (reset),
		.iCOEF_V (iCOEF_V),
		.iCOEFF (iCOEFF),
		.iDO (iDO),
		.iIQ_V (iIQ_V),
		.iIQ_i (iIQ_i),
		.iIQ_q (iIQ_q),
		.oCOEF_RDY (oCOEF_RDY),
		.oIQ_V (oIQ_V),
		.oIQ_i (oIQ_i),
		.oIQ_q (oIQ_q)
	);
endmodule
