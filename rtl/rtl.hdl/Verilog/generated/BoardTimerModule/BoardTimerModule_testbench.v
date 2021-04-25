`timescale 1ns/1ps
`default_nettype none

`define Assert(expected, actual, message) \
if (expected !== actual) begin \
$display("Assert failed"); \
$display(message); \
$display("Expected: 0x%H, Actual: 0x%H", expected, actual); \
/*$finish;*/ \
end

module BoardTimerModule_testbench;
	reg clk;
	reg reset;

	reg Restart;

	wire OutActive10;
	wire OutActive20;

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

		Restart = 1'b0;
		@(negedge clk); // reset

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 1");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 1");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 2");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 2");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 3");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 3");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 4");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 4");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 5");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 5");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 6");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 6");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 7");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 7");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 8");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 8");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 9");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 9");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 10");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 10");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 11");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 11");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 12");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 12");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 13");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 13");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 14");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 14");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 15");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 15");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 16");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 16");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 17");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 17");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 18");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 18");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 19");
		`Assert(1'b1, OutActive20, "OutActive20: value does not match at clock 19");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 20");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 20");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 21");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 21");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 22");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 22");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 23");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 23");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 24");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 24");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 25");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 25");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 26");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 26");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 27");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 27");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 28");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 28");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 29");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 29");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 30");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 30");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 31");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 31");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 32");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 32");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 33");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 33");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 34");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 34");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 35");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 35");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 36");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 36");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 37");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 37");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 38");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 38");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 39");
		`Assert(1'b1, OutActive20, "OutActive20: value does not match at clock 39");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 40");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 40");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 41");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 41");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 42");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 42");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 43");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 43");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 44");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 44");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 45");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 45");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 46");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 46");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 47");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 47");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 48");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 48");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 49");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 49");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 50");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 50");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 51");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 51");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 52");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 52");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 53");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 53");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 54");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 54");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 55");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 55");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 56");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 56");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 57");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 57");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 58");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 58");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 59");
		`Assert(1'b1, OutActive20, "OutActive20: value does not match at clock 59");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 60");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 60");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 61");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 61");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 62");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 62");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 63");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 63");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 64");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 64");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 65");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 65");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 66");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 66");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 67");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 67");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 68");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 68");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 69");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 69");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 70");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 70");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 71");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 71");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 72");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 72");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 73");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 73");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 74");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 74");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 75");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 75");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 76");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 76");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 77");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 77");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 78");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 78");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 79");
		`Assert(1'b1, OutActive20, "OutActive20: value does not match at clock 79");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 80");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 80");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 81");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 81");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 82");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 82");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 83");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 83");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 84");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 84");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 85");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 85");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 86");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 86");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 87");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 87");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 88");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 88");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 89");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 89");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 90");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 90");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 91");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 91");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 92");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 92");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 93");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 93");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 94");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 94");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 95");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 95");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 96");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 96");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 97");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 97");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 98");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 98");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b1, OutActive10, "OutActive10: value does not match at clock 99");
		`Assert(1'b1, OutActive20, "OutActive20: value does not match at clock 99");

		Restart = 1'b0;
		@(negedge clk);
		`Assert(1'b0, OutActive10, "OutActive10: value does not match at clock 100");
		`Assert(1'b0, OutActive20, "OutActive20: value does not match at clock 100");
	end

	// DUT instantiation
	BoardTimerModule_TopLevel dut (
		.Clock (clk),
		.Reset (reset),
		.Restart (Restart),
		.OutActive10 (OutActive10),
		.OutActive20 (OutActive20)
	);
endmodule
