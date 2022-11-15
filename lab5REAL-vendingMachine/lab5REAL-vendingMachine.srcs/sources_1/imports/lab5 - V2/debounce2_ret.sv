`timescale 1ns / 1ps

// //////////////////////
// DEBOUCE provides button debounce
//  Button ("btn") must be pressed continually for 10^6 clock cycles
//  (following any intermittent behavior of the button)
//  In this design the output consists of a single pulse that is one clock 
//    cycle in duration - Hence one rising edge
//
//  by FWD and students in CPE 133-07 in Fall 2022
//  Prior: This module will output one clock cycle per button press "cycle". Holding the button will output many smaller pulses.
//  We've modified this code as to only put out ONE clock cycle per button press. Holding the button should only pulse once and only once. 
//
//  DEBOUCE_RET  db ( .clk(clk), .rst(rst), .btn(btn), .z(z) );
//
// //////////////////////

module DEBOUCE_RET(
	input logic clk,
	input logic rst,
	input logic btn,
	output logic z
	);

	// store 24 bit count
	//  for 100Mhz clock, 24'ha00000 delays ~1 sec  
	//  (note this means a 24 bit value, 
	//    and the "h" means the number is specified in hex)
	logic [23:0] count;
	
	// flag logic for button being held 
	logic held;
	
	// change state on the rising edge of the clock
	always_ff @ ( posedge clk , posedge rst )
	begin
	
		// go to RESET state
		if (rst)
		begin
			count <= 0;
			z <= 0;
			held <= 0;
		end
		
		// button pressed
		else if (btn)
		begin
		
			// COUNTING state
			if (count < 24'ha00000 & !held)
			begin
				count <= count + 1;
				z <= 0;
			end
			
			// MAX_COUNT reached
			//  clear output, providing a pulse that is one clock cycle
			else
			begin
				count <= 0;
				z <= 1;
				held <= 1;
			end
		end
		
		// btn released or intermittent btn signal or count reached and cleared.
		//  go to RESET state
		else
		begin
			count <= 0;
			z <= 0;
			held <= 0;
		end
		
	end

endmodule