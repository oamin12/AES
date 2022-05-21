module multiplydGalois_tb();

reg [7:0] inputValue;
wire [7:0] outputValue;


//# 2f   f0
//# 3d   3a
//# 1e   96
//# 9b   75


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
multiplydGalois uG(inputValue, outputValue);


endmodule 