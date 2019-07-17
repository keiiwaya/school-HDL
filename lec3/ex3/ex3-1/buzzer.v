`timescale 1ns/1ns

`define IDLE  2'b00
`define ACT1  2'b01
`define ACT2  2'b10

module buzzer (clk, sw1, sw2, sw3, led1, led2);
	input        clk, sw1, sw2, sw3;
	output       led1, led2;
	reg          led1, led2;
	reg    [1:0] state, next_state;

	always@(sw1 or sw2 or sw3 or state) begin
		case(state)
		/* 以下を記述 */
		  `IDLE : begin
		     if(sw1 == 1'b1 && sw2 == 1'b1) begin
				 		next_state <= `IDLE;
					end else if(sw1 == 1'b1 && sw2 == 1'b0 && sw3 == 1'b0) begin
						next_state <= `ACT1;
					end else if(sw1 == 1'b0 && sw2 == 1'b1 && sw3 == 1'b0) begin
						next_state <= `ACT2;
					end
		   end

		  `ACT1 : begin
		     if(sw3 == 1'b1) begin
				 		next_state <= `IDLE;
				 end
		   end

		  `ACT2 : begin
		     if(sw3 == 1'b1) begin
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
		     led1 <= 1'b0;
				 led2 <= 1'b0;
		  end

		  `ACT1 : begin
		     led1 <= 1'b1;
		     led2 <= 1'b0;
		  end

		  `ACT2 : begin
		     led1 <= 1'b0;
		     led2 <= 1'b1;
		  end

			default : begin
				led1 <= 1'b0;
				led2 <= 1'b0;
			end

		endcase
	end


endmodule
