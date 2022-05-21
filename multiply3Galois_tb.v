module multiply3Galois_tb();

reg [7:0] inputValue;
wire [7:0] outputValue;


initial begin 
 $monitor ("%h   %h", 
  	  inputValue, outputValue);
	  
inputValue = 8'h 057;
#3

inputValue = 8'h 0f9;

#3

inputValue = 8'h 10;



end
multiply3Galois s(inputValue, outputValue);


endmodule 