module inverseMixColumns_tb();

reg [7:0] inputValue1;
reg [7:0] inputValue2;
reg [7:0] inputValue3;
reg [7:0] inputValue4;

wire [7:0] outputValue1;
wire [7:0] outputValue2;
wire [7:0] outputValue3;
wire [7:0] outputValue4;


// 1e  51
// 07  22
// 2b  9e
// 4f  90
//---------
// 2f  9c
// 3d  ec
// 1e  98
// 9b  7f
//---------
// db  8e   
// 13  4d   
// 53  a1 
// 45  bc


initial begin 
 $monitor ("%h   %h   %h    %h   %h    %h   %h   %h"  , 
  	  inputValue1, inputValue2, inputValue3, inputValue4, outputValue1, outputValue2, outputValue3, outputValue4);
	  
inputValue1 = 8'h 51;
inputValue2 = 8'h 22;
inputValue3 = 8'h 9e;
inputValue4 = 8'h 90;


#3

inputValue1 = 8'h 09c;
inputValue2 = 8'h 0ec;
inputValue3 = 8'h 098;
inputValue4 = 8'h 07f;


#3

inputValue1 = 8'h 08e;
inputValue2 = 8'h 04d;
inputValue3 = 8'h 0a1;
inputValue4 = 8'h 0bc;

end
inverseMixColumns mix(inputValue1, inputValue2, inputValue3, inputValue4, outputValue1, outputValue2, outputValue3, outputValue4);



endmodule 