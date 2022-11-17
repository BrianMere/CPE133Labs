`timescale 1ns / 1ps

// //////////////////////
// top level module that debounces a button and counts the number
//  of button presses
//  FWD, created 10-17-2022
////
// //////////////////////

module button_db_rev(
	input clk,
	input btnC,
	output logic out
	);

	// local signals
	logic  btn_db;
	logic [1:0] Q;
	
	// debounce switch, resulting in a single pulse
	DEBOUCE_RET  db ( .clk(clk), .rst(0), .btn(btnC), .z(btn_db) );
	
	// instantiate module to limit values
//	CTR3  my_ctr ( .clk(btn_db), .rst(0), .count(Q) );
	
//	assign out[0] = Q[0];
//	assign out[1] = Q[1];

    assign out = btn_db;
	

endmodule

