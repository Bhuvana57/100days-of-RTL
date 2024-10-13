module sipo_tb();
    reg serial_in, clk, rst;
    wire [7:0] parallel_out;

    sipo dut(
        .clk(clk),
        .serial_in(serial_in),
        .rst(rst),
        .parallel_out(parallel_out)
    );

    task initialise;
        begin
            clk = 0;
            rst = 0;
            serial_in = 0;
        end
    endtask

    task stimulus;
        begin
            forever #5 clk = !clk; 
        end
    endtask

    initial begin 
        initialise;
        stimulus;
    end

    initial begin
        #10 rst = 1;
        #10 rst = 0;
        forever begin
            #10 serial_in = $random;
        end
    end

    initial begin
        $monitor("simtime=%t, serial_in=%0b, parallel_out=%0b", $time, serial_in, parallel_out);
    end
endmodule

