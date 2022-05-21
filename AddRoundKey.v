module AddRoundKey(str, key, out);

input [31:0] str;
input [31:0] key;
output [31:0] out;

assign out[31:0] = str[31:0] ^ key[31:0];


endmodule