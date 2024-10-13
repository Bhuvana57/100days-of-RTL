
module sync_counter (
    input clk,         // Clock input
    input rst,         // Asynchronous reset input
    output reg [3:0] cnt);  // 4-bit output register representing the counter

    always @(posedge clk) begin
        if (rst) begin
            cnt <= 4'b0;  // Reset the counter to zero on positive edge of clk and rst high
        end else begin
            cnt <= cnt + 1;  // Increment the counter on positive edge of clk
        end
    end

endmodule

