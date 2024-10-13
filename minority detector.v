module minority_detector (in1 ,in2 ,in3 , out);
	input in1 ,in2 ,in3 ;
	output  out ;
	wire and1,and2,and3;

	
	assign and1 = in1 & in2;
	assign and2 = in2 &in3;
	assign and3 = in3 & in1;
	assign out = ~( and1|and2|and3);
		
endmodule
