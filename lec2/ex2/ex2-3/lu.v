`timescale 1ns/1ns

module lu(a, b, op, y);
   input  [7:0] a, b;
   input [1:0] 	op;
   output [7:0] y;
   /* 以下を記述 */
   wire [7:0] 	w0, w1, w2, w3;
   wire [3:0] 	w4;
   

   andl a0(.a(a), .b(b), .y(w0));
   orl a1(.a(a), .b(b), .y(w1));
   xorl a2(.a(a), .b(b), .y(w2));
   norl a3(.a(a), .b(b), .y(w3));

   dec d0(.a(op), .y(w4));

   tribuf t0(.a(w0), .c(w4[0]), .y(y));
   tribuf t1(.a(w1), .c(w4[1]), .y(y));
   tribuf t2(.a(w2), .c(w4[2]), .y(y));
   tribuf t3(.a(w3), .c(w4[3]), .y(y));
   

   

   
   
  
  
   

   /* ここまで */
   
endmodule
