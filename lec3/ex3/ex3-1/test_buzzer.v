`timescale 1ns/1ns

module test_buzzer(); 
	reg  clk, sw1, sw2, sw3;
	wire led1, led2;
	
	buzzer u0(.clk(clk), .sw1(sw1), .sw2(sw2), .sw3(sw3), .led1(led1), .led2(led2));
	
	initial begin
		$dumpfile( "buzzer.vcd" );
		$dumpvars( 0, test_buzzer );
	end
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor( $time,, "clk=%b sw1=%b sw2=%b sw3=%b next_st=%b st=%b led1=%d led2=%b", 
		clk, sw1, sw2, sw3, u0.next_state, u0.state, led1, led2 );
	end
	
	initial begin
		sw1 = 1'b0;
		sw2 = 1'b0;
		sw3 = 1'b0;
		#10
		sw1 = 1'b1;
		#10
		sw1 = 1'b0;
		#30
		sw1 = 1'b1;
		#10
		sw1 = 1'b0;
		#20
		sw2 = 1'b1;
		#10
		sw2 = 1'b0;
		#20
		sw3 = 1'b1;
		#10
		sw3 = 1'b0;
		#50
		sw2 = 1'b1;
		#10
		sw2 = 1'b0;
		#50
		sw1 = 1'b1;
		#10
		sw1 = 1'b0;
		#20
		sw3 = 1'b1;
		#10
		sw3 = 1'b0;
		#50
		sw1 = 1'b1;
		sw2 = 1'b1;
		#10
		sw1 = 1'b0;
		sw2 = 1'b0;
		#50
		$finish();
	end
	
endmodule
