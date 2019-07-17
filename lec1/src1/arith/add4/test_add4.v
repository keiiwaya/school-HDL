`timescale 1ns/1ns

module test_add4();  /* moduleの定義開始 */
	reg  [3:0] a, b; /* input signal (4bit) */
	reg        ci;   /* input signal (1bit) */
	wire       co;   /* output signal (1bit) */
	wire [3:0] s;    /* output signal (4bit) */
	
	/* テストするmoduleの接続 */
	add4 a0(.a(a), .b(b), .ci(ci), .co(co), .s(s));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("add4.vcd");
		$dumpvars(0, test_add4);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b ci=%b co=%b s=%b", a, b, ci, co, s);
	end
	
	/* input signalのパターン */
	initial begin
		a = 4'b0001; b = 4'b0001; ci = 1'b0;
		#10 /* 遅延時間 */
		a = 4'b0001; b = 4'b0001; ci = 1'b1;
		#10
		a = 4'b0111; b = 4'b1000; ci = 1'b0;
		#10
		a = 4'b0111; b = 4'b1000; ci = 1'b1;
		#10
		a = 4'bxxxx; b = 4'bxxxx; ci = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
