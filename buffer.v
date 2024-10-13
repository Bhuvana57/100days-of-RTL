`include "d_ff.v"
module buffer (d,clk,rst,q);
input [3:0]d;
input clk,rst;
output [3:0]q;

d_ff f0(d[0],clk,rst,q[0]);
d_ff f1(d[1],clk,rst,q[1]);
d_ff f2(d[2],clk,rst,q[2]);
d_ff f3(d[3],clk,rst,q[3]);

endmodule