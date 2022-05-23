module keyExpansion128(key,rCon,key_exp);

input [127:0] key;
input [31:0] rCon;
output [127:0] key_exp;
wire [31:0] rot;
wire [31:0] sboxOut;
wire [31:0] xorRcon;  




ShiftRows s(key[31:0],1,rot);
sbox sbox1(rot,sboxOut);

assign xorRcon = sboxOut^rCon;

assign key_exp[127:96]=xorRcon^key[127:96];
assign key_exp[95:64]=key_exp[127:96]^key[95:64];
assign key_exp[63:32]=key_exp[95:64]^key[63:32];
assign key_exp[31:0]=key_exp[63:32]^key[31:0];


endmodule