module cronometru(input clk,
		 input rst,
		 input en,
		 input [1:0] comanda,
		 output [6:0] hex_0,
		output[6:0] hex_1,
		output [6:0] hex_2,
		output [6:0] hex_3,
		output [8:0] led_0
		);
wire clk_div;
wire [7:0]timp_s;
wire [7:0] timp_m;
wire [7:0] bcd;
wire [7:0] bcd1;
wire [9:0] adresa;

clk_div modul1(.clk(clk),.rst(rst),.en(en),.clk_div(clk_div));
clk_mng modul2(.clk(clk_div),.rst(rst),.timp_s(timp_s),.timp_m(timp_m),.comanda(comanda),.adr_out(adresa));
bram #(.WIDTH(9))modul9(.clk(clk_div),.rst(rst),.WE(1),.adr_in(adresa),.data_in({timp_m[0],timp_s}),.data_out(led_0));
BCD modul3(.bin(timp_s),.bcd(bcd));
BCD modul4(.bin(timp_m),.bcd(bcd1));
hex modul5(.in(bcd[3:0]), .hex_0(hex_0));
hex modul6(.in(bcd[7:4]), .hex_0(hex_1));
hex modul7(.in(bcd1[3:0]), .hex_0(hex_2));
hex modul8(.in(bcd1[7:4]), .hex_0(hex_3));


endmodule
