module piso_tb();
  reg clk, load;
  reg [3:0] parallel_in;
  wire serial_out;
  integer i;

  // Instantiate the DUT
  piso dut (
    .clk(clk), 
    .parallel_in(parallel_in), 
    .load(load), 
    .serial_out(serial_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock (10ns period)
  end

  // Task to initialize signals
  task initialize;
  begin
    parallel_in = 4'b0000;
    load = 1'b0;
  end
  endtask

  // Task to apply stimulus
  task stimulus;
  begin
    for (i = 0; i < 16; i = i + 1) begin
      load = 1;
      parallel_in = i;
      #25 load = 0;
      #80; // Wait enough time for all bits to shift out
    end
  end
  endtask

  // Apply the test sequence
  initial begin
    initialize;
    stimulus;
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | load = %b | parallel_in = %b | serial_out = %b", $time, load, parallel_in, serial_out);
  end
endmodule

