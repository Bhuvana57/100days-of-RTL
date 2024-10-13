module binary2bcd(
 input [7:0] binary,
 output reg [11:0] bcd);

 reg [3:0] hundreds, tens, ones;
 reg [6:0] temp_reg;

 always @(*) begin
   hundreds = binary / 100;
   temp_reg = binary % 100;
   tens = temp_reg / 10;
   ones = temp_reg % 10;
 end
  
 always @(*) begin
   bcd = {hundreds, tens, ones};
 end
endmodule

	