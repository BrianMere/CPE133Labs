`timescale 1ns / 1ps

// //////////////////////
// DEBOUCE provides button debounce
//  Button ("btn") must be pressed continually for 10^6 clock cycles
//  (following any intermittent behavior of the button)
//  In this design the output will remain high as long as the 
//    button remains pressed (following the delay for debounce)
//
//  by FWD and students in CPE 133-07 in Fall 2022
//  Note, this was not designed using the perspective of a state machine.
//   Nevertheless, some states are suggested below, as an after thought,
//   for comparative purposes. HaHa! A force-fit?
//
//  DEBOUCE  db ( .clk(clk), .rst(rst), .btn(btn), .z(z) );
//
// //////////////////////

module DEBOUCE(
	input logic clk,
	input logic rst,
	input logic btn,
	output logic z
	);

	// store 24 bit count
	//  for 100Mhz clock, 6'ha00000 delays ~1 sec
	logic [23:0] count;
	
	// change state on the rising edge of the clock
	always_ff @ ( posedge clk , posedge rst )
	begin
	
		// go to RESET state
		if (rst)
		begin
			count <= 0;
			z <= 0;
		end
		
		// stay in COUNTING state if btn pressed
		else if (btn)
		begin
			count <= count + 1;
			z <= 0;
		end
		
		// btn released or intermittent btn signal. go to RESET state
		else
		begin
			count <= 0;
			z <= 0;
		end
		
		/////////
		// if in COUNTING state and count > threshold
		//  then limit count and set output
		if (count > 6'ha00000)
		begin
			count <= 6'ha00000;  // avoids wrap around
			z <= 1;
		end

	end

endmodule

