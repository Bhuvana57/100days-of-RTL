module fa_hs_tb();
 reg A,B,C;
 wire Sum,Carry;

 Full_Adder_HS dut(.A(A), .B(B), .C(C), .Sum(Sum), .Carry(Carry));

 initial begin 
  A = 0 ; B = 0; C = 0;

  #50  C = ~C;
  #100 B = ~B;
  #200 A = ~A;
  #500 $stop();
 end
endmodule
