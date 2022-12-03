`timescale 1ns / 1ps

////////////////////////
// Limit_val module from lab 3 that turns our neg flag and S values into 
////////////////////////

module limit_val(
	input logic [8:0] S,
	input logic neg,
	output logic [7:0] out    // keyword "logic" must be here!
	);

	// if/else statement
	always_comb
	begin
	   if (neg) begin
	       out = 8'b00000000;
	   end
	   else if (S > 9'b100000001) begin // range for 8 bit numbers is from +129 to 0
	       out = 8'b11111111; //8'b10000001
	   end
	   else begin
	       out[7:0] = S[7:0]; 
	   end          // always include a default case 
	                        // otherwise, verilog will allocate memory to save old value of out
	end

endmodule
