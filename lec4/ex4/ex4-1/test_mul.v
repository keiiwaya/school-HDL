`timescale 1ns/1ns

module test_mul();
	reg        clk, ld;
	reg  [3:0] a, b;
	wire [7:0] y;

	mul u0(.clk(clk), .ld(ld), .a(a), .b(b), .y(y));

	initial begin
		$dumpfile("mul.vcd");
		$dumpvars(0, test_mul);
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
		ld = 1'b0;
		a = 4'b1101;
		b = 4'b1011;
		#10
		ld = 1'b1;	
		a = 4'b1101;
		b = 4'b1011;
		#20
		ld = 1'b0;
		a = 4'b1101;
		b = 4'b1011;
		#30
		ld = 1'b0;
		a = 4'b1101;
		b = 4'b1011;
		#40
		ld = 1'b1;	
		a = 4'b1101;
		b = 4'b1011;
		#50
		ld = 1'b0;
		a = 4'b1101;
		b = 4'b1011;
		#60


	




		/* ここまで */
		$finish();
	end

endmodule
