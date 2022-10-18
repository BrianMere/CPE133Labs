`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module add_sub_struct(
	input [3:0] A,
	input [3:0] B,
	input subtract, 
	output [3:0] S,
	output neg
	);

	// local signals
	// logic  Cin = 1'b0;
	logic  Cout;
	logic [3:0] notS, notB;
	logic nCout;
	logic [3:0] Bin, Sout;
	
	not (notB[0], B[0]);
	not (notB[1], B[1]);
	not (notB[2], B[2]);
	not (notB[3], B[3]);
	
	
	Mux4bit2sel M1(
	   .A(B),
	   .B(notB),
	   .sel(subtract),
	   .out(Bin));
	   

	// instantiate lower-level modules
	Adder_4bit A4(
	.A(A),
	.B(Bin),
	.Cin(subtract),
	.S(Sout),
	.Cout(Cout)
	);
	
	not (nCout, Cout);
	and (neg, nCout, subtract); 
	
	not (notS[0], Sout[0]);
	not (notS[1], Sout[1]);
	not (notS[2], Sout[2]);
    not (notS[3], Sout[3]);


	
	Mux4bit2sel M2(
	.A(Sout),
	.B(notS),
	.sel(neg),
	.out(S));

endmodule

