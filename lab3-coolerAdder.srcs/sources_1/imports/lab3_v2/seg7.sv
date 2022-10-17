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
	       4'b0000: D = 7'b0000001; //0
	       4'b0001: D = 7'b1001111; //1
	       4'b0010: D = 7'b0010010; //2
	       4'b0011: D = 7'b0000110; //3
	       4'b0100: D = 7'b1001100; //4
	       4'b0101: D = 7'b0100100; //5
	       4'b0110: D = 7'b0100000; //6
	       4'b0111: D = 7'b0001111; //7
	       4'b1000: D = 7'b0000000; //8
	       4'b1001: D = 7'b0000100; //9
	       default: D = 7'b1111111;    // always include default case! For our case have it be off. 
	   endcase 
	end

endmodule

