
module piso(clk , load , parallel_in , serial_out);
	input clk , load ;
	input [3:0] parallel_in;
	output reg serial_out;
	reg [3:0] shift;

	always @(posedge clk ) begin 
		if(load) begin 
			shift <=  parallel_in;
		end
		else begin 
			serial_out <= shift[3];
			shift <= {shift[2:0] , 1'b0};
		end
	end
endmodule
			
