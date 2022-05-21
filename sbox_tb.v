module sbox_tb();

reg [31:0] inputSbox;
wire [31:0] outputSbox;


initial begin 
 $monitor ("%h   %h", 
  	  inputSbox, outputSbox);
inputSbox = 32'h 00ff0110;
#3

inputSbox = 32'h 0c91f33a2;




end
sbox s(inputSbox, outputSbox);


endmodule 