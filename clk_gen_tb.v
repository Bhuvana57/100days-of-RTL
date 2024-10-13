`timescale 1ns/1ps;
module clk_gen_tb ;
reg clk_in;
reg en;
wire clk_out;

clk_gen dut(.clk_in(clk_in) ,
            .en(en)         ,
            .clk_out(clk_out) 
);

initial begin 
 clk_in =1;
forever #5 clk_in = ~clk_in;
end

always begin
 
en=1;
#100;
$display("Enable=1");
en=0;
#200;
$display("Enable =0");
en =1;
#200;
$display("Enable =1");
en=0;
end
$finish();
always @(posedge clk_out) begin
$display("time=%0t , clk_out=%0b",$realtime,clk_out);
end
                
endmodule

