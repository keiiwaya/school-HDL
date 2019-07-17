`timescale 1ns/1ns

/* 課題(2)
	制御信号alu_selを追加
	csgに出力ポートを追加
	aluを追加
	dr_dinに対するマルチプレクサを変更
 */

/* 課題(3)
	制御信号pr_selを追加
	csgに出力ポートを追加
	pr_dinに対するマルチプレクサを追加
 */

module data_path(
	clk, rst
);
	input      clk, rst;
	/*--- instruction fetch ---*/
	wire [3:0] pr_din, pr_dout;
	wire [3:0] im_adrs;
	wire [7:0] im_dout;
	wire [7:0] ir_din, ir_dout;
	/*--- register fetch ---*/
	wire [1:0] gr_a, gr_b;
	wire [3:0] gr_din, gr_dout_a, gr_dout_b;
	wire [3:0] ar_din, ar_dout;
	wire [3:0] br_din, br_dout;
	/*--- execution ---*/
	wire [3:0] dm_adrs, dm_din, dm_dout;
	wire [3:0] dr_din, dr_dout;
	/*--- state register ---*/
	wire [1:0] sr_din, sr_dout;
	/*--- control signal ---*/
	wire       gr_sel, br_sel, dr_sel;
	wire       ir_we, pr_we, gr_we;
	wire       dm_re, dm_we;
	wire[1:0]	 alu_sel;
	wire[3:0]			alu_din1, alu_din2, alu_dout;
	wire				pr_sel;


	/*--- instruction fetch ---*/
	assign pr_din = pr_dout + 4'b0001;
	reg4 pc(.clk(clk), .rst(rst), .we(pr_we), .din(pr_din), .dout(pr_dout));

	assign im_adrs = pr_dout;
	rom im(.adrs(im_adrs), .dout(im_dout));

	assign ir_din = im_dout;
	reg8 ir(.clk(clk), .rst(rst), .we(ir_we), .din(ir_din), .dout(ir_dout));
	/*--- register fetch ---*/
	assign gr_a = (gr_sel == 1'b1) ? ir_dout[3:2] : 2'b00;
	assign gr_b = ir_dout[1:0];
	assign gr_din = dr_dout;
	regf gr(.clk(clk), .we(gr_we), .din(gr_din),
			.a(gr_a), .dout_a(gr_dout_a), .b(gr_b), .dout_b(gr_dout_b));

	assign ar_din = gr_dout_a;
	reg4 ar(.clk(clk), .rst(1'b1), .we(1'b1), .din(ar_din), .dout(ar_dout));

	assign br_din = (br_sel == 1'b1) ? gr_dout_b : ir_dout[3:0];
	reg4 br(.clk(clk), .rst(1'b1), .we(1'b1), .din(br_din), .dout(br_dout));
	/*--- execution ---*/
	assign dm_adrs = br_dout;
	assign dm_din = ar_dout;
	ram dm(.clk(clk), .re(dm_re), .we(dm_we),
		.adrs(dm_adrs), .din(dm_din), .dout(dm_dout));

	assign dr_din = (dr_sel == 1'b1) ? alu_dout : dm_dout;

	reg4 dr(.clk(clk), .rst(1'b1), .we(1'b1), .din(dr_din), .dout(dr_dout));
	/*--- state register ---*/
	assign sr_din = sr_dout + 2'b01;
	reg2 sc(.clk(clk), .rst(rst), .we(1'b1), .din(sr_din), .dout(sr_dout));

	/*--- control signal ---*/
	csg csg(
		.iru(ir_dout[7:4]),  .sr(sr_dout),
		.gr_sel(gr_sel), .br_sel(br_sel), .dr_sel(dr_sel),
		.alu_sel(alu_sel),
		.ir_we(ir_we), .pr_we(pr_we), .gr_we(gr_we),
		.dm_re(dm_re), .dm_we(dm_we),
		.pr_sel(pr_sel));

	


endmodule
