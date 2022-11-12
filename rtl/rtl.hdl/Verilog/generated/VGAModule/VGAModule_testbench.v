`timescale 1ns/1ps
`default_nettype none

`define Assert(expected, actual, message) \
if (expected !== actual) begin \
$display("Assert failed"); \
$display(message); \
$display("Expected: 0x%H, Actual: 0x%H", expected, actual); \
/*$finish;*/ \
end

module VGAModule_testbench;
	reg clk;
	reg reset;


	wire VSync;
	wire HSync;
	wire IsVisible;
	wire R;
	wire G;
	wire B;

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

		@(negedge clk); // reset

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 1");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 1");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 1");
		`Assert(1'b1, R, "R: value does not match at clock 1");
		`Assert(1'b1, G, "G: value does not match at clock 1");
		`Assert(1'b1, B, "B: value does not match at clock 1");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 2");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 2");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 2");
		`Assert(1'b1, R, "R: value does not match at clock 2");
		`Assert(1'b1, G, "G: value does not match at clock 2");
		`Assert(1'b1, B, "B: value does not match at clock 2");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 3");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 3");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 3");
		`Assert(1'b1, R, "R: value does not match at clock 3");
		`Assert(1'b1, G, "G: value does not match at clock 3");
		`Assert(1'b1, B, "B: value does not match at clock 3");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 4");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 4");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 4");
		`Assert(1'b1, R, "R: value does not match at clock 4");
		`Assert(1'b1, G, "G: value does not match at clock 4");
		`Assert(1'b1, B, "B: value does not match at clock 4");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 5");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 5");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 5");
		`Assert(1'b1, R, "R: value does not match at clock 5");
		`Assert(1'b1, G, "G: value does not match at clock 5");
		`Assert(1'b1, B, "B: value does not match at clock 5");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 6");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 6");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 6");
		`Assert(1'b1, R, "R: value does not match at clock 6");
		`Assert(1'b1, G, "G: value does not match at clock 6");
		`Assert(1'b1, B, "B: value does not match at clock 6");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 7");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 7");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 7");
		`Assert(1'b1, R, "R: value does not match at clock 7");
		`Assert(1'b1, G, "G: value does not match at clock 7");
		`Assert(1'b1, B, "B: value does not match at clock 7");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 8");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 8");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 8");
		`Assert(1'b1, R, "R: value does not match at clock 8");
		`Assert(1'b1, G, "G: value does not match at clock 8");
		`Assert(1'b1, B, "B: value does not match at clock 8");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 9");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 9");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 9");
		`Assert(1'b1, R, "R: value does not match at clock 9");
		`Assert(1'b1, G, "G: value does not match at clock 9");
		`Assert(1'b1, B, "B: value does not match at clock 9");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 10");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 10");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 10");
		`Assert(1'b1, R, "R: value does not match at clock 10");
		`Assert(1'b1, G, "G: value does not match at clock 10");
		`Assert(1'b1, B, "B: value does not match at clock 10");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 11");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 11");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 11");
		`Assert(1'b1, R, "R: value does not match at clock 11");
		`Assert(1'b1, G, "G: value does not match at clock 11");
		`Assert(1'b1, B, "B: value does not match at clock 11");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 12");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 12");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 12");
		`Assert(1'b1, R, "R: value does not match at clock 12");
		`Assert(1'b1, G, "G: value does not match at clock 12");
		`Assert(1'b1, B, "B: value does not match at clock 12");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 13");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 13");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 13");
		`Assert(1'b1, R, "R: value does not match at clock 13");
		`Assert(1'b1, G, "G: value does not match at clock 13");
		`Assert(1'b1, B, "B: value does not match at clock 13");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 14");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 14");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 14");
		`Assert(1'b1, R, "R: value does not match at clock 14");
		`Assert(1'b1, G, "G: value does not match at clock 14");
		`Assert(1'b1, B, "B: value does not match at clock 14");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 15");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 15");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 15");
		`Assert(1'b1, R, "R: value does not match at clock 15");
		`Assert(1'b1, G, "G: value does not match at clock 15");
		`Assert(1'b1, B, "B: value does not match at clock 15");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 16");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 16");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 16");
		`Assert(1'b1, R, "R: value does not match at clock 16");
		`Assert(1'b1, G, "G: value does not match at clock 16");
		`Assert(1'b1, B, "B: value does not match at clock 16");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 17");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 17");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 17");
		`Assert(1'b1, R, "R: value does not match at clock 17");
		`Assert(1'b1, G, "G: value does not match at clock 17");
		`Assert(1'b1, B, "B: value does not match at clock 17");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 18");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 18");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 18");
		`Assert(1'b1, R, "R: value does not match at clock 18");
		`Assert(1'b1, G, "G: value does not match at clock 18");
		`Assert(1'b1, B, "B: value does not match at clock 18");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 19");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 19");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 19");
		`Assert(1'b1, R, "R: value does not match at clock 19");
		`Assert(1'b1, G, "G: value does not match at clock 19");
		`Assert(1'b1, B, "B: value does not match at clock 19");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 20");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 20");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 20");
		`Assert(1'b1, R, "R: value does not match at clock 20");
		`Assert(1'b1, G, "G: value does not match at clock 20");
		`Assert(1'b1, B, "B: value does not match at clock 20");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 21");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 21");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 21");
		`Assert(1'b1, R, "R: value does not match at clock 21");
		`Assert(1'b1, G, "G: value does not match at clock 21");
		`Assert(1'b1, B, "B: value does not match at clock 21");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 22");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 22");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 22");
		`Assert(1'b1, R, "R: value does not match at clock 22");
		`Assert(1'b1, G, "G: value does not match at clock 22");
		`Assert(1'b1, B, "B: value does not match at clock 22");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 23");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 23");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 23");
		`Assert(1'b1, R, "R: value does not match at clock 23");
		`Assert(1'b1, G, "G: value does not match at clock 23");
		`Assert(1'b1, B, "B: value does not match at clock 23");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 24");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 24");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 24");
		`Assert(1'b1, R, "R: value does not match at clock 24");
		`Assert(1'b1, G, "G: value does not match at clock 24");
		`Assert(1'b1, B, "B: value does not match at clock 24");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 25");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 25");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 25");
		`Assert(1'b1, R, "R: value does not match at clock 25");
		`Assert(1'b1, G, "G: value does not match at clock 25");
		`Assert(1'b1, B, "B: value does not match at clock 25");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 26");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 26");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 26");
		`Assert(1'b1, R, "R: value does not match at clock 26");
		`Assert(1'b1, G, "G: value does not match at clock 26");
		`Assert(1'b1, B, "B: value does not match at clock 26");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 27");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 27");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 27");
		`Assert(1'b1, R, "R: value does not match at clock 27");
		`Assert(1'b1, G, "G: value does not match at clock 27");
		`Assert(1'b1, B, "B: value does not match at clock 27");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 28");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 28");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 28");
		`Assert(1'b1, R, "R: value does not match at clock 28");
		`Assert(1'b1, G, "G: value does not match at clock 28");
		`Assert(1'b1, B, "B: value does not match at clock 28");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 29");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 29");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 29");
		`Assert(1'b1, R, "R: value does not match at clock 29");
		`Assert(1'b1, G, "G: value does not match at clock 29");
		`Assert(1'b1, B, "B: value does not match at clock 29");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 30");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 30");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 30");
		`Assert(1'b1, R, "R: value does not match at clock 30");
		`Assert(1'b1, G, "G: value does not match at clock 30");
		`Assert(1'b1, B, "B: value does not match at clock 30");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 31");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 31");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 31");
		`Assert(1'b1, R, "R: value does not match at clock 31");
		`Assert(1'b1, G, "G: value does not match at clock 31");
		`Assert(1'b1, B, "B: value does not match at clock 31");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 32");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 32");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 32");
		`Assert(1'b1, R, "R: value does not match at clock 32");
		`Assert(1'b1, G, "G: value does not match at clock 32");
		`Assert(1'b1, B, "B: value does not match at clock 32");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 33");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 33");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 33");
		`Assert(1'b1, R, "R: value does not match at clock 33");
		`Assert(1'b1, G, "G: value does not match at clock 33");
		`Assert(1'b1, B, "B: value does not match at clock 33");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 34");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 34");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 34");
		`Assert(1'b1, R, "R: value does not match at clock 34");
		`Assert(1'b1, G, "G: value does not match at clock 34");
		`Assert(1'b1, B, "B: value does not match at clock 34");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 35");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 35");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 35");
		`Assert(1'b1, R, "R: value does not match at clock 35");
		`Assert(1'b1, G, "G: value does not match at clock 35");
		`Assert(1'b1, B, "B: value does not match at clock 35");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 36");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 36");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 36");
		`Assert(1'b1, R, "R: value does not match at clock 36");
		`Assert(1'b1, G, "G: value does not match at clock 36");
		`Assert(1'b1, B, "B: value does not match at clock 36");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 37");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 37");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 37");
		`Assert(1'b1, R, "R: value does not match at clock 37");
		`Assert(1'b1, G, "G: value does not match at clock 37");
		`Assert(1'b1, B, "B: value does not match at clock 37");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 38");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 38");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 38");
		`Assert(1'b1, R, "R: value does not match at clock 38");
		`Assert(1'b1, G, "G: value does not match at clock 38");
		`Assert(1'b1, B, "B: value does not match at clock 38");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 39");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 39");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 39");
		`Assert(1'b1, R, "R: value does not match at clock 39");
		`Assert(1'b1, G, "G: value does not match at clock 39");
		`Assert(1'b1, B, "B: value does not match at clock 39");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 40");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 40");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 40");
		`Assert(1'b1, R, "R: value does not match at clock 40");
		`Assert(1'b1, G, "G: value does not match at clock 40");
		`Assert(1'b1, B, "B: value does not match at clock 40");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 41");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 41");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 41");
		`Assert(1'b1, R, "R: value does not match at clock 41");
		`Assert(1'b1, G, "G: value does not match at clock 41");
		`Assert(1'b1, B, "B: value does not match at clock 41");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 42");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 42");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 42");
		`Assert(1'b1, R, "R: value does not match at clock 42");
		`Assert(1'b1, G, "G: value does not match at clock 42");
		`Assert(1'b1, B, "B: value does not match at clock 42");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 43");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 43");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 43");
		`Assert(1'b1, R, "R: value does not match at clock 43");
		`Assert(1'b1, G, "G: value does not match at clock 43");
		`Assert(1'b1, B, "B: value does not match at clock 43");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 44");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 44");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 44");
		`Assert(1'b1, R, "R: value does not match at clock 44");
		`Assert(1'b1, G, "G: value does not match at clock 44");
		`Assert(1'b1, B, "B: value does not match at clock 44");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 45");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 45");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 45");
		`Assert(1'b1, R, "R: value does not match at clock 45");
		`Assert(1'b1, G, "G: value does not match at clock 45");
		`Assert(1'b1, B, "B: value does not match at clock 45");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 46");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 46");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 46");
		`Assert(1'b1, R, "R: value does not match at clock 46");
		`Assert(1'b1, G, "G: value does not match at clock 46");
		`Assert(1'b1, B, "B: value does not match at clock 46");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 47");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 47");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 47");
		`Assert(1'b1, R, "R: value does not match at clock 47");
		`Assert(1'b1, G, "G: value does not match at clock 47");
		`Assert(1'b1, B, "B: value does not match at clock 47");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 48");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 48");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 48");
		`Assert(1'b1, R, "R: value does not match at clock 48");
		`Assert(1'b1, G, "G: value does not match at clock 48");
		`Assert(1'b1, B, "B: value does not match at clock 48");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 49");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 49");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 49");
		`Assert(1'b1, R, "R: value does not match at clock 49");
		`Assert(1'b1, G, "G: value does not match at clock 49");
		`Assert(1'b1, B, "B: value does not match at clock 49");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 50");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 50");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 50");
		`Assert(1'b1, R, "R: value does not match at clock 50");
		`Assert(1'b1, G, "G: value does not match at clock 50");
		`Assert(1'b1, B, "B: value does not match at clock 50");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 51");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 51");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 51");
		`Assert(1'b1, R, "R: value does not match at clock 51");
		`Assert(1'b1, G, "G: value does not match at clock 51");
		`Assert(1'b1, B, "B: value does not match at clock 51");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 52");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 52");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 52");
		`Assert(1'b1, R, "R: value does not match at clock 52");
		`Assert(1'b1, G, "G: value does not match at clock 52");
		`Assert(1'b1, B, "B: value does not match at clock 52");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 53");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 53");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 53");
		`Assert(1'b1, R, "R: value does not match at clock 53");
		`Assert(1'b1, G, "G: value does not match at clock 53");
		`Assert(1'b1, B, "B: value does not match at clock 53");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 54");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 54");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 54");
		`Assert(1'b1, R, "R: value does not match at clock 54");
		`Assert(1'b1, G, "G: value does not match at clock 54");
		`Assert(1'b1, B, "B: value does not match at clock 54");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 55");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 55");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 55");
		`Assert(1'b1, R, "R: value does not match at clock 55");
		`Assert(1'b1, G, "G: value does not match at clock 55");
		`Assert(1'b1, B, "B: value does not match at clock 55");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 56");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 56");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 56");
		`Assert(1'b1, R, "R: value does not match at clock 56");
		`Assert(1'b1, G, "G: value does not match at clock 56");
		`Assert(1'b1, B, "B: value does not match at clock 56");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 57");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 57");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 57");
		`Assert(1'b1, R, "R: value does not match at clock 57");
		`Assert(1'b1, G, "G: value does not match at clock 57");
		`Assert(1'b1, B, "B: value does not match at clock 57");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 58");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 58");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 58");
		`Assert(1'b1, R, "R: value does not match at clock 58");
		`Assert(1'b1, G, "G: value does not match at clock 58");
		`Assert(1'b1, B, "B: value does not match at clock 58");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 59");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 59");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 59");
		`Assert(1'b1, R, "R: value does not match at clock 59");
		`Assert(1'b1, G, "G: value does not match at clock 59");
		`Assert(1'b1, B, "B: value does not match at clock 59");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 60");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 60");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 60");
		`Assert(1'b1, R, "R: value does not match at clock 60");
		`Assert(1'b1, G, "G: value does not match at clock 60");
		`Assert(1'b1, B, "B: value does not match at clock 60");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 61");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 61");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 61");
		`Assert(1'b1, R, "R: value does not match at clock 61");
		`Assert(1'b1, G, "G: value does not match at clock 61");
		`Assert(1'b1, B, "B: value does not match at clock 61");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 62");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 62");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 62");
		`Assert(1'b1, R, "R: value does not match at clock 62");
		`Assert(1'b1, G, "G: value does not match at clock 62");
		`Assert(1'b1, B, "B: value does not match at clock 62");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 63");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 63");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 63");
		`Assert(1'b1, R, "R: value does not match at clock 63");
		`Assert(1'b1, G, "G: value does not match at clock 63");
		`Assert(1'b1, B, "B: value does not match at clock 63");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 64");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 64");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 64");
		`Assert(1'b1, R, "R: value does not match at clock 64");
		`Assert(1'b1, G, "G: value does not match at clock 64");
		`Assert(1'b1, B, "B: value does not match at clock 64");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 65");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 65");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 65");
		`Assert(1'b1, R, "R: value does not match at clock 65");
		`Assert(1'b1, G, "G: value does not match at clock 65");
		`Assert(1'b1, B, "B: value does not match at clock 65");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 66");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 66");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 66");
		`Assert(1'b1, R, "R: value does not match at clock 66");
		`Assert(1'b1, G, "G: value does not match at clock 66");
		`Assert(1'b1, B, "B: value does not match at clock 66");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 67");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 67");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 67");
		`Assert(1'b1, R, "R: value does not match at clock 67");
		`Assert(1'b1, G, "G: value does not match at clock 67");
		`Assert(1'b1, B, "B: value does not match at clock 67");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 68");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 68");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 68");
		`Assert(1'b1, R, "R: value does not match at clock 68");
		`Assert(1'b1, G, "G: value does not match at clock 68");
		`Assert(1'b1, B, "B: value does not match at clock 68");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 69");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 69");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 69");
		`Assert(1'b1, R, "R: value does not match at clock 69");
		`Assert(1'b1, G, "G: value does not match at clock 69");
		`Assert(1'b1, B, "B: value does not match at clock 69");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 70");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 70");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 70");
		`Assert(1'b1, R, "R: value does not match at clock 70");
		`Assert(1'b1, G, "G: value does not match at clock 70");
		`Assert(1'b1, B, "B: value does not match at clock 70");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 71");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 71");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 71");
		`Assert(1'b1, R, "R: value does not match at clock 71");
		`Assert(1'b1, G, "G: value does not match at clock 71");
		`Assert(1'b1, B, "B: value does not match at clock 71");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 72");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 72");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 72");
		`Assert(1'b1, R, "R: value does not match at clock 72");
		`Assert(1'b1, G, "G: value does not match at clock 72");
		`Assert(1'b1, B, "B: value does not match at clock 72");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 73");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 73");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 73");
		`Assert(1'b1, R, "R: value does not match at clock 73");
		`Assert(1'b1, G, "G: value does not match at clock 73");
		`Assert(1'b1, B, "B: value does not match at clock 73");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 74");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 74");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 74");
		`Assert(1'b1, R, "R: value does not match at clock 74");
		`Assert(1'b1, G, "G: value does not match at clock 74");
		`Assert(1'b1, B, "B: value does not match at clock 74");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 75");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 75");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 75");
		`Assert(1'b1, R, "R: value does not match at clock 75");
		`Assert(1'b1, G, "G: value does not match at clock 75");
		`Assert(1'b1, B, "B: value does not match at clock 75");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 76");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 76");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 76");
		`Assert(1'b1, R, "R: value does not match at clock 76");
		`Assert(1'b1, G, "G: value does not match at clock 76");
		`Assert(1'b1, B, "B: value does not match at clock 76");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 77");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 77");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 77");
		`Assert(1'b1, R, "R: value does not match at clock 77");
		`Assert(1'b1, G, "G: value does not match at clock 77");
		`Assert(1'b1, B, "B: value does not match at clock 77");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 78");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 78");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 78");
		`Assert(1'b1, R, "R: value does not match at clock 78");
		`Assert(1'b1, G, "G: value does not match at clock 78");
		`Assert(1'b1, B, "B: value does not match at clock 78");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 79");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 79");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 79");
		`Assert(1'b1, R, "R: value does not match at clock 79");
		`Assert(1'b1, G, "G: value does not match at clock 79");
		`Assert(1'b1, B, "B: value does not match at clock 79");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 80");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 80");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 80");
		`Assert(1'b1, R, "R: value does not match at clock 80");
		`Assert(1'b1, G, "G: value does not match at clock 80");
		`Assert(1'b1, B, "B: value does not match at clock 80");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 81");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 81");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 81");
		`Assert(1'b1, R, "R: value does not match at clock 81");
		`Assert(1'b1, G, "G: value does not match at clock 81");
		`Assert(1'b1, B, "B: value does not match at clock 81");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 82");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 82");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 82");
		`Assert(1'b1, R, "R: value does not match at clock 82");
		`Assert(1'b1, G, "G: value does not match at clock 82");
		`Assert(1'b1, B, "B: value does not match at clock 82");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 83");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 83");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 83");
		`Assert(1'b1, R, "R: value does not match at clock 83");
		`Assert(1'b1, G, "G: value does not match at clock 83");
		`Assert(1'b1, B, "B: value does not match at clock 83");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 84");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 84");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 84");
		`Assert(1'b1, R, "R: value does not match at clock 84");
		`Assert(1'b1, G, "G: value does not match at clock 84");
		`Assert(1'b1, B, "B: value does not match at clock 84");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 85");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 85");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 85");
		`Assert(1'b1, R, "R: value does not match at clock 85");
		`Assert(1'b1, G, "G: value does not match at clock 85");
		`Assert(1'b1, B, "B: value does not match at clock 85");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 86");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 86");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 86");
		`Assert(1'b1, R, "R: value does not match at clock 86");
		`Assert(1'b1, G, "G: value does not match at clock 86");
		`Assert(1'b1, B, "B: value does not match at clock 86");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 87");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 87");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 87");
		`Assert(1'b1, R, "R: value does not match at clock 87");
		`Assert(1'b1, G, "G: value does not match at clock 87");
		`Assert(1'b1, B, "B: value does not match at clock 87");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 88");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 88");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 88");
		`Assert(1'b1, R, "R: value does not match at clock 88");
		`Assert(1'b1, G, "G: value does not match at clock 88");
		`Assert(1'b1, B, "B: value does not match at clock 88");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 89");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 89");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 89");
		`Assert(1'b1, R, "R: value does not match at clock 89");
		`Assert(1'b1, G, "G: value does not match at clock 89");
		`Assert(1'b1, B, "B: value does not match at clock 89");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 90");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 90");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 90");
		`Assert(1'b1, R, "R: value does not match at clock 90");
		`Assert(1'b1, G, "G: value does not match at clock 90");
		`Assert(1'b1, B, "B: value does not match at clock 90");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 91");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 91");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 91");
		`Assert(1'b1, R, "R: value does not match at clock 91");
		`Assert(1'b1, G, "G: value does not match at clock 91");
		`Assert(1'b1, B, "B: value does not match at clock 91");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 92");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 92");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 92");
		`Assert(1'b1, R, "R: value does not match at clock 92");
		`Assert(1'b1, G, "G: value does not match at clock 92");
		`Assert(1'b1, B, "B: value does not match at clock 92");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 93");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 93");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 93");
		`Assert(1'b1, R, "R: value does not match at clock 93");
		`Assert(1'b1, G, "G: value does not match at clock 93");
		`Assert(1'b1, B, "B: value does not match at clock 93");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 94");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 94");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 94");
		`Assert(1'b1, R, "R: value does not match at clock 94");
		`Assert(1'b1, G, "G: value does not match at clock 94");
		`Assert(1'b1, B, "B: value does not match at clock 94");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 95");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 95");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 95");
		`Assert(1'b1, R, "R: value does not match at clock 95");
		`Assert(1'b1, G, "G: value does not match at clock 95");
		`Assert(1'b1, B, "B: value does not match at clock 95");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 96");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 96");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 96");
		`Assert(1'b1, R, "R: value does not match at clock 96");
		`Assert(1'b1, G, "G: value does not match at clock 96");
		`Assert(1'b1, B, "B: value does not match at clock 96");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 97");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 97");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 97");
		`Assert(1'b1, R, "R: value does not match at clock 97");
		`Assert(1'b1, G, "G: value does not match at clock 97");
		`Assert(1'b1, B, "B: value does not match at clock 97");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 98");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 98");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 98");
		`Assert(1'b1, R, "R: value does not match at clock 98");
		`Assert(1'b1, G, "G: value does not match at clock 98");
		`Assert(1'b1, B, "B: value does not match at clock 98");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 99");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 99");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 99");
		`Assert(1'b1, R, "R: value does not match at clock 99");
		`Assert(1'b1, G, "G: value does not match at clock 99");
		`Assert(1'b1, B, "B: value does not match at clock 99");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 100");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 100");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 100");
		`Assert(1'b1, R, "R: value does not match at clock 100");
		`Assert(1'b1, G, "G: value does not match at clock 100");
		`Assert(1'b1, B, "B: value does not match at clock 100");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 101");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 101");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 101");
		`Assert(1'b1, R, "R: value does not match at clock 101");
		`Assert(1'b1, G, "G: value does not match at clock 101");
		`Assert(1'b1, B, "B: value does not match at clock 101");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 102");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 102");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 102");
		`Assert(1'b1, R, "R: value does not match at clock 102");
		`Assert(1'b1, G, "G: value does not match at clock 102");
		`Assert(1'b1, B, "B: value does not match at clock 102");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 103");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 103");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 103");
		`Assert(1'b1, R, "R: value does not match at clock 103");
		`Assert(1'b1, G, "G: value does not match at clock 103");
		`Assert(1'b1, B, "B: value does not match at clock 103");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 104");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 104");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 104");
		`Assert(1'b1, R, "R: value does not match at clock 104");
		`Assert(1'b1, G, "G: value does not match at clock 104");
		`Assert(1'b1, B, "B: value does not match at clock 104");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 105");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 105");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 105");
		`Assert(1'b1, R, "R: value does not match at clock 105");
		`Assert(1'b1, G, "G: value does not match at clock 105");
		`Assert(1'b1, B, "B: value does not match at clock 105");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 106");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 106");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 106");
		`Assert(1'b1, R, "R: value does not match at clock 106");
		`Assert(1'b1, G, "G: value does not match at clock 106");
		`Assert(1'b1, B, "B: value does not match at clock 106");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 107");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 107");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 107");
		`Assert(1'b1, R, "R: value does not match at clock 107");
		`Assert(1'b1, G, "G: value does not match at clock 107");
		`Assert(1'b1, B, "B: value does not match at clock 107");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 108");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 108");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 108");
		`Assert(1'b1, R, "R: value does not match at clock 108");
		`Assert(1'b1, G, "G: value does not match at clock 108");
		`Assert(1'b1, B, "B: value does not match at clock 108");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 109");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 109");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 109");
		`Assert(1'b1, R, "R: value does not match at clock 109");
		`Assert(1'b1, G, "G: value does not match at clock 109");
		`Assert(1'b1, B, "B: value does not match at clock 109");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 110");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 110");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 110");
		`Assert(1'b1, R, "R: value does not match at clock 110");
		`Assert(1'b1, G, "G: value does not match at clock 110");
		`Assert(1'b1, B, "B: value does not match at clock 110");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 111");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 111");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 111");
		`Assert(1'b1, R, "R: value does not match at clock 111");
		`Assert(1'b1, G, "G: value does not match at clock 111");
		`Assert(1'b1, B, "B: value does not match at clock 111");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 112");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 112");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 112");
		`Assert(1'b1, R, "R: value does not match at clock 112");
		`Assert(1'b1, G, "G: value does not match at clock 112");
		`Assert(1'b1, B, "B: value does not match at clock 112");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 113");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 113");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 113");
		`Assert(1'b1, R, "R: value does not match at clock 113");
		`Assert(1'b1, G, "G: value does not match at clock 113");
		`Assert(1'b1, B, "B: value does not match at clock 113");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 114");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 114");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 114");
		`Assert(1'b1, R, "R: value does not match at clock 114");
		`Assert(1'b1, G, "G: value does not match at clock 114");
		`Assert(1'b1, B, "B: value does not match at clock 114");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 115");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 115");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 115");
		`Assert(1'b1, R, "R: value does not match at clock 115");
		`Assert(1'b1, G, "G: value does not match at clock 115");
		`Assert(1'b1, B, "B: value does not match at clock 115");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 116");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 116");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 116");
		`Assert(1'b1, R, "R: value does not match at clock 116");
		`Assert(1'b1, G, "G: value does not match at clock 116");
		`Assert(1'b1, B, "B: value does not match at clock 116");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 117");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 117");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 117");
		`Assert(1'b1, R, "R: value does not match at clock 117");
		`Assert(1'b1, G, "G: value does not match at clock 117");
		`Assert(1'b1, B, "B: value does not match at clock 117");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 118");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 118");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 118");
		`Assert(1'b1, R, "R: value does not match at clock 118");
		`Assert(1'b1, G, "G: value does not match at clock 118");
		`Assert(1'b1, B, "B: value does not match at clock 118");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 119");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 119");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 119");
		`Assert(1'b1, R, "R: value does not match at clock 119");
		`Assert(1'b1, G, "G: value does not match at clock 119");
		`Assert(1'b1, B, "B: value does not match at clock 119");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 120");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 120");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 120");
		`Assert(1'b1, R, "R: value does not match at clock 120");
		`Assert(1'b1, G, "G: value does not match at clock 120");
		`Assert(1'b1, B, "B: value does not match at clock 120");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 121");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 121");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 121");
		`Assert(1'b1, R, "R: value does not match at clock 121");
		`Assert(1'b1, G, "G: value does not match at clock 121");
		`Assert(1'b1, B, "B: value does not match at clock 121");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 122");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 122");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 122");
		`Assert(1'b1, R, "R: value does not match at clock 122");
		`Assert(1'b1, G, "G: value does not match at clock 122");
		`Assert(1'b1, B, "B: value does not match at clock 122");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 123");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 123");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 123");
		`Assert(1'b1, R, "R: value does not match at clock 123");
		`Assert(1'b1, G, "G: value does not match at clock 123");
		`Assert(1'b1, B, "B: value does not match at clock 123");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 124");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 124");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 124");
		`Assert(1'b1, R, "R: value does not match at clock 124");
		`Assert(1'b1, G, "G: value does not match at clock 124");
		`Assert(1'b1, B, "B: value does not match at clock 124");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 125");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 125");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 125");
		`Assert(1'b1, R, "R: value does not match at clock 125");
		`Assert(1'b1, G, "G: value does not match at clock 125");
		`Assert(1'b1, B, "B: value does not match at clock 125");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 126");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 126");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 126");
		`Assert(1'b1, R, "R: value does not match at clock 126");
		`Assert(1'b1, G, "G: value does not match at clock 126");
		`Assert(1'b1, B, "B: value does not match at clock 126");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 127");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 127");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 127");
		`Assert(1'b1, R, "R: value does not match at clock 127");
		`Assert(1'b1, G, "G: value does not match at clock 127");
		`Assert(1'b1, B, "B: value does not match at clock 127");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 128");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 128");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 128");
		`Assert(1'b1, R, "R: value does not match at clock 128");
		`Assert(1'b1, G, "G: value does not match at clock 128");
		`Assert(1'b1, B, "B: value does not match at clock 128");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 129");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 129");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 129");
		`Assert(1'b1, R, "R: value does not match at clock 129");
		`Assert(1'b1, G, "G: value does not match at clock 129");
		`Assert(1'b1, B, "B: value does not match at clock 129");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 130");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 130");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 130");
		`Assert(1'b1, R, "R: value does not match at clock 130");
		`Assert(1'b1, G, "G: value does not match at clock 130");
		`Assert(1'b1, B, "B: value does not match at clock 130");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 131");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 131");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 131");
		`Assert(1'b1, R, "R: value does not match at clock 131");
		`Assert(1'b1, G, "G: value does not match at clock 131");
		`Assert(1'b1, B, "B: value does not match at clock 131");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 132");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 132");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 132");
		`Assert(1'b1, R, "R: value does not match at clock 132");
		`Assert(1'b1, G, "G: value does not match at clock 132");
		`Assert(1'b1, B, "B: value does not match at clock 132");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 133");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 133");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 133");
		`Assert(1'b1, R, "R: value does not match at clock 133");
		`Assert(1'b1, G, "G: value does not match at clock 133");
		`Assert(1'b1, B, "B: value does not match at clock 133");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 134");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 134");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 134");
		`Assert(1'b1, R, "R: value does not match at clock 134");
		`Assert(1'b1, G, "G: value does not match at clock 134");
		`Assert(1'b1, B, "B: value does not match at clock 134");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 135");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 135");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 135");
		`Assert(1'b1, R, "R: value does not match at clock 135");
		`Assert(1'b1, G, "G: value does not match at clock 135");
		`Assert(1'b1, B, "B: value does not match at clock 135");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 136");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 136");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 136");
		`Assert(1'b1, R, "R: value does not match at clock 136");
		`Assert(1'b1, G, "G: value does not match at clock 136");
		`Assert(1'b1, B, "B: value does not match at clock 136");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 137");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 137");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 137");
		`Assert(1'b1, R, "R: value does not match at clock 137");
		`Assert(1'b1, G, "G: value does not match at clock 137");
		`Assert(1'b1, B, "B: value does not match at clock 137");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 138");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 138");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 138");
		`Assert(1'b1, R, "R: value does not match at clock 138");
		`Assert(1'b1, G, "G: value does not match at clock 138");
		`Assert(1'b1, B, "B: value does not match at clock 138");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 139");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 139");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 139");
		`Assert(1'b1, R, "R: value does not match at clock 139");
		`Assert(1'b1, G, "G: value does not match at clock 139");
		`Assert(1'b1, B, "B: value does not match at clock 139");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 140");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 140");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 140");
		`Assert(1'b1, R, "R: value does not match at clock 140");
		`Assert(1'b1, G, "G: value does not match at clock 140");
		`Assert(1'b1, B, "B: value does not match at clock 140");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 141");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 141");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 141");
		`Assert(1'b1, R, "R: value does not match at clock 141");
		`Assert(1'b1, G, "G: value does not match at clock 141");
		`Assert(1'b1, B, "B: value does not match at clock 141");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 142");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 142");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 142");
		`Assert(1'b1, R, "R: value does not match at clock 142");
		`Assert(1'b1, G, "G: value does not match at clock 142");
		`Assert(1'b1, B, "B: value does not match at clock 142");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 143");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 143");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 143");
		`Assert(1'b1, R, "R: value does not match at clock 143");
		`Assert(1'b1, G, "G: value does not match at clock 143");
		`Assert(1'b1, B, "B: value does not match at clock 143");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 144");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 144");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 144");
		`Assert(1'b1, R, "R: value does not match at clock 144");
		`Assert(1'b1, G, "G: value does not match at clock 144");
		`Assert(1'b1, B, "B: value does not match at clock 144");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 145");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 145");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 145");
		`Assert(1'b1, R, "R: value does not match at clock 145");
		`Assert(1'b1, G, "G: value does not match at clock 145");
		`Assert(1'b1, B, "B: value does not match at clock 145");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 146");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 146");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 146");
		`Assert(1'b1, R, "R: value does not match at clock 146");
		`Assert(1'b1, G, "G: value does not match at clock 146");
		`Assert(1'b1, B, "B: value does not match at clock 146");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 147");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 147");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 147");
		`Assert(1'b1, R, "R: value does not match at clock 147");
		`Assert(1'b1, G, "G: value does not match at clock 147");
		`Assert(1'b1, B, "B: value does not match at clock 147");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 148");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 148");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 148");
		`Assert(1'b1, R, "R: value does not match at clock 148");
		`Assert(1'b1, G, "G: value does not match at clock 148");
		`Assert(1'b1, B, "B: value does not match at clock 148");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 149");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 149");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 149");
		`Assert(1'b1, R, "R: value does not match at clock 149");
		`Assert(1'b1, G, "G: value does not match at clock 149");
		`Assert(1'b1, B, "B: value does not match at clock 149");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 150");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 150");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 150");
		`Assert(1'b1, R, "R: value does not match at clock 150");
		`Assert(1'b1, G, "G: value does not match at clock 150");
		`Assert(1'b1, B, "B: value does not match at clock 150");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 151");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 151");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 151");
		`Assert(1'b1, R, "R: value does not match at clock 151");
		`Assert(1'b1, G, "G: value does not match at clock 151");
		`Assert(1'b1, B, "B: value does not match at clock 151");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 152");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 152");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 152");
		`Assert(1'b1, R, "R: value does not match at clock 152");
		`Assert(1'b1, G, "G: value does not match at clock 152");
		`Assert(1'b1, B, "B: value does not match at clock 152");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 153");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 153");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 153");
		`Assert(1'b1, R, "R: value does not match at clock 153");
		`Assert(1'b1, G, "G: value does not match at clock 153");
		`Assert(1'b1, B, "B: value does not match at clock 153");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 154");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 154");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 154");
		`Assert(1'b1, R, "R: value does not match at clock 154");
		`Assert(1'b1, G, "G: value does not match at clock 154");
		`Assert(1'b1, B, "B: value does not match at clock 154");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 155");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 155");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 155");
		`Assert(1'b1, R, "R: value does not match at clock 155");
		`Assert(1'b1, G, "G: value does not match at clock 155");
		`Assert(1'b1, B, "B: value does not match at clock 155");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 156");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 156");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 156");
		`Assert(1'b1, R, "R: value does not match at clock 156");
		`Assert(1'b1, G, "G: value does not match at clock 156");
		`Assert(1'b1, B, "B: value does not match at clock 156");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 157");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 157");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 157");
		`Assert(1'b1, R, "R: value does not match at clock 157");
		`Assert(1'b1, G, "G: value does not match at clock 157");
		`Assert(1'b1, B, "B: value does not match at clock 157");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 158");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 158");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 158");
		`Assert(1'b1, R, "R: value does not match at clock 158");
		`Assert(1'b1, G, "G: value does not match at clock 158");
		`Assert(1'b1, B, "B: value does not match at clock 158");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 159");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 159");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 159");
		`Assert(1'b1, R, "R: value does not match at clock 159");
		`Assert(1'b1, G, "G: value does not match at clock 159");
		`Assert(1'b1, B, "B: value does not match at clock 159");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 160");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 160");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 160");
		`Assert(1'b1, R, "R: value does not match at clock 160");
		`Assert(1'b1, G, "G: value does not match at clock 160");
		`Assert(1'b1, B, "B: value does not match at clock 160");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 161");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 161");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 161");
		`Assert(1'b1, R, "R: value does not match at clock 161");
		`Assert(1'b1, G, "G: value does not match at clock 161");
		`Assert(1'b1, B, "B: value does not match at clock 161");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 162");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 162");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 162");
		`Assert(1'b1, R, "R: value does not match at clock 162");
		`Assert(1'b1, G, "G: value does not match at clock 162");
		`Assert(1'b1, B, "B: value does not match at clock 162");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 163");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 163");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 163");
		`Assert(1'b1, R, "R: value does not match at clock 163");
		`Assert(1'b1, G, "G: value does not match at clock 163");
		`Assert(1'b1, B, "B: value does not match at clock 163");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 164");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 164");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 164");
		`Assert(1'b1, R, "R: value does not match at clock 164");
		`Assert(1'b1, G, "G: value does not match at clock 164");
		`Assert(1'b1, B, "B: value does not match at clock 164");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 165");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 165");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 165");
		`Assert(1'b1, R, "R: value does not match at clock 165");
		`Assert(1'b1, G, "G: value does not match at clock 165");
		`Assert(1'b1, B, "B: value does not match at clock 165");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 166");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 166");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 166");
		`Assert(1'b1, R, "R: value does not match at clock 166");
		`Assert(1'b1, G, "G: value does not match at clock 166");
		`Assert(1'b1, B, "B: value does not match at clock 166");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 167");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 167");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 167");
		`Assert(1'b1, R, "R: value does not match at clock 167");
		`Assert(1'b1, G, "G: value does not match at clock 167");
		`Assert(1'b1, B, "B: value does not match at clock 167");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 168");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 168");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 168");
		`Assert(1'b1, R, "R: value does not match at clock 168");
		`Assert(1'b1, G, "G: value does not match at clock 168");
		`Assert(1'b1, B, "B: value does not match at clock 168");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 169");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 169");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 169");
		`Assert(1'b1, R, "R: value does not match at clock 169");
		`Assert(1'b1, G, "G: value does not match at clock 169");
		`Assert(1'b1, B, "B: value does not match at clock 169");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 170");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 170");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 170");
		`Assert(1'b1, R, "R: value does not match at clock 170");
		`Assert(1'b1, G, "G: value does not match at clock 170");
		`Assert(1'b1, B, "B: value does not match at clock 170");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 171");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 171");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 171");
		`Assert(1'b1, R, "R: value does not match at clock 171");
		`Assert(1'b1, G, "G: value does not match at clock 171");
		`Assert(1'b1, B, "B: value does not match at clock 171");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 172");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 172");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 172");
		`Assert(1'b1, R, "R: value does not match at clock 172");
		`Assert(1'b1, G, "G: value does not match at clock 172");
		`Assert(1'b1, B, "B: value does not match at clock 172");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 173");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 173");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 173");
		`Assert(1'b1, R, "R: value does not match at clock 173");
		`Assert(1'b1, G, "G: value does not match at clock 173");
		`Assert(1'b1, B, "B: value does not match at clock 173");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 174");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 174");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 174");
		`Assert(1'b1, R, "R: value does not match at clock 174");
		`Assert(1'b1, G, "G: value does not match at clock 174");
		`Assert(1'b1, B, "B: value does not match at clock 174");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 175");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 175");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 175");
		`Assert(1'b1, R, "R: value does not match at clock 175");
		`Assert(1'b1, G, "G: value does not match at clock 175");
		`Assert(1'b1, B, "B: value does not match at clock 175");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 176");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 176");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 176");
		`Assert(1'b1, R, "R: value does not match at clock 176");
		`Assert(1'b1, G, "G: value does not match at clock 176");
		`Assert(1'b1, B, "B: value does not match at clock 176");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 177");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 177");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 177");
		`Assert(1'b1, R, "R: value does not match at clock 177");
		`Assert(1'b1, G, "G: value does not match at clock 177");
		`Assert(1'b1, B, "B: value does not match at clock 177");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 178");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 178");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 178");
		`Assert(1'b1, R, "R: value does not match at clock 178");
		`Assert(1'b1, G, "G: value does not match at clock 178");
		`Assert(1'b1, B, "B: value does not match at clock 178");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 179");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 179");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 179");
		`Assert(1'b1, R, "R: value does not match at clock 179");
		`Assert(1'b1, G, "G: value does not match at clock 179");
		`Assert(1'b1, B, "B: value does not match at clock 179");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 180");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 180");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 180");
		`Assert(1'b1, R, "R: value does not match at clock 180");
		`Assert(1'b1, G, "G: value does not match at clock 180");
		`Assert(1'b1, B, "B: value does not match at clock 180");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 181");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 181");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 181");
		`Assert(1'b1, R, "R: value does not match at clock 181");
		`Assert(1'b1, G, "G: value does not match at clock 181");
		`Assert(1'b1, B, "B: value does not match at clock 181");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 182");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 182");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 182");
		`Assert(1'b1, R, "R: value does not match at clock 182");
		`Assert(1'b1, G, "G: value does not match at clock 182");
		`Assert(1'b1, B, "B: value does not match at clock 182");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 183");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 183");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 183");
		`Assert(1'b1, R, "R: value does not match at clock 183");
		`Assert(1'b1, G, "G: value does not match at clock 183");
		`Assert(1'b1, B, "B: value does not match at clock 183");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 184");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 184");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 184");
		`Assert(1'b1, R, "R: value does not match at clock 184");
		`Assert(1'b1, G, "G: value does not match at clock 184");
		`Assert(1'b1, B, "B: value does not match at clock 184");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 185");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 185");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 185");
		`Assert(1'b1, R, "R: value does not match at clock 185");
		`Assert(1'b1, G, "G: value does not match at clock 185");
		`Assert(1'b1, B, "B: value does not match at clock 185");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 186");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 186");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 186");
		`Assert(1'b1, R, "R: value does not match at clock 186");
		`Assert(1'b1, G, "G: value does not match at clock 186");
		`Assert(1'b1, B, "B: value does not match at clock 186");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 187");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 187");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 187");
		`Assert(1'b1, R, "R: value does not match at clock 187");
		`Assert(1'b1, G, "G: value does not match at clock 187");
		`Assert(1'b1, B, "B: value does not match at clock 187");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 188");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 188");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 188");
		`Assert(1'b1, R, "R: value does not match at clock 188");
		`Assert(1'b1, G, "G: value does not match at clock 188");
		`Assert(1'b1, B, "B: value does not match at clock 188");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 189");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 189");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 189");
		`Assert(1'b1, R, "R: value does not match at clock 189");
		`Assert(1'b1, G, "G: value does not match at clock 189");
		`Assert(1'b1, B, "B: value does not match at clock 189");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 190");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 190");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 190");
		`Assert(1'b1, R, "R: value does not match at clock 190");
		`Assert(1'b1, G, "G: value does not match at clock 190");
		`Assert(1'b1, B, "B: value does not match at clock 190");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 191");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 191");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 191");
		`Assert(1'b1, R, "R: value does not match at clock 191");
		`Assert(1'b1, G, "G: value does not match at clock 191");
		`Assert(1'b1, B, "B: value does not match at clock 191");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 192");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 192");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 192");
		`Assert(1'b1, R, "R: value does not match at clock 192");
		`Assert(1'b1, G, "G: value does not match at clock 192");
		`Assert(1'b1, B, "B: value does not match at clock 192");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 193");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 193");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 193");
		`Assert(1'b1, R, "R: value does not match at clock 193");
		`Assert(1'b1, G, "G: value does not match at clock 193");
		`Assert(1'b1, B, "B: value does not match at clock 193");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 194");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 194");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 194");
		`Assert(1'b1, R, "R: value does not match at clock 194");
		`Assert(1'b1, G, "G: value does not match at clock 194");
		`Assert(1'b1, B, "B: value does not match at clock 194");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 195");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 195");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 195");
		`Assert(1'b1, R, "R: value does not match at clock 195");
		`Assert(1'b1, G, "G: value does not match at clock 195");
		`Assert(1'b1, B, "B: value does not match at clock 195");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 196");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 196");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 196");
		`Assert(1'b1, R, "R: value does not match at clock 196");
		`Assert(1'b1, G, "G: value does not match at clock 196");
		`Assert(1'b1, B, "B: value does not match at clock 196");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 197");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 197");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 197");
		`Assert(1'b1, R, "R: value does not match at clock 197");
		`Assert(1'b1, G, "G: value does not match at clock 197");
		`Assert(1'b1, B, "B: value does not match at clock 197");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 198");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 198");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 198");
		`Assert(1'b1, R, "R: value does not match at clock 198");
		`Assert(1'b1, G, "G: value does not match at clock 198");
		`Assert(1'b1, B, "B: value does not match at clock 198");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 199");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 199");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 199");
		`Assert(1'b1, R, "R: value does not match at clock 199");
		`Assert(1'b1, G, "G: value does not match at clock 199");
		`Assert(1'b1, B, "B: value does not match at clock 199");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 200");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 200");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 200");
		`Assert(1'b1, R, "R: value does not match at clock 200");
		`Assert(1'b1, G, "G: value does not match at clock 200");
		`Assert(1'b1, B, "B: value does not match at clock 200");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 201");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 201");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 201");
		`Assert(1'b1, R, "R: value does not match at clock 201");
		`Assert(1'b1, G, "G: value does not match at clock 201");
		`Assert(1'b1, B, "B: value does not match at clock 201");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 202");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 202");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 202");
		`Assert(1'b1, R, "R: value does not match at clock 202");
		`Assert(1'b1, G, "G: value does not match at clock 202");
		`Assert(1'b1, B, "B: value does not match at clock 202");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 203");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 203");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 203");
		`Assert(1'b1, R, "R: value does not match at clock 203");
		`Assert(1'b1, G, "G: value does not match at clock 203");
		`Assert(1'b1, B, "B: value does not match at clock 203");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 204");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 204");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 204");
		`Assert(1'b1, R, "R: value does not match at clock 204");
		`Assert(1'b1, G, "G: value does not match at clock 204");
		`Assert(1'b1, B, "B: value does not match at clock 204");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 205");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 205");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 205");
		`Assert(1'b1, R, "R: value does not match at clock 205");
		`Assert(1'b1, G, "G: value does not match at clock 205");
		`Assert(1'b1, B, "B: value does not match at clock 205");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 206");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 206");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 206");
		`Assert(1'b1, R, "R: value does not match at clock 206");
		`Assert(1'b1, G, "G: value does not match at clock 206");
		`Assert(1'b1, B, "B: value does not match at clock 206");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 207");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 207");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 207");
		`Assert(1'b1, R, "R: value does not match at clock 207");
		`Assert(1'b1, G, "G: value does not match at clock 207");
		`Assert(1'b1, B, "B: value does not match at clock 207");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 208");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 208");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 208");
		`Assert(1'b1, R, "R: value does not match at clock 208");
		`Assert(1'b1, G, "G: value does not match at clock 208");
		`Assert(1'b1, B, "B: value does not match at clock 208");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 209");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 209");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 209");
		`Assert(1'b1, R, "R: value does not match at clock 209");
		`Assert(1'b1, G, "G: value does not match at clock 209");
		`Assert(1'b1, B, "B: value does not match at clock 209");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 210");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 210");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 210");
		`Assert(1'b1, R, "R: value does not match at clock 210");
		`Assert(1'b1, G, "G: value does not match at clock 210");
		`Assert(1'b1, B, "B: value does not match at clock 210");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 211");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 211");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 211");
		`Assert(1'b1, R, "R: value does not match at clock 211");
		`Assert(1'b1, G, "G: value does not match at clock 211");
		`Assert(1'b1, B, "B: value does not match at clock 211");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 212");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 212");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 212");
		`Assert(1'b1, R, "R: value does not match at clock 212");
		`Assert(1'b1, G, "G: value does not match at clock 212");
		`Assert(1'b1, B, "B: value does not match at clock 212");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 213");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 213");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 213");
		`Assert(1'b1, R, "R: value does not match at clock 213");
		`Assert(1'b1, G, "G: value does not match at clock 213");
		`Assert(1'b1, B, "B: value does not match at clock 213");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 214");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 214");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 214");
		`Assert(1'b1, R, "R: value does not match at clock 214");
		`Assert(1'b1, G, "G: value does not match at clock 214");
		`Assert(1'b1, B, "B: value does not match at clock 214");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 215");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 215");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 215");
		`Assert(1'b1, R, "R: value does not match at clock 215");
		`Assert(1'b1, G, "G: value does not match at clock 215");
		`Assert(1'b1, B, "B: value does not match at clock 215");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 216");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 216");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 216");
		`Assert(1'b1, R, "R: value does not match at clock 216");
		`Assert(1'b1, G, "G: value does not match at clock 216");
		`Assert(1'b1, B, "B: value does not match at clock 216");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 217");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 217");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 217");
		`Assert(1'b1, R, "R: value does not match at clock 217");
		`Assert(1'b1, G, "G: value does not match at clock 217");
		`Assert(1'b1, B, "B: value does not match at clock 217");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 218");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 218");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 218");
		`Assert(1'b1, R, "R: value does not match at clock 218");
		`Assert(1'b1, G, "G: value does not match at clock 218");
		`Assert(1'b1, B, "B: value does not match at clock 218");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 219");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 219");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 219");
		`Assert(1'b1, R, "R: value does not match at clock 219");
		`Assert(1'b1, G, "G: value does not match at clock 219");
		`Assert(1'b1, B, "B: value does not match at clock 219");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 220");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 220");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 220");
		`Assert(1'b1, R, "R: value does not match at clock 220");
		`Assert(1'b1, G, "G: value does not match at clock 220");
		`Assert(1'b1, B, "B: value does not match at clock 220");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 221");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 221");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 221");
		`Assert(1'b1, R, "R: value does not match at clock 221");
		`Assert(1'b1, G, "G: value does not match at clock 221");
		`Assert(1'b1, B, "B: value does not match at clock 221");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 222");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 222");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 222");
		`Assert(1'b1, R, "R: value does not match at clock 222");
		`Assert(1'b1, G, "G: value does not match at clock 222");
		`Assert(1'b1, B, "B: value does not match at clock 222");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 223");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 223");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 223");
		`Assert(1'b1, R, "R: value does not match at clock 223");
		`Assert(1'b1, G, "G: value does not match at clock 223");
		`Assert(1'b1, B, "B: value does not match at clock 223");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 224");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 224");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 224");
		`Assert(1'b1, R, "R: value does not match at clock 224");
		`Assert(1'b1, G, "G: value does not match at clock 224");
		`Assert(1'b1, B, "B: value does not match at clock 224");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 225");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 225");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 225");
		`Assert(1'b1, R, "R: value does not match at clock 225");
		`Assert(1'b1, G, "G: value does not match at clock 225");
		`Assert(1'b1, B, "B: value does not match at clock 225");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 226");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 226");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 226");
		`Assert(1'b1, R, "R: value does not match at clock 226");
		`Assert(1'b1, G, "G: value does not match at clock 226");
		`Assert(1'b1, B, "B: value does not match at clock 226");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 227");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 227");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 227");
		`Assert(1'b1, R, "R: value does not match at clock 227");
		`Assert(1'b1, G, "G: value does not match at clock 227");
		`Assert(1'b1, B, "B: value does not match at clock 227");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 228");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 228");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 228");
		`Assert(1'b1, R, "R: value does not match at clock 228");
		`Assert(1'b1, G, "G: value does not match at clock 228");
		`Assert(1'b1, B, "B: value does not match at clock 228");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 229");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 229");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 229");
		`Assert(1'b1, R, "R: value does not match at clock 229");
		`Assert(1'b1, G, "G: value does not match at clock 229");
		`Assert(1'b1, B, "B: value does not match at clock 229");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 230");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 230");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 230");
		`Assert(1'b1, R, "R: value does not match at clock 230");
		`Assert(1'b1, G, "G: value does not match at clock 230");
		`Assert(1'b1, B, "B: value does not match at clock 230");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 231");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 231");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 231");
		`Assert(1'b1, R, "R: value does not match at clock 231");
		`Assert(1'b1, G, "G: value does not match at clock 231");
		`Assert(1'b1, B, "B: value does not match at clock 231");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 232");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 232");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 232");
		`Assert(1'b1, R, "R: value does not match at clock 232");
		`Assert(1'b1, G, "G: value does not match at clock 232");
		`Assert(1'b1, B, "B: value does not match at clock 232");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 233");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 233");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 233");
		`Assert(1'b1, R, "R: value does not match at clock 233");
		`Assert(1'b1, G, "G: value does not match at clock 233");
		`Assert(1'b1, B, "B: value does not match at clock 233");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 234");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 234");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 234");
		`Assert(1'b1, R, "R: value does not match at clock 234");
		`Assert(1'b1, G, "G: value does not match at clock 234");
		`Assert(1'b1, B, "B: value does not match at clock 234");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 235");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 235");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 235");
		`Assert(1'b1, R, "R: value does not match at clock 235");
		`Assert(1'b1, G, "G: value does not match at clock 235");
		`Assert(1'b1, B, "B: value does not match at clock 235");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 236");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 236");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 236");
		`Assert(1'b1, R, "R: value does not match at clock 236");
		`Assert(1'b1, G, "G: value does not match at clock 236");
		`Assert(1'b1, B, "B: value does not match at clock 236");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 237");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 237");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 237");
		`Assert(1'b1, R, "R: value does not match at clock 237");
		`Assert(1'b1, G, "G: value does not match at clock 237");
		`Assert(1'b1, B, "B: value does not match at clock 237");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 238");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 238");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 238");
		`Assert(1'b1, R, "R: value does not match at clock 238");
		`Assert(1'b1, G, "G: value does not match at clock 238");
		`Assert(1'b1, B, "B: value does not match at clock 238");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 239");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 239");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 239");
		`Assert(1'b1, R, "R: value does not match at clock 239");
		`Assert(1'b1, G, "G: value does not match at clock 239");
		`Assert(1'b1, B, "B: value does not match at clock 239");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 240");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 240");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 240");
		`Assert(1'b1, R, "R: value does not match at clock 240");
		`Assert(1'b1, G, "G: value does not match at clock 240");
		`Assert(1'b1, B, "B: value does not match at clock 240");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 241");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 241");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 241");
		`Assert(1'b1, R, "R: value does not match at clock 241");
		`Assert(1'b1, G, "G: value does not match at clock 241");
		`Assert(1'b1, B, "B: value does not match at clock 241");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 242");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 242");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 242");
		`Assert(1'b1, R, "R: value does not match at clock 242");
		`Assert(1'b1, G, "G: value does not match at clock 242");
		`Assert(1'b1, B, "B: value does not match at clock 242");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 243");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 243");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 243");
		`Assert(1'b1, R, "R: value does not match at clock 243");
		`Assert(1'b1, G, "G: value does not match at clock 243");
		`Assert(1'b1, B, "B: value does not match at clock 243");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 244");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 244");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 244");
		`Assert(1'b1, R, "R: value does not match at clock 244");
		`Assert(1'b1, G, "G: value does not match at clock 244");
		`Assert(1'b1, B, "B: value does not match at clock 244");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 245");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 245");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 245");
		`Assert(1'b1, R, "R: value does not match at clock 245");
		`Assert(1'b1, G, "G: value does not match at clock 245");
		`Assert(1'b1, B, "B: value does not match at clock 245");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 246");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 246");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 246");
		`Assert(1'b1, R, "R: value does not match at clock 246");
		`Assert(1'b1, G, "G: value does not match at clock 246");
		`Assert(1'b1, B, "B: value does not match at clock 246");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 247");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 247");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 247");
		`Assert(1'b1, R, "R: value does not match at clock 247");
		`Assert(1'b1, G, "G: value does not match at clock 247");
		`Assert(1'b1, B, "B: value does not match at clock 247");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 248");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 248");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 248");
		`Assert(1'b1, R, "R: value does not match at clock 248");
		`Assert(1'b1, G, "G: value does not match at clock 248");
		`Assert(1'b1, B, "B: value does not match at clock 248");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 249");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 249");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 249");
		`Assert(1'b1, R, "R: value does not match at clock 249");
		`Assert(1'b1, G, "G: value does not match at clock 249");
		`Assert(1'b1, B, "B: value does not match at clock 249");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 250");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 250");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 250");
		`Assert(1'b1, R, "R: value does not match at clock 250");
		`Assert(1'b1, G, "G: value does not match at clock 250");
		`Assert(1'b1, B, "B: value does not match at clock 250");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 251");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 251");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 251");
		`Assert(1'b1, R, "R: value does not match at clock 251");
		`Assert(1'b1, G, "G: value does not match at clock 251");
		`Assert(1'b1, B, "B: value does not match at clock 251");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 252");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 252");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 252");
		`Assert(1'b1, R, "R: value does not match at clock 252");
		`Assert(1'b1, G, "G: value does not match at clock 252");
		`Assert(1'b1, B, "B: value does not match at clock 252");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 253");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 253");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 253");
		`Assert(1'b1, R, "R: value does not match at clock 253");
		`Assert(1'b1, G, "G: value does not match at clock 253");
		`Assert(1'b1, B, "B: value does not match at clock 253");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 254");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 254");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 254");
		`Assert(1'b1, R, "R: value does not match at clock 254");
		`Assert(1'b1, G, "G: value does not match at clock 254");
		`Assert(1'b1, B, "B: value does not match at clock 254");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 255");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 255");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 255");
		`Assert(1'b1, R, "R: value does not match at clock 255");
		`Assert(1'b1, G, "G: value does not match at clock 255");
		`Assert(1'b1, B, "B: value does not match at clock 255");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 256");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 256");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 256");
		`Assert(1'b1, R, "R: value does not match at clock 256");
		`Assert(1'b1, G, "G: value does not match at clock 256");
		`Assert(1'b1, B, "B: value does not match at clock 256");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 257");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 257");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 257");
		`Assert(1'b1, R, "R: value does not match at clock 257");
		`Assert(1'b1, G, "G: value does not match at clock 257");
		`Assert(1'b1, B, "B: value does not match at clock 257");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 258");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 258");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 258");
		`Assert(1'b1, R, "R: value does not match at clock 258");
		`Assert(1'b1, G, "G: value does not match at clock 258");
		`Assert(1'b1, B, "B: value does not match at clock 258");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 259");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 259");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 259");
		`Assert(1'b1, R, "R: value does not match at clock 259");
		`Assert(1'b1, G, "G: value does not match at clock 259");
		`Assert(1'b1, B, "B: value does not match at clock 259");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 260");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 260");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 260");
		`Assert(1'b1, R, "R: value does not match at clock 260");
		`Assert(1'b1, G, "G: value does not match at clock 260");
		`Assert(1'b1, B, "B: value does not match at clock 260");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 261");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 261");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 261");
		`Assert(1'b1, R, "R: value does not match at clock 261");
		`Assert(1'b1, G, "G: value does not match at clock 261");
		`Assert(1'b1, B, "B: value does not match at clock 261");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 262");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 262");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 262");
		`Assert(1'b1, R, "R: value does not match at clock 262");
		`Assert(1'b1, G, "G: value does not match at clock 262");
		`Assert(1'b1, B, "B: value does not match at clock 262");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 263");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 263");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 263");
		`Assert(1'b1, R, "R: value does not match at clock 263");
		`Assert(1'b1, G, "G: value does not match at clock 263");
		`Assert(1'b1, B, "B: value does not match at clock 263");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 264");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 264");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 264");
		`Assert(1'b1, R, "R: value does not match at clock 264");
		`Assert(1'b1, G, "G: value does not match at clock 264");
		`Assert(1'b1, B, "B: value does not match at clock 264");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 265");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 265");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 265");
		`Assert(1'b1, R, "R: value does not match at clock 265");
		`Assert(1'b1, G, "G: value does not match at clock 265");
		`Assert(1'b1, B, "B: value does not match at clock 265");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 266");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 266");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 266");
		`Assert(1'b1, R, "R: value does not match at clock 266");
		`Assert(1'b1, G, "G: value does not match at clock 266");
		`Assert(1'b1, B, "B: value does not match at clock 266");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 267");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 267");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 267");
		`Assert(1'b1, R, "R: value does not match at clock 267");
		`Assert(1'b1, G, "G: value does not match at clock 267");
		`Assert(1'b1, B, "B: value does not match at clock 267");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 268");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 268");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 268");
		`Assert(1'b1, R, "R: value does not match at clock 268");
		`Assert(1'b1, G, "G: value does not match at clock 268");
		`Assert(1'b1, B, "B: value does not match at clock 268");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 269");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 269");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 269");
		`Assert(1'b1, R, "R: value does not match at clock 269");
		`Assert(1'b1, G, "G: value does not match at clock 269");
		`Assert(1'b1, B, "B: value does not match at clock 269");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 270");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 270");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 270");
		`Assert(1'b1, R, "R: value does not match at clock 270");
		`Assert(1'b1, G, "G: value does not match at clock 270");
		`Assert(1'b1, B, "B: value does not match at clock 270");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 271");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 271");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 271");
		`Assert(1'b1, R, "R: value does not match at clock 271");
		`Assert(1'b1, G, "G: value does not match at clock 271");
		`Assert(1'b1, B, "B: value does not match at clock 271");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 272");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 272");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 272");
		`Assert(1'b1, R, "R: value does not match at clock 272");
		`Assert(1'b1, G, "G: value does not match at clock 272");
		`Assert(1'b1, B, "B: value does not match at clock 272");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 273");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 273");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 273");
		`Assert(1'b1, R, "R: value does not match at clock 273");
		`Assert(1'b1, G, "G: value does not match at clock 273");
		`Assert(1'b1, B, "B: value does not match at clock 273");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 274");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 274");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 274");
		`Assert(1'b1, R, "R: value does not match at clock 274");
		`Assert(1'b1, G, "G: value does not match at clock 274");
		`Assert(1'b1, B, "B: value does not match at clock 274");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 275");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 275");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 275");
		`Assert(1'b1, R, "R: value does not match at clock 275");
		`Assert(1'b1, G, "G: value does not match at clock 275");
		`Assert(1'b1, B, "B: value does not match at clock 275");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 276");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 276");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 276");
		`Assert(1'b1, R, "R: value does not match at clock 276");
		`Assert(1'b1, G, "G: value does not match at clock 276");
		`Assert(1'b1, B, "B: value does not match at clock 276");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 277");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 277");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 277");
		`Assert(1'b1, R, "R: value does not match at clock 277");
		`Assert(1'b1, G, "G: value does not match at clock 277");
		`Assert(1'b1, B, "B: value does not match at clock 277");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 278");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 278");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 278");
		`Assert(1'b1, R, "R: value does not match at clock 278");
		`Assert(1'b1, G, "G: value does not match at clock 278");
		`Assert(1'b1, B, "B: value does not match at clock 278");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 279");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 279");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 279");
		`Assert(1'b1, R, "R: value does not match at clock 279");
		`Assert(1'b1, G, "G: value does not match at clock 279");
		`Assert(1'b1, B, "B: value does not match at clock 279");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 280");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 280");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 280");
		`Assert(1'b1, R, "R: value does not match at clock 280");
		`Assert(1'b1, G, "G: value does not match at clock 280");
		`Assert(1'b1, B, "B: value does not match at clock 280");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 281");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 281");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 281");
		`Assert(1'b1, R, "R: value does not match at clock 281");
		`Assert(1'b1, G, "G: value does not match at clock 281");
		`Assert(1'b1, B, "B: value does not match at clock 281");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 282");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 282");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 282");
		`Assert(1'b1, R, "R: value does not match at clock 282");
		`Assert(1'b1, G, "G: value does not match at clock 282");
		`Assert(1'b1, B, "B: value does not match at clock 282");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 283");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 283");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 283");
		`Assert(1'b1, R, "R: value does not match at clock 283");
		`Assert(1'b1, G, "G: value does not match at clock 283");
		`Assert(1'b1, B, "B: value does not match at clock 283");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 284");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 284");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 284");
		`Assert(1'b1, R, "R: value does not match at clock 284");
		`Assert(1'b1, G, "G: value does not match at clock 284");
		`Assert(1'b1, B, "B: value does not match at clock 284");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 285");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 285");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 285");
		`Assert(1'b1, R, "R: value does not match at clock 285");
		`Assert(1'b1, G, "G: value does not match at clock 285");
		`Assert(1'b1, B, "B: value does not match at clock 285");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 286");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 286");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 286");
		`Assert(1'b1, R, "R: value does not match at clock 286");
		`Assert(1'b1, G, "G: value does not match at clock 286");
		`Assert(1'b1, B, "B: value does not match at clock 286");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 287");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 287");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 287");
		`Assert(1'b1, R, "R: value does not match at clock 287");
		`Assert(1'b1, G, "G: value does not match at clock 287");
		`Assert(1'b1, B, "B: value does not match at clock 287");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 288");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 288");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 288");
		`Assert(1'b1, R, "R: value does not match at clock 288");
		`Assert(1'b1, G, "G: value does not match at clock 288");
		`Assert(1'b1, B, "B: value does not match at clock 288");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 289");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 289");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 289");
		`Assert(1'b1, R, "R: value does not match at clock 289");
		`Assert(1'b1, G, "G: value does not match at clock 289");
		`Assert(1'b1, B, "B: value does not match at clock 289");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 290");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 290");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 290");
		`Assert(1'b1, R, "R: value does not match at clock 290");
		`Assert(1'b1, G, "G: value does not match at clock 290");
		`Assert(1'b1, B, "B: value does not match at clock 290");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 291");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 291");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 291");
		`Assert(1'b1, R, "R: value does not match at clock 291");
		`Assert(1'b1, G, "G: value does not match at clock 291");
		`Assert(1'b1, B, "B: value does not match at clock 291");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 292");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 292");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 292");
		`Assert(1'b1, R, "R: value does not match at clock 292");
		`Assert(1'b1, G, "G: value does not match at clock 292");
		`Assert(1'b1, B, "B: value does not match at clock 292");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 293");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 293");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 293");
		`Assert(1'b1, R, "R: value does not match at clock 293");
		`Assert(1'b1, G, "G: value does not match at clock 293");
		`Assert(1'b1, B, "B: value does not match at clock 293");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 294");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 294");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 294");
		`Assert(1'b1, R, "R: value does not match at clock 294");
		`Assert(1'b1, G, "G: value does not match at clock 294");
		`Assert(1'b1, B, "B: value does not match at clock 294");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 295");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 295");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 295");
		`Assert(1'b1, R, "R: value does not match at clock 295");
		`Assert(1'b1, G, "G: value does not match at clock 295");
		`Assert(1'b1, B, "B: value does not match at clock 295");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 296");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 296");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 296");
		`Assert(1'b1, R, "R: value does not match at clock 296");
		`Assert(1'b1, G, "G: value does not match at clock 296");
		`Assert(1'b1, B, "B: value does not match at clock 296");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 297");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 297");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 297");
		`Assert(1'b1, R, "R: value does not match at clock 297");
		`Assert(1'b1, G, "G: value does not match at clock 297");
		`Assert(1'b1, B, "B: value does not match at clock 297");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 298");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 298");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 298");
		`Assert(1'b1, R, "R: value does not match at clock 298");
		`Assert(1'b1, G, "G: value does not match at clock 298");
		`Assert(1'b1, B, "B: value does not match at clock 298");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 299");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 299");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 299");
		`Assert(1'b1, R, "R: value does not match at clock 299");
		`Assert(1'b1, G, "G: value does not match at clock 299");
		`Assert(1'b1, B, "B: value does not match at clock 299");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 300");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 300");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 300");
		`Assert(1'b1, R, "R: value does not match at clock 300");
		`Assert(1'b1, G, "G: value does not match at clock 300");
		`Assert(1'b1, B, "B: value does not match at clock 300");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 301");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 301");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 301");
		`Assert(1'b1, R, "R: value does not match at clock 301");
		`Assert(1'b1, G, "G: value does not match at clock 301");
		`Assert(1'b1, B, "B: value does not match at clock 301");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 302");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 302");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 302");
		`Assert(1'b1, R, "R: value does not match at clock 302");
		`Assert(1'b1, G, "G: value does not match at clock 302");
		`Assert(1'b1, B, "B: value does not match at clock 302");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 303");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 303");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 303");
		`Assert(1'b1, R, "R: value does not match at clock 303");
		`Assert(1'b1, G, "G: value does not match at clock 303");
		`Assert(1'b1, B, "B: value does not match at clock 303");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 304");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 304");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 304");
		`Assert(1'b1, R, "R: value does not match at clock 304");
		`Assert(1'b1, G, "G: value does not match at clock 304");
		`Assert(1'b1, B, "B: value does not match at clock 304");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 305");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 305");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 305");
		`Assert(1'b1, R, "R: value does not match at clock 305");
		`Assert(1'b1, G, "G: value does not match at clock 305");
		`Assert(1'b1, B, "B: value does not match at clock 305");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 306");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 306");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 306");
		`Assert(1'b1, R, "R: value does not match at clock 306");
		`Assert(1'b1, G, "G: value does not match at clock 306");
		`Assert(1'b1, B, "B: value does not match at clock 306");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 307");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 307");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 307");
		`Assert(1'b1, R, "R: value does not match at clock 307");
		`Assert(1'b1, G, "G: value does not match at clock 307");
		`Assert(1'b1, B, "B: value does not match at clock 307");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 308");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 308");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 308");
		`Assert(1'b1, R, "R: value does not match at clock 308");
		`Assert(1'b1, G, "G: value does not match at clock 308");
		`Assert(1'b1, B, "B: value does not match at clock 308");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 309");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 309");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 309");
		`Assert(1'b1, R, "R: value does not match at clock 309");
		`Assert(1'b1, G, "G: value does not match at clock 309");
		`Assert(1'b1, B, "B: value does not match at clock 309");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 310");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 310");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 310");
		`Assert(1'b1, R, "R: value does not match at clock 310");
		`Assert(1'b1, G, "G: value does not match at clock 310");
		`Assert(1'b1, B, "B: value does not match at clock 310");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 311");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 311");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 311");
		`Assert(1'b1, R, "R: value does not match at clock 311");
		`Assert(1'b1, G, "G: value does not match at clock 311");
		`Assert(1'b1, B, "B: value does not match at clock 311");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 312");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 312");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 312");
		`Assert(1'b1, R, "R: value does not match at clock 312");
		`Assert(1'b1, G, "G: value does not match at clock 312");
		`Assert(1'b1, B, "B: value does not match at clock 312");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 313");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 313");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 313");
		`Assert(1'b1, R, "R: value does not match at clock 313");
		`Assert(1'b1, G, "G: value does not match at clock 313");
		`Assert(1'b1, B, "B: value does not match at clock 313");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 314");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 314");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 314");
		`Assert(1'b1, R, "R: value does not match at clock 314");
		`Assert(1'b1, G, "G: value does not match at clock 314");
		`Assert(1'b1, B, "B: value does not match at clock 314");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 315");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 315");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 315");
		`Assert(1'b1, R, "R: value does not match at clock 315");
		`Assert(1'b1, G, "G: value does not match at clock 315");
		`Assert(1'b1, B, "B: value does not match at clock 315");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 316");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 316");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 316");
		`Assert(1'b1, R, "R: value does not match at clock 316");
		`Assert(1'b1, G, "G: value does not match at clock 316");
		`Assert(1'b1, B, "B: value does not match at clock 316");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 317");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 317");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 317");
		`Assert(1'b1, R, "R: value does not match at clock 317");
		`Assert(1'b1, G, "G: value does not match at clock 317");
		`Assert(1'b1, B, "B: value does not match at clock 317");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 318");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 318");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 318");
		`Assert(1'b1, R, "R: value does not match at clock 318");
		`Assert(1'b1, G, "G: value does not match at clock 318");
		`Assert(1'b1, B, "B: value does not match at clock 318");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 319");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 319");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 319");
		`Assert(1'b1, R, "R: value does not match at clock 319");
		`Assert(1'b1, G, "G: value does not match at clock 319");
		`Assert(1'b1, B, "B: value does not match at clock 319");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 320");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 320");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 320");
		`Assert(1'b1, R, "R: value does not match at clock 320");
		`Assert(1'b1, G, "G: value does not match at clock 320");
		`Assert(1'b1, B, "B: value does not match at clock 320");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 321");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 321");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 321");
		`Assert(1'b1, R, "R: value does not match at clock 321");
		`Assert(1'b1, G, "G: value does not match at clock 321");
		`Assert(1'b1, B, "B: value does not match at clock 321");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 322");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 322");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 322");
		`Assert(1'b1, R, "R: value does not match at clock 322");
		`Assert(1'b1, G, "G: value does not match at clock 322");
		`Assert(1'b1, B, "B: value does not match at clock 322");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 323");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 323");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 323");
		`Assert(1'b1, R, "R: value does not match at clock 323");
		`Assert(1'b1, G, "G: value does not match at clock 323");
		`Assert(1'b1, B, "B: value does not match at clock 323");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 324");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 324");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 324");
		`Assert(1'b1, R, "R: value does not match at clock 324");
		`Assert(1'b1, G, "G: value does not match at clock 324");
		`Assert(1'b1, B, "B: value does not match at clock 324");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 325");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 325");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 325");
		`Assert(1'b1, R, "R: value does not match at clock 325");
		`Assert(1'b1, G, "G: value does not match at clock 325");
		`Assert(1'b1, B, "B: value does not match at clock 325");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 326");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 326");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 326");
		`Assert(1'b1, R, "R: value does not match at clock 326");
		`Assert(1'b1, G, "G: value does not match at clock 326");
		`Assert(1'b1, B, "B: value does not match at clock 326");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 327");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 327");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 327");
		`Assert(1'b1, R, "R: value does not match at clock 327");
		`Assert(1'b1, G, "G: value does not match at clock 327");
		`Assert(1'b1, B, "B: value does not match at clock 327");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 328");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 328");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 328");
		`Assert(1'b1, R, "R: value does not match at clock 328");
		`Assert(1'b1, G, "G: value does not match at clock 328");
		`Assert(1'b1, B, "B: value does not match at clock 328");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 329");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 329");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 329");
		`Assert(1'b1, R, "R: value does not match at clock 329");
		`Assert(1'b1, G, "G: value does not match at clock 329");
		`Assert(1'b1, B, "B: value does not match at clock 329");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 330");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 330");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 330");
		`Assert(1'b1, R, "R: value does not match at clock 330");
		`Assert(1'b1, G, "G: value does not match at clock 330");
		`Assert(1'b1, B, "B: value does not match at clock 330");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 331");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 331");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 331");
		`Assert(1'b1, R, "R: value does not match at clock 331");
		`Assert(1'b1, G, "G: value does not match at clock 331");
		`Assert(1'b1, B, "B: value does not match at clock 331");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 332");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 332");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 332");
		`Assert(1'b1, R, "R: value does not match at clock 332");
		`Assert(1'b1, G, "G: value does not match at clock 332");
		`Assert(1'b1, B, "B: value does not match at clock 332");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 333");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 333");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 333");
		`Assert(1'b1, R, "R: value does not match at clock 333");
		`Assert(1'b1, G, "G: value does not match at clock 333");
		`Assert(1'b1, B, "B: value does not match at clock 333");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 334");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 334");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 334");
		`Assert(1'b1, R, "R: value does not match at clock 334");
		`Assert(1'b1, G, "G: value does not match at clock 334");
		`Assert(1'b1, B, "B: value does not match at clock 334");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 335");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 335");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 335");
		`Assert(1'b1, R, "R: value does not match at clock 335");
		`Assert(1'b1, G, "G: value does not match at clock 335");
		`Assert(1'b1, B, "B: value does not match at clock 335");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 336");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 336");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 336");
		`Assert(1'b1, R, "R: value does not match at clock 336");
		`Assert(1'b1, G, "G: value does not match at clock 336");
		`Assert(1'b1, B, "B: value does not match at clock 336");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 337");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 337");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 337");
		`Assert(1'b1, R, "R: value does not match at clock 337");
		`Assert(1'b1, G, "G: value does not match at clock 337");
		`Assert(1'b1, B, "B: value does not match at clock 337");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 338");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 338");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 338");
		`Assert(1'b1, R, "R: value does not match at clock 338");
		`Assert(1'b1, G, "G: value does not match at clock 338");
		`Assert(1'b1, B, "B: value does not match at clock 338");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 339");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 339");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 339");
		`Assert(1'b1, R, "R: value does not match at clock 339");
		`Assert(1'b1, G, "G: value does not match at clock 339");
		`Assert(1'b1, B, "B: value does not match at clock 339");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 340");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 340");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 340");
		`Assert(1'b1, R, "R: value does not match at clock 340");
		`Assert(1'b1, G, "G: value does not match at clock 340");
		`Assert(1'b1, B, "B: value does not match at clock 340");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 341");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 341");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 341");
		`Assert(1'b1, R, "R: value does not match at clock 341");
		`Assert(1'b1, G, "G: value does not match at clock 341");
		`Assert(1'b1, B, "B: value does not match at clock 341");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 342");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 342");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 342");
		`Assert(1'b1, R, "R: value does not match at clock 342");
		`Assert(1'b1, G, "G: value does not match at clock 342");
		`Assert(1'b1, B, "B: value does not match at clock 342");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 343");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 343");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 343");
		`Assert(1'b1, R, "R: value does not match at clock 343");
		`Assert(1'b1, G, "G: value does not match at clock 343");
		`Assert(1'b1, B, "B: value does not match at clock 343");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 344");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 344");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 344");
		`Assert(1'b1, R, "R: value does not match at clock 344");
		`Assert(1'b1, G, "G: value does not match at clock 344");
		`Assert(1'b1, B, "B: value does not match at clock 344");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 345");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 345");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 345");
		`Assert(1'b1, R, "R: value does not match at clock 345");
		`Assert(1'b1, G, "G: value does not match at clock 345");
		`Assert(1'b1, B, "B: value does not match at clock 345");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 346");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 346");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 346");
		`Assert(1'b1, R, "R: value does not match at clock 346");
		`Assert(1'b1, G, "G: value does not match at clock 346");
		`Assert(1'b1, B, "B: value does not match at clock 346");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 347");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 347");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 347");
		`Assert(1'b1, R, "R: value does not match at clock 347");
		`Assert(1'b1, G, "G: value does not match at clock 347");
		`Assert(1'b1, B, "B: value does not match at clock 347");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 348");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 348");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 348");
		`Assert(1'b1, R, "R: value does not match at clock 348");
		`Assert(1'b1, G, "G: value does not match at clock 348");
		`Assert(1'b1, B, "B: value does not match at clock 348");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 349");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 349");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 349");
		`Assert(1'b1, R, "R: value does not match at clock 349");
		`Assert(1'b1, G, "G: value does not match at clock 349");
		`Assert(1'b1, B, "B: value does not match at clock 349");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 350");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 350");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 350");
		`Assert(1'b1, R, "R: value does not match at clock 350");
		`Assert(1'b1, G, "G: value does not match at clock 350");
		`Assert(1'b1, B, "B: value does not match at clock 350");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 351");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 351");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 351");
		`Assert(1'b1, R, "R: value does not match at clock 351");
		`Assert(1'b1, G, "G: value does not match at clock 351");
		`Assert(1'b1, B, "B: value does not match at clock 351");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 352");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 352");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 352");
		`Assert(1'b1, R, "R: value does not match at clock 352");
		`Assert(1'b1, G, "G: value does not match at clock 352");
		`Assert(1'b1, B, "B: value does not match at clock 352");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 353");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 353");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 353");
		`Assert(1'b1, R, "R: value does not match at clock 353");
		`Assert(1'b1, G, "G: value does not match at clock 353");
		`Assert(1'b1, B, "B: value does not match at clock 353");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 354");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 354");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 354");
		`Assert(1'b1, R, "R: value does not match at clock 354");
		`Assert(1'b1, G, "G: value does not match at clock 354");
		`Assert(1'b1, B, "B: value does not match at clock 354");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 355");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 355");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 355");
		`Assert(1'b1, R, "R: value does not match at clock 355");
		`Assert(1'b1, G, "G: value does not match at clock 355");
		`Assert(1'b1, B, "B: value does not match at clock 355");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 356");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 356");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 356");
		`Assert(1'b1, R, "R: value does not match at clock 356");
		`Assert(1'b1, G, "G: value does not match at clock 356");
		`Assert(1'b1, B, "B: value does not match at clock 356");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 357");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 357");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 357");
		`Assert(1'b1, R, "R: value does not match at clock 357");
		`Assert(1'b1, G, "G: value does not match at clock 357");
		`Assert(1'b1, B, "B: value does not match at clock 357");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 358");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 358");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 358");
		`Assert(1'b1, R, "R: value does not match at clock 358");
		`Assert(1'b1, G, "G: value does not match at clock 358");
		`Assert(1'b1, B, "B: value does not match at clock 358");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 359");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 359");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 359");
		`Assert(1'b1, R, "R: value does not match at clock 359");
		`Assert(1'b1, G, "G: value does not match at clock 359");
		`Assert(1'b1, B, "B: value does not match at clock 359");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 360");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 360");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 360");
		`Assert(1'b1, R, "R: value does not match at clock 360");
		`Assert(1'b1, G, "G: value does not match at clock 360");
		`Assert(1'b1, B, "B: value does not match at clock 360");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 361");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 361");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 361");
		`Assert(1'b1, R, "R: value does not match at clock 361");
		`Assert(1'b1, G, "G: value does not match at clock 361");
		`Assert(1'b1, B, "B: value does not match at clock 361");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 362");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 362");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 362");
		`Assert(1'b1, R, "R: value does not match at clock 362");
		`Assert(1'b1, G, "G: value does not match at clock 362");
		`Assert(1'b1, B, "B: value does not match at clock 362");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 363");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 363");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 363");
		`Assert(1'b1, R, "R: value does not match at clock 363");
		`Assert(1'b1, G, "G: value does not match at clock 363");
		`Assert(1'b1, B, "B: value does not match at clock 363");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 364");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 364");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 364");
		`Assert(1'b1, R, "R: value does not match at clock 364");
		`Assert(1'b1, G, "G: value does not match at clock 364");
		`Assert(1'b1, B, "B: value does not match at clock 364");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 365");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 365");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 365");
		`Assert(1'b1, R, "R: value does not match at clock 365");
		`Assert(1'b1, G, "G: value does not match at clock 365");
		`Assert(1'b1, B, "B: value does not match at clock 365");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 366");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 366");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 366");
		`Assert(1'b1, R, "R: value does not match at clock 366");
		`Assert(1'b1, G, "G: value does not match at clock 366");
		`Assert(1'b1, B, "B: value does not match at clock 366");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 367");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 367");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 367");
		`Assert(1'b1, R, "R: value does not match at clock 367");
		`Assert(1'b1, G, "G: value does not match at clock 367");
		`Assert(1'b1, B, "B: value does not match at clock 367");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 368");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 368");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 368");
		`Assert(1'b1, R, "R: value does not match at clock 368");
		`Assert(1'b1, G, "G: value does not match at clock 368");
		`Assert(1'b1, B, "B: value does not match at clock 368");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 369");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 369");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 369");
		`Assert(1'b1, R, "R: value does not match at clock 369");
		`Assert(1'b1, G, "G: value does not match at clock 369");
		`Assert(1'b1, B, "B: value does not match at clock 369");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 370");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 370");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 370");
		`Assert(1'b1, R, "R: value does not match at clock 370");
		`Assert(1'b1, G, "G: value does not match at clock 370");
		`Assert(1'b1, B, "B: value does not match at clock 370");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 371");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 371");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 371");
		`Assert(1'b1, R, "R: value does not match at clock 371");
		`Assert(1'b1, G, "G: value does not match at clock 371");
		`Assert(1'b1, B, "B: value does not match at clock 371");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 372");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 372");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 372");
		`Assert(1'b1, R, "R: value does not match at clock 372");
		`Assert(1'b1, G, "G: value does not match at clock 372");
		`Assert(1'b1, B, "B: value does not match at clock 372");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 373");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 373");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 373");
		`Assert(1'b1, R, "R: value does not match at clock 373");
		`Assert(1'b1, G, "G: value does not match at clock 373");
		`Assert(1'b1, B, "B: value does not match at clock 373");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 374");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 374");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 374");
		`Assert(1'b1, R, "R: value does not match at clock 374");
		`Assert(1'b1, G, "G: value does not match at clock 374");
		`Assert(1'b1, B, "B: value does not match at clock 374");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 375");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 375");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 375");
		`Assert(1'b1, R, "R: value does not match at clock 375");
		`Assert(1'b1, G, "G: value does not match at clock 375");
		`Assert(1'b1, B, "B: value does not match at clock 375");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 376");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 376");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 376");
		`Assert(1'b1, R, "R: value does not match at clock 376");
		`Assert(1'b1, G, "G: value does not match at clock 376");
		`Assert(1'b1, B, "B: value does not match at clock 376");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 377");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 377");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 377");
		`Assert(1'b1, R, "R: value does not match at clock 377");
		`Assert(1'b1, G, "G: value does not match at clock 377");
		`Assert(1'b1, B, "B: value does not match at clock 377");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 378");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 378");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 378");
		`Assert(1'b1, R, "R: value does not match at clock 378");
		`Assert(1'b1, G, "G: value does not match at clock 378");
		`Assert(1'b1, B, "B: value does not match at clock 378");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 379");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 379");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 379");
		`Assert(1'b1, R, "R: value does not match at clock 379");
		`Assert(1'b1, G, "G: value does not match at clock 379");
		`Assert(1'b1, B, "B: value does not match at clock 379");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 380");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 380");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 380");
		`Assert(1'b1, R, "R: value does not match at clock 380");
		`Assert(1'b1, G, "G: value does not match at clock 380");
		`Assert(1'b1, B, "B: value does not match at clock 380");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 381");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 381");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 381");
		`Assert(1'b1, R, "R: value does not match at clock 381");
		`Assert(1'b1, G, "G: value does not match at clock 381");
		`Assert(1'b1, B, "B: value does not match at clock 381");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 382");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 382");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 382");
		`Assert(1'b1, R, "R: value does not match at clock 382");
		`Assert(1'b1, G, "G: value does not match at clock 382");
		`Assert(1'b1, B, "B: value does not match at clock 382");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 383");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 383");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 383");
		`Assert(1'b1, R, "R: value does not match at clock 383");
		`Assert(1'b1, G, "G: value does not match at clock 383");
		`Assert(1'b1, B, "B: value does not match at clock 383");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 384");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 384");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 384");
		`Assert(1'b1, R, "R: value does not match at clock 384");
		`Assert(1'b1, G, "G: value does not match at clock 384");
		`Assert(1'b1, B, "B: value does not match at clock 384");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 385");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 385");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 385");
		`Assert(1'b1, R, "R: value does not match at clock 385");
		`Assert(1'b1, G, "G: value does not match at clock 385");
		`Assert(1'b1, B, "B: value does not match at clock 385");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 386");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 386");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 386");
		`Assert(1'b1, R, "R: value does not match at clock 386");
		`Assert(1'b1, G, "G: value does not match at clock 386");
		`Assert(1'b1, B, "B: value does not match at clock 386");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 387");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 387");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 387");
		`Assert(1'b1, R, "R: value does not match at clock 387");
		`Assert(1'b1, G, "G: value does not match at clock 387");
		`Assert(1'b1, B, "B: value does not match at clock 387");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 388");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 388");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 388");
		`Assert(1'b1, R, "R: value does not match at clock 388");
		`Assert(1'b1, G, "G: value does not match at clock 388");
		`Assert(1'b1, B, "B: value does not match at clock 388");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 389");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 389");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 389");
		`Assert(1'b1, R, "R: value does not match at clock 389");
		`Assert(1'b1, G, "G: value does not match at clock 389");
		`Assert(1'b1, B, "B: value does not match at clock 389");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 390");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 390");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 390");
		`Assert(1'b1, R, "R: value does not match at clock 390");
		`Assert(1'b1, G, "G: value does not match at clock 390");
		`Assert(1'b1, B, "B: value does not match at clock 390");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 391");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 391");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 391");
		`Assert(1'b1, R, "R: value does not match at clock 391");
		`Assert(1'b1, G, "G: value does not match at clock 391");
		`Assert(1'b1, B, "B: value does not match at clock 391");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 392");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 392");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 392");
		`Assert(1'b1, R, "R: value does not match at clock 392");
		`Assert(1'b1, G, "G: value does not match at clock 392");
		`Assert(1'b1, B, "B: value does not match at clock 392");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 393");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 393");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 393");
		`Assert(1'b1, R, "R: value does not match at clock 393");
		`Assert(1'b1, G, "G: value does not match at clock 393");
		`Assert(1'b1, B, "B: value does not match at clock 393");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 394");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 394");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 394");
		`Assert(1'b1, R, "R: value does not match at clock 394");
		`Assert(1'b1, G, "G: value does not match at clock 394");
		`Assert(1'b1, B, "B: value does not match at clock 394");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 395");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 395");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 395");
		`Assert(1'b1, R, "R: value does not match at clock 395");
		`Assert(1'b1, G, "G: value does not match at clock 395");
		`Assert(1'b1, B, "B: value does not match at clock 395");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 396");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 396");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 396");
		`Assert(1'b1, R, "R: value does not match at clock 396");
		`Assert(1'b1, G, "G: value does not match at clock 396");
		`Assert(1'b1, B, "B: value does not match at clock 396");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 397");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 397");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 397");
		`Assert(1'b1, R, "R: value does not match at clock 397");
		`Assert(1'b1, G, "G: value does not match at clock 397");
		`Assert(1'b1, B, "B: value does not match at clock 397");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 398");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 398");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 398");
		`Assert(1'b1, R, "R: value does not match at clock 398");
		`Assert(1'b1, G, "G: value does not match at clock 398");
		`Assert(1'b1, B, "B: value does not match at clock 398");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 399");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 399");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 399");
		`Assert(1'b1, R, "R: value does not match at clock 399");
		`Assert(1'b1, G, "G: value does not match at clock 399");
		`Assert(1'b1, B, "B: value does not match at clock 399");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 400");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 400");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 400");
		`Assert(1'b1, R, "R: value does not match at clock 400");
		`Assert(1'b1, G, "G: value does not match at clock 400");
		`Assert(1'b1, B, "B: value does not match at clock 400");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 401");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 401");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 401");
		`Assert(1'b1, R, "R: value does not match at clock 401");
		`Assert(1'b1, G, "G: value does not match at clock 401");
		`Assert(1'b1, B, "B: value does not match at clock 401");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 402");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 402");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 402");
		`Assert(1'b1, R, "R: value does not match at clock 402");
		`Assert(1'b1, G, "G: value does not match at clock 402");
		`Assert(1'b1, B, "B: value does not match at clock 402");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 403");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 403");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 403");
		`Assert(1'b1, R, "R: value does not match at clock 403");
		`Assert(1'b1, G, "G: value does not match at clock 403");
		`Assert(1'b1, B, "B: value does not match at clock 403");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 404");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 404");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 404");
		`Assert(1'b1, R, "R: value does not match at clock 404");
		`Assert(1'b1, G, "G: value does not match at clock 404");
		`Assert(1'b1, B, "B: value does not match at clock 404");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 405");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 405");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 405");
		`Assert(1'b1, R, "R: value does not match at clock 405");
		`Assert(1'b1, G, "G: value does not match at clock 405");
		`Assert(1'b1, B, "B: value does not match at clock 405");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 406");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 406");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 406");
		`Assert(1'b1, R, "R: value does not match at clock 406");
		`Assert(1'b1, G, "G: value does not match at clock 406");
		`Assert(1'b1, B, "B: value does not match at clock 406");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 407");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 407");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 407");
		`Assert(1'b1, R, "R: value does not match at clock 407");
		`Assert(1'b1, G, "G: value does not match at clock 407");
		`Assert(1'b1, B, "B: value does not match at clock 407");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 408");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 408");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 408");
		`Assert(1'b1, R, "R: value does not match at clock 408");
		`Assert(1'b1, G, "G: value does not match at clock 408");
		`Assert(1'b1, B, "B: value does not match at clock 408");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 409");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 409");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 409");
		`Assert(1'b1, R, "R: value does not match at clock 409");
		`Assert(1'b1, G, "G: value does not match at clock 409");
		`Assert(1'b1, B, "B: value does not match at clock 409");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 410");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 410");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 410");
		`Assert(1'b1, R, "R: value does not match at clock 410");
		`Assert(1'b1, G, "G: value does not match at clock 410");
		`Assert(1'b1, B, "B: value does not match at clock 410");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 411");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 411");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 411");
		`Assert(1'b1, R, "R: value does not match at clock 411");
		`Assert(1'b1, G, "G: value does not match at clock 411");
		`Assert(1'b1, B, "B: value does not match at clock 411");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 412");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 412");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 412");
		`Assert(1'b1, R, "R: value does not match at clock 412");
		`Assert(1'b1, G, "G: value does not match at clock 412");
		`Assert(1'b1, B, "B: value does not match at clock 412");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 413");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 413");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 413");
		`Assert(1'b1, R, "R: value does not match at clock 413");
		`Assert(1'b1, G, "G: value does not match at clock 413");
		`Assert(1'b1, B, "B: value does not match at clock 413");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 414");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 414");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 414");
		`Assert(1'b1, R, "R: value does not match at clock 414");
		`Assert(1'b1, G, "G: value does not match at clock 414");
		`Assert(1'b1, B, "B: value does not match at clock 414");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 415");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 415");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 415");
		`Assert(1'b1, R, "R: value does not match at clock 415");
		`Assert(1'b1, G, "G: value does not match at clock 415");
		`Assert(1'b1, B, "B: value does not match at clock 415");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 416");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 416");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 416");
		`Assert(1'b1, R, "R: value does not match at clock 416");
		`Assert(1'b1, G, "G: value does not match at clock 416");
		`Assert(1'b1, B, "B: value does not match at clock 416");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 417");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 417");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 417");
		`Assert(1'b1, R, "R: value does not match at clock 417");
		`Assert(1'b1, G, "G: value does not match at clock 417");
		`Assert(1'b1, B, "B: value does not match at clock 417");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 418");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 418");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 418");
		`Assert(1'b1, R, "R: value does not match at clock 418");
		`Assert(1'b1, G, "G: value does not match at clock 418");
		`Assert(1'b1, B, "B: value does not match at clock 418");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 419");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 419");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 419");
		`Assert(1'b1, R, "R: value does not match at clock 419");
		`Assert(1'b1, G, "G: value does not match at clock 419");
		`Assert(1'b1, B, "B: value does not match at clock 419");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 420");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 420");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 420");
		`Assert(1'b1, R, "R: value does not match at clock 420");
		`Assert(1'b1, G, "G: value does not match at clock 420");
		`Assert(1'b1, B, "B: value does not match at clock 420");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 421");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 421");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 421");
		`Assert(1'b1, R, "R: value does not match at clock 421");
		`Assert(1'b1, G, "G: value does not match at clock 421");
		`Assert(1'b1, B, "B: value does not match at clock 421");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 422");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 422");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 422");
		`Assert(1'b1, R, "R: value does not match at clock 422");
		`Assert(1'b1, G, "G: value does not match at clock 422");
		`Assert(1'b1, B, "B: value does not match at clock 422");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 423");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 423");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 423");
		`Assert(1'b1, R, "R: value does not match at clock 423");
		`Assert(1'b1, G, "G: value does not match at clock 423");
		`Assert(1'b1, B, "B: value does not match at clock 423");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 424");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 424");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 424");
		`Assert(1'b1, R, "R: value does not match at clock 424");
		`Assert(1'b1, G, "G: value does not match at clock 424");
		`Assert(1'b1, B, "B: value does not match at clock 424");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 425");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 425");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 425");
		`Assert(1'b1, R, "R: value does not match at clock 425");
		`Assert(1'b1, G, "G: value does not match at clock 425");
		`Assert(1'b1, B, "B: value does not match at clock 425");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 426");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 426");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 426");
		`Assert(1'b1, R, "R: value does not match at clock 426");
		`Assert(1'b1, G, "G: value does not match at clock 426");
		`Assert(1'b1, B, "B: value does not match at clock 426");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 427");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 427");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 427");
		`Assert(1'b1, R, "R: value does not match at clock 427");
		`Assert(1'b1, G, "G: value does not match at clock 427");
		`Assert(1'b1, B, "B: value does not match at clock 427");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 428");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 428");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 428");
		`Assert(1'b1, R, "R: value does not match at clock 428");
		`Assert(1'b1, G, "G: value does not match at clock 428");
		`Assert(1'b1, B, "B: value does not match at clock 428");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 429");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 429");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 429");
		`Assert(1'b1, R, "R: value does not match at clock 429");
		`Assert(1'b1, G, "G: value does not match at clock 429");
		`Assert(1'b1, B, "B: value does not match at clock 429");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 430");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 430");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 430");
		`Assert(1'b1, R, "R: value does not match at clock 430");
		`Assert(1'b1, G, "G: value does not match at clock 430");
		`Assert(1'b1, B, "B: value does not match at clock 430");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 431");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 431");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 431");
		`Assert(1'b1, R, "R: value does not match at clock 431");
		`Assert(1'b1, G, "G: value does not match at clock 431");
		`Assert(1'b1, B, "B: value does not match at clock 431");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 432");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 432");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 432");
		`Assert(1'b1, R, "R: value does not match at clock 432");
		`Assert(1'b1, G, "G: value does not match at clock 432");
		`Assert(1'b1, B, "B: value does not match at clock 432");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 433");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 433");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 433");
		`Assert(1'b1, R, "R: value does not match at clock 433");
		`Assert(1'b1, G, "G: value does not match at clock 433");
		`Assert(1'b1, B, "B: value does not match at clock 433");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 434");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 434");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 434");
		`Assert(1'b1, R, "R: value does not match at clock 434");
		`Assert(1'b1, G, "G: value does not match at clock 434");
		`Assert(1'b1, B, "B: value does not match at clock 434");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 435");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 435");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 435");
		`Assert(1'b1, R, "R: value does not match at clock 435");
		`Assert(1'b1, G, "G: value does not match at clock 435");
		`Assert(1'b1, B, "B: value does not match at clock 435");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 436");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 436");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 436");
		`Assert(1'b1, R, "R: value does not match at clock 436");
		`Assert(1'b1, G, "G: value does not match at clock 436");
		`Assert(1'b1, B, "B: value does not match at clock 436");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 437");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 437");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 437");
		`Assert(1'b1, R, "R: value does not match at clock 437");
		`Assert(1'b1, G, "G: value does not match at clock 437");
		`Assert(1'b1, B, "B: value does not match at clock 437");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 438");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 438");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 438");
		`Assert(1'b1, R, "R: value does not match at clock 438");
		`Assert(1'b1, G, "G: value does not match at clock 438");
		`Assert(1'b1, B, "B: value does not match at clock 438");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 439");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 439");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 439");
		`Assert(1'b1, R, "R: value does not match at clock 439");
		`Assert(1'b1, G, "G: value does not match at clock 439");
		`Assert(1'b1, B, "B: value does not match at clock 439");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 440");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 440");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 440");
		`Assert(1'b1, R, "R: value does not match at clock 440");
		`Assert(1'b1, G, "G: value does not match at clock 440");
		`Assert(1'b1, B, "B: value does not match at clock 440");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 441");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 441");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 441");
		`Assert(1'b1, R, "R: value does not match at clock 441");
		`Assert(1'b1, G, "G: value does not match at clock 441");
		`Assert(1'b1, B, "B: value does not match at clock 441");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 442");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 442");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 442");
		`Assert(1'b1, R, "R: value does not match at clock 442");
		`Assert(1'b1, G, "G: value does not match at clock 442");
		`Assert(1'b1, B, "B: value does not match at clock 442");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 443");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 443");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 443");
		`Assert(1'b1, R, "R: value does not match at clock 443");
		`Assert(1'b1, G, "G: value does not match at clock 443");
		`Assert(1'b1, B, "B: value does not match at clock 443");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 444");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 444");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 444");
		`Assert(1'b1, R, "R: value does not match at clock 444");
		`Assert(1'b1, G, "G: value does not match at clock 444");
		`Assert(1'b1, B, "B: value does not match at clock 444");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 445");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 445");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 445");
		`Assert(1'b1, R, "R: value does not match at clock 445");
		`Assert(1'b1, G, "G: value does not match at clock 445");
		`Assert(1'b1, B, "B: value does not match at clock 445");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 446");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 446");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 446");
		`Assert(1'b1, R, "R: value does not match at clock 446");
		`Assert(1'b1, G, "G: value does not match at clock 446");
		`Assert(1'b1, B, "B: value does not match at clock 446");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 447");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 447");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 447");
		`Assert(1'b1, R, "R: value does not match at clock 447");
		`Assert(1'b1, G, "G: value does not match at clock 447");
		`Assert(1'b1, B, "B: value does not match at clock 447");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 448");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 448");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 448");
		`Assert(1'b1, R, "R: value does not match at clock 448");
		`Assert(1'b1, G, "G: value does not match at clock 448");
		`Assert(1'b1, B, "B: value does not match at clock 448");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 449");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 449");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 449");
		`Assert(1'b1, R, "R: value does not match at clock 449");
		`Assert(1'b1, G, "G: value does not match at clock 449");
		`Assert(1'b1, B, "B: value does not match at clock 449");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 450");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 450");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 450");
		`Assert(1'b1, R, "R: value does not match at clock 450");
		`Assert(1'b1, G, "G: value does not match at clock 450");
		`Assert(1'b1, B, "B: value does not match at clock 450");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 451");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 451");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 451");
		`Assert(1'b1, R, "R: value does not match at clock 451");
		`Assert(1'b1, G, "G: value does not match at clock 451");
		`Assert(1'b1, B, "B: value does not match at clock 451");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 452");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 452");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 452");
		`Assert(1'b1, R, "R: value does not match at clock 452");
		`Assert(1'b1, G, "G: value does not match at clock 452");
		`Assert(1'b1, B, "B: value does not match at clock 452");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 453");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 453");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 453");
		`Assert(1'b1, R, "R: value does not match at clock 453");
		`Assert(1'b1, G, "G: value does not match at clock 453");
		`Assert(1'b1, B, "B: value does not match at clock 453");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 454");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 454");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 454");
		`Assert(1'b1, R, "R: value does not match at clock 454");
		`Assert(1'b1, G, "G: value does not match at clock 454");
		`Assert(1'b1, B, "B: value does not match at clock 454");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 455");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 455");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 455");
		`Assert(1'b1, R, "R: value does not match at clock 455");
		`Assert(1'b1, G, "G: value does not match at clock 455");
		`Assert(1'b1, B, "B: value does not match at clock 455");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 456");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 456");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 456");
		`Assert(1'b1, R, "R: value does not match at clock 456");
		`Assert(1'b1, G, "G: value does not match at clock 456");
		`Assert(1'b1, B, "B: value does not match at clock 456");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 457");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 457");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 457");
		`Assert(1'b1, R, "R: value does not match at clock 457");
		`Assert(1'b1, G, "G: value does not match at clock 457");
		`Assert(1'b1, B, "B: value does not match at clock 457");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 458");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 458");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 458");
		`Assert(1'b1, R, "R: value does not match at clock 458");
		`Assert(1'b1, G, "G: value does not match at clock 458");
		`Assert(1'b1, B, "B: value does not match at clock 458");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 459");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 459");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 459");
		`Assert(1'b1, R, "R: value does not match at clock 459");
		`Assert(1'b1, G, "G: value does not match at clock 459");
		`Assert(1'b1, B, "B: value does not match at clock 459");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 460");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 460");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 460");
		`Assert(1'b1, R, "R: value does not match at clock 460");
		`Assert(1'b1, G, "G: value does not match at clock 460");
		`Assert(1'b1, B, "B: value does not match at clock 460");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 461");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 461");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 461");
		`Assert(1'b1, R, "R: value does not match at clock 461");
		`Assert(1'b1, G, "G: value does not match at clock 461");
		`Assert(1'b1, B, "B: value does not match at clock 461");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 462");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 462");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 462");
		`Assert(1'b1, R, "R: value does not match at clock 462");
		`Assert(1'b1, G, "G: value does not match at clock 462");
		`Assert(1'b1, B, "B: value does not match at clock 462");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 463");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 463");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 463");
		`Assert(1'b1, R, "R: value does not match at clock 463");
		`Assert(1'b1, G, "G: value does not match at clock 463");
		`Assert(1'b1, B, "B: value does not match at clock 463");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 464");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 464");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 464");
		`Assert(1'b1, R, "R: value does not match at clock 464");
		`Assert(1'b1, G, "G: value does not match at clock 464");
		`Assert(1'b1, B, "B: value does not match at clock 464");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 465");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 465");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 465");
		`Assert(1'b1, R, "R: value does not match at clock 465");
		`Assert(1'b1, G, "G: value does not match at clock 465");
		`Assert(1'b1, B, "B: value does not match at clock 465");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 466");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 466");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 466");
		`Assert(1'b1, R, "R: value does not match at clock 466");
		`Assert(1'b1, G, "G: value does not match at clock 466");
		`Assert(1'b1, B, "B: value does not match at clock 466");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 467");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 467");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 467");
		`Assert(1'b1, R, "R: value does not match at clock 467");
		`Assert(1'b1, G, "G: value does not match at clock 467");
		`Assert(1'b1, B, "B: value does not match at clock 467");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 468");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 468");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 468");
		`Assert(1'b1, R, "R: value does not match at clock 468");
		`Assert(1'b1, G, "G: value does not match at clock 468");
		`Assert(1'b1, B, "B: value does not match at clock 468");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 469");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 469");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 469");
		`Assert(1'b1, R, "R: value does not match at clock 469");
		`Assert(1'b1, G, "G: value does not match at clock 469");
		`Assert(1'b1, B, "B: value does not match at clock 469");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 470");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 470");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 470");
		`Assert(1'b1, R, "R: value does not match at clock 470");
		`Assert(1'b1, G, "G: value does not match at clock 470");
		`Assert(1'b1, B, "B: value does not match at clock 470");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 471");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 471");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 471");
		`Assert(1'b1, R, "R: value does not match at clock 471");
		`Assert(1'b1, G, "G: value does not match at clock 471");
		`Assert(1'b1, B, "B: value does not match at clock 471");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 472");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 472");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 472");
		`Assert(1'b1, R, "R: value does not match at clock 472");
		`Assert(1'b1, G, "G: value does not match at clock 472");
		`Assert(1'b1, B, "B: value does not match at clock 472");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 473");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 473");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 473");
		`Assert(1'b1, R, "R: value does not match at clock 473");
		`Assert(1'b1, G, "G: value does not match at clock 473");
		`Assert(1'b1, B, "B: value does not match at clock 473");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 474");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 474");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 474");
		`Assert(1'b1, R, "R: value does not match at clock 474");
		`Assert(1'b1, G, "G: value does not match at clock 474");
		`Assert(1'b1, B, "B: value does not match at clock 474");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 475");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 475");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 475");
		`Assert(1'b1, R, "R: value does not match at clock 475");
		`Assert(1'b1, G, "G: value does not match at clock 475");
		`Assert(1'b1, B, "B: value does not match at clock 475");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 476");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 476");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 476");
		`Assert(1'b1, R, "R: value does not match at clock 476");
		`Assert(1'b1, G, "G: value does not match at clock 476");
		`Assert(1'b1, B, "B: value does not match at clock 476");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 477");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 477");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 477");
		`Assert(1'b1, R, "R: value does not match at clock 477");
		`Assert(1'b1, G, "G: value does not match at clock 477");
		`Assert(1'b1, B, "B: value does not match at clock 477");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 478");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 478");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 478");
		`Assert(1'b1, R, "R: value does not match at clock 478");
		`Assert(1'b1, G, "G: value does not match at clock 478");
		`Assert(1'b1, B, "B: value does not match at clock 478");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 479");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 479");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 479");
		`Assert(1'b1, R, "R: value does not match at clock 479");
		`Assert(1'b1, G, "G: value does not match at clock 479");
		`Assert(1'b1, B, "B: value does not match at clock 479");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 480");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 480");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 480");
		`Assert(1'b1, R, "R: value does not match at clock 480");
		`Assert(1'b1, G, "G: value does not match at clock 480");
		`Assert(1'b1, B, "B: value does not match at clock 480");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 481");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 481");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 481");
		`Assert(1'b1, R, "R: value does not match at clock 481");
		`Assert(1'b1, G, "G: value does not match at clock 481");
		`Assert(1'b1, B, "B: value does not match at clock 481");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 482");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 482");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 482");
		`Assert(1'b1, R, "R: value does not match at clock 482");
		`Assert(1'b1, G, "G: value does not match at clock 482");
		`Assert(1'b1, B, "B: value does not match at clock 482");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 483");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 483");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 483");
		`Assert(1'b1, R, "R: value does not match at clock 483");
		`Assert(1'b1, G, "G: value does not match at clock 483");
		`Assert(1'b1, B, "B: value does not match at clock 483");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 484");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 484");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 484");
		`Assert(1'b1, R, "R: value does not match at clock 484");
		`Assert(1'b1, G, "G: value does not match at clock 484");
		`Assert(1'b1, B, "B: value does not match at clock 484");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 485");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 485");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 485");
		`Assert(1'b1, R, "R: value does not match at clock 485");
		`Assert(1'b1, G, "G: value does not match at clock 485");
		`Assert(1'b1, B, "B: value does not match at clock 485");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 486");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 486");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 486");
		`Assert(1'b1, R, "R: value does not match at clock 486");
		`Assert(1'b1, G, "G: value does not match at clock 486");
		`Assert(1'b1, B, "B: value does not match at clock 486");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 487");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 487");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 487");
		`Assert(1'b1, R, "R: value does not match at clock 487");
		`Assert(1'b1, G, "G: value does not match at clock 487");
		`Assert(1'b1, B, "B: value does not match at clock 487");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 488");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 488");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 488");
		`Assert(1'b1, R, "R: value does not match at clock 488");
		`Assert(1'b1, G, "G: value does not match at clock 488");
		`Assert(1'b1, B, "B: value does not match at clock 488");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 489");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 489");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 489");
		`Assert(1'b1, R, "R: value does not match at clock 489");
		`Assert(1'b1, G, "G: value does not match at clock 489");
		`Assert(1'b1, B, "B: value does not match at clock 489");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 490");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 490");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 490");
		`Assert(1'b1, R, "R: value does not match at clock 490");
		`Assert(1'b1, G, "G: value does not match at clock 490");
		`Assert(1'b1, B, "B: value does not match at clock 490");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 491");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 491");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 491");
		`Assert(1'b1, R, "R: value does not match at clock 491");
		`Assert(1'b1, G, "G: value does not match at clock 491");
		`Assert(1'b1, B, "B: value does not match at clock 491");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 492");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 492");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 492");
		`Assert(1'b1, R, "R: value does not match at clock 492");
		`Assert(1'b1, G, "G: value does not match at clock 492");
		`Assert(1'b1, B, "B: value does not match at clock 492");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 493");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 493");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 493");
		`Assert(1'b1, R, "R: value does not match at clock 493");
		`Assert(1'b1, G, "G: value does not match at clock 493");
		`Assert(1'b1, B, "B: value does not match at clock 493");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 494");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 494");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 494");
		`Assert(1'b1, R, "R: value does not match at clock 494");
		`Assert(1'b1, G, "G: value does not match at clock 494");
		`Assert(1'b1, B, "B: value does not match at clock 494");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 495");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 495");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 495");
		`Assert(1'b1, R, "R: value does not match at clock 495");
		`Assert(1'b1, G, "G: value does not match at clock 495");
		`Assert(1'b1, B, "B: value does not match at clock 495");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 496");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 496");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 496");
		`Assert(1'b1, R, "R: value does not match at clock 496");
		`Assert(1'b1, G, "G: value does not match at clock 496");
		`Assert(1'b1, B, "B: value does not match at clock 496");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 497");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 497");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 497");
		`Assert(1'b1, R, "R: value does not match at clock 497");
		`Assert(1'b1, G, "G: value does not match at clock 497");
		`Assert(1'b1, B, "B: value does not match at clock 497");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 498");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 498");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 498");
		`Assert(1'b1, R, "R: value does not match at clock 498");
		`Assert(1'b1, G, "G: value does not match at clock 498");
		`Assert(1'b1, B, "B: value does not match at clock 498");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 499");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 499");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 499");
		`Assert(1'b1, R, "R: value does not match at clock 499");
		`Assert(1'b1, G, "G: value does not match at clock 499");
		`Assert(1'b1, B, "B: value does not match at clock 499");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 500");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 500");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 500");
		`Assert(1'b1, R, "R: value does not match at clock 500");
		`Assert(1'b1, G, "G: value does not match at clock 500");
		`Assert(1'b1, B, "B: value does not match at clock 500");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 501");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 501");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 501");
		`Assert(1'b1, R, "R: value does not match at clock 501");
		`Assert(1'b1, G, "G: value does not match at clock 501");
		`Assert(1'b1, B, "B: value does not match at clock 501");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 502");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 502");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 502");
		`Assert(1'b1, R, "R: value does not match at clock 502");
		`Assert(1'b1, G, "G: value does not match at clock 502");
		`Assert(1'b1, B, "B: value does not match at clock 502");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 503");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 503");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 503");
		`Assert(1'b1, R, "R: value does not match at clock 503");
		`Assert(1'b1, G, "G: value does not match at clock 503");
		`Assert(1'b1, B, "B: value does not match at clock 503");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 504");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 504");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 504");
		`Assert(1'b1, R, "R: value does not match at clock 504");
		`Assert(1'b1, G, "G: value does not match at clock 504");
		`Assert(1'b1, B, "B: value does not match at clock 504");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 505");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 505");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 505");
		`Assert(1'b1, R, "R: value does not match at clock 505");
		`Assert(1'b1, G, "G: value does not match at clock 505");
		`Assert(1'b1, B, "B: value does not match at clock 505");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 506");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 506");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 506");
		`Assert(1'b1, R, "R: value does not match at clock 506");
		`Assert(1'b1, G, "G: value does not match at clock 506");
		`Assert(1'b1, B, "B: value does not match at clock 506");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 507");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 507");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 507");
		`Assert(1'b1, R, "R: value does not match at clock 507");
		`Assert(1'b1, G, "G: value does not match at clock 507");
		`Assert(1'b1, B, "B: value does not match at clock 507");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 508");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 508");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 508");
		`Assert(1'b1, R, "R: value does not match at clock 508");
		`Assert(1'b1, G, "G: value does not match at clock 508");
		`Assert(1'b1, B, "B: value does not match at clock 508");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 509");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 509");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 509");
		`Assert(1'b1, R, "R: value does not match at clock 509");
		`Assert(1'b1, G, "G: value does not match at clock 509");
		`Assert(1'b1, B, "B: value does not match at clock 509");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 510");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 510");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 510");
		`Assert(1'b1, R, "R: value does not match at clock 510");
		`Assert(1'b1, G, "G: value does not match at clock 510");
		`Assert(1'b1, B, "B: value does not match at clock 510");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 511");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 511");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 511");
		`Assert(1'b1, R, "R: value does not match at clock 511");
		`Assert(1'b1, G, "G: value does not match at clock 511");
		`Assert(1'b1, B, "B: value does not match at clock 511");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 512");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 512");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 512");
		`Assert(1'b1, R, "R: value does not match at clock 512");
		`Assert(1'b1, G, "G: value does not match at clock 512");
		`Assert(1'b1, B, "B: value does not match at clock 512");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 513");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 513");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 513");
		`Assert(1'b1, R, "R: value does not match at clock 513");
		`Assert(1'b1, G, "G: value does not match at clock 513");
		`Assert(1'b1, B, "B: value does not match at clock 513");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 514");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 514");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 514");
		`Assert(1'b1, R, "R: value does not match at clock 514");
		`Assert(1'b1, G, "G: value does not match at clock 514");
		`Assert(1'b1, B, "B: value does not match at clock 514");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 515");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 515");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 515");
		`Assert(1'b1, R, "R: value does not match at clock 515");
		`Assert(1'b1, G, "G: value does not match at clock 515");
		`Assert(1'b1, B, "B: value does not match at clock 515");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 516");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 516");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 516");
		`Assert(1'b1, R, "R: value does not match at clock 516");
		`Assert(1'b1, G, "G: value does not match at clock 516");
		`Assert(1'b1, B, "B: value does not match at clock 516");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 517");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 517");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 517");
		`Assert(1'b1, R, "R: value does not match at clock 517");
		`Assert(1'b1, G, "G: value does not match at clock 517");
		`Assert(1'b1, B, "B: value does not match at clock 517");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 518");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 518");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 518");
		`Assert(1'b1, R, "R: value does not match at clock 518");
		`Assert(1'b1, G, "G: value does not match at clock 518");
		`Assert(1'b1, B, "B: value does not match at clock 518");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 519");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 519");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 519");
		`Assert(1'b1, R, "R: value does not match at clock 519");
		`Assert(1'b1, G, "G: value does not match at clock 519");
		`Assert(1'b1, B, "B: value does not match at clock 519");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 520");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 520");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 520");
		`Assert(1'b1, R, "R: value does not match at clock 520");
		`Assert(1'b1, G, "G: value does not match at clock 520");
		`Assert(1'b1, B, "B: value does not match at clock 520");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 521");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 521");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 521");
		`Assert(1'b1, R, "R: value does not match at clock 521");
		`Assert(1'b1, G, "G: value does not match at clock 521");
		`Assert(1'b1, B, "B: value does not match at clock 521");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 522");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 522");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 522");
		`Assert(1'b1, R, "R: value does not match at clock 522");
		`Assert(1'b1, G, "G: value does not match at clock 522");
		`Assert(1'b1, B, "B: value does not match at clock 522");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 523");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 523");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 523");
		`Assert(1'b1, R, "R: value does not match at clock 523");
		`Assert(1'b1, G, "G: value does not match at clock 523");
		`Assert(1'b1, B, "B: value does not match at clock 523");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 524");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 524");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 524");
		`Assert(1'b1, R, "R: value does not match at clock 524");
		`Assert(1'b1, G, "G: value does not match at clock 524");
		`Assert(1'b1, B, "B: value does not match at clock 524");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 525");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 525");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 525");
		`Assert(1'b1, R, "R: value does not match at clock 525");
		`Assert(1'b1, G, "G: value does not match at clock 525");
		`Assert(1'b1, B, "B: value does not match at clock 525");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 526");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 526");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 526");
		`Assert(1'b1, R, "R: value does not match at clock 526");
		`Assert(1'b1, G, "G: value does not match at clock 526");
		`Assert(1'b1, B, "B: value does not match at clock 526");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 527");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 527");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 527");
		`Assert(1'b1, R, "R: value does not match at clock 527");
		`Assert(1'b1, G, "G: value does not match at clock 527");
		`Assert(1'b1, B, "B: value does not match at clock 527");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 528");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 528");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 528");
		`Assert(1'b1, R, "R: value does not match at clock 528");
		`Assert(1'b1, G, "G: value does not match at clock 528");
		`Assert(1'b1, B, "B: value does not match at clock 528");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 529");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 529");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 529");
		`Assert(1'b1, R, "R: value does not match at clock 529");
		`Assert(1'b1, G, "G: value does not match at clock 529");
		`Assert(1'b1, B, "B: value does not match at clock 529");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 530");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 530");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 530");
		`Assert(1'b1, R, "R: value does not match at clock 530");
		`Assert(1'b1, G, "G: value does not match at clock 530");
		`Assert(1'b1, B, "B: value does not match at clock 530");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 531");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 531");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 531");
		`Assert(1'b1, R, "R: value does not match at clock 531");
		`Assert(1'b1, G, "G: value does not match at clock 531");
		`Assert(1'b1, B, "B: value does not match at clock 531");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 532");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 532");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 532");
		`Assert(1'b1, R, "R: value does not match at clock 532");
		`Assert(1'b1, G, "G: value does not match at clock 532");
		`Assert(1'b1, B, "B: value does not match at clock 532");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 533");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 533");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 533");
		`Assert(1'b1, R, "R: value does not match at clock 533");
		`Assert(1'b1, G, "G: value does not match at clock 533");
		`Assert(1'b1, B, "B: value does not match at clock 533");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 534");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 534");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 534");
		`Assert(1'b1, R, "R: value does not match at clock 534");
		`Assert(1'b1, G, "G: value does not match at clock 534");
		`Assert(1'b1, B, "B: value does not match at clock 534");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 535");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 535");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 535");
		`Assert(1'b1, R, "R: value does not match at clock 535");
		`Assert(1'b1, G, "G: value does not match at clock 535");
		`Assert(1'b1, B, "B: value does not match at clock 535");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 536");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 536");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 536");
		`Assert(1'b1, R, "R: value does not match at clock 536");
		`Assert(1'b1, G, "G: value does not match at clock 536");
		`Assert(1'b1, B, "B: value does not match at clock 536");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 537");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 537");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 537");
		`Assert(1'b1, R, "R: value does not match at clock 537");
		`Assert(1'b1, G, "G: value does not match at clock 537");
		`Assert(1'b1, B, "B: value does not match at clock 537");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 538");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 538");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 538");
		`Assert(1'b1, R, "R: value does not match at clock 538");
		`Assert(1'b1, G, "G: value does not match at clock 538");
		`Assert(1'b1, B, "B: value does not match at clock 538");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 539");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 539");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 539");
		`Assert(1'b1, R, "R: value does not match at clock 539");
		`Assert(1'b1, G, "G: value does not match at clock 539");
		`Assert(1'b1, B, "B: value does not match at clock 539");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 540");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 540");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 540");
		`Assert(1'b1, R, "R: value does not match at clock 540");
		`Assert(1'b1, G, "G: value does not match at clock 540");
		`Assert(1'b1, B, "B: value does not match at clock 540");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 541");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 541");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 541");
		`Assert(1'b1, R, "R: value does not match at clock 541");
		`Assert(1'b1, G, "G: value does not match at clock 541");
		`Assert(1'b1, B, "B: value does not match at clock 541");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 542");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 542");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 542");
		`Assert(1'b1, R, "R: value does not match at clock 542");
		`Assert(1'b1, G, "G: value does not match at clock 542");
		`Assert(1'b1, B, "B: value does not match at clock 542");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 543");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 543");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 543");
		`Assert(1'b1, R, "R: value does not match at clock 543");
		`Assert(1'b1, G, "G: value does not match at clock 543");
		`Assert(1'b1, B, "B: value does not match at clock 543");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 544");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 544");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 544");
		`Assert(1'b1, R, "R: value does not match at clock 544");
		`Assert(1'b1, G, "G: value does not match at clock 544");
		`Assert(1'b1, B, "B: value does not match at clock 544");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 545");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 545");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 545");
		`Assert(1'b1, R, "R: value does not match at clock 545");
		`Assert(1'b1, G, "G: value does not match at clock 545");
		`Assert(1'b1, B, "B: value does not match at clock 545");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 546");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 546");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 546");
		`Assert(1'b1, R, "R: value does not match at clock 546");
		`Assert(1'b1, G, "G: value does not match at clock 546");
		`Assert(1'b1, B, "B: value does not match at clock 546");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 547");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 547");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 547");
		`Assert(1'b1, R, "R: value does not match at clock 547");
		`Assert(1'b1, G, "G: value does not match at clock 547");
		`Assert(1'b1, B, "B: value does not match at clock 547");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 548");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 548");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 548");
		`Assert(1'b1, R, "R: value does not match at clock 548");
		`Assert(1'b1, G, "G: value does not match at clock 548");
		`Assert(1'b1, B, "B: value does not match at clock 548");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 549");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 549");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 549");
		`Assert(1'b1, R, "R: value does not match at clock 549");
		`Assert(1'b1, G, "G: value does not match at clock 549");
		`Assert(1'b1, B, "B: value does not match at clock 549");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 550");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 550");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 550");
		`Assert(1'b1, R, "R: value does not match at clock 550");
		`Assert(1'b1, G, "G: value does not match at clock 550");
		`Assert(1'b1, B, "B: value does not match at clock 550");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 551");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 551");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 551");
		`Assert(1'b1, R, "R: value does not match at clock 551");
		`Assert(1'b1, G, "G: value does not match at clock 551");
		`Assert(1'b1, B, "B: value does not match at clock 551");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 552");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 552");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 552");
		`Assert(1'b1, R, "R: value does not match at clock 552");
		`Assert(1'b1, G, "G: value does not match at clock 552");
		`Assert(1'b1, B, "B: value does not match at clock 552");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 553");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 553");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 553");
		`Assert(1'b1, R, "R: value does not match at clock 553");
		`Assert(1'b1, G, "G: value does not match at clock 553");
		`Assert(1'b1, B, "B: value does not match at clock 553");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 554");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 554");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 554");
		`Assert(1'b1, R, "R: value does not match at clock 554");
		`Assert(1'b1, G, "G: value does not match at clock 554");
		`Assert(1'b1, B, "B: value does not match at clock 554");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 555");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 555");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 555");
		`Assert(1'b1, R, "R: value does not match at clock 555");
		`Assert(1'b1, G, "G: value does not match at clock 555");
		`Assert(1'b1, B, "B: value does not match at clock 555");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 556");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 556");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 556");
		`Assert(1'b1, R, "R: value does not match at clock 556");
		`Assert(1'b1, G, "G: value does not match at clock 556");
		`Assert(1'b1, B, "B: value does not match at clock 556");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 557");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 557");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 557");
		`Assert(1'b1, R, "R: value does not match at clock 557");
		`Assert(1'b1, G, "G: value does not match at clock 557");
		`Assert(1'b1, B, "B: value does not match at clock 557");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 558");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 558");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 558");
		`Assert(1'b1, R, "R: value does not match at clock 558");
		`Assert(1'b1, G, "G: value does not match at clock 558");
		`Assert(1'b1, B, "B: value does not match at clock 558");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 559");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 559");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 559");
		`Assert(1'b1, R, "R: value does not match at clock 559");
		`Assert(1'b1, G, "G: value does not match at clock 559");
		`Assert(1'b1, B, "B: value does not match at clock 559");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 560");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 560");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 560");
		`Assert(1'b1, R, "R: value does not match at clock 560");
		`Assert(1'b1, G, "G: value does not match at clock 560");
		`Assert(1'b1, B, "B: value does not match at clock 560");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 561");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 561");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 561");
		`Assert(1'b1, R, "R: value does not match at clock 561");
		`Assert(1'b1, G, "G: value does not match at clock 561");
		`Assert(1'b1, B, "B: value does not match at clock 561");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 562");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 562");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 562");
		`Assert(1'b1, R, "R: value does not match at clock 562");
		`Assert(1'b1, G, "G: value does not match at clock 562");
		`Assert(1'b1, B, "B: value does not match at clock 562");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 563");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 563");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 563");
		`Assert(1'b1, R, "R: value does not match at clock 563");
		`Assert(1'b1, G, "G: value does not match at clock 563");
		`Assert(1'b1, B, "B: value does not match at clock 563");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 564");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 564");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 564");
		`Assert(1'b1, R, "R: value does not match at clock 564");
		`Assert(1'b1, G, "G: value does not match at clock 564");
		`Assert(1'b1, B, "B: value does not match at clock 564");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 565");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 565");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 565");
		`Assert(1'b1, R, "R: value does not match at clock 565");
		`Assert(1'b1, G, "G: value does not match at clock 565");
		`Assert(1'b1, B, "B: value does not match at clock 565");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 566");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 566");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 566");
		`Assert(1'b1, R, "R: value does not match at clock 566");
		`Assert(1'b1, G, "G: value does not match at clock 566");
		`Assert(1'b1, B, "B: value does not match at clock 566");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 567");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 567");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 567");
		`Assert(1'b1, R, "R: value does not match at clock 567");
		`Assert(1'b1, G, "G: value does not match at clock 567");
		`Assert(1'b1, B, "B: value does not match at clock 567");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 568");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 568");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 568");
		`Assert(1'b1, R, "R: value does not match at clock 568");
		`Assert(1'b1, G, "G: value does not match at clock 568");
		`Assert(1'b1, B, "B: value does not match at clock 568");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 569");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 569");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 569");
		`Assert(1'b1, R, "R: value does not match at clock 569");
		`Assert(1'b1, G, "G: value does not match at clock 569");
		`Assert(1'b1, B, "B: value does not match at clock 569");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 570");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 570");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 570");
		`Assert(1'b1, R, "R: value does not match at clock 570");
		`Assert(1'b1, G, "G: value does not match at clock 570");
		`Assert(1'b1, B, "B: value does not match at clock 570");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 571");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 571");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 571");
		`Assert(1'b1, R, "R: value does not match at clock 571");
		`Assert(1'b1, G, "G: value does not match at clock 571");
		`Assert(1'b1, B, "B: value does not match at clock 571");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 572");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 572");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 572");
		`Assert(1'b1, R, "R: value does not match at clock 572");
		`Assert(1'b1, G, "G: value does not match at clock 572");
		`Assert(1'b1, B, "B: value does not match at clock 572");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 573");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 573");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 573");
		`Assert(1'b1, R, "R: value does not match at clock 573");
		`Assert(1'b1, G, "G: value does not match at clock 573");
		`Assert(1'b1, B, "B: value does not match at clock 573");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 574");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 574");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 574");
		`Assert(1'b1, R, "R: value does not match at clock 574");
		`Assert(1'b1, G, "G: value does not match at clock 574");
		`Assert(1'b1, B, "B: value does not match at clock 574");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 575");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 575");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 575");
		`Assert(1'b1, R, "R: value does not match at clock 575");
		`Assert(1'b1, G, "G: value does not match at clock 575");
		`Assert(1'b1, B, "B: value does not match at clock 575");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 576");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 576");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 576");
		`Assert(1'b1, R, "R: value does not match at clock 576");
		`Assert(1'b1, G, "G: value does not match at clock 576");
		`Assert(1'b1, B, "B: value does not match at clock 576");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 577");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 577");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 577");
		`Assert(1'b1, R, "R: value does not match at clock 577");
		`Assert(1'b1, G, "G: value does not match at clock 577");
		`Assert(1'b1, B, "B: value does not match at clock 577");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 578");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 578");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 578");
		`Assert(1'b1, R, "R: value does not match at clock 578");
		`Assert(1'b1, G, "G: value does not match at clock 578");
		`Assert(1'b1, B, "B: value does not match at clock 578");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 579");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 579");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 579");
		`Assert(1'b1, R, "R: value does not match at clock 579");
		`Assert(1'b1, G, "G: value does not match at clock 579");
		`Assert(1'b1, B, "B: value does not match at clock 579");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 580");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 580");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 580");
		`Assert(1'b1, R, "R: value does not match at clock 580");
		`Assert(1'b1, G, "G: value does not match at clock 580");
		`Assert(1'b1, B, "B: value does not match at clock 580");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 581");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 581");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 581");
		`Assert(1'b1, R, "R: value does not match at clock 581");
		`Assert(1'b1, G, "G: value does not match at clock 581");
		`Assert(1'b1, B, "B: value does not match at clock 581");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 582");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 582");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 582");
		`Assert(1'b1, R, "R: value does not match at clock 582");
		`Assert(1'b1, G, "G: value does not match at clock 582");
		`Assert(1'b1, B, "B: value does not match at clock 582");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 583");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 583");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 583");
		`Assert(1'b1, R, "R: value does not match at clock 583");
		`Assert(1'b1, G, "G: value does not match at clock 583");
		`Assert(1'b1, B, "B: value does not match at clock 583");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 584");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 584");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 584");
		`Assert(1'b1, R, "R: value does not match at clock 584");
		`Assert(1'b1, G, "G: value does not match at clock 584");
		`Assert(1'b1, B, "B: value does not match at clock 584");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 585");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 585");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 585");
		`Assert(1'b1, R, "R: value does not match at clock 585");
		`Assert(1'b1, G, "G: value does not match at clock 585");
		`Assert(1'b1, B, "B: value does not match at clock 585");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 586");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 586");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 586");
		`Assert(1'b1, R, "R: value does not match at clock 586");
		`Assert(1'b1, G, "G: value does not match at clock 586");
		`Assert(1'b1, B, "B: value does not match at clock 586");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 587");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 587");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 587");
		`Assert(1'b1, R, "R: value does not match at clock 587");
		`Assert(1'b1, G, "G: value does not match at clock 587");
		`Assert(1'b1, B, "B: value does not match at clock 587");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 588");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 588");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 588");
		`Assert(1'b1, R, "R: value does not match at clock 588");
		`Assert(1'b1, G, "G: value does not match at clock 588");
		`Assert(1'b1, B, "B: value does not match at clock 588");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 589");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 589");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 589");
		`Assert(1'b1, R, "R: value does not match at clock 589");
		`Assert(1'b1, G, "G: value does not match at clock 589");
		`Assert(1'b1, B, "B: value does not match at clock 589");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 590");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 590");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 590");
		`Assert(1'b1, R, "R: value does not match at clock 590");
		`Assert(1'b1, G, "G: value does not match at clock 590");
		`Assert(1'b1, B, "B: value does not match at clock 590");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 591");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 591");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 591");
		`Assert(1'b1, R, "R: value does not match at clock 591");
		`Assert(1'b1, G, "G: value does not match at clock 591");
		`Assert(1'b1, B, "B: value does not match at clock 591");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 592");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 592");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 592");
		`Assert(1'b1, R, "R: value does not match at clock 592");
		`Assert(1'b1, G, "G: value does not match at clock 592");
		`Assert(1'b1, B, "B: value does not match at clock 592");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 593");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 593");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 593");
		`Assert(1'b1, R, "R: value does not match at clock 593");
		`Assert(1'b1, G, "G: value does not match at clock 593");
		`Assert(1'b1, B, "B: value does not match at clock 593");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 594");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 594");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 594");
		`Assert(1'b1, R, "R: value does not match at clock 594");
		`Assert(1'b1, G, "G: value does not match at clock 594");
		`Assert(1'b1, B, "B: value does not match at clock 594");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 595");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 595");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 595");
		`Assert(1'b1, R, "R: value does not match at clock 595");
		`Assert(1'b1, G, "G: value does not match at clock 595");
		`Assert(1'b1, B, "B: value does not match at clock 595");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 596");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 596");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 596");
		`Assert(1'b1, R, "R: value does not match at clock 596");
		`Assert(1'b1, G, "G: value does not match at clock 596");
		`Assert(1'b1, B, "B: value does not match at clock 596");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 597");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 597");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 597");
		`Assert(1'b1, R, "R: value does not match at clock 597");
		`Assert(1'b1, G, "G: value does not match at clock 597");
		`Assert(1'b1, B, "B: value does not match at clock 597");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 598");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 598");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 598");
		`Assert(1'b1, R, "R: value does not match at clock 598");
		`Assert(1'b1, G, "G: value does not match at clock 598");
		`Assert(1'b1, B, "B: value does not match at clock 598");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 599");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 599");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 599");
		`Assert(1'b1, R, "R: value does not match at clock 599");
		`Assert(1'b1, G, "G: value does not match at clock 599");
		`Assert(1'b1, B, "B: value does not match at clock 599");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 600");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 600");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 600");
		`Assert(1'b1, R, "R: value does not match at clock 600");
		`Assert(1'b1, G, "G: value does not match at clock 600");
		`Assert(1'b1, B, "B: value does not match at clock 600");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 601");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 601");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 601");
		`Assert(1'b1, R, "R: value does not match at clock 601");
		`Assert(1'b1, G, "G: value does not match at clock 601");
		`Assert(1'b1, B, "B: value does not match at clock 601");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 602");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 602");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 602");
		`Assert(1'b1, R, "R: value does not match at clock 602");
		`Assert(1'b1, G, "G: value does not match at clock 602");
		`Assert(1'b1, B, "B: value does not match at clock 602");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 603");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 603");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 603");
		`Assert(1'b1, R, "R: value does not match at clock 603");
		`Assert(1'b1, G, "G: value does not match at clock 603");
		`Assert(1'b1, B, "B: value does not match at clock 603");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 604");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 604");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 604");
		`Assert(1'b1, R, "R: value does not match at clock 604");
		`Assert(1'b1, G, "G: value does not match at clock 604");
		`Assert(1'b1, B, "B: value does not match at clock 604");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 605");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 605");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 605");
		`Assert(1'b1, R, "R: value does not match at clock 605");
		`Assert(1'b1, G, "G: value does not match at clock 605");
		`Assert(1'b1, B, "B: value does not match at clock 605");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 606");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 606");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 606");
		`Assert(1'b1, R, "R: value does not match at clock 606");
		`Assert(1'b1, G, "G: value does not match at clock 606");
		`Assert(1'b1, B, "B: value does not match at clock 606");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 607");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 607");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 607");
		`Assert(1'b1, R, "R: value does not match at clock 607");
		`Assert(1'b1, G, "G: value does not match at clock 607");
		`Assert(1'b1, B, "B: value does not match at clock 607");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 608");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 608");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 608");
		`Assert(1'b1, R, "R: value does not match at clock 608");
		`Assert(1'b1, G, "G: value does not match at clock 608");
		`Assert(1'b1, B, "B: value does not match at clock 608");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 609");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 609");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 609");
		`Assert(1'b1, R, "R: value does not match at clock 609");
		`Assert(1'b1, G, "G: value does not match at clock 609");
		`Assert(1'b1, B, "B: value does not match at clock 609");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 610");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 610");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 610");
		`Assert(1'b1, R, "R: value does not match at clock 610");
		`Assert(1'b1, G, "G: value does not match at clock 610");
		`Assert(1'b1, B, "B: value does not match at clock 610");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 611");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 611");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 611");
		`Assert(1'b1, R, "R: value does not match at clock 611");
		`Assert(1'b1, G, "G: value does not match at clock 611");
		`Assert(1'b1, B, "B: value does not match at clock 611");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 612");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 612");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 612");
		`Assert(1'b1, R, "R: value does not match at clock 612");
		`Assert(1'b1, G, "G: value does not match at clock 612");
		`Assert(1'b1, B, "B: value does not match at clock 612");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 613");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 613");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 613");
		`Assert(1'b1, R, "R: value does not match at clock 613");
		`Assert(1'b1, G, "G: value does not match at clock 613");
		`Assert(1'b1, B, "B: value does not match at clock 613");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 614");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 614");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 614");
		`Assert(1'b1, R, "R: value does not match at clock 614");
		`Assert(1'b1, G, "G: value does not match at clock 614");
		`Assert(1'b1, B, "B: value does not match at clock 614");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 615");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 615");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 615");
		`Assert(1'b1, R, "R: value does not match at clock 615");
		`Assert(1'b1, G, "G: value does not match at clock 615");
		`Assert(1'b1, B, "B: value does not match at clock 615");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 616");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 616");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 616");
		`Assert(1'b1, R, "R: value does not match at clock 616");
		`Assert(1'b1, G, "G: value does not match at clock 616");
		`Assert(1'b1, B, "B: value does not match at clock 616");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 617");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 617");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 617");
		`Assert(1'b1, R, "R: value does not match at clock 617");
		`Assert(1'b1, G, "G: value does not match at clock 617");
		`Assert(1'b1, B, "B: value does not match at clock 617");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 618");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 618");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 618");
		`Assert(1'b1, R, "R: value does not match at clock 618");
		`Assert(1'b1, G, "G: value does not match at clock 618");
		`Assert(1'b1, B, "B: value does not match at clock 618");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 619");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 619");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 619");
		`Assert(1'b1, R, "R: value does not match at clock 619");
		`Assert(1'b1, G, "G: value does not match at clock 619");
		`Assert(1'b1, B, "B: value does not match at clock 619");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 620");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 620");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 620");
		`Assert(1'b1, R, "R: value does not match at clock 620");
		`Assert(1'b1, G, "G: value does not match at clock 620");
		`Assert(1'b1, B, "B: value does not match at clock 620");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 621");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 621");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 621");
		`Assert(1'b1, R, "R: value does not match at clock 621");
		`Assert(1'b1, G, "G: value does not match at clock 621");
		`Assert(1'b1, B, "B: value does not match at clock 621");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 622");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 622");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 622");
		`Assert(1'b1, R, "R: value does not match at clock 622");
		`Assert(1'b1, G, "G: value does not match at clock 622");
		`Assert(1'b1, B, "B: value does not match at clock 622");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 623");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 623");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 623");
		`Assert(1'b1, R, "R: value does not match at clock 623");
		`Assert(1'b1, G, "G: value does not match at clock 623");
		`Assert(1'b1, B, "B: value does not match at clock 623");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 624");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 624");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 624");
		`Assert(1'b1, R, "R: value does not match at clock 624");
		`Assert(1'b1, G, "G: value does not match at clock 624");
		`Assert(1'b1, B, "B: value does not match at clock 624");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 625");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 625");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 625");
		`Assert(1'b1, R, "R: value does not match at clock 625");
		`Assert(1'b1, G, "G: value does not match at clock 625");
		`Assert(1'b1, B, "B: value does not match at clock 625");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 626");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 626");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 626");
		`Assert(1'b1, R, "R: value does not match at clock 626");
		`Assert(1'b1, G, "G: value does not match at clock 626");
		`Assert(1'b1, B, "B: value does not match at clock 626");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 627");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 627");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 627");
		`Assert(1'b1, R, "R: value does not match at clock 627");
		`Assert(1'b1, G, "G: value does not match at clock 627");
		`Assert(1'b1, B, "B: value does not match at clock 627");

		@(negedge clk);
		`Assert(1'b1, VSync, "VSync: value does not match at clock 628");
		`Assert(1'b1, HSync, "HSync: value does not match at clock 628");
		`Assert(1'b1, IsVisible, "IsVisible: value does not match at clock 628");
		`Assert(1'b1, R, "R: value does not match at clock 628");
		`Assert(1'b1, G, "G: value does not match at clock 628");
		`Assert(1'b1, B, "B: value does not match at clock 628");
	end

	// DUT instantiation
	VGAModule_TopLevel dut (
		.Clock (clk),
		.Reset (reset),
		.VSync (VSync),
		.HSync (HSync),
		.IsVisible (IsVisible),
		.R (R),
		.G (G),
		.B (B)
	);
endmodule
