module ShiftRows(s, o);

input [127:0] s;
output [127:0] o;

//wire [15:0] s;
//reg [15:0] o;

assign o[127:0] = {s[127:120], s[87:80], s[47:40], s[7:0], s[95:88], s[55:48], s[15:8], s[103:96], s[63:56], s[23:16], s[111:104], s[71:64], s[31:24], s[119:112], s[79:72], s[39:32]};


endmodule 