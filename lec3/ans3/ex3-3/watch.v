`timescale 1ns/1ns

module watch(clk, rst, ld, hour_in, min_in, sec_in, 
	ci, co, hour_out, min_out, sec_out);
	
	input        clk, rst, ld;
	input        ci;
	input  [4:0] hour_in;
	input  [5:0] min_in, sec_in;
	output [4:0] hour_out;
	output [5:0] min_out, sec_out;
	output       co;
	
	wire w0, w1;

	counter24 hour(.clk(clk), .rst(rst), .ld(ld), .d(hour_in), 
		.ci(w1), .co(co), .q(hour_out));
	counter60 min(.clk(clk), .rst(rst), .ld(ld), .d(min_in), 
		.ci(w0), .co(w1), .q(min_out));
	counter60 sec(.clk(clk), .rst(rst), .ld(ld), .d(sec_in), 
		.ci(ci), .co(w0), .q(sec_out));
endmodule
