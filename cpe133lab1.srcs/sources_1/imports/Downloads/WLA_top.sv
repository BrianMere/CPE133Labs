`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Brian Mere, 
// 
// Create Date: 09/30/2022 12:27:45 PM
// Design Name: WLA_top
// Module Name: WLA_top
// Project Name: Lab1
// Target Devices: Basys 3
// Description: Submodule that detects when water level is too high AND too low. 
// Revision 0.01 - File Created
// Additional Comments: LOW water level 
// 
//////////////////////////////////////////////////////////////////////////////////


module WLA_top(
    input w2,
    input w1,
    input w0,
    output wHIGH,
    output wLOW
    );
    
    WLA1 m1 ( .w2(w2), .w1(w1), .w0(w0), .wLOW(wLOW) );
    WLA2 m2 ( .w2(w2), .w1(w1), .w0(w0), .wHIGH(wHIGH) );
    
endmodule
