`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2022 12:27:45 PM
// Design Name: 
// Module Name: WLA2
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


module WLA2(
    input w2,
    input w1,
    input w0,
    output wHIGH
    );
    
    logic a1,a2;
    
    // define logic for low water module level 
    
    // purely structural approach
    and #3 (a1, w2, w1, w0);
    and #3 (a2, ~w2, w1, ~w0);
    or  #3 (wHIGH, a1, a2);

endmodule
