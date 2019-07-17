`timescale 1ns/1ns

module mux1(a, b, s, y); /* moduleの定義開始 */
	input  a, b, s;      /* input signal (1bit) */
	output y;            /* output signal (1bit) */
	
	/* assign文(output portの接続) */
	assign y  = (a & ~s) | (b & s);
	
endmodule /* moduleの定義終了 */
