// e b d 9
// 9 e b d
// d 9 e b
// b d 9 e

module inverseMixColumns(input wire [7:0] inputColumn0,
								 input wire [7:0] inputColumn1,
								 input wire [7:0] inputColumn2,
								 input wire [7:0] inputColumn3,
							 
								 output wire[7:0] outputColumn0,
								 output wire[7:0] outputColumn1,
								 output wire[7:0] outputColumn2,
								 output wire[7:0] outputColumn3
								 );
						

wire[7:0] multiply9Column0;
wire[7:0] multiplybColumn0;
wire[7:0] multiplydColumn0;
wire[7:0] multiplyeColumn0;


multiply9Galois m1(inputColumn3, multiply9Column0);
multiplybGalois m2(inputColumn1, multiplybColumn0);
multiplydGalois m3(inputColumn2, multiplydColumn0);
multiplyeGalois m4(inputColumn0, multiplyeColumn0);


assign outputColumn0 = multiplyeColumn0 ^ multiply9Column0 ^ multiplydColumn0 ^ multiplybColumn0;


wire[7:0] multiply9Column1;
wire[7:0] multiplybColumn1;
wire[7:0] multiplydColumn1;
wire[7:0] multiplyeColumn1;


multiply9Galois m5(inputColumn0, multiply9Column1);
multiplybGalois m6(inputColumn2, multiplybColumn1);
multiplydGalois m7(inputColumn3, multiplydColumn1);
multiplyeGalois m8(inputColumn1, multiplyeColumn1);


assign outputColumn1 = multiplyeColumn1 ^ multiply9Column1 ^ multiplydColumn1 ^ multiplybColumn1;



wire[7:0] multiply9Column2;
wire[7:0] multiplybColumn2;
wire[7:0] multiplydColumn2;
wire[7:0] multiplyeColumn2;


multiply9Galois m9(inputColumn1, multiply9Column2);
multiplybGalois m10(inputColumn3, multiplybColumn2);
multiplydGalois m11(inputColumn0, multiplydColumn2);
multiplyeGalois m12(inputColumn2, multiplyeColumn2);


assign outputColumn2 = multiplyeColumn2 ^ multiply9Column2 ^ multiplydColumn2 ^ multiplybColumn2;

wire[7:0] multiply9Column3;
wire[7:0] multiplybColumn3;
wire[7:0] multiplydColumn3;
wire[7:0] multiplyeColumn3;


multiply9Galois m13(inputColumn2, multiply9Column3);
multiplybGalois m14(inputColumn0, multiplybColumn3);
multiplydGalois m15(inputColumn1, multiplydColumn3);
multiplyeGalois m16(inputColumn3, multiplyeColumn3);


assign outputColumn3 = multiplyeColumn3 ^ multiply9Column3 ^ multiplydColumn3 ^ multiplybColumn3;

						
						
endmodule