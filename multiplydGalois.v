module multiplydGalois(input wire[7:0] inputNumber, output wire[7:0] outputNumber);

	wire[7:0] multiply2;
	wire[7:0] multiply4;
	wire[7:0] multiply8;
	xtime s2(inputNumber, multiply2);
	xtime s3(multiply2, multiply4);
	xtime s4(multiply4, multiply8);

	assign outputNumber = multiply8 ^ multiply4 ^ inputNumber;


endmodule 