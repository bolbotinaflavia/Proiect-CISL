module  clk_div #(parameter perioada=5000000)
(
		input rst,
		input clk,
		input en,
		output clk_div
);

reg clk_reg;
reg clk_next;
reg [24:0]cnt_reg;
reg [24:0]cnt_next;



always @(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		cnt_reg<=0;
		clk_reg<=0;
	end
	else
	begin
		cnt_reg<=cnt_next;
		clk_reg<=clk_next;
	end
end


always @(clk_reg,en)
begin
	clk_next=clk_reg;
        cnt_next=cnt_reg;
	if(en)
	begin
		if(cnt_reg == perioada)
		begin 
			cnt_next=0;
			clk_next=~(clk_reg);
		end
		else
		begin
			cnt_next=cnt_reg+1;
		end
	end
end
assign clk_div=clk_reg;

endmodule
