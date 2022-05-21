module ShiftRows(s, row, o);

input [31:0] s;
input[1:0] row;
output [31:0] o;

//wire [15:0] s;
//reg [15:0] o;

assign o[31:0] = (row==1)? {s[23:0], s[31:24]} :
					  (row==2)? {s[15:0], s[31:16]} : {s[7:0], s[31:8]};

endmodule