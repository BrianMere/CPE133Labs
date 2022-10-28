`timescale 1ns / 1ps

// //////////////////////
// A T-flip/flop, or toggle flip/flop that changes state with every rising edge 
//   of the clock. reset input is included
//  FWD, created 10-17-2022
//
//  TFF  my_tff ( .clk(clk), .rst(R), .q(Q) );
//
// //////////////////////

//--//
module TFF(
	input logic clk,
	input logic rst,
	output logic q
	);

	// change state on the rising edge of the clock
	always_ff @ ( posedge clk , posedge rst )
	begin
	   if (rst)
	       q <= 1'b0;
	   else if (q)
	       q <= 1'b0;
	   else
	       q <= 1'b1;
	end

endmodule

