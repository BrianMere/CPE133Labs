`timescale 1ns / 1ps

// //////////////////////
// top level module that debounces a button and counts the number
//  of button presses
//  FWD, created 10-17-2022
////
// //////////////////////

module push_count(
	input clk,
	input btnC,
	output [2:0] Q
	);

	// local signals
	logic  btn_db;
	
	// debounce switch, resulting in a single pulse
	DEBOUCE_RET  db ( .clk(clk), .rst(0), .btn(btnC), .z(btn_db) );
	
	// instantiate module to limit values
	CTR3  my_ctr ( .clk(btn_db), .rst(0), .count(Q) );

endmodule

