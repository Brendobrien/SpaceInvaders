module VGA(clock, reset, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, X, Y, display);

	input clock, reset;
	output VGA_VS, VGA_HS, VGA_BLANK, VGA_SYNC, display;
	output[31:0] X, Y;

	// CONSTANTS
	wire[31:0] ha, hb, hc, hd, va, vb, vc, vd, hT, vT;
	wire hp, vp;
	
	// 1280x1024
	assign ha = 112; 
	assign hb = 248;
	assign hc = 1280;
	assign hd = 48;
	assign hp = 1'b1;
	assign va = 3;		
	assign vb = 38;
	assign vc = 1024; 
	assign vd = 1;
	assign vp = 1'b1;
	
	// 1440x900
//	assign ha = 152; 
//	assign hb = 232;
//	assign hc = 1440;
//	assign hd = 80;
//	assign hp = 1'b1;
//	assign va = 3;		
//	assign vb = 28;
//	assign vc = 900; 
//	assign vd = 1;
//	assign vp = 1'b1;
	
	
	assign hT = ha + hb + hc + hd;  
	assign vT = va + vb + vc + vd; 
	
	
	assign VGA_SYNC = 1'b0; 
	assign VGA_BLANK = 1'b1;
	assign VGA_HS = hs;
	assign VGA_VS = vs;
	
	reg[31:0] Xcount, X; 
	reg[31:0] Ycount, Y; 

	
	reg hs, vs, blank;
	reg display; 
	
	always @(posedge clock) begin
		if(reset) begin 
			Xcount = 0; 
			Ycount = 0; 
			hs = ~hp; 
			vs = ~vp; 
			display = 1'b0;
			X = 0; 
			Y = 0; 
		end
		
		else if(clock) begin
			
			if (Xcount < (hT-1)) begin
				Xcount = Xcount + 1;
			end else begin
				Xcount = 0;
				
				if(Ycount < (vT-1)) begin
					Ycount = Ycount + 1;
				end else begin
					Ycount = 0;
				end
				
			end
			
		end
		
		if ((Xcount < (hc + hd)) | (Xcount > (hc + hd + ha))) begin
			hs = ~hp; 
		end else begin 
			hs = hp; 
		end 
		
		if ((Ycount < (vc + vd)) | (Ycount > (vc + vd + va))) begin
			vs = ~vp; 
		end else begin 
			vs = vp; 
		end 
		

		if (Xcount < hc) begin 
			X = Xcount;				
		end
		if (Ycount < vc) begin 
			Y = Ycount;				
		end
		
		
		if ((Xcount < hc) & (Ycount < vc)) begin
			display = 1'b1;
		end else begin													  
			display = 1'b0;
		end
		
	end
endmodule 
