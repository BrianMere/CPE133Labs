`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Imported lab 3 adder/subtractor full_adder
//////////////////////////////////////////////////////////////////////////////////


module Full_Adder(
	input A,
	input B,
	input  Cin,
	output S,
	output  Cout
	);
	
	logic Sint, Cout1, Cout2;

	half_adder FA1(
	   .A(A),
	   .B(B),
	   .S(Sint),
	   .Cout(Cout1));
	
	half_adder FA2(
	   .A(Cin),
	   .B(Sint),
	   .S(S),
	   .Cout(Cout2));
	   
	or (Cout, Cout1, Cout2);
	
endmodule
