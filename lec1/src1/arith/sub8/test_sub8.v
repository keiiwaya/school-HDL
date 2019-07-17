`timescale 1ns/1ns

module test_sub8();  /* moduleの定義開始 */
	reg  [7:0] a, b; /* input signal (8bit) */
	reg        ci;   /* input signal (1bit) */
	wire       co;   /* output signal (1bit) */
	wire [7:0] s;    /* output signal (8bit) */
	
	/* テストするmoduleの接続 */
	sub8 s0(.a(a), .b(b), .ci(ci), .co(co), .s(s));
	
	/* 波形表示用ファイルの設定 */
	initial begin
		$dumpfile("sub8.vcd");
		$dumpvars(0, test_sub8);
	end
	
	/* 端末への表示 */
	initial begin
		$monitor($time,, "a=%b b=%b ci=%b co=%b s=%b", a, b, ci, co, s);
	end
	
	/* input signalのパターン */
	initial begin
		a = 8'b11111111; b = 8'b01111111; ci = 1'b1;
		#10 /* 遅延時間 */
		a = 8'b00011111; b = 8'b00001111; ci = 1'b1;
		#10
		a = 8'b00000001; b = 8'b00000001; ci = 1'b1;
		#10
		a = 8'b10000000; b = 8'b00000001; ci = 1'b1;
		#10
		a = 8'b00010000; b = 8'b00000001; ci = 1'b1;
		#10
		a = 8'b00000000; b = 8'b00000001; ci = 1'b1;
		#10
		a = 8'bxxxxxxxx; b = 8'bxxxxxxxx; ci = 1'bx;
		#10
		$finish(); /* シミュレーションの終了 */
	end
	
endmodule /* moduleの定義終了 */
