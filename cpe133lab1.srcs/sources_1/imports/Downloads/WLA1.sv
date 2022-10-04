`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Dr D
// 
// Create Date: 09/30/2022 12:27:45 PM
// Design Name: 
// Module Name: WLA1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: LOW water level 
// 
//////////////////////////////////////////////////////////////////////////////////


module WLA1(
    input w2,
    input w1,
    input w0,
    output wLOW
    );
    
    // define logic for low water module level 
    assign wLOW = (~w1 & ~w2) | (~w0 & ~w2);
 
    // purely structural approach
    and #3 (a1, w2, w1, w0);
    and #3 (a2, ~w2, w1, ~w0);
    or  #3 (wLOW, a1, a2);
    
endmodule
