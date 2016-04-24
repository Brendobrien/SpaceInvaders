module KEY(clk_in, KEY3, KEY2, KEY1, insn_key, key_pressed_out);
	
	input clk_in, KEY3, KEY2, KEY1;
	output[31:0] insn_key;
	output key_pressed_out;
	
	wire key_pressed, alreadyPressed;
	
	assign key_pressed = ~(KEY3 & KEY2 & KEY1);
//	assign key_pressed = 1'b0;
	wire[31:0] insn_KEY3, insn_KEY2, insn_KEY1, nop;
	assign insn_KEY3 = 32'b00101000010000111111111111100000;
	assign insn_KEY2 = 32'b00101000010000100000000000100000;
	assign insn_KEY1 = 32'b00000000000000000000000000000000;
	assign nop = 32'b00000000000000000000000000000000;
	
	my_tri32 k3(insn_KEY3, ~KEY3, insn_key);
	my_tri32 k2(insn_KEY2, ~KEY2, insn_key);
	my_tri32 k1(insn_KEY1, ~KEY1, insn_key);
	my_tri32 nop1(nop, ~key_pressed, insn_key);
	
	dffe buttonPressed_dff(.d(key_pressed), .clk(clk_in), .clrn(~alreadyPressed), .prn(1'b1), .ena(1'b1), .q(key_pressed_out));

	dffe alreadyPressed_dff(.d(key_pressed_out), .clk(clk_in), .clrn(key_pressed), .prn(1'b1), .ena(~alreadyPressed), .q(alreadyPressed));
endmodule 