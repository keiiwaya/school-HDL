`timescale 1ns/1ns

module half_add(a, b, co, s); /* moduleの定義開始 */
	input  a, b;              /* input port */
	output co, s;             /* output port */
	wire   w0, w1, w2;        /* wire */
	
	/* assign文(wireの接続) */
	assign w0 = a & b;
	assign w1 = ~w0;
	assign w2 = a | b;
	
	/* assign文(output portの接続) */
	assign s  = w1 & w2;
	assign co = w0;
	
endmodule /* moduleの定義終了 */
