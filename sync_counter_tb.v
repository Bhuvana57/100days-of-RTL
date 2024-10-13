

`timescale 1ns / 1ps

module tb_sync_counter;

    // Inputs
    reg clk;
    reg rst;
    
    // Outputs
    wire [3:0] cnt;
    
    // Instantiate the sync_counter module
    sync_counter dut (
        .clk(clk),
        .rst(rst),
        .cnt(cnt)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clk every 5 time units
    end
    
    // Reset control
    initial begin
        // Initialize reset
        rst = 1;
        #10;  // Wait for 10 time units
        rst = 0;  // De-assert reset
        #100; // Run for additional 100 time units
        $finish;  // End simulation
    end
    
    // Display counter value
    always @(posedge clk) begin
        $display("Time=%0t: Counter Value=%d", $time, cnt);
    end

endmodule
