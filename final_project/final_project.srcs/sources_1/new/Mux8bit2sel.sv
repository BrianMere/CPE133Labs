`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Modified MUX from lab 3 (for adder/subtractor)
//////////////////////////////////////////////////////////////////////////////////


module Mux8bit2sel(
    input [7:0] A,
    input [7:0] B,
    input sel,
    output [7:0] out
);

    logic [7:0] sel8;
    logic [7:0] out1, out2;
    logic [7:0] nSel;
    
    assign sel8[0] = sel;
    assign sel8[1] = sel;
    assign sel8[2] = sel;
    assign sel8[3] = sel;
    assign sel8[4] = sel;
    assign sel8[5] = sel;
    assign sel8[6] = sel;
    assign sel8[7] = sel;
    
    assign nSel = ~sel8;
    assign out1 = A & nSel;
    assign out2 = B & sel8;
    assign out = out1 | out2;
    
endmodule
