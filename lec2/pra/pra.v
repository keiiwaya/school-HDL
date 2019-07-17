/*4bit add */
module add4(a, b, ci, co, s);
   /*input port*/
   input [3:0];
   input      ci;
   /*output port*/
   output     co;
   output [3:0] s;
   /*assign*/
   assign {co, s} = a + b + ci;
   
endmodule
