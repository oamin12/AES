module keyExpansion256_tb();

reg [255:0] inputValue;
wire [255:0] outputValue;
reg [31:0] rCon=32'h20000000;

initial begin 

 $monitor ("%h   %h   %h",inputValue,rCon , outputValue);

	#0 inputValue = 256'hde1369676ccc5a71fa2563959674ee155886ca5d2e2f31d77e0af1fa27cf73c3;

end
keyExpansion256 v(inputValue,rCon , outputValue);


endmodule 