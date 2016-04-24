module spaceinvaders(clk_in
	, reset_SW0, reset_SW1, KEY3, KEY2, KEY1
	, VGA_CLK
	, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC
	, VGA_R, VGA_G, VGA_B
	
	// i
	, debug_reg1, debug_reg2, debug_reg3, debug_reg4
	// u
	, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
);

	input clk_in, reset_SW0, reset_SW1, KEY3, KEY2, KEY1;
	output VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC;
	output[7:0] VGA_R, VGA_G, VGA_B;
	
//	displayVGA(clk_in, reset_SW0, VGA_CLK
//	, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC
//	, VGA_R, VGA_G, VGA_B);

	// PLL
	clkpll kendrick(clk_in, VGA_CLK);

	// VGA
	wire[31:0] X, Y;
	wire display;
	VGA mfdoom(VGA_CLK, ~reset_SW0, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC
	, X, Y, display
	);
	
	// KEY
	wire[31:0] insn_key;
	wire key_pressed;
	KEY kaytranada(clk_in, KEY3, KEY2, KEY1, insn_key, key_pressed);
	
	// Processor
	output[31:0] 
	// i
	debug_reg1, debug_reg2, debug_reg3, debug_reg4
	// u
	, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10;
	
	
	wire clkProcess;
	clk_div MHz5(clk_in, 1'b0, clkProcess);
//	clk_Process MHz2(clk_in, 1'b0, clkProcess);
	
	amd77_hw5 iration(
//		clk_in
		clkProcess
		, reset_SW1
		// input
		, insn_key, key_pressed
		// i
		, debug_reg1, debug_reg2
		, debug_reg3, debug_reg4
		// u
		, debug_reg5, debug_reg6
		, debug_reg7, debug_reg8
		, debug_reg9, debug_reg10
	);
	
	// RGB
	RGB outkast(display, X, Y, VGA_R, VGA_G, VGA_B
	// i
	, debug_reg1, debug_reg2
	, debug_reg3, debug_reg4
	// u
	, debug_reg5, debug_reg6
	, debug_reg7, debug_reg8
	, debug_reg9, debug_reg10
	);
	
//	RGB outkast(display, X, Y, VGA_R, VGA_G, VGA_B
//	// i
//	, debug_reg1, debug_reg2
//	, 624, 800
//	// u
//	, debug_reg5, debug_reg6
//	, debug_reg7, debug_reg8
//	, debug_reg9, debug_reg10
//	);

	// 1280x1024
//	RGB outkast(display,  X, Y, VGA_R, VGA_G, VGA_B
//	// i
//	, 624, 864
//	, 624, 800
////	// u
////	, 32, 64
////	, 592, 64
////	, 1184, 64
//	// u
//	, 32, 64
//	, 352, 64
//	, 672, 64
//	);
	
	// 1440x900
//	RGB outkast(display,  X, Y, VGA_R, VGA_G, VGA_B
//	// i
//	, 704, 756
//	, 704, 692
//	// u
//	, 32, 32
//	, 352, 32
//	, 672, 32
//	);
endmodule 