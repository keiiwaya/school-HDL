`timescale 1ns/1ns

module orl(a, b, y);
	input  [7:0] a, b;
	output [7:0] y;
	reg    [7:0] y;
	
	always@(a or b) begin
		y <= a | b;
	end
	
endmodule
