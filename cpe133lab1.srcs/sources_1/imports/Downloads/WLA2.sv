`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Brian Mere, 
// 
// Create Date: 09/30/2022 12:27:45 PM
// Design Name: WLA_top
// Module Name: WLA2
// Project Name: Lab1
// Target Devices: Basys 3
// Description: Submodule that detects when water level is too high. 
// Revision 0.01 - File Created
// Additional Comments: LOW water level 
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
    // assign wHIGH = (w1 & w2); 
    
    // purely structural approach
    and #0 (wHIGH, w1, w2);

endmodule
