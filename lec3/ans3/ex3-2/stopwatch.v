`timescale 1ns/1ns

`define IDLE  2'b00
`define COUNT 2'b01
`define LAP   2'b10
`define STOP  2'b11

module stopwatch (clk, sw1, sw2, sw3, dsp);
	input        clk, sw1, sw2, sw3;
	output [7:0] dsp;
	
	reg    [7:0] cnt, dsp;
	reg    [1:0] state, next_state;
	reg          ci, ld, rst;
	
	always@(sw1 or sw2 or sw3 or state) begin
		case (state)
			`IDLE : begin
				if(sw1 == 1'b1)
					next_state <= `COUNT;
				else
					next_state <= `IDLE;
			end
			`COUNT : begin
				if(sw2 == 1'b1)
					next_state <= `STOP;
				else if(sw3 == 1'b1)
					next_state <= `LAP;
				else
					next_state <= `COUNT;
			end
			`LAP : begin
				if(sw1 == 1'b1)
					next_state <= `COUNT;
				else if(sw2 == 1'b1)
					next_state <= `STOP;
				else
					next_state <= `LAP;
			end
			`STOP : begin
				if(sw1 == 1'b1)
					next_state <= `COUNT;
				else if(sw3 == 1'b1)
					next_state <= `IDLE;
				else
					next_state <= `STOP;
			end
			default : begin
					next_state <= `IDLE;
			end
		endcase
	end
	
	always@(posedge clk) begin
		state <= next_state;
	end
	
	always@(state) begin
		case(state)
			`IDLE : begin
				rst  <= 1'b0;
				ci   <= 1'b0;
				ld   <= 1'b0;
			end
			`COUNT : begin
				rst  <= 1'b1;
				ci   <= 1'b1;
				ld   <= 1'b1;
			end
			`LAP : begin
				rst  <= 1'b1;
				ci   <= 1'b1;
				ld   <= 1'b0;
			end
			`STOP : begin
				rst  <= 1'b1;
				ci   <= 1'b0;
				ld   <= 1'b1;
			end
			default : begin
				rst  <= 1'b0;
				ci   <= 1'b0;
				ld   <= 1'b0;
			end
		endcase
	end
	
	always@(posedge clk) begin
		if (rst == 1'b0) begin
			cnt   <= 8'b00000000;
		end else begin
			cnt <= cnt + ci;
		end
	end
	
	always@(posedge clk) begin
		if (rst == 1'b0) begin
			dsp <= 8'b00000000;
		end else if (ld == 1'b1) begin
			dsp <= cnt;
		end
	end
	
endmodule
