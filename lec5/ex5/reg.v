`timescale 1ns/1ns

module regf(clk, we, din, a, dout_a, b, dout_b);
	input        clk, we;
	input  [3:0] din;
	input  [1:0] a, b;
	output [3:0] dout_a, dout_b;
	reg    [3:0] data [0:3];
	always@(posedge clk) begin
		if(we == 1'b1) begin
			data[a] <= din;
		end
	end
	assign dout_a = data[a];
	assign dout_b = data[b];

	initial begin
		data[0] = 4'h0;
		data[1] = 4'h0;
		data[2] = 4'h0;
		data[3] = 4'h0;
	end
	wire   [3:0] r0, r1, r2, r3;
	assign r0 = data[0];
	assign r1 = data[1];
	assign r2 = data[2];
	assign r3 = data[3];
endmodule

module reg8(clk, rst, we, din, dout);
	input        clk, rst, we;
	input  [7:0] din;
	output [7:0] dout;
	reg    [7:0] dout;

	always@(posedge clk) begin
		if(rst == 1'b0) begin
			dout <= 8'b00000000;
		end else if(we == 1'b1) begin
			dout <= din;
		end
	end
endmodule

module reg4(clk, rst, we, din, dout);
	input        clk, rst, we;
	input  [3:0] din;
	output [3:0] dout;
	reg    [3:0] dout;

	always@(posedge clk) begin
		if(rst == 1'b0) begin
			dout <= 4'b0000;
		end else if(we == 1'b1) begin
			dout <= din;
		end
	end
endmodule

module reg2(clk, rst, we, din, dout);
	input        clk, rst, we;
	input  [1:0] din;
	output [1:0] dout;
	reg    [1:0] dout;

	always@(posedge clk) begin
		if(rst == 1'b0) begin
			dout <= 2'b00;
		end else if(we == 1'b1) begin
			dout <= din;
		end
	end
endmodule
