`timescale 1ns/1ns

module test_watch();
	reg        clk, rst, ld;
	reg  [4:0] hour_in;
	reg  [5:0] min_in, sec_in;
	reg        ci;
	wire       co;
	wire [4:0] hour_out;
	wire [5:0] min_out, sec_out;
	
	watch w0(.clk(clk), .rst(rst), .ld(ld), 
		.hour_in(hour_in), .min_in(min_in), .sec_in(sec_in), 
		.ci(ci), .co(co), 
		.hour_out(hour_out), .min_out(min_out), .sec_out(sec_out));
	initial begin
		$dumpfile("watch.vcd");
		$dumpvars(0, test_watch);
	end
	initial begin
		$monitor($time,, "clk=%b rst=%b ld=%b co=%b time=%d:%d:%d", 
			clk, rst, ld, co, hour_out, min_out, sec_out);
	end
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end
	initial begin
		rst = 1'b1;
		ld = 1'b0; ci = 1'b0;
		#5
		rst = 1'b0;
		#10
		rst = 1'b1;
		#5
		ld = 1'b1;
		hour_in = 5'd11;
		min_in = 6'd20;
		sec_in = 6'd57;
		#20
		ld = 1'b0; ci = 1'b1;
		#100
		ld = 1'b1; ci = 1'b0;
		hour_in = 5'd23;
		min_in = 6'd59;
		sec_in = 6'd57;
		#20
		ld = 1'b0; ci = 1'b1;
		#100
		$finish();
	end
endmodule
