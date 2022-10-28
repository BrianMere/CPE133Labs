`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2022 02:50:40 PM
// Design Name: 
// Module Name: max_counter
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


module max_counter(
    input clk,
    input reset,
    input [3:0] max,
    output out
    );
    
    logic [3:0] count;
    
    counter CNT(.clk(clk), .reset(reset), .count(count));
    comparator CMP(.A(A), .B(count), .out(out));
    
endmodule
