`timescale 1ns / 1ps

////////////////////////
// 
////////////////////////

module seg7(
	input logic [3:0] val,
	output logic [6:0] D       // keyword "logic" must be here!
	);

	// case statement
	always_comb
	begin
	   case(val)
	       4'b0000: D = 7'b0111111;
	       4'b0001: D = 7'b1011111;
	       4'b0010: D = 7'b1101111;
	       4'b0011: D = 7'b0110000;
	       default: D = 7'b1111111;    // always include default case!
	   endcase 
	end

endmodule

