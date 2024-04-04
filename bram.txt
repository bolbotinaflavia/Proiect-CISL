module bram #(parameter WIDTH = 8, parameter ADR_WIDTH=10)
(
	input [ADR_WIDTH-1:0]adr_in,
	input [WIDTH-1:0] data_in,
	input WE,
	input clk,
	input rst,
	output reg [WIDTH-1:0] data_out
);

reg[WIDTH-1:0]ram[2**ADR_WIDTH-1:0];
always @(posedge clk)
begin
	if(WE)
		ram[adr_in]<=data_in;
	data_out<=ram[adr_in];
end
endmodule
