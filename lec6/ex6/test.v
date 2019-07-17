`timescale 1ns/1ns

module test();
	reg clk, rst;

	data_path dp(.clk(clk), .rst(rst));
	
	initial begin
		$dumpfile("cpu.vcd");
		$dumpvars(0, test);
	end
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	initial begin
		/* FRの内容を表示できるように変更 */
		$display($time, " SR PR IR AR BR DR: R0 R1 R2 R3: M0 M1 M2 M3");
		rst = 1'b0;
		#8
		rst = 1'b1;
		/* プログラムの長さに応じてシミュレーション時間を変更 */
		#500
		$finish();
	end
	initial begin
		/* FRの内容を表示できるように変更 */
		$monitor($time,," %h  %h %h  %h  %h  %h  %h:  %h  %h  %h  %h:  %h  %h  %h  %h", 
		dp.sr_dout, dp.pr_dout, dp.ir_dout, 
		dp.ar_dout, dp.br_dout, dp.dr_dout, 
		dp.gr.r0, dp.gr.r1, dp.gr.r2, dp.gr.r3,
		dp.dm.m0, dp.dm.m1, dp.dm.m2, dp.dm.m3);
	end
endmodule
