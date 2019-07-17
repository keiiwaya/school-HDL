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
	/* 以下を記述 */
	
	/* ここまで */
endmodule
