`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module add_sub_struct(
	input [3:0] A,
	input [3:0] B,
	input subtract, 
	output [4:0] S,
	output neg
	);

	// local signals
	logic  Cout;
	logic [3:0] notB;
	logic [4:0] A_in, B_in;
	logic nCout;
	logic [4:0] Bin;
	
	not #0 (notB[0], B[0]);
	not #0 (notB[1], B[1]);
	not #0 (notB[2], B[2]);
	not #0 (notB[3], B[3]);
	
	
	Mux4bit2sel M1(
	   .A(B),
	   .B(notB),
	   .sel(subtract),
	   .out(Bin));
	   
    assign A_in[0] = A[0];
	assign A_in[1] = A[1];
	assign A_in[2] = A[2];
	assign A_in[3] = A[3];
	assign A_in[4] = 0;
	
	assign B_in[0] = Bin[0];
	assign B_in[1] = Bin[1];
	assign B_in[2] = Bin[2];
	assign B_in[3] = Bin[3];
	assign B_in[4] = subtract;

	// instantiate lower-level modules
	Adder_5bit A5(
	.A(A),
	.B(B_in),
	.Cin(subtract),
	.S(S),
	.Cout(Cout)
	);
	
	// not (nCout, Cout);
	//and (neg, Cout, subtract); 
    and #0 (neg, S[4], subtract); 

	
//	not (notS[0], Sout[0]);
//	not (notS[1], Sout[1]);
//	not (notS[2], Sout[2]);
//    not (notS[3], Sout[3]);

	
//	Mux4bit2sel M2(
//	.A(Sout),
//	.B(notS),
//	.sel(neg),
//	.out(S));

endmodule

