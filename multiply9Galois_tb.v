module multiply9Galois_tb();

reg [7:0] inputValue;
wire [7:0] outputValue;


//# 2f   4c
//# 3d   ce
//# 1e   ee
//# 9b   2f


initial begin 
 $monitor ("%h   %h", 
  	  inputValue, outputValue);
	  
inputValue = 8'h 02f;
#3

inputValue = 8'h 03d;

#3

inputValue = 8'h 1e;

#3

inputValue = 8'h 9b;



end
multiply9Galois uG(inputValue, outputValue);


endmodule 