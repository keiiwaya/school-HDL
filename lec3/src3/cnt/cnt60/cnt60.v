`timescale 1ns/1ns

module cnt60(clk, rst, ci, co, q);
	input        clk, rst;
	input        ci;
	output       co;
	output [6:0] q;
	wire         w0;
	
	cnt10 c0(.clk(clk), .rst(rst), .ci(ci), .co(w0), .q(q[3:0]));
	cnt6  c1(.clk(clk), .rst(rst), .ci(w0), .co(co), .q(q[6:4]));
	
endmodule
