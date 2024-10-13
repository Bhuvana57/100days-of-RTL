module buffer_tb();
 reg [3:0]d;
 reg clk,rst;
 wire [3:0]q;
 
buffer dut(.d(d),.clk(clk),.rst(rst),.q(q));

initial begin 
	clk =0;
	forever #10 clk = ~clk;
	end
initial begin
	d = 4'b1111;
	rst =1 ;
	#20 rst =0;
	d=4'b1101;
	#50 d=4'b1001;
        #100 $finish();
	end 
endmodule
