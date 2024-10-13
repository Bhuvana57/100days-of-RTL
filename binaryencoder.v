module decimal2binaryencoder( decimal , binary);

 	 input  [3:0] decimal;
	 output reg [3:0] binary;
	 //reg [3:0] binary;
	 always@(decimal) begin 
		
		case (decimal)
			 
            4'd0 : binary = 4'b0000;
            4'd1 : binary = 4'b0001;
            4'd2 : binary = 4'b0010;
            4'd3 : binary = 4'b0011;
            4'd4 : binary = 4'b0100;
            4'd5 : binary = 4'b0101;
            4'd6 : binary = 4'b0110;
            4'd7 : binary = 4'b0111;
            4'd8 : binary = 4'b1000;
            4'd9 : binary = 4'b1001;
            default : binary = 4'b0000;
		   endcase
	    end
endmodule

