project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE prog.v
set_global_assignment -name VERILOG_FILE tm.v
set_global_assignment -name VERILOG_FILE hex.v
set_global_assignment -name VERILOG_FILE cronometru.v
set_global_assignment -name VERILOG_FILE BCD.v
set_global_assignment -name VERILOG_FILE bram.v

set_global_assignment -name SDC_FILE example1.sdc

#set_global_assignment -name TOP_LEVEL_ENTITY clk_div
#set_global_assignment -name TOP_LEVEL_ENTITY clk_mng
set_global_assignment -name TOP_LEVEL_ENTITY cronometru
set_location_assignment -to clk PIN_AH10


set_location_assignment PIN_B8 -to rst   ;# PUSH BUTTON[0]
set_location_assignment PIN_C10  -to en  ;# SWITCH[1]
#set_location_assignment PIN_A9  -to clk_div  ;# LEDR[1]
#set_location_assignment PIN_A8  -to timp[0]  ;# LEDR[1]
#set_location_assignment PIN_A9  -to timp[1]  ;# LEDR[1]
#set_location_assignment PIN_A10  -to timp[2]  ;# LEDR[1]
#set_location_assignment PIN_B10  -to timp[3]  ;# LEDR[1]
#set_location_assignment PIN_D13  -to timp[4]  ;# LEDR[1]
#set_location_assignment PIN_C13  -to timp[5]  ;# LEDR[1]
#set_location_assignment PIN_E14  -to timp[6]  ;# LEDR[1]
#set_location_assignment PIN_D14  -to timp[7]  ;# LEDR[1]
set_location_assignment PIN_C11 -to comanda[0];
set_location_assignment PIN_D12 -to comanda[1];



set_location_assignment PIN_C14 -to hex_0[0];
set_location_assignment PIN_E15 -to hex_0[1];
set_location_assignment PIN_C15 -to hex_0[2];
set_location_assignment PIN_C16 -to hex_0[3];
set_location_assignment PIN_E16 -to hex_0[4];
set_location_assignment PIN_D17 -to hex_0[5];
set_location_assignment PIN_C17 -to hex_0[6];

set_location_assignment PIN_C18 -to hex_1[0];
set_location_assignment PIN_D18 -to hex_1[1];
set_location_assignment PIN_E18 -to hex_1[2];
set_location_assignment PIN_B16 -to hex_1[3];
set_location_assignment PIN_A17 -to hex_1[4];
set_location_assignment PIN_A18 -to hex_1[5];
set_location_assignment PIN_B17 -to hex_1[6];

set_location_assignment PIN_B20 -to hex_2[0];
set_location_assignment PIN_A20 -to hex_2[1];
set_location_assignment PIN_B19 -to hex_2[2];
set_location_assignment PIN_A21 -to hex_2[3];
set_location_assignment PIN_B21 -to hex_2[4];
set_location_assignment PIN_C22 -to hex_2[5];
set_location_assignment PIN_B22 -to hex_2[6];

set_location_assignment PIN_F21 -to hex_3[0];
set_location_assignment PIN_E22 -to hex_3[1];
set_location_assignment PIN_E21 -to hex_3[2];
set_location_assignment PIN_C19 -to hex_3[3];
set_location_assignment PIN_C20 -to hex_3[4];
set_location_assignment PIN_D19 -to hex_3[5];
set_location_assignment PIN_E17 -to hex_3[6];

#memorie
set_location_assignment PIN_A8 -to led_0[0];
set_location_assignment PIN_A9 -to led_0[1];
set_location_assignment PIN_A10 -to led_0[2];
set_location_assignment PIN_B10 -to led_0[3];
set_location_assignment PIN_D13 -to led_0[4];
set_location_assignment PIN_C13 -to led_0[5];
set_location_assignment PIN_E14 -to led_0[6];
set_location_assignment PIN_D14 -to led_0[7];
set_location_assignment PIN_A11 -to led_0[8];

set_location_assignment PIN_P11  -to clk  ;

load_package flow
execute_flow -compile

project_close
