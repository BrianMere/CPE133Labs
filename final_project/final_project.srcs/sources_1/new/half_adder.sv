`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Imported half-adder module (lab 3)
//////////////////////////////////////////////////////////////////////////////////


module half_adder(
    input A,
    input B,
    output S,
    output Cout
    );
    
    xor (S, A, B);
    and (Cout, A, B);
    
endmodule
