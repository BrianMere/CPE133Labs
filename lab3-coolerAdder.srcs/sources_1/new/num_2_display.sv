`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 02:53:21 PM
// Design Name: 
// Module Name: num_2_display
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


module num_2_display(
    input [3:0] S,
    input neg,
    output [6:0] numSeg,
    output [6:0] negSeg
    );
    
    logic [3:0] LimitOut;
    
    limit_val L(
        .S(S),
        .neg(neg),
        .out(LimitOut));
    
    seg7 S7(
        .val(LimitOut),
        .D(numSeg));
        
    negSeg NS(
        .neg(neg),
        .out(negSeg));
        
    
    
endmodule
