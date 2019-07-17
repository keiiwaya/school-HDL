`timescale 1ns/1ns

module lu(a, b, op, y);
	input  [7:0] a, b;
	input  [1:0] op;
	output [7:0] y;
	wire   [7:0] w0, w1, w2, w3;
	wire   [3:0] c;
	
	andl a0(.a(a), .b(b), .y(w0));
	orl  o0( .a(a), .b(b), .y(w1));
	xorl x0(.a(a), .b(b), .y(w2));
	norl n0(.a(a), .b(b), .y(w3));
	
	dec dec0(.a(op), .y(c));
	
	tribuf t0(.a(w0), .c(c[0]), .y(y));
	tribuf t1(.a(w1), .c(c[1]), .y(y));
	tribuf t2(.a(w2), .c(c[2]), .y(y));
	tribuf t3(.a(w3), .c(c[3]), .y(y));
	
endmodule
