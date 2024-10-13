module johnson_tb;
  reg clk, load;
  wire [3:0] cnt;

 
  johnson uut (
    .clk(clk),
    .load(load),
    .cnt(cnt)
  );

 
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

  
  initial begin
    
    load = 1;
    #15 load = 0; 
    #100;       

    
    repeat (16) begin
      #10; 
    end

    $finish;
  end

  
  initial begin
    $monitor("Time = %0t | load = %b | cnt = %b", $time, load, cnt);
  end
endmodule

