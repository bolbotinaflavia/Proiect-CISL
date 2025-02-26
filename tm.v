`define IDLE 3'b000
`define START 3'b001
`define STOP 3'b011
`define RESET 3'b010
`define MEM 3'b100


module clk_mng #(parameter ADR_WIDTH=10)
(
	input clk,
	input rst,
	input [1:0]comanda,
	output [7:0]timp_s,
	output [7:0] timp_m,
	output [ADR_WIDTH-1:0] adr_out
);

reg[7:0] contor_reg_s;
reg[7:0] contor_next_s;
reg [7:0] contor_reg_m;
reg [7:0]  contor_next_m;
reg[ADR_WIDTH-1:0] adr_reg, adr_next;
reg [2:0] state_reg;
reg [2:0] state_next;


always @(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		contor_reg_s<=0;
		contor_reg_m<=0;
		state_reg<=3'b000;
		adr_reg<=0;
	end
	else
	begin
		contor_reg_s<=contor_next_s;
		contor_reg_m<=contor_next_m;
		state_reg<=state_next;
		adr_reg<=adr_next;
	end
end

always @(state_reg, contor_reg_s,contor_reg_m)
begin
	state_next=state_reg;
	contor_next_s=contor_reg_s;
	adr_next=adr_reg;
	contor_next_m=contor_reg_m;
	case(state_reg)
	
	`IDLE: begin
		contor_next_s=0;
		contor_next_m=0;
		if(comanda==2'b01)
			state_next=`START;
		end

	`START: begin
		
		//contor_next=contor_reg;
		contor_next_s=contor_reg_s+1;
		if(contor_reg_s==60) begin
 			contor_next_s=0;
			contor_next_m=contor_reg_m+1;
			
			end							
		if(comanda==2'b11)
			state_next=`MEM;
		if(comanda==2'b10)
			state_next=`RESET;
		if(comanda==2'b00)
			state_next=`IDLE;
		end

	`MEM: begin
		state_next=`STOP;
		adr_next=adr_reg+1;
		
	      end
	`STOP: begin
		if(comanda==2'b01)
			state_next=`START;
		end

	
	
	`RESET: begin
		
		if(comanda==2'b01)
			state_next=`IDLE;
		end
		
		//contor_next=contor_reg;
	
 		//contor_next<=contor_reg+1;
	endcase
	
end

assign timp_s=contor_reg_s;
assign timp_m=contor_reg_m;
assign adr_out=adr_reg;

endmodule

