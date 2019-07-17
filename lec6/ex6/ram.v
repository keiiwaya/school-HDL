`timescale 1ns/1ns

module ram(clk, re, we, adrs, din, dout);
	input        clk, re, we;
	input  [3:0] adrs, din;
	output [3:0] dout;
	reg    [3:0] data [0:15];
	always@(posedge clk) begin
		if(we == 1'b1) begin
			data[adrs] <= din;
		end
	end
	assign dout = (re == 1'b1) ? data[adrs] : 4'bxxxx;
	
	initial begin
		data[0] = 4'h0;
		data[1] = 4'h0;
		data[2] = 4'h0;
		data[3] = 4'h0;
		data[4] = 4'h0;
		data[5] = 4'h0;
		data[6] = 4'h0;
		data[7] = 4'h0;
		data[8] = 4'h0;
		data[9] = 4'h0;
		data[10] = 4'h0;
		data[11] = 4'h0;
		data[12] = 4'h0;
		data[13] = 4'h0;
		data[14] = 4'h0;
		data[15] = 4'h0;
	end
	wire [3:0] m0, m1, m2, m3;
	assign m0 = data[0];
	assign m1 = data[1];
	assign m2 = data[2];
	assign m3 = data[3];
endmodule
