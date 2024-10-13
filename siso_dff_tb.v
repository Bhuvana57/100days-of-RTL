
module siso_dff_tb();
	 reg sin , rst , clk ;
	wire  sout ;
	
	siso_dff dut ( .clk(clk) , .rst(rst) , . sin(sin) , .sout(sout)); 
	
	always  #10 clk = ~clk;
	always  begin 
 	   clk = 0;
	   rst = 1;
	   sin = 1'b1;
	   #30 rst = ~rst;
	   
	   forever #15 sin = ~sin;
	   $display("simtime = %0t , sin = %0b , sout = %0b" , $time , sin ,sout );
	
	   #500 $finish;
	   end 
endmodule