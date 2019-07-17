`timescale 1ns/1ns

module lu(a, b, op, y);
   input  [7:0] a, b;
   input [1:0] 	op;
   output [7:0] y;
   /* 以下を記述 */
   wire [7:0] 	w0, w1, w2, w3;
   
   andl a0(.a(a), .b(b), .y(w0));
   orl o0(.a(a), .b(b), .y(w1));
   xorl x0(.a(a), .b(b), .y(w2));
   norl n0(.a(a), .b(b), .y(w3));

   mux4 m0(.a(w0), .b(w1), .c(w2), .d(w3), .s(op), .y(y));

 
   /* ここまで */
   
endmodule
