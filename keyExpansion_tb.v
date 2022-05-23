module keyExpansion_tb();

reg [127:0] inputValue;
wire [127:0] outputValue;
reg [31:0] rCon=32'h40000000;
//assign rCon=8'h01000000;

initial begin 

 $monitor ("%h   %h   %h",inputValue,rCon , outputValue);
	  
	#0 inputValue = 128'h6d88a37a110b3efddbf98641ca0093fd;
	


end
keyExpansion v(inputValue,rCon , outputValue);


endmodule 