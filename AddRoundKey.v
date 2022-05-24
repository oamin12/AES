module AddRoundKey(str, key, out);

input [127:0] str;
input [127:0] key;
output [127:0] out;

assign out[127:0] = str[127:0] ^ key[127:0];


endmodule