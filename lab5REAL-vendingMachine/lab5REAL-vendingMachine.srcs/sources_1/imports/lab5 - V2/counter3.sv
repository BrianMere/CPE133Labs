`timescale 1ns / 1ps

// //////////////////////
// A 3-bit counter that increments on every rising edge 
//   of the clock. reset input is included
//  FWD, created 10-17-2022
//
//  CTR3  my_ctr ( .clk(clk), .rst(R), .count(Q) );
//
// //////////////////////

//--//
module CTR3(
	input logic clk,
	input logic rst,
	output logic [2:0] count
	);

	// change state on the rising edge of the clock
	always_ff @ ( posedge clk , posedge rst )
	begin
	   if (rst)
	       count <= 3'b000;
       else
	       count <= count + 1;
	end

endmodule

