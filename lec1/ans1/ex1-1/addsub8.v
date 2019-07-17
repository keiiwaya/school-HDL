`timescale 1ns/1ns

module addsub8(a, b, ci, co, s); /* moduleの定義開始 */
	input  [7:0] a, b;           /* input port (8bit) */
	input        ci;             /* input port (1bit) */
	output       co;             /* output port (1bit) */
	output [7:0] s;              /* output port (8bit) */
	wire   [7:0] w0;             /* wire (8bit) */
	wire         w1;             /* wire (1bit) */
	
	/* instance文(下位moduleの接続) */
	mux8 m0(.a(b), .b(~b), .s(ci), .y(w0));
	add8 a0(.a(a), .b(w0), .ci(ci), .co(w1), .s(s));
	mux1 m1(.a(w1), .b(~w1), .s(ci), .y(co));
	
endmodule /* moduleの定義終了 */
