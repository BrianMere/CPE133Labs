`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2022 02:34:55 PM
// Description: Dummy circuit to practice Vivado
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab0(
    input A,
    input B,
    input C,
    output Q
    );
    
    assign Q = ~(A|B)|(C&B);
    
endmodule
