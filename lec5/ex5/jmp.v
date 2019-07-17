`timescale 1ns/1ns

module jmp(a, b, sel, y);
	input  [3:0] a, b;
	input  [1:0] sel;
	output [3:0] y;
	reg    [3:0] y;

	always@(a or b or sel) begin
		case(sel)
		/* 以下を記述*/
		4'b0000: y <= 8'h05;
		4'b0001: y <= 8'h14;
		4'b0010: y <= 8'h02;
		4'b0011: y <= 8'h54;
		4'b0100: y <= 8'h48;
		4'b0101: y <= 8'h1e;
		4'b0110: y <= 8'h24;
		4'b0111: y <= 8'h38;
		4'b1000: y <= 8'h60;
		4'b1001: y <= 8'hxx;
		4'b1010: y <= 8'hxx;
		4'b1011: y <= 8'hxx;
		4'b1100: y <= 8'hxx;
		4'b1101: y <= 8'hxx;
		4'b1110: y <= 8'hxx;
		4'b1111: y <= 8'hxx;
		default: y <= 8'hxx;

		/* ここまで */
		default: y <= 4'bxxxx;
		endcase
	end
endmodule
