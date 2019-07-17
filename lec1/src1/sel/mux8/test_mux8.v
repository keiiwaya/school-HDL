`timescale 1ns/1ns

module test_mux8();  /* moduleの定義開始 */
	reg  [7:0] a, b; /* input signal (8bit) */
	reg        s;    /* input signal (1bit) */
	wire [7:0] y;    /* output signal (8bit) */
	
	/* テストするmoduleの接続 */
	mux8 m0(.a(a), .b(b), .s(s), .y(y));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("mux8.vcd");
		$dumpvars(0, test_mux8);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b s=%b y=%b", a, b, s, y);
	end
	
	/* input signalのパターン */
	initial begin
		a = 8'b11110000; b = 8'b00001111;
		s = 1'b0;
		#10 /* 遅延時間 */
		s = 1'b1;
		#10
		a = 8'b10000000; b = 8'b00000001;
		#10
		s = 1'b0;
		#10
		a = 8'bxxxxxxxx; b = 8'bxxxxxxxx;
		s = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
