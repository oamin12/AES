module multiply3Galois(input wire[7:0] inputNumber, output wire[7:0] outputNumber);

	wire[7:0] multiply2;

	xtime s2(inputNumber, multiply2);

	assign outputNumber = multiply2 ^ inputNumber;


endmodule 