`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 03:45:15 PM
// Design Name: 
// Module Name: adder-wrapper
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


module adder_wrapper(
       input[3:0] A,
       input[3:0] B,
       input Oflow, 
       output[3:0] S,
       output[3:0] Cout
    );
    
    logic [3:0] S_int; 
    logic O_int;
    
    Adder_4bit Adder(
        .A(A),
        .B(B),
        .S(S_int),
        .Cout(Cout),
        .Cin(0));
        
    and #0 (O_int, Cout, Oflow);
    or #0 (S[0], S_int[0], O_int);
    or #0 (S[1], S_int[1], O_int);
    or #0 (S[2], S_int[2], O_int);
    or #0 (S[3], S_int[3], O_int);
    
      
endmodule
