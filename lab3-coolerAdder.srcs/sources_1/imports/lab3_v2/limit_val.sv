`timescale 1ns / 1ps

////////////////////////
// 
////////////////////////

module limit_val(
	input logic [3:0] S,
	output logic [3:0] L    // keyword "logic" must be here!
	);

	// if/else statement
	always_comb
	begin
	   if (S > 4'b0011)     // note: S is treated as positive!
	       L = 4'b0011;
	   else
	       L = S;           // always include a default case 
	                        // otherwise, verilog will allocate memory to save old value of L
	end

endmodule

