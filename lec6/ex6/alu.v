`timescale 1ns/1ns

/* 課題(1)
	フラグ判定回路を追加
	フラグの出力ポートを追加
 */

module alu(a, b, sel, y);
	input  [3:0] a, b;
	input  [1:0] sel;
	output [3:0] y;
	reg    [3:0] y;

	always@(a or b or sel) begin
		case(sel)
			2'b01:   y <= b;
			2'b10:   y <= a + b;
			2'b11:   y <= a - b;
			default: y <= 4'bxxxx;
		endcase
	end
endmodule
