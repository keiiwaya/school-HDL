`timescale 1ns/1ns

module test_cnt60();
	reg        clk, rst;
	reg        ci;
	wire       co;
	wire [6:0] q;
	
	cnt60 c0(.clk(clk), .rst(rst),
                 .ci(ci), .co(co), .q(q));
	
	initial begin
		$dumpfile("cnt60.vcd");
		$dumpvars(0, test_cnt60);
	end
	
	initial begin
		$monitor($time,, "clk=%b ci=%b q=%h%h co=%b", clk, ci, q[6:4], q[3:0], co);
	end
	
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end
	
	initial begin
		rst = 1'b1;
		ci  = 1'b1;
		$display($time,, "rst=%b", rst);
		#5
		rst = 1'b0;
		$display($time,, "rst=%b", rst);
		#10
		rst = 1'b1;
		$display($time,, "rst=%b", rst);
		#80
		ci = 1'b0;
		#50
		ci = 1'b1;
		#1200
		ci = 1'bx;
		$finish();
	end
	
endmodule
