`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 02:39:32 PM
// Design Name: 
// Module Name: 4bit2selMux
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


module Mux4bit2sel(
    input [3:0] A,
    input [3:0] B,
    input sel,
    output [3:0] out
    );
    
    logic [3:0] sel4;
    logic out1, out2;
    
    assign sel4[0] = sel;
    assign sel4[1] = sel;
    assign sel4[2] = sel;
    assign sel4[3] = sel; 
    
    assign out1 = A & ~(sel);
    
    assign out2 = B & sel;
    
    assign out = out1 | out2;
    
endmodule
