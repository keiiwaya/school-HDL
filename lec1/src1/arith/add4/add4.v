`timescale 1ns/1ns

module add4(a, b, ci, co, s); /* moduleの定義開始 */
	input  [3:0] a, b;        /* input port (4bit) */
	input        ci;          /* input port (1bit) */
	output       co;          /* output port (1bit) */
	output [3:0] s;           /* output port (4bit) */
	wire         w0, w1, w2;  /* wire (1bit) */
	
	/* instance文(下位moduleの接続) */
	full_add a0(.a(a[0]), .b(b[0]), .ci(ci), .co(w0), .s(s[0]));
	full_add a1(.a(a[1]), .b(b[1]), .ci(w0), .co(w1), .s(s[1]));
	full_add a2(.a(a[2]), .b(b[2]), .ci(w1), .co(w2), .s(s[2]));
	full_add a3(.a(a[3]), .b(b[3]), .ci(w2), .co(co), .s(s[3]));
	
endmodule /* moduleの定義終了 */
