`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 03:13:30 PM
// Design Name: 
// Module Name: negSeg
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


module negSeg(
    input logic neg,
    output logic [6:0] out
    );
    
    always_comb
    begin
        case(neg)
            1'b1: out = 7'b1111110;
            default: out = 7'b1111111;
        endcase
    end
endmodule
