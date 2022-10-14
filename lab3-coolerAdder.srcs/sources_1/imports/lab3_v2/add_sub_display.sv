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
	logic notb, nCout, notS;
	logic [3:0] Bin, Sout;
	
	not #0 (notb, B);
	
	Mux4bit2sel M1(
	   .A(B),
	   .B(notb),
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
	
	not #0 (nCout, Cout);
	and #0 (neg, nCout, subtract); 
	
	not #0 (notS, Sout);
	
	Mux4bit2sel M2(
	.A(Sout),
	.B(notS),
	.sel(neg),
	.out(S));
	
	// instantiate module to limit values
//	limit_val my_limit( .S(S), .L(L) );

//	// instantiate module to drive 7-segment display
//	//   (L) is a local signal
//	//   .S  is a signal in the called module
//	seg7 my_seg7( .val(L), .D(D) );
	
	// use digit 0 only. active low
//	assign an = 4'b1110;
	
//	// decimal point off
//	assign dp = 1'b1;

endmodule

