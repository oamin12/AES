module keyExpansion192_tb();

reg [191:0] inputValue;
wire [191:0] outputValue;
reg [31:0] rCon=32'h80000000;
//assign rCon=8'h01000000;

initial begin 

 $monitor ("%h   %h   %h",inputValue,rCon , outputValue);
	  
	#0 inputValue = 192'h821f750aad07d753ca4005388fcc5006282d166abc3ce7b5;
	


end
keyExpansion192 v(inputValue,rCon , outputValue);


endmodule 