
module minority_detector_tb( );
 reg in1 ,in2 ,in3;
 wire out;
 
 minority_detector dut(.in1(in1),.in2(in2),.in3(in3),.out(out));
 initial begin
   $monitor("simtime = %0t , in1 = %0b ,in2= %0b, in3= %0b,out= %0b",$time,in1,in2,in3,out);
   in1 = 0; in2 =0;in3 = 0;
   #50 in1 = ~in1;
   #100 in2 = ~in2;
   #200 in3 = ~in3;
   #400 $finish();
     end
endmodule   