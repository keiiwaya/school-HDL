`timescale 1ns/1ns

module test_full_add(); /* moduleの定義開始 */
	reg  a, b, ci;      /* input signal */
	wire co, s;         /* output signal */
	
	/* テストするmoduleの接続 */
	full_add a0(.a(a), .b(b), .ci(ci), .co(co), .s(s));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("full_add.vcd");
		$dumpvars(0, test_full_add);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b ci=%b co=%b s=%b", a, b, ci, co, s);
	end
	
	/* input signalのパターン */
	initial begin
		a = 1'b0; b = 1'b0; ci = 1'b0;
		#10 /* 遅延時間 */
		a = 1'b0; b = 1'b0; ci = 1'b1;
		#10
		a = 1'b0; b = 1'b1; ci = 1'b0;
		#10
		a = 1'b0; b = 1'b1; ci = 1'b1;
		#10
		a = 1'b1; b = 1'b0; ci = 1'b0;
		#10
		a = 1'b1; b = 1'b0; ci = 1'b1;
		#10
		a = 1'b1; b = 1'b1; ci = 1'b0;
		#10
		a = 1'b1; b = 1'b1; ci = 1'b1;
		#10
		a = 1'bx; b = 1'bx; ci = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
