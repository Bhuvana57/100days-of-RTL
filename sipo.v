module sipo(
    input serial_in,
    input clk,
    input rst,
    output reg [7:0] parallel_out
);
    reg [7:0] shift;

    always @(posedge clk ) begin
        if (rst) begin
            shift <= 8'b0;
        end else begin
            shift <= {shift[6:0], serial_in};
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            parallel_out <= shift;
        end
    end
endmodule

 