`timescale 1ns/1ps;
module d_ff_tb();
	reg clk,rst,d;
	wire q;

	d_ff dut(.clk(clk),.rst(rst),.d(d),.q(q));

	
	initial begin
		clk=0;
		rst = 0;
		d = 0;
		forever  #10 clk = ~clk;
		end
	always @(posedge clk) begin
		#100 rst = ~rst;
		#50  d = ~d;
		end

	always begin
		$monitor("simtime = %0t , clk =%0d,rst = %0d, d=%0b, q=%0b",$time,clk,rst,d,q);
		#500 $finish();
		end
endmodule
