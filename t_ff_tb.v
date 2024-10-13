`timescale 1ns/1ps;
module t_ff_tb();
    reg clk, rst, t;
    wire q;

    // Instantiate the T flip-flop module
    t_ff dut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #25 clk = ~clk;
    end

    initial begin
        rst=0;
        t = 0;
        #50 rst = 1;   
        #50 rst = 0;   
        
        #100 t = 1;    // Set T = 1 after 100 ns
        #100 t = 0;    // Set T = 0 after another 100 ns
        #100 t = 1;    // Set T = 1 after another 100 ns
        #100 t = 0;    // Set T = 0 after another 100 ns
    end

    // Monitor signals
    initial begin
        $monitor("simtime = %0t, t = %0b, clk = %0b, rst = %0b, q = %0b", $time, t, clk, rst, q);
        #1000 $finish(); // Stop simulation after 500 ns
    end
endmodule

