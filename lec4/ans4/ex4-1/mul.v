`timescale 1ns/1ns

module mul(clk, ld, a, b, y);
	input        clk; /* クロック */
	input        ld;  /* ロード */
	input  [3:0] a;   /* 被乗数 */
	input  [3:0] b;   /* 乗数 */
	output [7:0] y;   /* 積 */
	
	reg [7:0] ra; /* 被乗数レジスタ */
	reg [3:0] rb; /* 乗数レジスタ */
	reg [7:0] ry; /* 積レジスタ */
	
	/* 被乗数レジスタ */
	always@(posedge clk) begin
		if(ld == 1'b1) begin
			ra <= {4'b0000, a};
		end else begin
			ra <= {ra[6:0], 1'b0};
		end
	end
	
	/* 乗数レジスタ */
	always@(posedge clk) begin
		if(ld == 1'b1) begin
			rb <= b;
		end else begin
			rb <= {1'b0, rb[3:1]};
		end
	end
	
	/* 積レジスタ */
	always@(posedge clk) begin
		if(ld == 1'b1) begin
			ry <= 8'b00000000;
		end else if(rb[0] == 1'b1) begin
			ry <= ry + ra;
		end
	end
	
	assign y = ry;
	
endmodule
