module johnson(clk, load, cnt);
  input clk, load;
  output reg [3:0] cnt;
  wire w1, w2, w3, w4;

  dff d1(.clk(clk), .load(load), .d(~cnt[3]), .q(w1));
  dff d2(.clk(clk), .load(load), .d(w1), .q(w2));
  dff d3(.clk(clk), .load(load), .d(w2), .q(w3));
  dff d4(.clk(clk), .load(load), .d(w3), .q(w4));

  always @(posedge clk or posedge load) begin
    if (load) begin
      cnt <= 4'b0000;
    end else begin
      cnt <= {w4, w3, w2, w1}; // Shift in the values from flip-flops
    end
  end
endmodule

module dff(clk, load, d, q);
  input clk, load, d;
  output reg q;

  always @(posedge clk) begin
    if (load) begin
      q <= 0;
    end else begin
      q <= d;
    end
  end
endmodule
