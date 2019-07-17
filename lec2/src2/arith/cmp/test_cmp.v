`timescale 1ns/1ns

module test_cmp();
	reg  [7:0] a, b;
	wire       gt, lt, eq;
	
	cmp c0(.a(a), .b(b), .gt(gt), .lt(lt), .eq(eq));
	
	initial begin
		$dumpfile("cmp.vcd");
		$dumpvars(0, test_cmp);
	end
	
	initial begin
		$monitor($time,, "a=%b b=%b gt=%b lt=%b eq=%b",
		         a, b, gt, lt, eq);
	end
	
	initial begin
		a = 8'b10000000;
		b = 8'b00000001;
		#10
		b = 8'b11111111;
		#10
		b = 8'b10000000;
		#10
		a = 8'bxxxxxxxx;
		b = 8'bxxxxxxxx;
		#10
		$finish();
	end
	
endmodule
