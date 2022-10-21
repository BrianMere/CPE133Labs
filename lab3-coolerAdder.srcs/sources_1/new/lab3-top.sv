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
    input clk,
    input [3:0] A,
    input [3:0] B,
    input sub,
    output reg [6:0] numSeg,
    output reg [3:0] an
    );
    
    logic [4:0] S;
    logic [6:0] ourNumSeg, ourNegSeg;
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
        .numSeg(ourNumSeg),
        .negSeg(ourNegSeg));
        
//    assign an = 4'b1110;
//    assign numSeg = ourNumSeg;
        
    bit displayRightDigit = 1'b0;
        
    always @ (posedge clk) begin // run this on the rising edge of the clk signal given by the basys 3 board
        if(displayRightDigit) begin
            an = 4'b1110; // Turn on specific displays (remember, on when LOW)
            numSeg = ourNumSeg;
        end
        else begin
            an = 4'b1101;
            numSeg = ourNegSeg;
        end
        displayRightDigit = ~displayRightDigit;
    end
        
    
endmodule
