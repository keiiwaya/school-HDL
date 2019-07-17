`timescale 1ns/1ns

module test_lu();
   reg  [7:0] a, b;
   reg [1:0]  op;
   wire [7:0] y;
   
   lu l0(.a(a), .b(b), .op(op), .y(y));
   
   initial begin
      $dumpfile("lu.vcd");
      $dumpvars(0, test_lu);
   end
   
   initial begin
      $monitor($time,, "a=%b b=%b op=%b y=%b", a, b, op, y);
   end
   
   initial begin
      /* 以下を記述 */
      a = 8'b00000001; b = 8'b00000010; op = 2'b00;
      #10
      a = 8'b00000001; b = 8'b00000010; op = 2'b01;
      #10
      a = 8'b00000001; b = 8'b00000010; op = 2'b10;
      #10
      a = 8'b00000001; b = 8'b00000010; op = 2'b11;
      
      
      

      /* ここまで */
      #10
	a = 8'bxxxxxxxx; b = 8'bxxxxxxxx;
      op = 2'bxx;
      #10
	$finish();
   end
   
endmodule
