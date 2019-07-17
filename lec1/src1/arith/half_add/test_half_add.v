`timescale 1ns/1ns

module test_half_add(); /* moduleの定義開始 */
	reg  a, b;          /* input signal */
	wire co, s;         /* output signal */
	
	/* テストするmoduleの接続 */
	half_add a0(.a(a), .b(b), .co(co), .s(s));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("half_add.vcd");
		$dumpvars(0, test_half_add);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b co=%b s=%b", a, b, co, s);
	end
	
	/* input signalのパターン */
	initial begin
		a = 1'b0; b = 1'b0; /* input singalを定数で指定 */
		#10 /* 遅延時間 */
		a = 1'b0; b = 1'b1;
		#10
		a = 1'b1; b = 1'b0;
		#10
		a = 1'b1; b = 1'b1;
		#10
		a = 1'bx; b = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
