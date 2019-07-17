`timescale 1ns/1ns

module cmp8(a, b, ci, gt, lt, eq); /* moduleの定義開始 */
	input  [7:0] a, b;       /* input port (8bit) */
	input        ci;         /* input port (1bit) */
	output       gt, lt, eq; /* output port (1bit) */
	wire         co;         /* wire (1bit) */
	wire   [7:0] s;          /* wire (8bit) */
	
	/* instance文(下位moduleの接続) */
	sub8 a0(.a(a), .b(b), .ci(ci), .co(co), .s(s));
	
	/* assign文(output portの接続) */
	assign eq = ~| s;
	assign lt = co;
	assign gt = ~(eq | lt);
	
endmodule /* moduleの定義終了 */
