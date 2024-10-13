module clk_gen(en,clk_in,clk_out);
input clk_in;
input en;  // enable
output reg clk_out;

parameter freq = 2000;  // in desired clk_freq
parameter duty = 50;    // in percentage
parameter clk_in_freq = 50000; // input clk freq

localparam clk_period_count = clk_in_freq/freq;
localparam clk_on     = duty/100.0 * clk_period_count;
localparam clk_off    = clk_period_count - clk_on;
integer counter =0;

initial 
 begin
  clk_out <= 0;
  $display("Frequency = %0d kHz", freq);
  $display("Duty Cycle = %0d", duty);
  $display("Clock Period_count= %0d",clk_period_count);
  $display("Clock On = %0d", clk_on);
  $display("Clock off = %0d", clk_off);
 end
 

always @(posedge clk_in)begin 
 if(en) begin
   if(counter < clk_on) begin
     clk_out <= 1;
    end else if (counter < clk_period_count-1) begin
     clk_out <= 0;
    end
    counter <= counter +1;
    if(counter >= clk_period_count) begin
   	counter <= 0;
        end
  end 
 else begin
      clk_out <=0;
      counter <=0;
	end
end

endmodule
