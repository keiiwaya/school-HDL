`timescale 1ns/1ns

module test_enc();
	reg  [3:0] a; 
	wire [2:0] y; 
	
	enc e0(.a(a), .y(y)); 
	
	initial begin
		$dumpfile("enc.vcd");
		$dumpvars(0, test_enc);
	end
	
	initial begin
		$monitor($time,, "a=%b y=%b", a, y);
	end
	
	initial begin
		a = 4'b0001;
		#10
		a = 4'b1111;
		#10
		a = 4'b1010;
		#10
		a = 4'b1100;
		#10
		a = 4'b1000;
		#10
		a = 4'b0000;
		#10
		a = 4'bxxxx;
		#10
		$finish();
	end
	
endmodule
