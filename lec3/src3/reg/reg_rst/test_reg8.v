`timescale 1ns/1ns

module test_reg8();
	reg        clk, rst;
	reg  [7:0] d; 
	wire [7:0] q; 
	
	reg8 r0(.clk(clk), .rst(rst), .d(d), .q(q));
	
	initial begin
		$dumpfile("reg8.vcd");
		$dumpvars(0, test_reg8);
	end
	
	initial begin
		$monitor($time,, "clk=%b rst=%b d=%b q=%b", clk, rst, d, q);
	end
	
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end
		
	initial begin
		rst = 1'b1;
		d   = 8'b00000001;
		#25
		rst = 1'b0;
		#10
		rst = 1'b1;
		#10
		d   = 8'b00000010;
		#20
		d   = 8'b10011001;
		#50
		$finish();
	end
	
endmodule
