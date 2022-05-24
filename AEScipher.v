module AEScipher(clk,reset,key,Nr,InputText,Cipher);


input wire [255:0] key;
input wire reset;
input wire [127:0] InputText;
input clk;
input wire [3:0] Nr;
output reg [127:0] Cipher;



localparam idle = 5'd0;
localparam AddRoundKey = 5'd1;
localparam SubBytes = 5'd2;
localparam shiftRow = 5'd3;
localparam MixColumn = 5'd4;
localparam outPutCipher= 5'd5;
localparam getKeyExp = 5'd6;

reg [4:0] current_state;
reg [4:0] next_state;
reg [127:0] ExpKey128In; // process
reg [191:0] ExpKey192In; // process
reg [255:0] ExpKey256In; // process
wire[127:0] ExpKey128Out; // process
wire [191:0] ExpKey192Out; // process
wire [255:0] ExpKey256Out; // process
reg [127:0] Text; // process
reg [127:0] inputRound;
reg [127:0] inputShift;
wire [127:0] outputShift;
reg [31:0] inputSub1;
reg [31:0] inputSub2;
reg [31:0] inputSub3;
reg [31:0] inputSub4;

wire [31:0] outputSub1;
wire [31:0] outputSub2;
wire [31:0] outputSub3;
wire [31:0] outputSub4;
////////////////////////////


reg [127:0] inputColumn;
wire [127:0] outputColumn;


////////////////////////////
reg [127:0] keyRound;
wire[127:0] outputRound;

reg [31:0] inputSub;
wire[31:0] outputSub;

reg [255:0] ExpKey;

reg [3:0] current_round;
reg [31:0] Rcon;

always@ (posedge clk, posedge reset)
begin
if (reset) begin
	current_state <= idle;
end
else begin
	current_state <= next_state;
end
end

always@ (current_state)
begin
case(current_state)
	idle:
	begin
		next_state<=getKeyExp;
	end
	getKeyExp:
	begin
		if(Nr==10)begin
			 ExpKey128In<=ExpKey[127:0];
		end
		else if(Nr==12)begin
			 ExpKey192In<=ExpKey[191:0];
		end
		else begin
			 ExpKey256In<=ExpKey[255:0];
		end
		next_state<=AddRoundKey;
	end
	
	AddRoundKey:
	begin
	if(current_round==4'b0000)
	begin
		if(Nr==10)begin
			 inputRound<=Text[127:0];
			 keyRound<=ExpKey128Out[127:0];
		end
		else if(Nr==12)begin
			 inputRound<=Text[127:0];
			 keyRound<=ExpKey192Out[127:0];
		end
		else begin
			 inputRound<=Text[127:0];
			 keyRound<=ExpKey256Out[127:0];
		end
	end
	else
	begin
		if(Nr==10)begin
			 inputRound<=outputColumn[127:0];
			 keyRound<=ExpKey128Out[127:0];
		end
		else if(Nr==12)begin
			 inputRound<=outputColumn[127:0];
			 keyRound<=ExpKey192Out[127:0];
		end
		else begin
			 inputRound<=outputColumn[127:0];
			 keyRound<=ExpKey256Out[127:0];
		end
	end

	next_state<=SubBytes;
		
	end
	SubBytes:
	begin
		inputSub1<=outputRound[31:0];
		inputSub2<=outputRound[63:32];
		inputSub3<=outputRound[95:64];
		inputSub4<=outputRound[127:96];
		
		next_state<=shiftRow;
	
	
	end	
	shiftRow:
	begin
		inputShift<={outputSub4,outputSub3,outputSub2,outputSub1};
	end
	MixColumn:
	begin
		inputColumn<=outputShift;
		next_state<=getKeyExp;
	end
	default: 
	begin
		next_state<=idle;
	end
endcase


end

	AddRoundKey addRound(inputRound, keyRound, outputRound);
	sbox sub1(inputSub1,outputSub1);
	sbox sub2(inputSub2,outputSub2);
	sbox sub3(inputSub3,outputSub3);
	sbox sub4(inputSub4,outputSub4);

	ShiftRows shiftR(inputShift,outputShift);
	keyExpansion256 key256(ExpKey128In[127:0],Rcon,ExpKey128Out[127:0]);
	keyExpansion192 key192(ExpKey192In[191:0],Rcon,ExpKey192Out[191:0]);
	keyExpansion128 key128(ExpKey256In[255:0],Rcon,ExpKey256Out[255:0]);
	
	mixColumns mix1(inputColumn[127:120],inputColumn[119:112],inputColumn[111:104],inputColumn[103:96]
	,outputColumn[127:120],outputColumn[119:112],outputColumn[111:104],outputColumn[103:96] );
	
	mixColumns mix2(inputColumn[95:88],inputColumn[87:80],inputColumn[79:72],inputColumn[71:64]
	,outputColumn[95:88],outputColumn[87:80],outputColumn[79:72],outputColumn[71:64] );
	
	mixColumns mix3(inputColumn[63:56],inputColumn[55:48],inputColumn[47:40],inputColumn[39:32]
	,outputColumn[63:56],outputColumn[55:48],outputColumn[47:40],outputColumn[39:32] );
	
	mixColumns mix4( inputColumn[31:24],inputColumn[23:16],inputColumn[15:8],inputColumn[7:0]
	,outputColumn[31:24],outputColumn[23:16],outputColumn[15:8],outputColumn[7:0] );
	//input wire [127:0] inputColumn;
	//output wire[127:0] outputColumn;
//	mixColumns(input wire [7:0] inputColumn0,
//						input wire [7:0] inputColumn1,
//						input wire [7:0] inputColumn2,
//						input wire [7:0] inputColumn3,
//					
//						output wire[7:0] outputColumn0,
//						output wire[7:0] outputColumn1,
//						output wire[7:0] outputColumn2,
//						output wire[7:0] outputColumn3
//						);

	
	
	
//	always@(current_state)
//	begin
//	case(current_state)
		
//output
//always@ (c_en, rst, accum, current_state)
//begin
//case(current_state)
//	idle:
//		if (rst == 1'b1) begin
//			next_state <= idle;
//		end
//		else if (c_en == 1'b1) begin
//			next_state <= coinaccept;
//		end
//		else begin
//			next_state <= idle;
//		end
//	coinaccept:
//		if (rst == 1'b1) begin
//			next_state <= idle;
//		end
//		else if (c_en == 1'b0) begin
//			next_state <= idle;
//		end
//		else if(accum >= 15) begin
//			next_state <= idle;
//		end
//		else begin
//			next_state <= coinaccept;
//		end
//	default:
//		next_state <= idle;
//endcase
//end
//
//always@ (posedge clk, posedge rst)
//begin
//if (rst == 1'b1) begin
//	accum <= 0;
//end

//end

endmodule 