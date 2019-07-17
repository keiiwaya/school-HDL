`timescale 1ns/1ns

`define LDI  4'b0000
`define MOV  4'b0001
`define ADD  4'b0010
`define SUB  4'b0011
`define LD   4'b0100
`define ST   4'b0101
`define JMP  4'b0110
`define CMP  4'b0111
`define JZ   4'b1000
`define JC   4'b1001
`define ADDI 4'b1010
`define CMPI 4'b1011

/* 課題(1)
	制御信号fr_weを追加
	CMPの制御を追加
	ADDとSUBの制御を変更
 */
/* 課題(2)
	入力ポートfrを追加
	センシティビティリストにfrを追加
	JZとJCの制御を追加
 */
/* 課題(3)
	ADDIとCMPIの制御を追加
 */

module csg(
	iru, sr,
	pr_sel, gr_sel, br_sel, dr_sel, alu_sel,
	ir_we, pr_we, gr_we,
	dm_re, dm_we
);
	input   [3:0] iru;
	input   [1:0] sr;
	output        pr_sel, gr_sel, br_sel, dr_sel;
	output  [1:0] alu_sel;
	output        ir_we, pr_we, gr_we;
	output        dm_re, dm_we;
	reg           pr_sel, gr_sel, br_sel, dr_sel;
	reg     [1:0] alu_sel;
	reg           ir_we, pr_we, gr_we;
	reg           dm_re, dm_we;
	
	always@(iru or sr) begin
		pr_sel <= 1'bx;
		gr_sel <= 1'bx;
		br_sel <= 1'bx;
		dr_sel <= 1'bx;
		alu_sel <= 2'bxx;
		ir_we  <= 1'b0;
		pr_we  <= 1'b0;
		gr_we  <= 1'b0;
		dm_re  <= 1'b0;
		dm_we  <= 1'b0;
		case(sr)
			2'b00: begin
				ir_we <= 1'b1;
				pr_sel <= 1'b1;
				pr_we <= 1'b1;
			end
			2'b01: begin
				case(iru)
					`LDI: begin
						br_sel <= 1'b0;
					end
					`MOV, `LD: begin
						br_sel <= 1'b1;
					end
					`ADD, `SUB, `ST: begin
						gr_sel <= 1'b1;
						br_sel <= 1'b1;
					end
					`JMP: begin
						pr_sel <= 1'b0;
						pr_we <= 1'b1;
					end
				endcase
			end
			2'b10: begin
				case(iru)
					`LDI, `MOV: begin
						alu_sel <= 2'b01;
						dr_sel <= 1'b1;
					end
					`ADD: begin
						alu_sel <= 2'b10;
						dr_sel <= 1'b1;
					end
					`SUB: begin
						alu_sel <= 2'b11;
						dr_sel <= 1'b1;
					end
					`LD: begin
						dm_re <= 1'b1;
						dr_sel <= 1'b0;
					end
					`ST: begin
						dm_we <= 1'b1;
					end
				endcase
			end
			2'b11: begin
				case(iru)
					`LDI: begin
						gr_sel <= 1'b0;
						gr_we <= 1'b1;
					end
					`MOV, `ADD, `SUB, `LD: begin
						gr_sel <= 1'b1;
						gr_we <= 1'b1;
					end
				endcase
			end
		endcase
	end
endmodule
