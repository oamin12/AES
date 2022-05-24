module keyExpansion192(key,rCon,key_exp);

input [191:0] key;
input [31:0] rCon;
output [191:0] key_exp;
wire [31:0] rot;
wire [31:0] sboxOut;
wire [31:0] xorRcon;  




ShiftRowsKey32 s(key[31:0],1,rot);
sbox sbox1(rot,sboxOut);
assign xorRcon = sboxOut^rCon;

assign key_exp[191:160]=xorRcon^key[191:160];
assign key_exp[159:128]=key_exp[191:160]^key[159:128];
assign key_exp[127:96]=key_exp[159:128]^key[127:96];
assign key_exp[95:64]=key_exp[127:96]^key[95:64];
assign key_exp[63:32]=key_exp[95:64]^key[63:32];
assign key_exp[31:0]=key_exp[63:32]^key[31:0];


endmodule