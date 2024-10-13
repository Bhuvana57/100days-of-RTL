`include "d_ff.v"
module siso_dff(sin , clk ,rst , sout);
	 input sin , clk, rst;
	 output  sout;
	 wire w1 , w2 , w3 ;
	 
	 d_ff d1(.d(sin), .clk(clk) , .rst(rst) , .q(w1));
	 d_ff d2(.d(w1), .clk(clk) , .rst(rst) , .q(w2));
	 d_ff d3(.d(w2), .clk(clk) , .rst(rst) , .q(w3));
	 d_ff d4(.d(w3), .clk(clk) , .rst(rst) , .q(sout));
	
	
endmodule	


