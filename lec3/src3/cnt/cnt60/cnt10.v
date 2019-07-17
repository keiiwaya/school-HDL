`timescale 1ns/1ns

module cnt10(clk, rst, ci, co, q);
	input        clk, rst;
	input        ci;
	output       co;
	output [3:0] q;
	reg    [3:0] q;
	
	always@(posedge clk) begin
		if(rst == 1'b0) begin
			q <= 4'b0000;
		end else if(co == 1'b1) begin
			q <= 4'b0000;
		end else begin
			q <= q + ci;
		end
	end
	
	assign co = (q == 4'b1001 && ci == 1'b1) ? 1'b1 : 1'b0;
	
endmodule
