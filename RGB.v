module RGB(display, X, Y, VGA_R, VGA_G, VGA_B
	// r1, r2
	, iX1, iY1
	// r3, r4
	, gX1, gY1
	// r5, r6
	, u1X1, u1Y1
	// r7, r8
	, u2X1, u2Y1
	// r9, r10
	, u3X1, u3Y1
	// r14, r15
	, win, lose
);

	input display;
	input [31:0] X, Y;
	
	output[7:0] VGA_R, VGA_G, VGA_B;
	
	// Containers
	input[31:0] 
	// r1, r2
	iX1, iY1
	// r3, r4
	, gX1, gY1
	// r5, r6
	, u1X1, u1Y1
	// r7, r8
	, u2X1, u2Y1
	// r9, r10
	, u3X1, u3Y1
	// r14, r15
	, win, lose
	;
	wire[31:0]
	// i
	iX2, iY2
	// g
	, gX2, gY2
	// u1
	, u1X2, u1Y2, u1X3, u1Y3, u1X4
	// u2
	, u2X2, u2Y2, u2X3, u2Y3, u2X4
	// u3
	, u3X2, u3Y2, u3X3, u3Y3, u3X4
	;
	g G1(gX1, gY1, gX2, gY2);
	u U1(u1X1, u1Y1, u1X2, u1Y2, u1X3, u1Y3, u1X4);
	i I1(iX1, iY1, iX2, iY2);
	u u2(u2X1, u2Y1, u2X2, u2Y2, u2X3, u2Y3, u2X4);
	u u3(u3X1, u3Y1, u3X2, u3Y2, u3X3, u3Y3, u3X4);
	
	reg[7:0] R, G, B;
	assign VGA_R = R;
	assign VGA_G = G;
	assign VGA_B = B;
	
	always @(display
	, Y, X
	, win, lose
	) begin
		if (display) begin
				if (win[0]) begin
					// i
					if ((Y < 584) & (X < 656) & (Y > 488) & (X > 624)) begin
						R = 8'b11111111;
						G = 8'b11111111;
						B = 8'b11111111;
					end 
					// g
					else if ((Y < 456) & (X < 656) & (Y > 424) & (X > 624)) begin
						R = 8'b11111111;
						G = 8'b11111111;
						B = 8'b11111111;
					end 
					else begin
						R = 8'b00000000;
						G = 8'b11111111;
						B = 8'b00000000;
					end
				end
				else if (lose[0]) begin
					// u
					if ((Y <= 584) & (X <= 624) & (Y > 456) & (X > 592)) begin
						R = 8'b00000000;
						G = 8'b00000000;
						B = 8'b11111111;
					end 
					else if ((Y <= 584) & (X <= 656) & (Y > 552) & (X > 624)) begin
						R = 8'b00000000;
						G = 8'b00000000;
						B = 8'b11111111;
					end 
					else if ((Y <= 584) & (X <= 688) & (Y > 456) & (X > 656)) begin
						R = 8'b00000000;
						G = 8'b00000000;
						B = 8'b11111111;
					end 
					else begin
						R = 8'b11111111;
						G = 8'b00000000;
						B = 8'b00000000;
					end
				end
				else begin
					// i
					if ((Y <= iY2) & (X <= iX2) & (Y > iY1) & (X > iX1)) begin
						R = 8'b11111111;
						G = 8'b11111111;
						B = 8'b11111111;
					end 
					// g
					else if ((Y <= gY2) & (X <= gX2) & (Y > gY1) & (X > gX1)) begin
						R = 8'b11111111;
						G = 8'b11111111;
						B = 8'b11111111;
					end 
					// u1
					else if ((Y <= u1Y2) & (X <= u1X2) & (Y > u1Y1) & (X > u1X1)) begin
						R = 8'b11111111;
						G = 8'b00000000;
						B = 8'b00000000;
					end 
					else if ((Y <= u1Y2) & (X <= u1X3) & (Y > u1Y3) & (X > u1X2)) begin
						R = 8'b11111111;
						G = 8'b00000000;
						B = 8'b00000000;
					end 
					else if ((Y <= u1Y2) & (X <= u1X4) & (Y > u1Y1) & (X > u1X3)) begin
						R = 8'b11111111;
						G = 8'b00000000;
						B = 8'b00000000;
					end 
					// u2
					else if ((Y <= u2Y2) & (X <= u2X2) & (Y > u2Y1) & (X > u2X1)) begin
						R = 8'b00000000;
						G = 8'b11111111;
						B = 8'b00000000;
					end 
					else if ((Y <= u2Y2) & (X <= u2X3) & (Y > u2Y3) & (X > u2X2)) begin
						R = 8'b00000000;
						G = 8'b11111111;
						B = 8'b00000000;
					end 
					else if ((Y <= u2Y2) & (X <= u2X4) & (Y > u2Y1) & (X > u2X3)) begin
						R = 8'b00000000;
						G = 8'b11111111;
						B = 8'b00000000;
					end 
					// u3
					else if ((Y <= u3Y2) & (X <= u3X2) & (Y > u3Y1) & (X > u3X1)) begin
						R = 8'b00000000;
						G = 8'b00000000;
						B = 8'b11111111;
					end 
					else if ((Y <= u3Y2) & (X <= u3X3) & (Y > u3Y3) & (X > u3X2)) begin
						R = 8'b00000000;
						G = 8'b00000000;
						B = 8'b11111111;
					end 
					else if ((Y <= u3Y2) & (X <= u3X4) & (Y > u3Y1) & (X > u3X3)) begin
						R = 8'b00000000;
						G = 8'b00000000;
						B = 8'b11111111;
					end 
					else begin
						if ((Y <= 816) & (X <= 1248) & (Y > 800) & (X > 32)) begin
							R = 8'b11111111;
							G = 8'b11111111;
							B = 8'b11111111;
						end
						else begin
							R = 8'b00000000;
							G = 8'b00000000;
							B = 8'b00000000;
						end
					end
				end
			end 
		else begin
			R = 8'b00000000;
			G = 8'b00000000;
			B = 8'b00000000;
		end
	end
endmodule 