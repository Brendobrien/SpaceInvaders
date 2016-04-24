module ultrasound(clk_in, clk_out
, increment, transmit, receive
, clk_5M
, z_on, markers
, reset_in, reset_out
, on_in, on_out
);
	input clk_in, reset_in, on_in;
	output clk_out, reset_out, on_out;
	output increment, transmit, receive
	, z_on, markers
	;
	output clk_5M;
	
	// debug inputs
	assign clk_out = clk_in;
	assign reset_out = reset_in;
	assign on_out = on_in;
	
	clk_div MHz5(clk_in, 1'b0, clk_5M);
//	FSM bme(clk_5M, increment, transmit, receive, resetDisplay);
//	FSMv2 bme464(clk_5M, increment, transmit, receive, z_on, markers);
	FSMv3 mvp(clk_5M, on_in, ~reset_in, increment, transmit, receive, z_on, markers);
	
endmodule 

module FSM(clock, increment, transmit, receive, resetDisplay);
	input clock;
	output increment, transmit, receive, resetDisplay;
	wire S1, S0, resetCounter, resetCounterNextCycle, NS1, NS0;

	wire counterIs0, delayIncrement, delayTransmit, delayReceive;  // will be 1 when true
	wire [31:0] count;
	
	// set up counter
	counterBME counter(clock, resetCounter, count);
	
	// set up DFFs for S0 and S1
	dffe S1_dff(.d(NS1), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(S1));
	dffe S0_dff(.d(NS0), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(S0));
	
	// set up reset clock DFF (delay 1 cycle)
	dffe resetCtr_dff(.d(resetCounterNextCycle), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(resetCounter));
	
	// assign controls
	assign counterIs0 = (count == 0);
	assign delayIncrement = (count == 8);
	assign delayTransmit = (count == 2);
	assign delayReceive = (count == 4);
	
	// next state calculation	
	assign NS1 = (~S1 & S0 & delayTransmit) | (S1 & ~S0 & ~delayReceive);
	assign NS0 = (~S1 & ~S0 & delayIncrement) | (~S1 & S0 & ~delayTransmit);
	
	// reset clock calculation
	assign resetCounterNextCycle = (~S1 & ~S0 & delayIncrement) | (~S1 & S0 & delayTransmit) | (S1 & ~S0 & delayReceive);
	
	// output signals calculation
	assign increment = ~S1 & ~S0 & counterIs0;
	assign transmit = ~S1 & S0 & counterIs0;
	assign receive = S1 & ~S0;
	assign resetDisplay = S1 & ~S0 & counterIs0;	
endmodule

module counterBME(clock, reset, out);
	input clock, reset;
	output [31:0] out;
	
	dffe counter_dff_initial(.d(~out[0]), .clk(clock), .clrn(!reset), .prn(1'b1), .ena(1'b1), .q(out[0]));
	
	genvar i;
	generate
		for (i=1; i<32; i=i+1) begin: generateCounter
			dffe counter_dff(.d(~out[i]), .clk(~out[i-1]), .clrn(!reset), .prn(1'b1), .ena(1'b1), .q(out[i]));
		end
	endgenerate	

endmodule

module clk_div 
#( 
parameter WIDTH = 3, // Width of the register required
parameter N = 5// We will divide by 12 for example in this case]
)
(clk,reset, clk_out);
 
	input clk;
	input reset;
	output clk_out;
	 
	reg [WIDTH-1:0] r_reg;
	wire [WIDTH-1:0] r_nxt;
	reg clk_track;
	 
	always @(posedge clk or posedge reset)
	 
	begin
	  if (reset)
		  begin
			  r_reg <= 0;
		clk_track <= 1'b0;
		  end
	 
	  else if (r_nxt == N)
			begin
			  r_reg <= 0;
			  clk_track <= ~clk_track;
			end
	 
	  else 
			r_reg <= r_nxt;
	end
	 
	 assign r_nxt = r_reg+1;   	      
	 assign clk_out = clk_track;
endmodule

module FSMv2(clock, increment, transmit, receive, z_on, markers);
    input clock;
    output increment, transmit, receive, z_on, markers;
    
	 wire S1, S0, resetCounter, resetCounterNextCycle, NS1, NS0;
    wire counterIs0, delayIncrement, delayTransmit, delayReceive;  // will be 1 when true
    wire [31:0] count;
    
    // set up counter
    counterBME counter(clock, resetCounter, count);
    
    // set up DFFs for S0 and S1
    dffe S1_dff(.d(NS1), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(S1));
    dffe S0_dff(.d(NS0), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(S0));
    
    // set up reset clock DFF (delay 1 cycle)
    dffe resetCtr_dff(.d(resetCounterNextCycle), .clk(clock), .clrn(1'b1), .prn(1'b1), .ena(1'b1), .q(resetCounter));
    
    // assign controls
    assign counterIs0 = (count == 0);
    assign delayIncrement = (count == 20000);
    assign delayTransmit = (count == 15);
    assign delayReceive = (count == 2000);
    
    // next state calculation    
    assign NS1 = (~S1 & S0 & delayTransmit) | (S1 & ~S0 & ~delayReceive);
    assign NS0 = (~S1 & ~S0 & delayIncrement) | (~S1 & S0 & ~delayTransmit);
    
    // reset clock calculation
    assign resetCounterNextCycle = (~S1 & ~S0 & delayIncrement) | (~S1 & S0 & delayTransmit) | (S1 & ~S0 & delayReceive);
    
    // output signals calculation
    assign increment = ~S1 & ~S0 & (count == 0);
    assign transmit = ~S1 & S0 & (count == 0);
    assign receive = S1 & ~S0;
    assign z_on = S1 & ~S0 & (count >= 65); // 65 = time to move one cm
    assign markers = S1 & ~S0 & ((count % 65) == 0) & (count != 0);  // every 65 cycles (1 cm), 1 pulse    
endmodule 

module FSMv3(clockIn, on, reset, increment, transmit, receive, z_on, markers);
    input clockIn, on, reset;
    output increment, transmit, receive, z_on, markers;
    
	 wire S1, S0, resetCounter, resetCounterNextCycle, NS1, NS0;
    wire counterIs0, delayIncrement, delayTransmit, delayReceive;  // will be 1 when true
    wire [31:0] count;
    
    // set up counter
    counterBME counter(clock, resetCounter | reset, count);
    
	 // only run clock when machine is on
	 wire clock;
	 assign clock = clockIn & on;
	 
    // set up DFFs for S0 and S1
    dffe S1_dff(.d(NS1), .clk(clock), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(S1));
    dffe S0_dff(.d(NS0), .clk(clock), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(S0));
    
    // set up reset clock DFF (delay 1 cycle)
    dffe resetCtr_dff(.d(resetCounterNextCycle), .clk(clock), .clrn(~reset), .prn(1'b1), .ena(1'b1), .q(resetCounter));
    
    // assign controls
    assign counterIs0 = (count == 0);
    assign delayIncrement = (count == 20000);
    assign delayTransmit = (count == 15);
    assign delayReceive = (count == 2000);
    
    // next state calculation    
    assign NS1 = (~S1 & S0 & delayTransmit) | (S1 & ~S0 & ~delayReceive);
    assign NS0 = (~S1 & ~S0 & delayIncrement) | (~S1 & S0 & ~delayTransmit);
    
    // reset clock calculation
    assign resetCounterNextCycle = (~S1 & ~S0 & delayIncrement) | (~S1 & S0 & delayTransmit) | (S1 & ~S0 & delayReceive);
    
    // output signals calculation
    assign increment = ~S1 & ~S0 & (count == 0);
    assign transmit = ~S1 & S0 & (count == 0);
    assign receive = S1 & ~S0;
    assign z_on = S1 & ~S0 & (count >= 65); // 65 = time to move one cm
    assign markers = S1 & ~S0 & ((count % 65) == 0) & (count != 0);  // every 65 cycles (1 cm), 1 pulse    
endmodule 