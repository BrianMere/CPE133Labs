`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 03:18:45 PM
// Design Name: 
// Module Name: lab3-top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab3_top(
    input [3:0] A,
    input [3:0] B,
    input sub,
    output [6:0] numSeg,
    output [6:0] negSeg
    );
    
    logic [3:0] S;
    logic neg;
    
    add_sub_struct ASS(
        .A(A),
        .B(B),
        .subtract(sub),
        .S(S),
        .neg(neg));
    
    num_2_display N2D(
        .S(S),
        .neg(neg),
        .numSeg(numSeg),
        .negSeg(negSeg));
        
    
endmodule
