`timescale 1ns / 1ps

////////////////////////
// 
////////////////////////

module Adder_4bit(
	input [3:0] A,
	input [3:0] B,
	input  Cin,
	output [3:0] S,
	output Cout
	);

	// local signals
	logic  C1;
	logic  C2;
	logic  C3;

	// instantiate lower-level modules
	Full_Adder FA0(
	.A(A[0]),
	.B(B[0]),
	.Cin(Cin),
	.S(S[0]),
	.Cout(C1)
	);

	Full_Adder FA1(
	.A(A[1]),
	.B(B[1]),
	.Cin(C1),
	.S(S[1]),
	.Cout(C2)
	);

	Full_Adder FA2(
	.A(A[2]),
	.B(B[2]),
	.Cin(C2),
	.S(S[2]),
	.Cout(C3)
	);

	Full_Adder FA3(
	.A(A[3]),
	.B(B[3]),
	.Cin(C3),
	.S(S[3]),
	.Cout(Cout)
	);

endmodule

