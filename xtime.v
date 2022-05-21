module xtime(input wire[7:0] inputNumber, output wire[7:0] outputNumber);

wire [8:0] numberAfterShift;
assign numberAfterShift = inputNumber*2;

assign outputNumber = (numberAfterShift > 255) ? (numberAfterShift ^ (9'h11b)) : numberAfterShift;

endmodule 