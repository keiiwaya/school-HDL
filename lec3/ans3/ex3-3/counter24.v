`timescale 1ns/1ns

module counter24(clk, rst, ld, d, ci, co, q);
	input        clk, rst, ld;
	input  [4:0] d;
	input        ci;
	output       co;
	output [4:0] q;
	reg    [4:0] q;
	
	always@(posedge clk) begin
		if(rst == 1'b0) begin
			q <= 5'b00000;
		end else if(ld == 1'b1) begin
			q <= d;
		end else if(q == 5'b10111 && ci == 1'b1) begin
			q <= 5'b0000;
		end else begin
			q <= q + ci;
		end
	end
	
	assign co = (q == 5'b10111 && ci == 1'b1);
endmodule
