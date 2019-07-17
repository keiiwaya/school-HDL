`timescale 1ns/1ns

module full_add(a, b, ci, co, s); /* moduleの定義開始 */
	input  a, b, ci;              /* input port */
	output co, s;                 /* output port */
	wire   w0, w1, w2;            /* wire */
	
	/* instance文(下位moduleの接続) */
	half_add a0(.a(a),  .b(b),  .co(w1), .s(w0));
	half_add a1(.a(w0), .b(ci), .co(w2), .s(s));
	
	/* assign文(output portの接続) */
	assign co = w1 | w2;
	
endmodule /* moduleの定義終了 */
