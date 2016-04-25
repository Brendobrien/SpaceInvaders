module amd77bpo5(
	// BME464 - Ultrasound
	clk_in, clk_out 
	, increment, transmit, receive
	, clk_5M
	, z_on, markers
	, reset_SW16, reset_out
	, on_SW15, on_out

	// ECE350 - Space Invaders
	, reset_SW0, reset_SW1, KEY3, KEY2, KEY1, KEY3_out
	, VGA_CLK
	, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC
	, VGA_R, VGA_G, VGA_B
	
	// Debug
	, debug_reg1, debug_reg2, debug_reg3, debug_reg4
	// u
	, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
	// win & lose
	, debug_reg14, debug_reg15
	
	// keys
	, key_pressed
	
	// LCD
	, lcd_data
	, lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon
);
	
	// BME464 - Ultrasound
	input clk_in, reset_SW16, on_SW15;
	output clk_out, reset_out, on_out, clk_5M;
	output increment, transmit, receive, z_on, markers;

	ultrasound Olaf(clk_in, clk_out
		, increment, transmit, receive
		, clk_5M
		, z_on, markers
		, reset_SW16, reset_out
		, on_SW15, on_out
	);
	
	// ECE350 - Space Invaders
	input reset_SW0, reset_SW1, KEY3, KEY2, KEY1;
	output VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC;
	output[7:0] VGA_R, VGA_G, VGA_B;
	
	output[31:0]
	// i
	debug_reg1, debug_reg2, debug_reg3, debug_reg4
	// u
	, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
	// win & lose
	, debug_reg14, debug_reg15
	;
	
	output key_pressed;
	
	spaceinvaders Dan(clk_in
	, reset_SW0, reset_SW1, KEY3, KEY2, KEY1
	, VGA_CLK
	, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC
	, VGA_R, VGA_G, VGA_B
	
	// i
	, debug_reg1, debug_reg2, debug_reg3, debug_reg4
	// u
	, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
	// win & lose
	, debug_reg14, debug_reg15
	
	// keys
	, key_pressed
	);

	output KEY3_out;
	assign KEY3_out = KEY3;
	
	wire lcd_write_en;
	wire[31:0] lcd_write_data;
	
	assign lcd_write_en = 1'b1;
	assign lcd_write_data = debug_reg1;
	
	output[7:0] lcd_data;
	output lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon;
	
//	lcd mylcd(clk_in, reset_SW0, lcd_write_en, lcd_write_data[7:0], lcd_data, lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon);
	assign lcd_blon = 1'b1;
	assign lcd_on = 1'b1;
endmodule 