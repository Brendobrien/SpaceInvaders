module my_tri32(in, oe, out);
		input oe; //put reset back here?
		input [31:0] in;
		output [31:0] out;
		assign out = oe ? in : 32'bz;
endmodule 

module i(iX1, iY1, iX2, iY2);
	input[31:0] iX1, iY1;
	output[31:0] iX2, iY2;

	assign iX2 = iX1 + 32;
	assign iY2 = iY1 + 96;
endmodule 

module u(u1X1, u1Y1, u1X2, u1Y2, u1X3, u1Y3, u1X4);
	input[31:0] u1X1, u1Y1;
	output[31:0] u1X2, u1Y2, u1X3, u1Y3, u1X4;

	assign u1X2 = u1X1 + 32;
	assign u1X3 = u1X1 + 64;
	assign u1X4 = u1X1 + 96;
	assign u1Y2 = u1Y1 + 96;
	assign u1Y3 = u1Y1 + 64;
endmodule 

module g(gX1, gY1, gX2, gY2);
	input[31:0] gX1, gY1;
	output[31:0] gX2, gY2;

	assign gX2 = gX1 + 32;
	assign gY2 = gY1 + 32;
endmodule 