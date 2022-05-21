module xtime_tb();

reg [7:0] inputValue;
wire [7:0] outputValue;


initial begin 
 $monitor ("%h   %h", 
  	  inputValue, outputValue);
	  
inputValue = 8'h 057;
#3

inputValue = 8'h 0ae;

#3

inputValue = 8'h 47;




end
xtime s(inputValue, outputValue);


endmodule 