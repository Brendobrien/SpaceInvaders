module amd77_hw5(	inclock, resetn, customInstruction, buttonPressed, /*ps2_clock, ps2_data,*/ 
					/*debug_word, debug_addr, leds, 
					lcd_data, lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon, 	
					seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8,
				debug_inst, debug_PC,
					debug_FD_PCin, debug_FD_IRin,
						debug_FD_PCout, debug_FD_IRout,
						debug_DX_PCin, debug_DX_Ain, debug_DX_Bin, debug_DX_IRin,
						debug_DX_PCout, debug_DX_Aout, debug_DX_Bout, debug_DX_IRout,
						debug_ALU_inA, debug_ALU_inB, debug_ALU_shift, debug_ALU_select,
						debug_ALU_out, debug_ALU_lessThan, debug_ALU_notEqual,
						debug_XM_Oin, debug_XM_Bin, debug_XM_IRin,
						debug_XM_Oout, debug_XM_Bout, debug_XM_IRout,
						debug_MW_Oin, debug_MW_Din, debug_MW_IRin,
						debug_MW_Oout, debug_MW_Dout, debug_MW_IRout,
						debug_Wout, debug_branch, debug_nextPC,
						debug_reset, debug_resetOrFlush, debug_branchPCout,
						debug_reg0, */
						debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
						/*debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20,
						debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31,
						debug_ALUinA, debug_ALUinB, debug_MemIn,
						debug_XMisSW, debug_XMisLW,
						debug_resultReady, debug_unitInUse, debug_multDiv_result,
						debug_mult_W, debug_div_W, debug_data_W_mux_ctrl,
						debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY,
						debug_multdiv_operandA, debug_multdiv_operandB,
						debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth,
						debug_PW_IRin, debug_PW_IRout, debug_PW_RD,
						debug_quotient, debug_divisor, debug_dividend,
						debug_cycleCount, debug_firstCycle,
						debug_divisorShiftAmt, debug_cyclesLeft, debug_div_resultReady,
						debug_statusin, debug_statusout,
						debug_statusException, debug_statusSetx, debug_setx_instr,
						debug_divisorShiftAmt5*/);

	input 			inclock, resetn;
	//inout 			ps2_data, ps2_clock;
	input [31:0] customInstruction;
	input buttonPressed;
/*	
	output 			lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon;
	output 	[7:0] 	leds, lcd_data;
	output 	[6:0] 	seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8;
	output 	[31:0] 	debug_word;
	output  [11:0]  debug_addr;*/
	
	//debugging
	/*output [31:0] debug_PC, debug_inst;
	output [31:0] debug_FD_PCin, debug_FD_IRin, debug_FD_PCout, debug_FD_IRout,  debug_DX_PCin, debug_DX_Ain, debug_DX_Bin, debug_DX_IRin, debug_DX_PCout, debug_DX_Aout, debug_DX_Bout, debug_DX_IRout, debug_ALU_inA, debug_ALU_inB, debug_ALU_out, debug_XM_Oin, debug_XM_Bin, debug_XM_IRin, debug_XM_Oout, debug_XM_Bout, debug_XM_IRout, debug_MW_Oin, debug_MW_Din, debug_MW_IRin, debug_MW_Oout, debug_MW_Dout, debug_MW_IRout, debug_Wout, debug_nextPC;
	output [4:0] debug_ALU_shift, debug_ALU_select;
	output debug_branch, debug_reset, debug_resetOrFlush, debug_ALU_lessThan, debug_ALU_notEqual;
	output [31:0] debug_branchPCout;
	output [31:0] debug_reg0;*/
	output [31:0] debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10;
	/*output [31:0] debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20;
	output [31:0] debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31;
	output [1:0] debug_ALUinA, debug_ALUinB;
	output debug_MemIn;
	output debug_XMisSW, debug_XMisLW;
	output debug_resultReady, debug_unitInUse;
	output [31:0] debug_multDiv_result;
	output debug_mult_W, debug_div_W;
	output [2:0] debug_data_W_mux_ctrl;
	output debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY;
	output [31:0] debug_multdiv_operandA;
	output [15:0] debug_multdiv_operandB;
	output [31:0] debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth;
	output [31:0] debug_PW_IRin, debug_PW_IRout;
	output [4:0] debug_PW_RD;
	output [31:0] debug_quotient, debug_divisor, debug_dividend;
	output [4:0] debug_cycleCount;
	output debug_firstCycle;
	output [31:0] debug_divisorShiftAmt, debug_cyclesLeft;
	output debug_div_resultReady;
	output [31:0] debug_statusin, debug_statusout;
	output [31:0] debug_statusException, debug_statusSetx;
	output debug_setx_instr;
	output [4:0] debug_divisorShiftAmt5;*/
	
	wire			clock;
	wire			lcd_write_en;
	wire 	[31:0]	lcd_write_data;
	wire	[7:0]	ps2_key_data;
	wire			ps2_key_pressed;
	wire	[7:0]	ps2_out;	

	
	// clock divider (by 5, i.e., 10 MHz)
	//pll div(inclock,clock);
	
	// UNCOMMENT FOLLOWING LINE AND COMMENT ABOVE LINE TO RUN AT 50 MHz
	assign clock = inclock;
	
	// your processor
	processor myprocessor(inclock, ~resetn, customInstruction, buttonPressed, 
						/*ps2_key_pressed, ps2_out, lcd_write_en, lcd_write_data, debug_word, debug_addr,
						debug_PC, debug_inst, 
						debug_FD_PCin, debug_FD_IRin,
						debug_FD_PCout, debug_FD_IRout,
						debug_DX_PCin, debug_DX_Ain, debug_DX_Bin, debug_DX_IRin,
						debug_DX_PCout, debug_DX_Aout, debug_DX_Bout, debug_DX_IRout,
						debug_ALU_inA, debug_ALU_inB, debug_ALU_shift, debug_ALU_select,
						debug_ALU_out, debug_ALU_lessThan, debug_ALU_notEqual,
						debug_XM_Oin, debug_XM_Bin, debug_XM_IRin,
						debug_XM_Oout, debug_XM_Bout, debug_XM_IRout,
						debug_MW_Oin, debug_MW_Din, debug_MW_IRin,
						debug_MW_Oout, debug_MW_Dout, debug_MW_IRout,
						debug_Wout, debug_branch, debug_nextPC,
						debug_reset, debug_resetOrFlush, debug_branchPCout,
						debug_reg0,*/
						debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
						/*debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20,
						debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31,
						debug_ALUinA, debug_ALUinB, debug_MemIn,
						debug_XMisSW, debug_XMisLW,
						debug_resultReady, debug_unitInUse, debug_multDiv_result,
						debug_mult_W, debug_div_W, debug_data_W_mux_ctrl,
						debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY,
						debug_multdiv_operandA, debug_multdiv_operandB,
						debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth,
						debug_PW_IRin, debug_PW_IRout, debug_PW_RD,
						debug_quotient, debug_divisor, debug_dividend,
						debug_cycleCount, debug_firstCycle,
						debug_divisorShiftAmt, debug_cyclesLeft, debug_div_resultReady,
						debug_statusin, debug_statusout,
						debug_statusException, debug_statusSetx, debug_setx_instr,
						debug_divisorShiftAmt5*/);
	
	// keyboard controller
	//PS2_Interface myps2(clock, resetn, ps2_clock, ps2_data, ps2_key_data, ps2_key_pressed, ps2_out);

	/*  
	//NONE OF THE BELOW ARE USED
	
	// lcd controller
	lcd mylcd(clock, ~resetn, lcd_write_en, lcd_write_data[7:0], lcd_data, lcd_rw, lcd_en, lcd_rs, lcd_on, lcd_blon);
	
	// example for sending ps2 data to the first two seven segment displays
	Hexadecimal_To_Seven_Segment hex1(ps2_out[3:0], seg1);
	Hexadecimal_To_Seven_Segment hex2(ps2_out[7:4], seg2);
	
	// the other seven segment displays are currently set to 0
	Hexadecimal_To_Seven_Segment hex3(4'b0, seg3);
	Hexadecimal_To_Seven_Segment hex4(4'b0, seg4);
	Hexadecimal_To_Seven_Segment hex5(4'b0, seg5);
	Hexadecimal_To_Seven_Segment hex6(4'b0, seg6);
	Hexadecimal_To_Seven_Segment hex7(4'b0, seg7);
	Hexadecimal_To_Seven_Segment hex8(4'b0, seg8);
	
	// some LEDs that you could use for debugging if you wanted
	assign leds = 8'b00101011;
	
	*/
	
endmodule





//-------------------------------PROCESSOR.V------------------------------------//

module processor(clock, reset, customInstruction, buttonPressed, 
						/*ps2_key_pressed, ps2_out, lcd_write, lcd_data, debug_data, debug_addr,
						debug_PC, debug_inst,
						debug_FD_PCin, debug_FD_IRin,
						debug_FD_PCout, debug_FD_IRout,
						debug_DX_PCin, debug_DX_Ain, debug_DX_Bin, debug_DX_IRin,
						debug_DX_PCout, debug_DX_Aout, debug_DX_Bout, debug_DX_IRout,
						debug_ALU_inA, debug_ALU_inB, debug_ALU_shift, debug_ALU_select,
						debug_ALU_out, debug_ALU_lessThan, debug_ALU_notEqual,
						debug_XM_Oin, debug_XM_Bin, debug_XM_IRin,
						debug_XM_Oout, debug_XM_Bout, debug_XM_IRout,
						debug_MW_Oin, debug_MW_Din, debug_MW_IRin,
						debug_MW_Oout, debug_MW_Dout, debug_MW_IRout,
						debug_Wout, debug_branch, debug_nextPC,
						debug_reset, debug_resetOrFlush, debug_branchPCout,
						debug_reg0, */
						debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10
						/*debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20,
						debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31,
						debug_ALUinA, debug_ALUinB, debug_MemIn,
						debug_XMisSW, debug_XMisLW,
						debug_resultReady, debug_unitInUse, debug_multDiv_result,
						debug_mult_W, debug_div_W, debug_data_W_mux_ctrl,
						debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY,
						debug_multdiv_operandA, debug_multdiv_operandB,
						debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth,
						debug_PW_IRin, debug_PW_IRout, debug_PW_RD,
						debug_quotient, debug_divisor, debug_dividend,
						debug_cycleCount, debug_firstCycle,
						debug_divisorShiftAmt, debug_cyclesLeft, debug_div_resultReady,
						debug_statusin, debug_statusout,
						debug_statusException, debug_statusSetx, debug_setx_instr,
						debug_divisorShiftAmt5*/);

	input 			clock, reset;
	/*input ps2_key_pressed;
	input 	[7:0]	ps2_out;*/
	
	input [31:0] customInstruction;
	input buttonPressed;
	/*
	output 			lcd_write;
	output 	[31:0] 	lcd_data;*/
	
	// GRADER OUTPUTS - YOU MUST CONNECT TO YOUR DMEM
	/*output 	[31:0] 	debug_data;
	output	[11:0]	debug_addr;*/
	
	// debugging -- to use, uncomment these and comment out the wires
	
	/*output [31:0] debug_PC, debug_inst, debug_FD_PCin, debug_FD_IRin, debug_FD_PCout, debug_FD_IRout,  debug_DX_PCin, debug_DX_Ain, debug_DX_Bin, debug_DX_IRin, debug_DX_PCout, debug_DX_Aout, debug_DX_Bout, debug_DX_IRout, debug_ALU_inA, debug_ALU_inB, debug_ALU_out, debug_XM_Oin, debug_XM_Bin, debug_XM_IRin, debug_XM_Oout, debug_XM_Bout, debug_XM_IRout, debug_MW_Oin, debug_MW_Din, debug_MW_IRin, debug_MW_Oout, debug_MW_Dout, debug_MW_IRout, debug_Wout, debug_nextPC;
	output [4:0] debug_ALU_shift, debug_ALU_select;
	output debug_branch, debug_reset, debug_resetOrFlush, debug_ALU_lessThan, debug_ALU_notEqual;
	output [31:0] debug_branchPCout;
	output [31:0] debug_reg0,*/
	output [31:0] debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10;
	/*output [31:0] debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20;
	output [31:0] debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31;
	output [1:0] debug_ALUinA, debug_ALUinB;
	output debug_MemIn;
	output debug_XMisSW, debug_XMisLW;
	output debug_resultReady, debug_unitInUse;
	output [31:0] debug_multDiv_result;
	output debug_mult_W, debug_div_W;
	output [2:0] debug_data_W_mux_ctrl;
	output debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY;
	output [31:0] debug_multdiv_operandA;
	output [15:0] debug_multdiv_operandB;
	output [31:0] debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth;
	output [31:0] debug_PW_IRin, debug_PW_IRout;
	output [4:0] debug_PW_RD;
	output [31:0] debug_quotient, debug_divisor, debug_dividend;
	output [4:0] debug_cycleCount;
	output debug_firstCycle;
	output [31:0] debug_divisorShiftAmt, debug_cyclesLeft;
	output debug_div_resultReady;
	output [31:0] debug_statusin, debug_statusout;
	output [31:0] debug_statusException, debug_statusSetx;
	output debug_setx_instr;
	output [4:0] debug_divisorShiftAmt5;*/
	
	// debugging -- to output, comment these out and uncomment the outputs above
	wire [31:0] debug_word;
	wire [11:0] debug_add;
	wire [31:0] debug_PC, debug_inst, debug_FD_PCin, debug_FD_IRin, debug_FD_PCout, debug_FD_IRout,  debug_DX_PCin, debug_DX_Ain, debug_DX_Bin, debug_DX_IRin, debug_DX_PCout, debug_DX_Aout, debug_DX_Bout, debug_DX_IRout, debug_ALU_inA, debug_ALU_inB, debug_ALU_out, debug_XM_Oin, debug_XM_Bin, debug_XM_IRin, debug_XM_Oout, debug_XM_Bout, debug_XM_IRout, debug_MW_Oin, debug_MW_Din, debug_MW_IRin, debug_MW_Oout, debug_MW_Dout, debug_MW_IRout, debug_Wout, debug_nextPC;
	wire [4:0] debug_ALU_shift, debug_ALU_select;
	wire debug_branch, debug_reset, debug_resetOrFlush, debug_ALU_lessThan, debug_ALU_notEqual;
	wire [31:0] debug_branchPCout;
	wire [31:0] debug_reg0, debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10;
	wire [31:0] debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20;
	wire [31:0] debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31;
	wire [1:0] debug_ALUinA, debug_ALUinB;
	wire debug_MemIn;
	wire debug_XMisSW, debug_XMisLW;
	wire debug_resultReady, debug_unitInUse;
	wire [31:0] debug_multDiv_result;
	wire debug_mult_W, debug_div_W;
	wire [2:0] debug_data_W_mux_ctrl;
	wire debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY;
	wire [31:0] debug_multdiv_operandA;
	wire [15:0] debug_multdiv_operandB;
	wire [31:0] debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth;
	wire [31:0] debug_PW_IRin, debug_PW_IRout;
	wire [4:0] debug_PW_RD;
	wire [31:0] debug_quotient, debug_divisor, debug_dividend;
	wire [4:0] debug_cycleCount;
	wire debug_firstCycle;
	wire [31:0] debug_divisorShiftAmt, debug_cyclesLeft;
	wire debug_div_resultReady;
	wire [31:0] debug_statusin, debug_statusout;
	wire [31:0] debug_statusException, debug_statusSetx;
	wire debug_setx_instr;
	wire [4:0] debug_divisorShiftAmt5;
	
	
	
	// your processor here

	//-----SET UP LATCHES AND REGISTERS-----//	
	
	wire [31:0] currentPC, nextPC;
	wire [31:0] FD_PCin, FD_PCout, FD_IRin, FD_IRout;
	wire [31:0] DX_PCin, DX_PCout, DX_IRin, DX_IRout, DX_Ain, DX_Aout, DX_Bin, DX_Bout;
	wire [31:0] XM_PCin, XM_PCout, XM_IRin, XM_IRout, XM_Oin, XM_Oout, XM_Bin, XM_Bout;
	wire [31:0] MW_PCin, MW_PCout, MW_IRin, MW_IRout, MW_Oin, MW_Oout, MW_Din, MW_Dout;
	wire [31:0] PW_Pin, PW_Pout, PW_IRin, PW_IRout;
	wire [31:0] status_in, status_out;
	wire resetOrFlush, resetOrFlush_temp, resetOrFlush_DX;
	wire branch;
	wire multDiv_unitReady, resultReady, stall;
	
	
	PC_latch PC_latch(nextPC, currentPC, ~clock, reset, ~resultReady & ~stall & ~buttonPressed);
	FD_latch FD_latch(FD_PCin, FD_PCout, FD_IRin, FD_IRout, ~clock, resetOrFlush, ~resultReady & ~stall);	
	DX_latch DX_latch(DX_PCin, DX_PCout, DX_IRin, DX_IRout, DX_Ain, DX_Aout, DX_Bin, DX_Bout, ~clock, reset, !resultReady);
	XM_latch XM_latch(XM_PCin, XM_PCout, XM_IRin, XM_IRout, XM_Oin, XM_Oout, XM_Bin, XM_Bout, ~clock, reset, !resultReady);
	MW_latch MW_latch(MW_PCin, MW_PCout, MW_IRin, MW_IRout, MW_Oin, MW_Oout, MW_Din, MW_Dout, ~clock, reset, !resultReady);
	PW_latch PW_latch(PW_Pin, PW_Pout, PW_IRin, PW_IRout, ~clock, reset, ~unitInUse/*resultReady*/);
	
	
	assign resetOrFlush_temp = reset | branch;
	
	// delay resetOrFlush half a cycle
	dffe flush_delay(.d(resetOrFlush_temp), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(resetOrFlush));
	dffe flush_delay_DX(.d(resetOrFlush_temp), .clk(~clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(resetOrFlush_DX)); // I don't think I used this but I'm afraid to break it

	
	// debugging	
	assign debug_resetOrFlush = resetOrFlush;
	assign debug_reset = reset;
	assign debug_branch = branch;
	assign debug_nextPC = nextPC;
	
	//-----END LATCHES-----//
	
	
	//-----FETCH STAGE-----//
	// add 1 to PC, output goes to FD_PCin
	wire junk;
	adder_full32bit PC_adder(currentPC, 32'b00000000000000000000000000000001, 1'b0, FD_PCin, junk);
	
	// set up output of instruction memory	
	wire [31:0] imem_dataOut; // this is the output of the imem data, assigned at bottom of module		
	
	// set up all remaining inputs to FD
	// FD_IRin is a mux to choose between imem_dataout and customInstruction
	mux1 instrMux(imem_dataOut, customInstruction, buttonPressed, FD_IRin);
	//assign FD_IRin = imem_dataOut;
	
	//fetch debug
	assign debug_PC = currentPC;
	assign debug_inst = imem_dataOut;
	assign debug_FD_PCin = FD_PCin;
	assign debug_FD_IRin = FD_IRin;
	
	//-----END FETCH-----//
	
	
	
	
	
	//-----DECODE STAGE-----//
	
	// stall logic
	wire [4:0] R_reserved;
	wire unitReady;
	stallLogic stallLogic(FD_IRout, R_reserved, clock, unitReady, stall);
	
	// determine if need to use nop
	mux1 nopMux(FD_IRout, 32'b00000000000000000000000000000000, stall, DX_IRin);
	
	// decode instruction
	wire [4:0] D_opcode, D_RD, D_RS, D_RT, D_shift, D_ALUop;
	wire [16:0] D_imm;
	wire [26:0] D_target;
	
	instructionDecode D_decode(DX_IRin, D_opcode, D_RD, D_RS, D_RT, D_shift, D_ALUop, D_imm, D_target);

	
	// determine if uses RT or RD; set that one to be D_RS2
	wire RTorRD_mux_ctrl;
	wire [4:0] D_RS2;
	
	instructionUsesRD rdTest(D_opcode, RTorRD_mux_ctrl);	
	mux1_5bit RTorRD_mux(D_RT, D_RD, RTorRD_mux_ctrl, D_RS2);
	
	// register file
	wire [31:0] data_readA, dataReadB, data_W;
	wire [4:0] W_RD; // RD from W stage
	wire [4:0] regDest; // which reg to use as RD, either the RD from the instruction, or $r31 for jal
	wire W_dest;
	wire [4:0] PW_RD; //RD from PW stage
	
	// store in RD or $r31?
	mux3_5bit regDestMux(W_RD, W_RD, 5'b11111, 5'b00000, PW_RD, PW_RD, PW_RD, PW_RD, data_W_mux_ctrl, regDest);
	
	// set up regfile. debug outputs for each register
	regfile regFile(clock, 1'b1, reset, regDest, D_RS, D_RS2, data_W, DX_Ain, DX_Bin,
					debug_reg0, debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10,
					debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20,
					debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31);
	
	
	// set up all remaining inputs to DX
	assign DX_PCin = FD_PCout;
	
	// debugging
	assign debug_FD_PCout = FD_PCout;
	assign debug_FD_IRout = FD_IRout;
	assign debug_DX_PCin = DX_PCin;
	assign debug_DX_Ain = DX_Ain;
	assign debug_DX_Bin = DX_Bin;
	assign debug_DX_IRin = DX_IRin;
	
	//-----END DECODE-----//
	
	
	
	
	//-----EXECUTE STAGE-----//
	
	// decode instruction
	wire [4:0] X_opcode, X_RD, X_RS, X_RT, X_shift, X_ALUop;
	wire [16:0] X_imm;
	wire [26:0] X_target;
	
	instructionDecode X_decode(DX_IRout, X_opcode, X_RD, X_RS, X_RT, X_shift, X_ALUop, X_imm, X_target);
	
	// reservation station: determine if RD needs to be reserved
	reservationStation reservationStation(DX_IRout, clock, reset | resultReady, R_reserved);
	
	// unitInUse: reserve the mult/div unit
	wire unitInUse;
	wire ctrl_MULT, ctrl_DIV;
	multOrDiv getMultDivCtrls(X_opcode, X_ALUop, ctrl_MULT, ctrl_DIV);
	latchReg unitInUseReg(clock, reset | resultReady, ~unitInUse, ctrl_MULT | ctrl_DIV, unitInUse);
	
	assign unitReady = ~unitInUse;
	
	// sign extend immediate
	wire [31:0] imm_signExtended;
	
	genvar i;
	generate
		for (i=17; i<32; i=i+1) begin: signExtendImmediate
			assign imm_signExtended[i] = X_imm[16];
		end
		for (i=0; i<17; i=i+1) begin: fillRestOfImmediate
			assign imm_signExtended[i] = X_imm[i];
		end
	endgenerate
	
	// determine values of dataA and dataB. Includes checking immediate and bypassing.
	wire [31:0] dataA, dataA_X, data_M;
	wire [31:0] dataB, dataB_X;
	wire useImm;
	wire XMisLW, XMisSW;
	
	//is data_M just XM_Oout, or MW_Din (for loads)?
	loadOrStore XMloadOrStore(M_opcode, XMisSW, XMisLW);
	mux1 data_M_mux(XM_Oout, MW_Din, XMisLW, data_M);
	
	assign dataA_X = DX_Aout;
	
	wire [1:0] ALUinA, ALUinB;
	wire MemIn;
	bypassControl bypassCtrl(DX_IRout, XM_IRout, MW_IRout, ALUinA, ALUinB, MemIn);

	
	// figure out dataB_X, then dataB
	mux2 bypassA(dataA_X, data_M, data_W, data_M, ALUinA, dataA);
	mux2 bypassB(DX_Bout, data_M, data_W, data_M, ALUinB, dataB_X);
	
	instructionIsImm instrIsImm(X_opcode, useImm);
	mux1 immOrRS2(dataB_X, imm_signExtended, useImm, dataB);	
	
		
	//debugging
	assign debug_ALUinA = ALUinA;
	assign debug_ALUinB = ALUinB;
	assign debug_MemIn = MemIn;
	
	// set up ALU
	wire[31:0] ALUresult;
	wire ALU_lessThan, ALU_notEqual;
	
	alu alu(dataA, dataB, X_ALUop, X_shift, ALUresult, ALU_notEqual, ALU_lessThan);
	
	// set up all remaining inputs to XM
	assign XM_PCin = DX_PCout;
	assign XM_Oin = ALUresult;
	assign XM_Bin = dataB_X;
	assign XM_IRin = DX_IRout;
	
	// debugging
	assign debug_DX_PCout = DX_PCout;
	assign debug_DX_Aout = DX_Aout;
	assign debug_DX_Bout = DX_Bout;
	assign debug_DX_IRout = DX_IRout;
	assign debug_ALU_inA = dataA;
	assign debug_ALU_inB = dataB;
	assign debug_ALU_shift = X_shift;
	assign debug_ALU_select = X_ALUop;
	assign debug_ALU_out = ALUresult;
	assign debug_ALU_lessThan = ALU_lessThan;
	assign debug_ALU_notEqual = ALU_notEqual;
	assign debug_XM_Oin = XM_Oin;
	assign debug_XM_Bin = XM_Bin;
	assign debug_XM_IRin = XM_IRin;
	assign debug_XMisSW = XMisSW;
	assign debug_XMisLW = XMisLW;
	
	
	// MULT/DIV	
	wire [31:0] multDiv_result;
	wire multDiv_exception, resultReady_in;
	multdiv multdiv(dataA, dataB[15:0], ctrl_MULT, ctrl_DIV, ~clock, multDiv_result, multDiv_exception, multDiv_unitReady, resultReady_in,
						debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY,
						debug_multdiv_operandA, debug_multdiv_operandB,
						debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth,
						debug_quotient, debug_divisor, debug_dividend,
						debug_cycleCount, debug_firstCycle,
						debug_divisorShiftAmt, debug_cyclesLeft, debug_div_resultReady,
						debug_divisorShiftAmt5);
						
	dffe resultReadyDFF(.d(resultReady_in), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(resultReady));
	
	assign PW_Pin = multDiv_result;
	
	// debugging
	assign debug_resultReady = resultReady;
	assign debug_unitInUse = unitInUse;
	assign debug_multDiv_result = multDiv_result;
	
	// send instruction to PW latch
	assign PW_IRin = DX_IRout;
	

	
	// STATUS reg
	wire [31:0] status_exception, status_setx;
	wire setx_instr, bex_instr;
	
	setxOrbex instrIsSetx(X_opcode, setx_instr, bex_instr);
	
	latchReg statusReg(~clock, 1'b0, resultReady | setx_instr, status_in, status_out); 
	//dffe statusReg(.d(status_in), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(resultReady), .q(status_out));  // will want to enable only for exception-causing instructions. Also what is clock?
	assign status_exception = {{31{1'b0}}, multDiv_exception};
	
	// sign extend target
	assign status_setx[26:0] = X_target;
	genvar a;
	generate
		for(a=27; a<32; a=a+1) begin: signExtendTargetSetx
			assign status_setx[a] = X_target[26];
		end
	endgenerate	

	mux1 statusMux(status_exception, status_setx, setx_instr, status_in);
	
	// debugging
	assign debug_statusin = status_in;
	assign debug_statusout = status_out;
	assign debug_statusException = status_exception;
	assign debug_statusSetx = status_setx;
	assign debug_setx_instr = setx_instr;
	
	//-----END EXECUTE STAGE-----//
	
	
	
	//-----MEMORY STAGE-----//
	
	// decode instruction
	wire [4:0] M_opcode, M_RD, M_RS, M_RT, M_shift, M_ALUop;
	wire [16:0] M_imm;
	wire [26:0] M_target;
	
	instructionDecode M_decode(XM_IRout, M_opcode, M_RD, M_RS, M_RT, M_shift, M_ALUop, M_imm, M_target);
	
	
	// determine if bypassing (bypassing control already set up)
	wire [31:0] memData;
	mux1 bypassMem(XM_Bout, data_W, MemIn, memData);
	
	// memory access
	wire [11:0] dmem_address;
	wire [31:0] dmem_dataOut;
	assign dmem_address = XM_Oout[11:0];
	
	
	// load or store?
	wire load_M, store_M;
	loadOrStore loadOrStore_M(M_opcode, store_M, load_M);
	
	// set up all remaining inputs to MW
	assign MW_PCin = XM_PCout;
	assign MW_Oin = XM_Oout;
	assign MW_Din = dmem_dataOut;
	assign MW_IRin = XM_IRout;
	
	// debugging
	assign debug_XM_Oout = XM_Oout;
	assign debug_XM_Bout = XM_Bout;
	assign debug_XM_IRout = XM_IRout;
	assign debug_MW_Oin = MW_Oin;
	assign debug_MW_Din = MW_Din;
	assign debug_MW_IRin = MW_IRin;
	
	//-----END MEMORY STAGE-----//
	
	
	
	
	//-----WRITE STAGE-----//
		
	// decode instruction
	wire [4:0] W_opcode, W_RS, W_RT, W_shift, W_ALUop;
	wire [16:0] W_imm;
	wire [26:0] W_target;
	wire link;        // 1 if jal instruction return PC+1 instead of data
	
	instructionDecode W_decode(MW_IRout, W_opcode, W_RD, W_RS, W_RT, W_shift, W_ALUop, W_imm, W_target);
	
	// also decode PW instruction
	wire [4:0] PW_opcode, PW_RS, PW_RT, PW_shift, PW_ALUop;
	wire [16:0] PW_imm;
	wire [26:0] PW_target;
		
	instructionDecode PW_decode(PW_IRout, PW_opcode, PW_RD, PW_RS, PW_RT, PW_shift, PW_ALUop, PW_imm, PW_target);
	
	// jal instruction?
	link instIsJAL(W_opcode, link);
	
	// writeback?
	wire writeBack;
	writeBack writeBackTest(W_opcode, writeBack);
	
	// load or store?
	wire store_W, load_W;	
	loadOrStore loadOrStore_W(W_opcode, store_W, load_W);
	
	// mult or div?
	wire mult_W, div_W;
	multOrDiv multOrDiv_W(W_opcode, W_ALUop, mult_W, div_W);
	
	// setx?
	wire setx_W, bex_W;
	setxOrbex WsetxOrbex(W_opcode, setx_W, bex_W);
	
	// pass result, data, PC, or nothing?
	wire [2:0] data_W_mux_ctrl;
	assign data_W_mux_ctrl[0] = load_W | (~writeBack & ~link) | (mult_W | div_W | setx_W | bex_W);
	assign data_W_mux_ctrl[1] = link | (~writeBack & ~link) | (mult_W | div_W | setx_W | bex_W);
	assign data_W_mux_ctrl[2] = resultReady;
	
	mux3 data_W_mux(MW_Oout, MW_Dout, MW_PCout, 32'b00000000000000000000000000000000, PW_Pout, PW_Pout, PW_Pout, PW_Pout, data_W_mux_ctrl, data_W);
	
	
	//debugging
	assign debug_MW_Oout = MW_Oout;
	assign debug_MW_Dout = MW_Dout;
	assign debug_MW_IRout = MW_IRout;
	assign debug_Wout = data_W;
	assign debug_mult_W = mult_W;
	assign debug_div_W = div_W;
	assign debug_data_W_mux_ctrl = data_W_mux_ctrl;
	assign debug_PW_IRin = PW_IRin;
	assign debug_PW_IRout = PW_IRout;
	assign debug_PW_RD = PW_RD;
	
	//-----END WRITE STAGE-----//
	
	
	
	//-----BRANCH CALCULATION-----//
	wire [31:0] branch_PCout;
	wire statusNot0;
	
	assign statusNot0 = status_out[31] | status_out[30] | status_out[29] | status_out[28] | status_out[27] | status_out[26] | status_out[25] | status_out[24] | status_out[23] | status_out[22] | status_out[21] | status_out[20] | status_out[19] | status_out[18] | status_out[17] | status_out[16] | status_out[15] | status_out[14] | status_out[13] | status_out[12] | status_out[11] | status_out[10] | status_out[9] | status_out[8] | status_out[7] | status_out[6] | status_out[5] | status_out[4] | status_out[3] | status_out[2] | status_out[1] | status_out[0];
	
	PC_calculator PC_calc(DX_IRout, clock, DX_PCout, DX_Bout, ALU_lessThan, ALU_notEqual, statusNot0, branch_PCout, branch);
	
	mux1 nextPCmux(FD_PCin, branch_PCout, branch, nextPC);
	
	// debugging
	assign debug_branchPCout = branch_PCout;
	
	//-----END BRANCH CALCULATION-----//
	
	
	//////////////////////////////////////
	////// THIS IS REQUIRED FOR GRADING
	// CHANGE THIS TO ASSIGN YOUR DMEM WRITE ADDRESS ALSO TO debug_addr
	assign debug_addr = dmem_address; //(12'b000000000001);
	// CHANGE THIS TO ASSIGN YOUR DMEM DATA INPUT (TO BE WRITTEN) ALSO TO debug_data
	assign debug_data = memData; //(12'b000000000001);
	////////////////////////////////////////////////////////////
	
		
	// You'll need to change where the dmem and imem read and write...
	dmem mydmem(	.address	(dmem_address),
					.clock		(clock),
					.data		(memData),
					.wren		(store_M), //,	//need to fix this!
					.q			(dmem_dataOut) 
	);
	
	imem myimem(	.address 	(currentPC[11:0]),
					.clken		(1'b1),
					.clock		(clock), //,
					.q			(imem_dataOut) 
	); 
	
	
endmodule

//-----------------END OF PROCESSOR----------------//







//----------------REGISTERS----------------------//
// Full register file
module regfile(clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg, ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA, data_readRegB,
					debug_reg0, debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10,
					debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20,
					debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31);
   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;
   output [31:0] data_readRegA, data_readRegB;
	output [31:0] debug_reg0, debug_reg1, debug_reg2, debug_reg3, debug_reg4, debug_reg5, debug_reg6, debug_reg7, debug_reg8, debug_reg9, debug_reg10;
	output [31:0] debug_reg11, debug_reg12, debug_reg13, debug_reg14, debug_reg15, debug_reg16, debug_reg17, debug_reg18, debug_reg19, debug_reg20;
	output [31:0] debug_reg21, debug_reg22, debug_reg23, debug_reg24, debug_reg25, debug_reg26, debug_reg27, debug_reg28, debug_reg29, debug_reg30, debug_reg31;
	
	wire ctrl_readEnable;
	assign ctrl_readEnable = 1'b1; // read is always enabled
	
	wire [31:0] debug_val;
	
	// get one-hot control for RS1, RS2, and RD
	wire [31:0] RS1, RS2, RD; //will each have 31 0 bits and one 1 bit
	decoder32 RS1_decode(RS1, ctrl_readRegA, ctrl_readEnable);
	decoder32 RS2_decode(RS2, ctrl_readRegB, ctrl_readEnable);
	decoder32 RD_decode(RD, ctrl_writeReg, ctrl_writeEnable);
	
	// generate registers
	/*genvar x;
	generate 
		for (x=2; x<32; x=x+1) begin: generateRegisters
			register register(clock, ctrl_reset, RD[x], RS1[x], RS2[x], data_writeReg, data_readRegA, data_readRegB);
			
		end
	endgenerate
	*/
	
	// set up registers like this to get the debug output values
	register reg0(clock, ctrl_reset, RD[0], RS1[0], RS2[0], data_writeReg, data_readRegA, data_readRegB, debug_reg0);
	register reg1(clock, ctrl_reset, RD[1], RS1[1], RS2[1], data_writeReg, data_readRegA, data_readRegB, debug_reg1);
	register reg2(clock, ctrl_reset, RD[2], RS1[2], RS2[2], data_writeReg, data_readRegA, data_readRegB, debug_reg2);
	register reg3(clock, ctrl_reset, RD[3], RS1[3], RS2[3], data_writeReg, data_readRegA, data_readRegB, debug_reg3);
	register reg4(clock, ctrl_reset, RD[4], RS1[4], RS2[4], data_writeReg, data_readRegA, data_readRegB, debug_reg4);
	register reg5(clock, ctrl_reset, RD[5], RS1[5], RS2[5], data_writeReg, data_readRegA, data_readRegB, debug_reg5);
	register reg6(clock, ctrl_reset, RD[6], RS1[6], RS2[6], data_writeReg, data_readRegA, data_readRegB, debug_reg6);
	register reg7(clock, ctrl_reset, RD[7], RS1[7], RS2[7], data_writeReg, data_readRegA, data_readRegB, debug_reg7);
	register reg8(clock, ctrl_reset, RD[8], RS1[8], RS2[8], data_writeReg, data_readRegA, data_readRegB, debug_reg8);
	register reg9(clock, ctrl_reset, RD[9], RS1[9], RS2[9], data_writeReg, data_readRegA, data_readRegB, debug_reg9);
	register reg10(clock, ctrl_reset, RD[10], RS1[10], RS2[10], data_writeReg, data_readRegA, data_readRegB, debug_reg10);
	register reg11(clock, ctrl_reset, RD[11], RS1[11], RS2[11], data_writeReg, data_readRegA, data_readRegB, debug_reg11);
	register reg12(clock, ctrl_reset, RD[12], RS1[12], RS2[12], data_writeReg, data_readRegA, data_readRegB, debug_reg12);
	register reg13(clock, ctrl_reset, RD[13], RS1[13], RS2[13], data_writeReg, data_readRegA, data_readRegB, debug_reg13);
	register reg14(clock, ctrl_reset, RD[14], RS1[14], RS2[14], data_writeReg, data_readRegA, data_readRegB, debug_reg14);
	register reg15(clock, ctrl_reset, RD[15], RS1[15], RS2[15], data_writeReg, data_readRegA, data_readRegB, debug_reg15);
	register reg16(clock, ctrl_reset, RD[16], RS1[16], RS2[16], data_writeReg, data_readRegA, data_readRegB, debug_reg16);
	register reg17(clock, ctrl_reset, RD[17], RS1[17], RS2[17], data_writeReg, data_readRegA, data_readRegB, debug_reg17);
	register reg18(clock, ctrl_reset, RD[18], RS1[18], RS2[18], data_writeReg, data_readRegA, data_readRegB, debug_reg18);
	register reg19(clock, ctrl_reset, RD[19], RS1[19], RS2[19], data_writeReg, data_readRegA, data_readRegB, debug_reg19);
	register reg20(clock, ctrl_reset, RD[20], RS1[20], RS2[20], data_writeReg, data_readRegA, data_readRegB, debug_reg20);
	register reg21(clock, ctrl_reset, RD[21], RS1[21], RS2[21], data_writeReg, data_readRegA, data_readRegB, debug_reg21);
	register reg22(clock, ctrl_reset, RD[22], RS1[22], RS2[22], data_writeReg, data_readRegA, data_readRegB, debug_reg22);
	register reg23(clock, ctrl_reset, RD[23], RS1[23], RS2[23], data_writeReg, data_readRegA, data_readRegB, debug_reg23);
	register reg24(clock, ctrl_reset, RD[24], RS1[24], RS2[24], data_writeReg, data_readRegA, data_readRegB, debug_reg24);
	register reg25(clock, ctrl_reset, RD[25], RS1[25], RS2[25], data_writeReg, data_readRegA, data_readRegB, debug_reg25);
	register reg26(clock, ctrl_reset, RD[26], RS1[26], RS2[26], data_writeReg, data_readRegA, data_readRegB, debug_reg26);
	register reg27(clock, ctrl_reset, RD[27], RS1[27], RS2[27], data_writeReg, data_readRegA, data_readRegB, debug_reg27);
	register reg28(clock, ctrl_reset, RD[28], RS1[28], RS2[28], data_writeReg, data_readRegA, data_readRegB, debug_reg28);
	register reg29(clock, ctrl_reset, RD[29], RS1[29], RS2[29], data_writeReg, data_readRegA, data_readRegB, debug_reg29);
	register reg30(clock, ctrl_reset, RD[30], RS1[30], RS2[30], data_writeReg, data_readRegA, data_readRegB, debug_reg30);
	register reg31(clock, ctrl_reset, RD[31], RS1[31], RS2[31], data_writeReg, data_readRegA, data_readRegB, debug_reg31);
	
endmodule

// Individual registers
module register(clock, ctrl_reset, ctrl_writeEnable, ctrl_readEnable_RS1, ctrl_readEnable_RS2, writeVal, RS1val, RS2val, debug_val);
	input clock, ctrl_reset, ctrl_writeEnable, ctrl_readEnable_RS1, ctrl_readEnable_RS2;
	input [31:0] writeVal;
	output [31:0] RS1val, RS2val, debug_val;
	
	wire [31:0] outputVal; //store output of registers, pre-tristate buffer
	wire [31:0] prnVal;    // store the preset value, in this case all 1's.
	assign prnVal = {32{1'b1}};
	
	// generate 32 D-FlipFlops
	genvar i;
	generate
		for (i=0; i<32; i=i+1) begin: generateFlipFlops
			dffe dff(.d(writeVal[i]), .clk(clock), .clrn(!ctrl_reset), .prn(prnVal[i]), .ena(ctrl_writeEnable), .q(outputVal[i]));		
		end
	endgenerate
	
	// create tri-state buffers for RS1 and RS2
	my_tri RS1tri(outputVal, ctrl_readEnable_RS1, RS1val);
	my_tri RS2tri(outputVal, ctrl_readEnable_RS2, RS2val);
	
	// debugging
	assign debug_val = outputVal;
	
endmodule

// latch register
module latchReg(clock, ctrl_reset, ctrl_enable, writeVal, readVal);
	input clock, ctrl_reset, ctrl_enable;
	input [31:0] writeVal;
	output [31:0] readVal;
	
	// generate 32 D-FlipFlops
	genvar i;
	generate
		for (i=0; i<32; i=i+1) begin: generateFlipFlopsForLatches
			dffe dff(.d(writeVal[i]), .clk(clock), .clrn(!ctrl_reset), .prn(1'b1), .ena(ctrl_enable), .q(readVal[i]));		
		end
	endgenerate
endmodule
	
//---------------END REGISTERS-------------------//





//----------------STAGE LATCHES -----------------//
module PC_latch(PC_in, PC_out, clock, ctrl_reset, ctrl_enable);
	input [31:0] PC_in;
	input clock, ctrl_reset, ctrl_enable;
	output [31:0] PC_out;
	
	wire [31:0] junk;
	
	latchReg PCreg(clock, ctrl_reset, ctrl_enable, PC_in, PC_out);
endmodule

module FD_latch(PC_in, PC_out, IR_in, IR_out, clock, ctrl_reset, ctrl_enable);
	input [31:0] PC_in, IR_in;
	input clock, ctrl_reset, ctrl_enable;
	output [31:0] PC_out, IR_out;
	
	wire [31:0] junk, junk2;
	
	latchReg PCreg(clock, ctrl_reset, ctrl_enable, PC_in, PC_out);
	latchReg IRreg(clock, ctrl_reset, ctrl_enable, IR_in, IR_out);
	
endmodule

module DX_latch(PC_in, PC_out, IR_in, IR_out, A_in, A_out, B_in, B_out, clock, ctrl_reset, ctrl_enable);
	input [31:0] PC_in, IR_in, A_in, B_in;
	input clock, ctrl_reset, ctrl_enable;
	output [31:0] PC_out, IR_out, A_out, B_out;
	
	wire [31:0] junk, junk2, junk3, junk4;
	
	latchReg PCreg(clock, ctrl_reset, ctrl_enable, PC_in, PC_out);
	latchReg IRreg(clock, ctrl_reset, ctrl_enable, IR_in, IR_out);
	latchReg Areg(clock, ctrl_reset, ctrl_enable, A_in, A_out);
	latchReg Breg(clock, ctrl_reset, ctrl_enable, B_in, B_out);
	
endmodule
	

module XM_latch(PC_in, PC_out, IR_in, IR_out, O_in, O_out, B_in, B_out, clock, ctrl_reset, ctrl_enable);
	input [31:0] PC_in, IR_in, O_in, B_in;
	input clock, ctrl_reset, ctrl_enable;
	output [31:0] PC_out, IR_out, O_out, B_out;
	
	wire [31:0] junk, junk2, junk3;
	
	latchReg PCreg(clock, ctrl_reset, ctrl_enable, PC_in, PC_out);
	latchReg IRreg(clock, ctrl_reset, ctrl_enable, IR_in, IR_out);
	latchReg Oreg(clock, ctrl_reset, ctrl_enable, O_in, O_out);
	latchReg Breg(clock, ctrl_reset, ctrl_enable, B_in, B_out);
	
endmodule

module MW_latch(PC_in, PC_out, IR_in, IR_out, O_in, O_out, D_in, D_out, clock, ctrl_reset, ctrl_enable);
	input [31:0] PC_in, IR_in, O_in, D_in;
	input clock, ctrl_reset, ctrl_enable;
	output [31:0] PC_out, IR_out, O_out, D_out;
	
	wire [31:0] junk, junk2, junk3;
	
	latchReg PCreg(clock, ctrl_reset, ctrl_enable, PC_in, PC_out);
	latchReg IRreg(clock, ctrl_reset, ctrl_enable, IR_in, IR_out);
	latchReg Oreg(clock, ctrl_reset, ctrl_enable, O_in, O_out);
	latchReg Dreg(clock, ctrl_reset, ctrl_enable, D_in, D_out);
	
endmodule

module PW_latch(P_in, P_out, IR_in, IR_out, clock, ctrl_reset, ctrl_enable);
	input [31:0] P_in, IR_in;
	input clock, ctrl_reset, ctrl_enable;
	output [31:0] P_out, IR_out;
	
	latchReg Preg(clock, ctrl_reset, ctrl_enable, P_in, P_out);
	latchReg IRreg(~clock, ctrl_reset, ctrl_enable, IR_in, IR_out);
	
endmodule
//-------------------------END LATCHES-------------------------//




//---------------------INSTRUCTION DECODE----------------------//
module instructionDecode(instruction, opcode, RD, RS, RT, shift, ALUop, imm, target);
	input [31:0] instruction;
	output [4:0] opcode, RS, RT, RD, shift, ALUop;
	output [26:0] target;
	output [16:0] imm;
	
	wire [4:0] ALUop_temp; // holds ALUop, but final ALUop may be modified for addi or mem instructions
	wire [4:0] ALUop_add; // holds the ALUop for add, which will be used for addi or mem instructions
	wire add;  // 1 if opcode is for addi mem instruction; used as mux control
	
	assign ALUop_add = 5'b00000;
	
	assign opcode = instruction[31:27];
	assign RD = instruction[26:22];
	assign RS = instruction [21:17];
	assign RT = instruction [16:12];
	assign shift = instruction[11:7];
	assign ALUop_temp = instruction[6:2];
	assign imm = instruction[16:0];
	assign target = instruction[26:0];

	assign add = (~opcode[4] & ~opcode[3] & opcode[2] & opcode[0]) | (~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]); //001x1 | 01000
	
	mux1_5bit ALUop_mux(ALUop_temp, ALUop_add, add, ALUop);
	
endmodule
//--------------------END INSTRUCTION DECODE--------------------//







//------------------------BYPASS CONTROL------------------------//
module bypassControl(DX_IR, XM_IR, MW_IR, ALUinA, ALUinB, MemIn);
	input [31:0] DX_IR, XM_IR, MW_IR;
	output [1:0] ALUinA, ALUinB;
	output MemIn;
	
	wire [26:0] DX_target;
	wire [16:0] DX_imm;
	wire [4:0] DX_opcode, DX_RD, DX_RS, DX_RT, DX_shift, DX_ALUop;
	
	wire [26:0] XM_target;
	wire [16:0] XM_imm;
	wire [4:0] XM_opcode, XM_RD, XM_RS, XM_RT, XM_shift, XM_ALUop;
	
	wire [26:0] MW_target;
	wire [16:0] MW_imm;
	wire [4:0] MW_opcode, MW_RD, MW_RS, MW_RT, MW_shift, MW_ALUop;
	
	wire [4:0] DX_XM_A_diff, DX_MW_A_diff, DX_XM_B_diff, DX_MW_B_diff, XM_MW_diff;
	
	wire junk1, junk2, junk3, junk4, junk5, junk6, junk7, junk8, junk9, junk10; // don't think these are necessary anymore but don't want to delete
	
	// decode instructions to get RS, RT, and RD for each stage
	instructionDecode DX(DX_IR, DX_opcode, DX_RD, DX_RS, DX_RT, DX_shift, DX_ALUop, DX_imm, DX_target);
	instructionDecode XM(XM_IR, XM_opcode, XM_RD, XM_RS, XM_RT, XM_shift, XM_ALUop, XM_imm, XM_target);	
	instructionDecode MX(MW_IR, MW_opcode, MW_RD, MW_RS, MW_RT, MW_shift, MW_ALUop, MW_imm, MW_target);
	
	// compare registers between each stage to determine need for bypassing
	wire ALUinA_temp0, ALUinA_temp1, ALUinB_temp0, ALUinB_temp1;
	wire [1:0] ALUinA_temp, ALUinB_temp;
	wire MemIn_temp, RSis0, RTis0, XMisSW, XMisLW, MWisSW, MWisLW; //RDfromSW;
	wire XM_writeBack, MW_writeBack;
	wire [4:0] DX_RS2;
	wire RS2ctrl;
	
	// does instruction in X stage use RT or RD?
	instructionUsesRD RS2RD(DX_opcode, RS2ctrl);
	mux1_5bit RS2mux(DX_RT, DX_RD, RS2ctrl, DX_RS2);	
	
	compareRegs comp_DX_XM_A(DX_RS, XM_RD, ALUinA_temp0);
	compareRegs comp_DX_MW_A(DX_RS, MW_RD, ALUinA_temp1);
	compareRegs comp_DX_XM_B(DX_RS2, XM_RD, ALUinB_temp0);
	compareRegs comp_DX_MW_B(DX_RS2, MW_RD, ALUinB_temp1);
	compareRegs comp_XM_MW_M(XM_RT, MW_RD, MemIn_temp);
	
	// if RS or RT is 0, don't bypass -- otherwise messes up after a reset
	assign RSis0 = ~DX_RS[4] & ~DX_RS[3] & ~DX_RS[2] & ~DX_RS[1] & ~DX_RS[0];
	assign RTis0 = ~DX_RS2[4] & ~DX_RS2[3] & ~DX_RS2[2] & ~DX_RS2[1] & ~DX_RS2[0];

	// if instruction in M or W isn't a writeback, don't bypass -- may get wrong value if you do
	writeBack XM_writeBack_test(XM_opcode, XM_writeBack);
	writeBack MW_writeBack_test(MW_opcode, MW_writeBack);
	
	// combine ALUinA_temp and ALUinB_temp
	mux1 ALUinA_temp0_mux(ALUinA_temp0, 1'b0, ~XM_writeBack, ALUinA_temp[0]);
	mux1 ALUinB_temp0_mux(ALUinB_temp0, 1'b0, ~XM_writeBack, ALUinB_temp[0]);
	mux1 ALUinA_temp1_mux(ALUinA_temp1, 1'b0, ~MW_writeBack, ALUinA_temp[1]);
	mux1 ALUinB_temp1_mux(ALUinB_temp1, 1'b0, ~MW_writeBack, ALUinB_temp[1]);
	
	// only send these controls if RS or RT isn't 0
	mux1_2bit ALUinA_mux(ALUinA_temp, 2'b00, RSis0, ALUinA);
	mux1_2bit ALUinB_mux(ALUinB_temp, 2'b00, RTis0, ALUinB);
	mux1 MemIn_mux(MemIn_temp, RTis0, MemIn);
		
endmodule	

//---------------------END BYPASS CONTROL------------------------//





//--------------------PC CALCULATOR------------------------------//
module PC_calculator(instruction, clock, PC_in, rd_value, lessThan, notEqual, statusNot0, PC_out, branch);
	input [31:0] instruction, PC_in, rd_value;
	input clock, lessThan, notEqual, statusNot0;
	output [31:0] PC_out;
	output branch;
	
	wire [31:0] target_full;
	wire [31:0] PC_plus_N;
	
	wire [4:0] opcode, RD, RS, RT, shift, ALUop;
	wire [26:0] target;
	wire [16:0] imm;
	wire [31:0] imm_SE;
	
	wire j_jal, jr, bne, blt, bex, conditionalBranch;
	
	// decode instruction
	instructionDecode decode(instruction, opcode, RD, RS, RT, shift, ALUop, imm, target);
	
	// check if opcode is any jump/branch instruction: j, jal, jr, bne, blt, or bex
	assign j_jal = ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[0]; //000x1
	assign jr = ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0]; //00100
	assign bne = ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0]; //00010
	assign blt = ~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & ~opcode[0];  //00110
	assign bex = opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & ~opcode[0];   //10110
	
	// full target uses upper bits of current PC
	genvar x;
	generate
		for (x=0; x<27; x=x+1) begin: copyTargetToTargetFull
			assign target_full[x] = target[x];
		end
		for (x=27; x<32; x=x+1) begin: copyPCToTargetFull
			assign target_full[x] = PC_in[x];
		end
	endgenerate
	
	// sign extend immediate
	genvar y;
	generate
		for (y=0; y<17; y=y+1) begin: copyImmediateToImmSE
			assign imm_SE[y] = imm[y];
		end
		for (y=17; y<32; y=y+1) begin: copySignToImmSE
			assign imm_SE[y] = imm[16];
		end
	endgenerate
	
	// add immediate value to PC to get PC_plus_N
	wire [31:0] junk1;
	adder_full32bit target_adder(PC_in, imm_SE, 1'b0, PC_plus_N, junk1); 
	
	// determine if need to branch
	assign conditionalBranch = (bne & notEqual) | (blt & (~lessThan & notEqual)) | (bex & statusNot0); // !less than & ! equal = b > a = rs < rd 
	
	assign branch = j_jal | jr | conditionalBranch;
	
	// tri-states to determine which PC to output
	my_tri N_tri(target_full, j_jal, PC_out);
	my_tri PC_plus_N_tri(PC_plus_N, conditionalBranch, PC_out);
	my_tri rd_tri(rd_value, jr, PC_out);
	my_tri PC_in_tri(PC_in, ~branch, PC_out);	
	
endmodule
//--------------------END PC CALCULATOR-------------------------//




//--------------------REGISTER COMPARE--------------------------//
// compare if register addresses are equal
module compareRegs(regA, regB, equal);
	input [4:0] regA, regB;
	output equal;
	
	wire equal0, equal1, equal2, equal3, equal4;
	
	// determine if each bit is equal with xnor (~^)
	assign equal0 = regA[0] ~^ regB[0];
	assign equal1 = regA[1] ~^ regB[1];
	assign equal2 = regA[2] ~^ regB[2];
	assign equal3 = regA[3] ~^ regB[3];
	assign equal4 = regA[4] ~^ regB[4];
	
	// register addresses are equal if all bits are equal
	assign equal = equal0 & equal1 & equal2 & equal3 & equal4;

endmodule

//--------------END REGISTER COMPARE----------------------//






//-------------------RESERVATION STATION-------------------//
module reservationStation(instruction, clock, clear, R_reserved);
input [31:0] instruction;
input clock, clear;
output [4:0] R_reserved;

// decode instruction
wire [4:0] opcode, RD, RS, RT, shift, ALU_op;
wire [16:0] imm;
wire [26:0] target;

instructionDecode reserve_decode(instruction, opcode, RD, RS, RT, shift, ALU_op, imm, target);

// determine if need to reserve RD
wire mult, div;
multOrDiv multOrDivTest(opcode, ALU_op, mult, div);

// store RD if mult or div
dffe reservation_dff(.d(RD), .clk(clock), .clrn(~clear), .prn(1'b1), .ena(mult | div), .q(R_reserved));


endmodule
//-----------------END RESERVATION STATION---------------------//




//----------------------STALL LOGIC----------------------------//
module stallLogic(instruction, R_reserved, clock, unitReady, stall);
	input [31:0] instruction;
	input [4:0] R_reserved;
	input clock, unitReady;
	output stall;
	
	// decode instruction
	wire [4:0] opcode, RD, RS, RT, shift, ALU_op;
	wire [16:0] imm;
	wire [26:0] target;

	instructionDecode reserve_decode(instruction, opcode, RD, RS, RT, shift, ALU_op, imm, target);
	
	// compare to R_reserved
	wire RS_reserved, RT_reserved, RD_reserved;
	
	compareRegs RS_comp(RS, R_reserved, RS_reserved);
	compareRegs RT_comp(RT, R_reserved, RT_reserved);
	compareRegs RD_comp(RD, R_reserved, RD_reserved);
	
	// also stall if mult/div instruction and unit already in use, or if needs status reg but mult/div hasn't been found yet
	wire mult, div, structHazard, R_res_not0, registerReserved, setx, bex;
	multOrDiv multOrDivTest(opcode, ALU_op, mult, div);
	setxOrbex setxTest(opcode, setx, bex);
	assign structHazard = (mult | div | setx | bex) & ~unitReady;  // when unit ready or when answer ready? is there a difference? applies to all instances
	
	assign R_res_not0 = R_reserved[4] | R_reserved[3] | R_reserved[2] | R_reserved[1] | R_reserved[0];
	assign registerReserved = (RS_reserved | RT_reserved | RD_reserved) & R_res_not0;
	assign stall = registerReserved | structHazard;   // still need to deal with 2 writebacks in one cycle -- mult/div first
endmodule
//-------------------------END STALL LOGIC-------------------------//




//-----------------------CONTROL MODULES-----------------------------//
// check if instruction uses immediate value
module instructionIsImm(opcode, use_imm); // determine if instruction needs immediate value
	input [4:0] opcode;
	output use_imm;
	
	wire imm_inst, BNEorBLT_inst;
	
	// check if opcode is an I type, but don't use immediate it BNE or BLT
	assign imm_inst = opcode[4] | opcode[3] | opcode[2] | opcode[1] | opcode[0];
	assign BNEorBLT_inst = ~opcode[4] & ~opcode[3] & opcode[1] & ~opcode[0];
	
	assign use_imm = imm_inst & ~BNEorBLT_inst;
	
endmodule

// check if instruction is load or store
module loadOrStore(opcode, store, load);
	input [4:0] opcode;
	output store, load;
	
	assign store = ~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0];
	assign load = ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
endmodule

// check if instruction uses RD instead of RT
module instructionUsesRD(opcode, RD); 
	input [4:0] opcode;
	output RD;
	
	wire and1, and2, and3;
	
	assign and1 = ~opcode[4] & ~opcode[3] & opcode[1] & ~opcode[0]; //00x10
	assign and2 = ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[0]; //001x0
	assign and3 = ~opcode[4] & ~opcode[3] & opcode[2] & opcode[1];  //0011x
	
	assign RD = and1 | and2 | and3;
	
endmodule

// determine if jal, to control muxes
module link(opcode, link); 
	input [4:0] opcode;
	output link;
	
	assign link = ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
endmodule

// determine if instruction writes back, used for deciding whether to bypass
module writeBack(opcode, writeback);
	input [4:0] opcode;
	output writeback;
	
	assign writeback = (~opcode[4] & ~opcode[2] & ~opcode[1] & ~opcode[0]) | (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0]);	
	
endmodule

// determine if instruction is mult or div
module multOrDiv(opcode, ALUop, mult, div);
	input [4:0] opcode, ALUop;
	output mult, div;
	
	wire ALU;
	
	assign ALU = ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
	assign mult = ~ALUop[4] & ~ALUop[3] & ALUop[2] & ALUop[1] & ~ALUop[0] & ALU;
	assign div = ~ALUop[4] & ~ALUop[3] & ALUop[2] & ALUop[1] & ALUop[0] & ALU;
	
endmodule

// determine if instruction is setx
module setxOrbex(opcode, setx, bex);
	input [4:0] opcode;
	output setx, bex;
	
	assign setx = opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0];
	assign bex = opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & ~opcode[0];
endmodule
//---------------------END CONTROL MODULES---------------------------------//






//---------------------ALU modules---------------------------------------//
// ALU
module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan);
   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
   output [31:0] data_result;
   output isNotEqual, isLessThan;
	
	// internal wires
	wire [31:0] out_add, out_sub, out_and, out_or, out_sll, out_sra;
	wire Cin_add, Cin_sub, Cout;
	
	// set constants
	assign Cin_add = 1'b0; // constant 0
	assign Cin_sub = 1'b1; // constant 1 as part of 2's complement
	
	// Determine 6 possible outputs
	adder_full32bit add(data_operandA, data_operandB, Cin_add, out_add, Cout);
	adder_full32bit sub(data_operandA, ~data_operandB, Cin_sub, out_sub, Cout);
	and_32bit andOp(data_operandA, data_operandB, out_and);
	or_32bit orOp(data_operandA, data_operandB, out_or);
	sll_32bit sll(data_operandA, ctrl_shiftamt, out_sll);
	sra_32bit sra(data_operandA, ctrl_shiftamt, out_sra);
	
	// get isNotEqual and isLessThan from subtract answer
	lessThanOrEqual ltoe(out_sub, isLessThan, isNotEqual);
	
	// Use mux to choose one of the 6 possible outputs. 6 and 7 default to add while mult/div is working.
	mux5 mux(out_add, out_sub, out_and, out_or, out_sll, out_sra, out_add, out_add, ctrl_ALUopcode, data_result); 
	
endmodule


// full 32-bit adder
module adder_full32bit(data_inputA, data_inputB, data_Cin, data_out, data_Cout);
	input [31:0] data_inputA, data_inputB;
	input data_Cin;
	output [31:0] data_out;
	output data_Cout;
	
	wire [31:0] g, p;  //g = generate function, p = propagate function
	wire [32:0] c; // carry
	
	assign c[0] = data_Cin;
	
	assign g = data_inputA & data_inputB;
	assign p = data_inputA | data_inputB;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) begin: generateSum
			xor(data_out[i], data_inputA[i], data_inputB[i], c[i]);
			assign c[i+1] = g[i] | (p[i] & c[i]);
		end	
	endgenerate
	
	assign data_Cout = c[8];
endmodule


// 32-bit and
module and_32bit(data_inputA, data_inputB, data_output);
	input [31:0] data_inputA, data_inputB;
	output [31:0] data_output;
	
	genvar x;
	generate
		for (x=0; x<32; x=x+1) begin: generateAnds
			and my_and(data_output[x], data_inputA[x], data_inputB[x]);
		end
	endgenerate	
	
endmodule

// 32-bit or
module or_32bit(data_inputA, data_inputB, data_output);
	input [31:0] data_inputA, data_inputB;
	output [31:0] data_output;
	
	genvar y;
	generate
		for (y=0; y<32; y=y+1) begin: generateOrs
			or my_or(data_output[y], data_inputA[y], data_inputB[y]);
		end
	endgenerate	
	
endmodule

// 32-bit sll
module sll_32bit(data_input, ctrl_shiftamt, data_output);
	input [31:0] data_input;
	input [4:0] ctrl_shiftamt;
	output [31:0] data_output;
	
	assign data_output = data_input << ctrl_shiftamt;
endmodule

// 32-bit sra
module sra_32bit(data_input, ctrl_shiftamt, data_output);
	input signed [31:0] data_input;
	input [4:0] ctrl_shiftamt;
	output [31:0] data_output;
	
	assign data_output = data_input >>> ctrl_shiftamt;
endmodule

//32-bit <= 0
module lessThanOrEqual(data_input, data_isLessThan, data_isNotEqualTo);
	input signed [31:0] data_input;
	output data_isLessThan, data_isNotEqualTo;
	
	assign data_isLessThan = data_input[31];  // will be 1 if a-b is negative
	// a and b were equal iff the result of their subtraction (data_input) is 00...00
	assign data_isNotEqualTo = (data_input[31] | data_input[30] | data_input[29] | data_input[28] | data_input[27] | data_input[26] | data_input[25] | data_input[24] | data_input[23] | data_input[22] | data_input[21] | data_input[20] | data_input[19] | data_input[18] | data_input[17] | data_input[16] | data_input[15] | data_input[14] | data_input[13] | data_input[12] | data_input[11] | data_input[10] | data_input[9] | data_input[8] | data_input[7] | data_input[6] | data_input[5] | data_input[4] | data_input[3] | data_input[2] | data_input[1] | data_input[0]);
endmodule

// 5-bit adder
module adder_5bit(data_inputA, data_inputB, data_Cin, data_out, data_Cout);
	input [4:0] data_inputA, data_inputB;
	input data_Cin;
	output [4:0] data_out;
	output data_Cout;
	
	wire [4:0] g, p;  //g = generate function, p = propagate function
	wire [5:0] c; // carry
	
	assign c[0] = data_Cin;
	
	assign g = data_inputA & data_inputB;
	assign p = data_inputA | data_inputB;
	
	genvar i;
	generate
		for (i=0; i<5; i=i+1) begin: generateSum
			xor(data_out[i], data_inputA[i], data_inputB[i], c[i]);
			assign c[i+1] = g[i] | (p[i] & c[i]);
		end	
	endgenerate
	
	assign data_Cout = c[5];
endmodule

//------------------END ALU MODULES------------------------//





//-----------------------MULT/DIV----------------------------//
// multdiv module
module multdiv(data_operandA, data_operandB, ctrl_MULT_in, ctrl_DIV_in, clock, data_result, data_exception, data_inputRDY, data_resultRDY,
					debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY,
					debug_multdiv_operandA, debug_multdiv_operandB,
					debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth,
					debug_quotient, debug_divisor, debug_dividend,
					debug_cycleCount, debug_firstCycle,
					debug_divisorShiftAmt, debug_cyclesLeft, debug_div_resultReady,
					debug_divisorShiftAmt5);
   input [31:0] data_operandA;
   input [15:0] data_operandB;
   input ctrl_MULT_in, ctrl_DIV_in, clock;             
   output [31:0] data_result; 
   output data_exception, data_inputRDY, data_resultRDY;
	output debug_multdiv_ctrl_MULT_in, debug_multdiv_ctrl_DIV_in, debug_multdiv_ctrl_MULT, debug_multdiv_ctrl_DIV, debug_data_inputRDY;
	output [31:0] debug_multdiv_operandA;
	output [15:0] debug_multdiv_operandB;
	output [31:0] debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth;
	output [31:0] debug_quotient, debug_divisor, debug_dividend;
	output [4:0] debug_cycleCount;
	output debug_firstCycle;
	output [31:0] debug_divisorShiftAmt, debug_cyclesLeft;
	output debug_div_resultReady;
	output [4:0] debug_divisorShiftAmt5;
	
	wire [31:0] product, quotient;
	wire data_exception_mult, data_exception_div, data_inputRDY_mult, data_inputRDY_div, data_resultRDY_mult, data_resultRDY_div;
	
	wire ctrl_MULT, ctrl_DIV, resultRDY_in;
	
	// hold reset for 1 cycle
	wire resetDiv;
	dffe resetDiv_dff(.d(data_resultRDY), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(resetDiv));
	
	// ADDED: Hold onto ctrl_MULT or ctrl_DIV until result is ready
	dffe ctrl_MULT_dff(.d(ctrl_MULT_in), .clk(~clock), .clrn(1'b1), .prn(1'b1), .ena(~ctrl_MULT), .q(ctrl_MULT));
	dffe ctrl_DIV_dff(.d(ctrl_DIV_in), .clk(~clock), .clrn(~resetDiv), .prn(1'b1), .ena(~ctrl_DIV), .q(ctrl_DIV));
	
	// multiplier and divider modules
	multiplier mult(data_operandA, data_operandB, ctrl_MULT, clock, product, data_exception_mult, data_inputRDY_mult, data_resultRDY_mult,
						debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth);
	divider div(data_operandA, data_operandB, ctrl_DIV, clock, quotient, data_exception_div, data_inputRDY_div, data_resultRDY_div,
					debug_quotient, debug_divisor, debug_dividend, debug_cycleCount, debug_firstCycle, debug_divisorShiftAmt, debug_cyclesLeft, debug_div_resultReady,
					debug_divisorShiftAmt5);
	
	// choose results, based on ctrl_DIV value.
	mux1 multdiv_result_Mux(product, quotient, ctrl_DIV, data_result);
	mux1_1bit multdiv_exception_Mux(data_exception_mult, data_exception_div, ctrl_DIV, data_exception);
	mux1_1bit multdiv_inputRDY_Mux(data_inputRDY_mult, data_inputRDY_div, ctrl_DIV, data_inputRDY);
	mux1_1bit multdiv_resultRDY_Mux(data_resultRDY_mult, data_resultRDY_div, ctrl_DIV, data_resultRDY); //data_resultRDY);
	
	// debug
	assign debug_multdiv_ctrl_MULT_in = ctrl_MULT_in;
	assign debug_multdiv_ctrl_DIV_in = ctrl_DIV_in;
	assign debug_multdiv_ctrl_MULT = ctrl_MULT;
	assign debug_multdiv_ctrl_DIV = ctrl_DIV;
	assign debug_data_inputRDY = data_inputRDY;
	assign debug_multdiv_operandA = data_operandA;
	assign debug_multdiv_operandB = data_operandB;
endmodule


// Multiplier module
module multiplier(data_operandA, data_operandB, ctrl_MULT, clock, data_result, data_exception, data_inputRDY, data_resultRDY,
						debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth);
   input [31:0] data_operandA;  // multiplicand
   input [15:0] data_operandB;  // multiplier
   input ctrl_MULT, clock;             
   output [31:0] data_result;   // product
   output data_exception, data_inputRDY, data_resultRDY;
	output [31:0] debug_multiplier, debug_multiplicand, debug_product, debug_multiplicanBooth;
	
	wire reset, noMult, clear, firstCycle, subtract, Cout_add, Cout_sub, expectedSign;
	wire [31:0] multiplicand, product, multiplicand_read, multiplicand_write, product_read, product_write, multiplicand_booth, out_add, out_sub, junk1, junk2, junk3;
	wire [4:0] cycleCount;
	wire signed [31:0] implicitMultiplier, multiplier, multiplier_read, multiplier_write;
	
	// add implicit 0 to end of multiplier, and sign-extend
	genvar i;
	generate
		for (i=0; i<16; i=i+1) begin: generateImplicitMultiplier
			assign implicitMultiplier[i+1] = data_operandB[i];
		end
		assign implicitMultiplier[0] = 1'b0;
		
		for (i=17; i<32; i=i+1) begin: signExtend
			assign implicitMultiplier[i] = implicitMultiplier[16];
		end
	endgenerate
	
	// set up controls
	assign noMult = ~ctrl_MULT;  // not multiplying this cycle (will clear registers)
	assign clear = reset | noMult; // clear if reset (product already found) or not multiplying
	
	// set up counter
	counter ctr(clock, clear, cycleCount);
	
	// inputRDY/firstCycle: Counter = 00000
	assign firstCycle = ~cycleCount[0] & ~cycleCount[1] & ~cycleCount[2] & ~cycleCount[3] & ~cycleCount[4];
	assign data_inputRDY = firstCycle;
	
	// data_resultRDY: Counter = 10000
	assign data_resultRDY = ~cycleCount[0] & ~cycleCount[1] & ~cycleCount[2] & ~cycleCount[3] & cycleCount[4];
	assign reset = 1'b0; // didn't end up using this
	
	// registers to store intermediate values of multiplicand, multiplier, and product
	register multiplicandReg(clock, clear, ctrl_MULT, ctrl_MULT, 1'b0, multiplicand_write, multiplicand_read, junk1);
	register multiplierReg(clock, clear, ctrl_MULT, ctrl_MULT, 1'b0, multiplier_write, multiplier_read, junk2);
	register productReg(clock, clear, ctrl_MULT, ctrl_MULT, 1'b0, product_write, product_read, junk3);
	
	// mux used to pick between original data passed in (first cycle) or modified from register
	mux1 multiplicandMux(multiplicand_read, data_operandA, firstCycle, multiplicand);
	mux1 multiplierMux(multiplier_read, implicitMultiplier, firstCycle, multiplier);
	mux1 productMux(product_read, {32{1'b0}}, firstCycle, product);
	
	// use Booth's algorithm to determine next step
	booths booth(multiplier[2:0], multiplicand, multiplicand_booth, subtract);
	
	// add or subtract, using the new multiplicand and the control from Booth's module
	adder_full32bit add(product, multiplicand_booth, 1'b0, out_add, Cout_add);
	adder_full32bit sub(product, ~multiplicand_booth, 1'b1, out_sub, Cout_sub);
	
	mux1 addOrSub(out_add, out_sub, subtract, product_write);
	
	// shifters for multiplicand and multiplier
	assign multiplicand_write = multiplicand << 2;
	assign multiplier_write = multiplier >>> 2;
	
	// set result
	assign data_result = product_read;
	
	// Check for overflow (product sign != expected sign)
	assign expectedSign = data_operandA[31] ^ data_operandB[15];
	assign data_exception = expectedSign ^ data_result[31];
	
	// debugging
	assign debug_multiplier = multiplier;
	assign debug_multiplicand = multiplicand;
	assign debug_product = product;
	assign debug_multiplicanBooth = multiplicand_booth;
endmodule



// Divider module
module divider(data_operandA, data_operandB, ctrl_DIV, clock, data_result, data_exception, data_inputRDY, data_resultRDY,
					debug_quotient, debug_divisor, debug_dividend,
					debug_cycleCount, debug_firstCycle,
					debug_divisorShiftAmt, debug_cyclesLeft, debug_resultReady, debug_divisorShiftAmt5);
   input [31:0] data_operandA;
   input [15:0] data_operandB;
   input ctrl_DIV, clock;             
   output [31:0] data_result; 
   output data_exception, data_inputRDY, data_resultRDY;
	output [31:0] debug_quotient, debug_divisor, debug_dividend;
	output [4:0] debug_cycleCount;
	output debug_firstCycle;
	output [31:0] debug_divisorShiftAmt, debug_cyclesLeft;
	output debug_resultReady;
	output [4:0] debug_divisorShiftAmt5;
	
	// lots of intermediate wires...
	wire reset, noDiv, clear, firstCycle, subCout, divisor_writeEnable, junk4, junk5;
	wire [4:0] dividend_MSB, divisor_MSB, divisor_shiftAmt, cycleCount;
	wire [31:0] dividend, divisor, quotient, quotient_shifted, divisor_shifted, divisor_read, divisor_write, dividend_read, dividend_write, quotient_read, quotient_write, junk1, junk2, junk3;
	wire [31:0] dividend_orig, dividend_negated, dividend_signAdj, quotient_orig, quotient_negated, divisor_orig, divisor_negated, divisor_signAdj, dividend_test;
	wire [31:0] cycleCount_32bit, shiftAmt_32bit, cyclesLeft;
	wire [15:0] operandB_checkedFor0;
	wire dividendSign, divisorSign, resultSign;
	
	// set up controls
	assign noDiv = ~ctrl_DIV;  // not dividing this cycle (will clear registers)
	assign clear = reset | noDiv; // clear if reset (quotient already found) or not dividing
	
	// set up counter
	counter ctr(clock, clear, cycleCount);
	
	// inputRDY/firstCycle: Counter = 00000
	assign firstCycle = ~cycleCount[0] & ~cycleCount[1] & ~cycleCount[2] & ~cycleCount[3] & ~cycleCount[4];
	assign data_inputRDY = firstCycle;
	
	// determine when result is ready, when cycleCount > shiftAmt
	
	// 0-extend cycleCount and shiftAmt
	assign cycleCount_32bit = {{26'b00000000000000000000000000}, cycleCount};
	assign shiftAmt_32bit = {{26'b00000000000000000000000000}, divisor_shiftAmt};
	
	// store shift amount
	wire [31:0] shiftAmt_32bit_stored;
	latchReg shiftAmtReg(clock, clear, firstCycle, shiftAmt_32bit, shiftAmt_32bit_stored);
	
	// subtract cycleCount from shiftAmt
	adder_full32bit cyclesLeftSub(shiftAmt_32bit_stored, ~cycleCount_32bit, 1'b1, cyclesLeft, junk4); 
	assign data_resultRDY = cyclesLeft[31];  // will be 1 when negative number
	assign reset = 1'b0;// didn't end up using this
	
	// Exception if data_operandB == 0
	wire data_exception_in;
	assign data_exception_in = ~data_operandB[0] & ~data_operandB[1] & ~data_operandB[2] & ~data_operandB[3] & ~data_operandB[4] & ~data_operandB[5] & ~data_operandB[6] & ~data_operandB[7] & ~data_operandB[8] & ~data_operandB[9] & ~data_operandB[10] & ~data_operandB[11] & ~data_operandB[12] & ~data_operandB[13] & ~data_operandB[14] & ~data_operandB[15]; 
	dffe exceptionDFF(.d(data_exception_in),  .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(firstCycle), .q(data_exception));
	
	// if operandB was 0, replace it with 1 so everything doesn't break
	mux1_16bit checkFor0(data_operandB, 16'b0000000000000001, data_exception_in, operandB_checkedFor0);
	
	// Sign-extend divisor
	assign divisor_orig[15:0] = operandB_checkedFor0;
	genvar i;
	generate
		for (i=16; i<32; i=i+1) begin: signExtendDivisor
			assign divisor_orig[i] = divisor_orig[15];
		end
	endgenerate
	
	// Choose whether to negate each operand and determine sign
	assign dividend_orig = data_operandA;
	assign dividendSign = dividend_orig[31];
	negator dividendNegate(dividend_orig, dividend_negated);
	mux1 dividendSignChoice(dividend_orig, dividend_negated, dividendSign, dividend_signAdj);
	
	assign divisorSign = divisor_orig[31];
	negator divisorNegate(divisor_orig, divisor_negated);
	mux1 divisorSignChoice(divisor_orig, divisor_negated, divisorSign, divisor_signAdj);
	
	assign resultSign = dividendSign ^ divisorSign;
	
	
	// Determine shift amount to align divisor and dividend
	priorityEncoder dividend_PE(dividend_signAdj, dividend_MSB);
	priorityEncoder divisor_PE(divisor_signAdj, divisor_MSB);	
	adder_5bit sub(dividend_MSB, ~divisor_MSB, 1'b1, divisor_shiftAmt, subCout);
	assign divisor_shifted = divisor_signAdj << divisor_shiftAmt;
	
	
	// registers to store intermediate values of dividend, divisor, quotient
	mux1 dividendValMux(dividend_test, dividend, dividend_test[31], dividend_write);
	register dividendReg(clock, clear, ctrl_DIV, ctrl_DIV, 1'b0, dividend_write, dividend_read, junk1);
	register divisorReg(clock, clear, ctrl_DIV, ctrl_DIV, 1'b0, divisor_write, divisor_read, junk2);
	register quotientReg(clock, clear, ctrl_DIV, ctrl_DIV, 1'b0, quotient_write, quotient_read, junk3);
	
	// mux used to pick between original data passed in (first cycle) or modified from register
	mux1 dividendMux(dividend_read, dividend_signAdj, firstCycle, dividend);
	mux1 divisorMux(divisor_read, divisor_shifted, firstCycle, divisor);
	mux1 quotientMux(quotient_read, {32{1'b0}}, firstCycle, quotient);
	
	// find remainder/dividend and divisor
	adder_full32bit remainder(dividend, ~divisor, 1'b1, dividend_test, junk5);
	assign divisor_write = divisor >> 1;
	assign quotient_shifted = quotient << 1;	
	
	// shift quotient to the left by 1 bit, and add opposite of subtraction sign as LSB
	genvar x;
	generate
		for(x=1; x<32; x=x+1) begin: generateQuotientWrite
			assign quotient_write[x] = quotient_shifted[x];
		end
		assign quotient_write[0] = ~dividend_test[31];
	endgenerate
	
	// adjust quotient sign and set it to data_result
	assign quotient_orig = quotient_read;
	negator quotientNegate(quotient_orig, quotient_negated);
	mux1 quotientSignChoice(quotient_orig, quotient_negated, resultSign, data_result);
	
	//debugging
	assign debug_quotient = data_result;
	assign debug_divisor = divisor;
	assign debug_dividend = dividend;
	assign debug_cycleCount = cycleCount;
	assign debug_firstCycle = firstCycle;
	assign debug_divisorShiftAmt = shiftAmt_32bit;
	assign debug_cyclesLeft = cyclesLeft;
	assign debug_resultReady = data_resultRDY;
	assign debug_divisorShiftAmt5 = divisor_shiftAmt;
	
endmodule



// Booth's Algorithm
module booths(inputBits, M_in, M_out, sub);
	input [2:0] inputBits;
	input [31:0] M_in;
	output [31:0] M_out;
	output sub;
	wire and1, and2, and3, and4;
	wire [1:0] muxSelect;
	wire [31:0] M_shifted;
	
	// add and sub are determined by the MSB (0 = add, 1 = sub)
	assign sub = inputBits[2];
	
	// determine multiplicand (0, M, or 2M)
	assign and1 = inputBits[1] & ~inputBits[0];
	assign and2 = ~inputBits[1] & inputBits[0];
	assign muxSelect[0] = and1 | and2;
	
	assign and3 = inputBits[2] & ~inputBits[1] & ~inputBits[0];
	assign and4 = ~inputBits[2] & inputBits[1] & inputBits[0];
	assign muxSelect[1] = and3 | and4;
	
	assign M_shifted = M_in << 1;
	
	mux5 multMux({32{1'b0}}, M_in, M_shifted, {32{1'b0}}, {32{1'b0}}, {32{1'b0}}, {32{1'b0}}, {32{1'b0}}, {3'b000, muxSelect}, M_out);
		
endmodule




// Priority Encoder. Returns a 5-bit number representing the number of the MSB of the input number.
module priorityEncoder(in, out_bitNum);
	input [31:0] in;
	output [4:0] out_bitNum;
	
	wire [31:0] bits; //one-hot, will be 1 if that bit is MSB

	// There is probably a more efficient way to write this, but...
	assign bits[31] = in[31];
	assign bits[30] = in[30] & ~in[31];
	assign bits[29] = in[29] & ~in[30] & ~in[31];
	assign bits[28] = in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[27] = in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[26] = in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[25] = in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[24] = in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[23] = in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[22] = in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[21] = in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[20] = in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[19] = in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[18] = in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[17] = in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[16] = in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[15] = in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[14] = in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[13] = in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[12] = in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[11] = in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[10] = in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[9]  = in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[8]  = in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[7]  = in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[6]  = in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[5]  = in[5]  & ~in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[4]  = in[4]  & ~in[5]  & ~in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[3]  = in[3]  & ~in[4]  & ~in[5]  & ~in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[2]  = in[2]  & ~in[3]  & ~in[4]  & ~in[5]  & ~in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[1]  = in[1]  & ~in[2]  & ~in[3]  & ~in[4]  & ~in[5]  & ~in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	assign bits[0]  =~in[1]  & ~in[2]  & ~in[3]  & ~in[4]  & ~in[5]  & ~in[6]  & ~in[7]  & ~in[8]  & ~in[9]  & ~in[10] & ~in[11] & ~in[12] & ~in[13] & ~in[14] & ~in[15] & ~in[16] & ~in[17] & ~in[18] & ~in[19] & ~in[20] & ~in[21] & ~in[22] & ~in[23] & ~in[24] & ~in[25] & ~in[26] & ~in[27] & ~in[28] & ~in[29] & ~in[30] & ~in[31];
	// bits[0] is the default case (this will catch all 0s)
	
	// use 1-hot to select tri-state buffer of correct 5-bit encoding
	my_tri_5bit priorityEncoderTri0(5'b00000, bits[0], out_bitNum);
	my_tri_5bit priorityEncoderTri1(5'b00001, bits[1], out_bitNum);
	my_tri_5bit priorityEncoderTri2(5'b00010, bits[2], out_bitNum);
	my_tri_5bit priorityEncoderTri3(5'b00011, bits[3], out_bitNum);
	my_tri_5bit priorityEncoderTri4(5'b00100, bits[4], out_bitNum);
	my_tri_5bit priorityEncoderTri5(5'b00101, bits[5], out_bitNum);
	my_tri_5bit priorityEncoderTri6(5'b00110, bits[6], out_bitNum);
	my_tri_5bit priorityEncoderTri7(5'b00111, bits[7], out_bitNum);
	my_tri_5bit priorityEncoderTri8(5'b01000, bits[8], out_bitNum);
	my_tri_5bit priorityEncoderTri9(5'b01001, bits[9], out_bitNum);
	my_tri_5bit priorityEncoderTri10(5'b01010, bits[10], out_bitNum);
	my_tri_5bit priorityEncoderTri11(5'b01011, bits[11], out_bitNum);
	my_tri_5bit priorityEncoderTri12(5'b01100, bits[12], out_bitNum);
	my_tri_5bit priorityEncoderTri13(5'b01101, bits[13], out_bitNum);
	my_tri_5bit priorityEncoderTri14(5'b01110, bits[14], out_bitNum);
	my_tri_5bit priorityEncoderTri15(5'b01111, bits[15], out_bitNum);
	my_tri_5bit priorityEncoderTri16(5'b10000, bits[16], out_bitNum);
	my_tri_5bit priorityEncoderTri17(5'b10001, bits[17], out_bitNum);
	my_tri_5bit priorityEncoderTri18(5'b10010, bits[18], out_bitNum);
	my_tri_5bit priorityEncoderTri19(5'b10011, bits[19], out_bitNum);
	my_tri_5bit priorityEncoderTri20(5'b10100, bits[20], out_bitNum);
	my_tri_5bit priorityEncoderTri21(5'b10101, bits[21], out_bitNum);
	my_tri_5bit priorityEncoderTri22(5'b10110, bits[22], out_bitNum);
	my_tri_5bit priorityEncoderTri23(5'b10111, bits[23], out_bitNum);
	my_tri_5bit priorityEncoderTri24(5'b11000, bits[24], out_bitNum);
	my_tri_5bit priorityEncoderTri25(5'b11001, bits[25], out_bitNum);
	my_tri_5bit priorityEncoderTri26(5'b11010, bits[26], out_bitNum);
	my_tri_5bit priorityEncoderTri27(5'b11011, bits[27], out_bitNum);
	my_tri_5bit priorityEncoderTri28(5'b11100, bits[28], out_bitNum);
	my_tri_5bit priorityEncoderTri29(5'b11101, bits[29], out_bitNum);
	my_tri_5bit priorityEncoderTri30(5'b11110, bits[30], out_bitNum);
	my_tri_5bit priorityEncoderTri31(5'b11111, bits[31], out_bitNum);

	
endmodule

// negator
module negator(data_in, data_out);
	input [31:0] data_in;
	output [31:0] data_out;
	wire Cout;
	
	adder_full32bit negate({32{1'b0}}, ~data_in, 1'b1, data_out, Cout);
	
endmodule


// counter, modified from Moore-type FSM in Lecture 12
`define state0 5'b00000
`define state1 5'b00001
`define state2 5'b00010
`define state3 5'b00011
`define state4 5'b00100
`define state5 5'b00101
`define state6 5'b00110
`define state7 5'b00111
`define state8 5'b01000
`define state9 5'b01001
`define state10 5'b01010
`define state11 5'b01011
`define state12 5'b01100
`define state13 5'b01101
`define state14 5'b01110
`define state15 5'b01111
`define state16 5'b10000
`define state17 5'b10001
`define state18 5'b10010
`define state19 5'b10011
`define state20 5'b10100
`define state21 5'b10101
`define state22 5'b10110
`define state23 5'b10111
`define state24 5'b11000
`define state25 5'b11001
`define state26 5'b11010
`define state27 5'b11011
`define state28 5'b11100
`define state29 5'b11101
`define state30 5'b11110
`define state31 5'b11111

module counter(clk, reset, z);
input clk, reset;
output [4:0] z;
wire [4:0] present;

// the FSM...
reg [4:0] z;
reg [4:0] next;

always @(*) begin
	case(present)
		`state0: next = reset ? `state0 : `state1;
		`state1: next = reset ? `state0 : `state2;
		`state2: next = reset ? `state0 : `state3;
		`state3: next = reset ? `state0 : `state4;
		`state4: next = reset ? `state0 : `state5;
		`state5: next = reset ? `state0 : `state6;
		`state6: next = reset ? `state0 : `state7;
		`state7: next = reset ? `state0 : `state8;
		`state8: next = reset ? `state0 : `state9;
		`state9: next = reset ? `state0 : `state10;
		`state10: next = reset ? `state0 : `state11;
		`state11: next = reset ? `state0 : `state12;
		`state12: next = reset ? `state0 : `state13;
		`state13: next = reset ? `state0 : `state14;
		`state14: next = reset ? `state0 : `state15;
		`state15: next = reset ? `state0 : `state16;
		`state16: next = reset ? `state0 : `state17;
		`state17: next = reset ? `state0 : `state18;
		`state18: next = reset ? `state0 : `state19;
		`state19: next = reset ? `state0 : `state20;
		`state20: next = reset ? `state0 : `state21;
		`state21: next = reset ? `state0 : `state22;
		`state22: next = reset ? `state0 : `state23;
		`state23: next = reset ? `state0 : `state24;
		`state24: next = reset ? `state0 : `state25;
		`state25: next = reset ? `state0 : `state26;
		`state26: next = reset ? `state0 : `state27;
		`state27: next = reset ? `state0 : `state28;
		`state28: next = reset ? `state0 : `state29;
		`state29: next = reset ? `state0 : `state30;
		`state30: next = reset ? `state0 : `state31;
		`state31: next = reset ? `state0 : `state0;

		default: next = `state0;
	endcase
end

always @(present) begin
	case(present)

		`state0: z = 5'b00000;
		`state1: z = 5'b00001;
		`state2: z = 5'b00010;
		`state3: z = 5'b00011;
		`state4: z = 5'b00100;
		`state5: z = 5'b00101;
		`state6: z = 5'b00110;
		`state7: z = 5'b00111;
		`state8: z = 5'b01000;
		`state9: z = 5'b01001;
		`state10: z = 5'b01010;
		`state11: z = 5'b01011;
		`state12: z = 5'b01100;
		`state13: z = 5'b01101;
		`state14: z = 5'b01110;
		`state15: z = 5'b01111;
		`state16: z = 5'b10000;
		`state17: z = 5'b10001;
		`state18: z = 5'b10010;
		`state19: z = 5'b10011;
		`state20: z = 5'b10100;
		`state21: z = 5'b10101;
		`state22: z = 5'b10110;
		`state23: z = 5'b10111;
		`state24: z = 5'b11000;
		`state25: z = 5'b11001;
		`state26: z = 5'b11010;
		`state27: z = 5'b11011;
		`state28: z = 5'b11100;
		`state29: z = 5'b11101;
		`state30: z = 5'b11110;
		`state31: z = 5'b11111;
	endcase
end
dffe state_reg0(.d(next[0]), .clk(clk), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(present[0]));
dffe state_reg1(.d(next[1]), .clk(clk), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(present[1]));
dffe state_reg2(.d(next[2]), .clk(clk), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(present[2]));
dffe state_reg3(.d(next[3]), .clk(clk), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(present[3]));
dffe state_reg4(.d(next[4]), .clk(clk), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(present[4]));
endmodule

//------------------------END MULT/DIV-----------------------//





//---------------------MUXES----------------//
// Mux with 1 bit selecter
module mux1(data_input0, data_input1, ctrl_select, result);
	input [31:0] data_input0, data_input1;
	input ctrl_select;
	output [31:0] result;
	
	wire select0, select1;
	
	assign select0 = ~ctrl_select;
	assign select1 = ctrl_select;

	// Use above controls to pass only one input through the mux
	my_tri input0_tri(data_input0, select0, result);
	my_tri input1_tri(data_input1, select1, result);
	
endmodule

// 1-bit mux with 1 bit selecter
module mux1_1bit(data_input0, data_input1, ctrl_select, result);
	input data_input0, data_input1, ctrl_select;
	output result;
	
	// Determine which input to choose based on ctrl_select
	wire select0, select1;
	
	assign select0 = ~ctrl_select;
	assign select1 = ctrl_select;
	
	// Use above controls to pass only one input through the mux
	my_tri_1bit input0_tri(data_input0, select0, result);
	my_tri_1bit input1_tri(data_input1, select1, result);	
	
endmodule

// 2-bit Mux with 1 bit selecter
module mux1_2bit(data_input0, data_input1, ctrl_select, result);
	input [1:0] data_input0, data_input1;
	input ctrl_select;
	output [1:0] result;
	
	wire select0, select1;
	
	assign select0 = ~ctrl_select;
	assign select1 = ctrl_select;

	// Use above controls to pass only one input through the mux
	my_tri_2bit input0_tri(data_input0, select0, result);
	my_tri_2bit input1_tri(data_input1, select1, result);
	
endmodule

// 5-bit Mux with 1 bit selecter
module mux1_5bit(data_input0, data_input1, ctrl_select, result);
	input [4:0] data_input0, data_input1;
	input ctrl_select;
	output [4:0] result;
	
	wire select0, select1;
	
	assign select0 = ~ctrl_select;
	assign select1 = ctrl_select;

	// Use above controls to pass only one input through the mux
	my_tri_5bit input0_tri(data_input0, select0, result);
	my_tri_5bit input1_tri(data_input1, select1, result);
	
endmodule

// 16-bit Mux with 1 bit selecter
module mux1_16bit(data_input0, data_input1, ctrl_select, result);
	input [15:0] data_input0, data_input1;
	input ctrl_select;
	output [15:0] result;
	
	wire select0, select1;
	
	assign select0 = ~ctrl_select;
	assign select1 = ctrl_select;

	// Use above controls to pass only one input through the mux
	my_tri_16bit input0_tri(data_input0, select0, result);
	my_tri_16bit input1_tri(data_input1, select1, result);
	
endmodule

// Mux with 2 bit selecter
module mux2(data_input0, data_input1, data_input2, data_input3, ctrl_select, result);
	input [31:0] data_input0, data_input1, data_input2, data_input3;
	input [1:0] ctrl_select;
	output [31:0] result;
	
	wire select0, select1, select2, select3;
	
	assign select0 = ~ctrl_select[1] & ~ctrl_select[0];
	assign select1 = ~ctrl_select[1] & ctrl_select[0];
	assign select2 = ctrl_select[1] & ~ctrl_select[0];
	assign select3 = ctrl_select[1] & ctrl_select[0];

	// Use above controls to pass only one input through the mux
	my_tri input0_tri(data_input0, select0, result);
	my_tri input1_tri(data_input1, select1, result);
	my_tri input2_tri(data_input2, select2, result);
	my_tri input3_tri(data_input3, select3, result);
	
	
endmodule

// Mux with 3 bit selecter
module mux3(data_input0, data_input1, data_input2, data_input3, data_input4, data_input5, data_input6, data_input7, ctrl_select, result);
	input [31:0] data_input0, data_input1, data_input2, data_input3, data_input4, data_input5, data_input6, data_input7;
	input [2:0] ctrl_select;
	output [31:0] result;
	
	wire select0, select1, select2, select3, select4, select5, select6, select7;
	
	assign select0 = ~ctrl_select[2] & ~ctrl_select[1] & ~ctrl_select[0];
	assign select1 = ~ctrl_select[2] & ~ctrl_select[1] & ctrl_select[0];
	assign select2 = ~ctrl_select[2] & ctrl_select[1] & ~ctrl_select[0];
	assign select3 = ~ctrl_select[2] & ctrl_select[1] & ctrl_select[0];
	assign select4 = ctrl_select[2] & ~ctrl_select[1] & ~ctrl_select[0];
	assign select5 = ctrl_select[2] & ~ctrl_select[1] & ctrl_select[0];
	assign select6 = ctrl_select[2] & ctrl_select[1] & ~ctrl_select[0];
	assign select7 = ctrl_select[2] & ctrl_select[1] & ctrl_select[0];

	// Use above controls to pass only one input through the mux
	my_tri input0_tri(data_input0, select0, result);
	my_tri input1_tri(data_input1, select1, result);
	my_tri input2_tri(data_input2, select2, result);
	my_tri input3_tri(data_input3, select3, result);
	my_tri input4_tri(data_input4, select4, result);
	my_tri input5_tri(data_input5, select5, result);
	my_tri input6_tri(data_input6, select6, result);
	my_tri input7_tri(data_input7, select7, result);
	
	
endmodule

// 5-bit Mux with 2 bit selecter
module mux2_5bit(data_input0, data_input1, data_input2, data_input3, ctrl_select, result);
	input [4:0] data_input0, data_input1, data_input2, data_input3;
	input [1:0] ctrl_select;
	output [4:0] result;
	
	wire select0, select1, select2, select3;
	
	assign select0 = ~ctrl_select[1] & ~ctrl_select[0];
	assign select1 = ~ctrl_select[1] & ctrl_select[0];
	assign select2 = ctrl_select[1] & ~ctrl_select[0];
	assign select3 = ctrl_select[1] & ctrl_select[0];

	// Use above controls to pass only one input through the mux
	my_tri_5bit input0_tri(data_input0, select0, result);
	my_tri_5bit input1_tri(data_input1, select1, result);
	my_tri_5bit input2_tri(data_input2, select2, result);
	my_tri_5bit input3_tri(data_input3, select3, result);
	
	
endmodule

// Mux with 3 bit selecter
module mux3_5bit(data_input0, data_input1, data_input2, data_input3, data_input4, data_input5, data_input6, data_input7, ctrl_select, result);
	input [4:0] data_input0, data_input1, data_input2, data_input3, data_input4, data_input5, data_input6, data_input7;
	input [2:0] ctrl_select;
	output [4:0] result;
	
	wire select0, select1, select2, select3, select4, select5, select6, select7;
	
	assign select0 = ~ctrl_select[2] & ~ctrl_select[1] & ~ctrl_select[0];
	assign select1 = ~ctrl_select[2] & ~ctrl_select[1] & ctrl_select[0];
	assign select2 = ~ctrl_select[2] & ctrl_select[1] & ~ctrl_select[0];
	assign select3 = ~ctrl_select[2] & ctrl_select[1] & ctrl_select[0];
	assign select4 = ctrl_select[2] & ~ctrl_select[1] & ~ctrl_select[0];
	assign select5 = ctrl_select[2] & ~ctrl_select[1] & ctrl_select[0];
	assign select6 = ctrl_select[2] & ctrl_select[1] & ~ctrl_select[0];
	assign select7 = ctrl_select[2] & ctrl_select[1] & ctrl_select[0];

	// Use above controls to pass only one input through the mux
	my_tri_5bit input0_tri(data_input0, select0, result);
	my_tri_5bit input1_tri(data_input1, select1, result);
	my_tri_5bit input2_tri(data_input2, select2, result);
	my_tri_5bit input3_tri(data_input3, select3, result);
	my_tri_5bit input4_tri(data_input4, select4, result);
	my_tri_5bit input5_tri(data_input5, select5, result);
	my_tri_5bit input6_tri(data_input6, select6, result);
	my_tri_5bit input7_tri(data_input7, select7, result);
	
	
endmodule

// Mux with 5 bit selecter (only 3 bits needed for this project)
module mux5(data_input0, data_input1, data_input2, data_input3, data_input4, data_input5, data_input6, data_input7, ctrl_select, result);
	input [31:0] data_input0, data_input1, data_input2, data_input3, data_input4, data_input5, data_input6, data_input7;
	input [4:0] ctrl_select;
	output [31:0] result;
	
	// Determine which input to choose based on ctrl_select
	wire select0, select1, select2, select3, select4, select5, select6, select7;
	
	assign select0 = ~ctrl_select[4] & ~ctrl_select[3] & ~ctrl_select[2] & ~ctrl_select[1] & ~ctrl_select[0];
	assign select1 = ~ctrl_select[4] & ~ctrl_select[3] & ~ctrl_select[2] & ~ctrl_select[1] & ctrl_select[0];
	assign select2 = ~ctrl_select[4] & ~ctrl_select[3] & ~ctrl_select[2] & ctrl_select[1] & ~ctrl_select[0];
	assign select3 = ~ctrl_select[4] & ~ctrl_select[3] & ~ctrl_select[2] & ctrl_select[1] & ctrl_select[0];
	assign select4 = ~ctrl_select[4] & ~ctrl_select[3] & ctrl_select[2] & ~ctrl_select[1] & ~ctrl_select[0];
	assign select5 = ~ctrl_select[4] & ~ctrl_select[3] & ctrl_select[2] & ~ctrl_select[1] & ctrl_select[0];
	assign select6 = ~ctrl_select[4] & ~ctrl_select[3] & ctrl_select[2] & ctrl_select[1] & ~ctrl_select[0];
	assign select7 = ~ctrl_select[4] & ~ctrl_select[3] & ctrl_select[2] & ctrl_select[1] & ctrl_select[0];

	// Use above controls to pass only one input through the mux
	my_tri input0_tri(data_input0, select0, result);
	my_tri input1_tri(data_input1, select1, result);
	my_tri input2_tri(data_input2, select2, result);
	my_tri input3_tri(data_input3, select3, result);
	my_tri input4_tri(data_input4, select4, result);
	my_tri input5_tri(data_input5, select5, result);
	my_tri input6_tri(data_input6, select6, result);
	my_tri input7_tri(data_input7, select7, result);
	
endmodule

//----------------------------END MUXES--------------------------//



//--------------------------TRI-STATES---------------------------//

// Tri-state buffer, modified from lecture 4 slides
module my_tri(in, oe, out);
	input oe;
	input [31:0] in;
	output [31:0] out;
	assign out = oe ? in : 32'bz;
endmodule

// Tri-state buffer, modified from lecture 4 slides
module my_tri_1bit(in, oe, out);
	input oe;
	input in;
	output out;
	assign out = oe ? in : 1'bz;
endmodule

// Tri-state buffer, modified from lecture 4 slides
module my_tri_2bit(in, oe, out);
	input oe;
	input [1:0] in;
	output [1:0] out;
	assign out = oe ? in : 2'bz;
endmodule

// Tri-state buffer, modified from lecture 4 slides
module my_tri_5bit(in, oe, out);
	input oe;
	input [4:0] in;
	output [4:0] out;
	assign out = oe ? in : 5'bz;
endmodule

// Tri-state buffer, modified from lecture 4 slides
module my_tri_16bit(in, oe, out);
	input oe;
	input [15:0] in;
	output [15:0] out;
	assign out = oe ? in : 16'bz;
endmodule

//---------------------END TRI-STATES----------------------//


// Decoder, from lecture 4 slides
module decoder32(out, select, enable);
	input [4:0] select;
	input enable;
	output [31:0] out;
	
	assign out = enable << select;
endmodule



//------------------------------------------------END PROCESSOR.V---------------------------------------//


