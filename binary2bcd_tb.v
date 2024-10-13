module binary2bcd_tb();
 reg [7:0] binary;
 wire [11:0] bcd;
 integer i;

 binary2bcd b2b(.binary(binary), .bcd(bcd));

 initial begin
   $monitor("Time = %0t | binary = %b | bcd = %b", $time, binary, bcd);
 end
 
 initial begin
   binary = 8'b0;
   #5;
   for(i = 0; i < 256; i = i + 1) begin
     binary = i;
     #5;
   end
 end
endmodule

		
