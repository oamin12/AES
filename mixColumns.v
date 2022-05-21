module mixColumns(input wire [7:0] inputColumn0,
						input wire [7:0] inputColumn1,
						input wire [7:0] inputColumn2,
						input wire [7:0] inputColumn3,
					
						output wire[7:0] outputColumn0,
						output wire[7:0] outputColumn1,
						output wire[7:0] outputColumn2,
						output wire[7:0] outputColumn3
						);



wire[7:0] multiply2Column0;
wire[7:0] multiply3Column0;

xtime m1(inputColumn0, multiply2Column0);
multiply3Galois m2(inputColumn1, multiply3Column0);

assign outputColumn0 = multiply2Column0 ^ multiply3Column0 ^ inputColumn2 ^ inputColumn3;



wire[7:0] multiply2Column1;
wire[7:0] multiply3Column1;

xtime m3(inputColumn1, multiply2Column1);
multiply3Galois m4(inputColumn2, multiply3Column1);

assign outputColumn1 = inputColumn0 ^ multiply2Column1 ^ multiply3Column1 ^ inputColumn3;



wire[7:0] multiply2Column2;
wire[7:0] multiply3Column2;

xtime m5(inputColumn2, multiply2Column2);
multiply3Galois m6(inputColumn3, multiply3Column2);

assign outputColumn2 = inputColumn0 ^ inputColumn1 ^ multiply2Column2 ^ multiply3Column2;


wire[7:0] multiply2Column3;
wire[7:0] multiply3Column3;

xtime m7(inputColumn3, multiply2Column3);
multiply3Galois m8(inputColumn0, multiply3Column3);

assign outputColumn3 = multiply3Column3 ^ inputColumn1 ^ inputColumn2 ^ multiply2Column3;



endmodule 