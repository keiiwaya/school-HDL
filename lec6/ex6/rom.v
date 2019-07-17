`timescale 1ns/1ns

module rom(adrs, dout);
	input  [3:0] adrs;
	output [7:0] dout;
	reg    [7:0] dout;

	always@(adrs) begin
		case(adrs)
			/* 以下にプログラムを記述 */
			4'b0000: dout <= 8'h01;
			4'b0001: dout <= 8'h14;
			4'b0010: dout <= 8'h32;
			4'b0011: dout <= 8'h32;
			4'b0100: dout <= 8'h22;
			4'b0101: dout <= 8'h22;
			4'b0110: dout <= 8'h02;
			4'b0111: dout <= 8'h70;
			4'b1000: dout <= 8'h71;
			4'b1001: dout <= 8'h72;
			4'b1010: dout <= 8'hxx;
			4'b1011: dout <= 8'hxx;
			4'b1100: dout <= 8'hxx;
			4'b1101: dout <= 8'hxx;
			4'b1110: dout <= 8'hxx;
			4'b1111: dout <= 8'hxx;
			default: dout <= 8'hxx;
			/* ここまで */
		endcase
	end
endmodule
