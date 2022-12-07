`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Modified adder module from lab 3
//////////////////////////////////////////////////////////////////////////////////


module Adder9bit(
        input [8:0] A,
        input [8:0] B, 
        input Cin,
        output [8:0] S, 
        output Cout
    );
    
    // local signals
	logic  C1;
	logic  C2;
	logic  C3;
	logic  C4;
	logic  C5;
	logic  C6;
	logic  C7;
	logic  C8;
	

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
	.Cout(C4)
	);
	
	Full_Adder FA4(
	.A(A[4]),
	.B(B[4]),
	.Cin(C4),
	.S(S[4]),
	.Cout(C5)
	);
	
	Full_Adder FA5(
	.A(A[5]),
	.B(B[5]),
	.Cin(C5),
	.S(S[5]),
	.Cout(C6)
	);
	
	Full_Adder FA6(
	.A(A[6]),
	.B(B[6]),
	.Cin(C6),
	.S(S[6]),
	.Cout(C7)
	);
	
	Full_Adder FA7(
	.A(A[7]),
	.B(B[7]),
	.Cin(C7),
	.S(S[7]),
	.Cout(C8)
	);
	
	Full_Adder FA8(
	.A(A[8]),
	.B(B[8]),
	.Cin(C8),
	.S(S[8]),
	.Cout(Cout)
	);

endmodule
