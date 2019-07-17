`timescale 1ns/1ns

module test_div();
	reg        clk, ld;
	reg  [3:0] a, b;
	wire [3:0] y;
	
	div u0(.clk(clk), .ld(ld), .a(a), .b(b), .y(y));
	
	initial begin
		$dumpfile("div.vcd");
		$dumpvars(0, test_div);
	end
	
	initial begin
		$monitor($time,, "%b %b %b", u0.ra, u0.rb, u0.ry);
	end
	
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end
	
	initial begin
		/* 以下を記述 */
		
		/* ここまで */
		$finish();
	end
	
endmodule
