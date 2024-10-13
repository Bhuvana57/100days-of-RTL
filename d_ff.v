
module d_ff(d,clk,rst,q);
 input clk,rst,d;
 output reg q;
 always@(negedge clk) begin
 	if(rst) begin 
	 	q <= 0;
	end
	else begin	
		q <= d;
	end
   end
endmodule 