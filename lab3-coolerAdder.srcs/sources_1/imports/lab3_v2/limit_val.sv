`timescale 1ns / 1ps

////////////////////////
// Turn a positive number into to limit to range 0-9
////////////////////////

module limit_val(
	input logic [4:0] S,
	input logic neg,
	output logic [3:0] out    // keyword "logic" must be here!
	);

	// if/else statement
	always_comb
	begin
	   if (neg)
	       out = 4'b0000;
	   else if (S > 5'b01001)
	       out = 4'b1001;
//	   if (~neg & S > 4'b1001)     // note: S is treated as positive! We want to see S > 9 ~ S > 8
//	       out = 4'b1001;
//	   else if (neg & S > 4'b1000) // S is given as the S + 1 version, S + 1 > 9 so S > 8
//	       out = 4'b1001;
	   else
	       out = S[3:0];           // always include a default case 
	                        // otherwise, verilog will allocate memory to save old value of out
	end

endmodule

