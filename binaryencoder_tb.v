
module decimal2binaryencoder_tb();
	
	reg [3:0]decimal ;
	wire [3:0] binary;
        decimal2binaryencoder dut(.decimal(decimal), .binary(binary));
	
 	task initialise;
		decimal = 0;
	endtask
	task stimulus ;
		integer i ;
		for(i=0; i <10; i= i+1)
			begin 
			  decimal = i;
		          #10;
			end
	endtask
	initial begin 
		initialise ;
		stimulus;
		$monitor("decimal = %0d , binary = %0b , simtime = %0t" , decimal , binary , $time);
		$finish;
	end  
endmodule
