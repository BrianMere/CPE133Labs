`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module add_sub_display(
	input [3:0] A,
	input [3:0] B,
	output [3:0] S,
	output [6:0] D,
	output [3:0] an,
	output dp
	);

	// local signals
	logic  Cin = 1'b0;
	logic  Cout;

	// instantiate lower-level modules
	Adder_4bit A4(
	.A(A),
	.B(B),
	.Cin(Cin),
	.S(S),
	.Cout(Cout)
	);
	
	logic [3:0] L;
	
	// instantiate module to limit values
	limit_val my_limit( .S(S), .L(L) );

	// instantiate module to drive 7-segment display
	//   (L) is a local signal
	//   .S  is a signal in the called module
	seg7 my_seg7( .val(L), .D(D) );
	
	// use digit 0 only. active low
	assign an = 4'b1110;
	
	// decimal point off
	assign dp = 1'b1;

endmodule

