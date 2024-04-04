module hex
(
	input [3:0] in,
	output[6:0] hex_0

);

reg [6:0] hex_reg;

always@(in)
begin
	case(in)
	0: hex_reg=7'b1000000;
	1: hex_reg=7'b1111001;
	2: hex_reg=7'b0100100;
	3: hex_reg=7'b0110000;
	4: hex_reg=7'b0011001;
	5: hex_reg=7'b0010010;
	6: hex_reg=7'b0000010;
	7: hex_reg=7'b1111000;
	8: hex_reg=7'b0000000;
	9: hex_reg=7'b0010000;
	10: hex_reg=7'b0001000;
	11: hex_reg=7'b0000011;
	12: hex_reg=7'b1000110;
	13: hex_reg=7'b0100001;
	14: hex_reg=7'b0000110;
	15: hex_reg=7'b0001110;
	endcase
end
assign hex_0=hex_reg;

endmodule

