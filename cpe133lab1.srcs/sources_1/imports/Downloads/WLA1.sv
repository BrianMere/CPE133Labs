`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Brian Mere, 
// 
// Create Date: 09/30/2022 12:27:45 PM
// Design Name: WLA_top
// Module Name: WLA1
// Project Name: Lab1
// Target Devices: Basys 3
// Description: Submodule that detects when water level is too low. 
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
    // assign wLOW = (~w1 & ~w2) | (~w0 & ~w2);
    
    logic a1, a2;
 
    // purely structural approach
    and #0 (a1, ~w2, ~w1);
    and #0 (a2, ~w2, ~w0);
    or  #0 (wLOW, a1, a2);
    
endmodule
