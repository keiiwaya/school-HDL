`timescale 1ns/1ns

module test_cmp8();        /* moduleの定義開始 */
	reg  [7:0] a, b;       /* input signal (8bit) */
	reg        ci;         /* input signal (1bit) */
	wire       gt, lt, eq; /* output signal (1bit) */
	
	/* テストするmoduleの接続 */
	cmp8 c0(.a(a), .b(b), .ci(ci), .gt(gt), .lt(lt), .eq(eq));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("cmp8.vcd");
		$dumpvars(0, test_cmp8);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b ci=%b gt=%b lt=%b eq=%b", 
		a, b, ci, gt, lt, eq);
	end
	
	/* input signalのパターン */
	initial begin
		/* 以下を記述 */

	   a = 8'b10000000; b = 8'b10000000; ci = 1'b1;
	   #10
	   a = 8'b00000001; b = 8'b10000000; ci = 1'b1;
	   #10
	   a = 8'b11111111; b = 8'b01111111; ci = 1'b1;
		
		/* ここまで */
		#10
		a = 8'bxxxxxxxx; b = 8'bxxxxxxxx; ci = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
