`timescale 1ns / 1ps

////////////////////////
// 
////////////////////////

module seg7(
	input logic [3:0] val,
	output logic [6:0] D       // keyword "logic" must be here! a is MSB, g is LSB. Tie D to 0 for 7 seg.
	);

	// case statement
	always_comb
	begin
	   case(val)
	       4'b0000: D = 7'b0000001;
	       4'b0001: D = 7'b1001111;
	       4'b0010: D = 7'b0010101;
	       4'b0011: D = 7'b0000110;
	       4'b0100: D = 7'b1001100;
	       4'b0101: D = 7'b0100101;
	       4'b0110: D = 7'b1100000;
	       4'b0111: D = 7'b0001111;
	       4'b1000: D = 7'b0000000;
	       4'b1001: D = 7'b0000100;
	       default: D = 7'b1111111;    // always include default case! For our case have it be off. 
	   endcase 
	end

endmodule

