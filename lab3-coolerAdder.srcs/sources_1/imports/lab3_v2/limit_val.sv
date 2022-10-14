`timescale 1ns / 1ps

////////////////////////
// Turn a positive number into to limit to range 0-9
////////////////////////

module limit_val(
	input logic [3:0] S,
	output logic [3:0] out    // keyword "logic" must be here!
	);

	// if/else statement
	always_comb
	begin
	   if (S > 4'b1001)     // note: S is treated as positive!
	       out = 4'b1001;
	   else
	       out = S;           // always include a default case 
	                        // otherwise, verilog will allocate memory to save old value of L
	end

endmodule

