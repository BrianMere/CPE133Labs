`timescale 1ns / 1ps

// //////////////////////
// top level module that uses T F/F to divide a clock frequency by 2^24
//  FWD, created 10-17-2022
////
// //////////////////////

module counter(
	input clk,
	input reset, 
	output [3:0] count
	);

	// local signals
	logic  f1,f2,f3,f4;
//	logic  f5,f6,f7,f8,f9,f10;
//	logic  f11,f12,f13,f14,f15,f16,f17,f18,f19,f20;
//	logic  f21,f22,f23;
	logic  R = reset;
//	logic led0;
	
	// instantiate module to limit values
	TFF  tff1 ( .clk(clk), .rst(R), .q(f1) );
	TFF  tff2 ( .clk(f1), .rst(R), .q(f2) );
	TFF  tff3 ( .clk(f2), .rst(R), .q(f3) );
	TFF  tff4 ( .clk(f3), .rst(R), .q(f4) );
//	TFF  tff5 ( .clk(f4), .rst(R), .q(f5) );
//	TFF  tff6 ( .clk(f5), .rst(R), .q(f6) );
//	TFF  tff7 ( .clk(f6), .rst(R), .q(f7) );
//	TFF  tff8 ( .clk(f7), .rst(R), .q(f8) );
//	TFF  tff9 ( .clk(f8), .rst(R), .q(f9) );
//	TFF  tff10 ( .clk(f9), .rst(R), .q(f10) );

//	TFF  tff11 ( .clk(f10), .rst(R), .q(f11) );
//	TFF  tff12 ( .clk(f11), .rst(R), .q(f12) );
//	TFF  tff13 ( .clk(f12), .rst(R), .q(f13) );
//	TFF  tff14 ( .clk(f13), .rst(R), .q(f14) );
//	TFF  tff15 ( .clk(f14), .rst(R), .q(f15) );
//	TFF  tff16 ( .clk(f15), .rst(R), .q(f16) );
//	TFF  tff17 ( .clk(f16), .rst(R), .q(f17) );
//	TFF  tff18 ( .clk(f17), .rst(R), .q(f18) );
//	TFF  tff19 ( .clk(f18), .rst(R), .q(f19) );
//	TFF  tff20 ( .clk(f19), .rst(R), .q(f20) );

//	TFF  tff21 ( .clk(f20), .rst(R), .q(f21) );
//	TFF  tff22 ( .clk(f21), .rst(R), .q(f22) );
//	TFF  tff23 ( .clk(f22), .rst(R), .q(f23) );
//	TFF  tff24 ( .clk(f23), .rst(R), .q(led0) );

    assign count[0] = f1;
    assign count[1] = f2;
    assign count[2] = f3;
    assign count[3] = f4;

endmodule

