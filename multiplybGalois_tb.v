module multiplybGalois_tb();

reg [7:0] inputValue;
wire [7:0] outputValue;


//# 2f   12
//# 3d   b4
//# 1e   d2
//# 9b   02


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
multiplybGalois uG(inputValue, outputValue);


endmodule 