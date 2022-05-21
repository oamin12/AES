module multiplyeGalois_tb();

reg [7:0] inputValue;
wire [7:0] outputValue;


//# 2f   81
//# 3d   7d
//# 1e   b4
//# 9b   c3

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
multiplyeGalois uG(inputValue, outputValue);


endmodule 