`timescale 1ns/1ns

module counter60(clk, rst, ld, d, ci, co, q);
	input        clk, rst, ld;
	input  [5:0] d;
	input        ci;
	output       co;
	output [5:0] q;
	reg    [5:0] q;
	
	always@(posedge clk) begin
		if(rst == 1'b0) begin
			q <= 6'b000000;
		end else if(ld == 1'b1) begin
			q <= d;
		end else if(q == 6'b111011 && ci == 1'b1) begin
			q <= 6'b000000;
		end else begin
			q <= q + ci;
		end
	end
	
	assign co = (q == 6'b111011 && ci == 1'b1);
endmodule
