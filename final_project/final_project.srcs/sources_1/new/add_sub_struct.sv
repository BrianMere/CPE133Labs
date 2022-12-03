`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Adder/Subtractor Logic module (modified from lab 3)
//////////////////////////////////////////////////////////////////////////////////


module add_sub_struct(
    input [7:0] A,
    input [7:0] B,
    input sub,
    output [7:0] out,
    output neg
    );
    
    // local signals
    logic Cout;
    logic [7:0] notB;
    logic [8:0] A_in, B_in;
    logic nCout;
    logic [8:0] Bin;
    
    not #0 (notB[0], B[0]);
    not #0 (notB[1], B[1]);
    not #0 (notB[2], B[2]);
    not #0 (notB[3], B[3]);
    not #0 (notB[4], B[4]);
    not #0 (notB[5], B[5]);
    not #0 (notB[6], B[6]);
    not #0 (notB[7], B[7]);
    
    Mux8bit2sel M1(
    .A(B),
    .B(notB),
    .sel(sub),
    .out(Bin));
    
    assign A_in[0] = A[0];
    assign A_in[1] = A[1];
    assign A_in[2] = A[2];
    assign A_in[3] = A[3];
    assign A_in[4] = A[4];
    assign A_in[5] = A[5];
    assign A_in[6] = A[6];
    assign A_in[7] = A[7];
    assign A_in[8] = 0;
    
    assign B_in[0] = Bin[0];
    assign B_in[1] = Bin[1];
    assign B_in[2] = Bin[2];
    assign B_in[3] = Bin[3];
    assign B_in[4] = Bin[4];
    assign B_in[5] = Bin[5];
    assign B_in[6] = Bin[6];
    assign B_in[7] = Bin[7];
    assign B_in[8] = sub;
    
    // instantiate lower-level modules
	Adder9bit A9(
	.A(A_in),//A?
	.B(B_in),
	.Cin(sub),
	.S(out),
	.Cout(Cout)
	);
 
    and #0 (neg, out[7], sub); 
    
endmodule
