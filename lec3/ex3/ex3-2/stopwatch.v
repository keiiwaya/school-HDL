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
		/* 以下を記述 */
			`IDLE : begin
				if(sw1 == 1'b1 && sw2 == 1'b0 && sw3 == 1'b0) begin
					next_state <= `COUNT;
				end
			end


			`COUNT : begin
				if(sw1 == 1'b0 && sw2 == 1'b1 && sw3 == 1'b0) begin
					next_state <= `STOP;
				end else if(sw1 == 1'b0 && sw2 == 1'b0 && sw3 == 1'b1) begin
					next_state <= `LAP;
				end
			end

			`LAP : begin
				if(sw1 == 1'b0 && sw2 == 1'b1 && sw3 == 1'b0) begin
					next_state <= `STOP;
				end else if(sw1 == 1'b1 && sw2 == 1'b0 && sw3 == 1'b0) begin
					next_state <= `COUNT;
				end
			end

			`STOP : begin
				if(sw1 == 1'b1 && sw2 == 1'b0 && sw3 == 1'b0) begin
					next_state <= `COUNT;
				end else if(sw1 == 1'b0 && sw2 == 1'b0 && sw3 == 1'b1) begin
					next_state <= `IDLE;
				end
			end

			default : begin
				next_state <= `IDLE;
			end

		/* ここまで */
		endcase
	end

	always@(posedge clk) begin
		state <= next_state;
	end

	always@(state) begin
		case(state)
		/* 以下を記述 */
		`IDLE : begin
			rst <= 1'b0;
			ci <= 1'b0;
			ld <= 1'b0;
		end

		`COUNT : begin
			rst <= 1'b1;
			ci <= 1'b1;
			ld <= 1'b1;
		end

		`LAP : begin
			rst <= 1'b1;
			ci <= 1'b1;
			ld <= 1'b0;
		end

		`STOP : begin
			rst <= 1'b1;
			ci <= 1'b0;
			ld <= 1'b1;
		end

		default : begin
			rst <= 1'b0;
			ci <= 1'b0;
			ld <= 1'b0;
		end

		/* ここまで */
		endcase
	end

	/* 以下を記述 */
	always@(posedge clk) begin
		if(rst == 1'b0) begin
			cnt <= 8'b00000000;
		end else begin
			cnt <= cnt + ci;
		end
	end

	always@(posedge clk) begin
		if(rst == 1'b0) begin
			dsp <= 8'b00000000;
		end else if(ld == 1'b1) begin
			dsp <= cnt;
		end
	end

	/* ここまで */

endmodule
