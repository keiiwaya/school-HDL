`timescale 1ns/1ns

module test_mux1(); /* moduleの定義開始 */
	reg  a, b, s;   /* input signal (1bit) */
	wire y;         /* output signal (1bit) */
	
	/* テストするmoduleの接続 */
	mux1 m0(.a(a), .b(b), .s(s), .y(y));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("mux1.vcd");
		$dumpvars(0, test_mux1);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b s=%b y=%b", a, b, s, y);
	end
	
	/* input signalのパターン */
	initial begin
		a = 1'b1; b = 1'b0;
		s = 1'b0;
		#10 /* 遅延時間 */
		s = 1'b1;
		#10
		a = 1'b0; b = 1'b1;
		#10
		s = 1'b0;
		#10
		a = 1'bx; b = 1'bx;
		s = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
