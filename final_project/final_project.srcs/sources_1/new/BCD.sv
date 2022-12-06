`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Takes an 8-bit binary number and outputs 4, 4-bit buses that represent the digits of the decimal number
//
// A should be the MSB, while D is the LSB
//////////////////////////////////////////////////////////////////////////////////


module BCD(
        input [7:0] b_num,
        output [4:0] A,
        output [4:0] B,
        output [4:0] C,
        output [4:0] D
    );
    
    //TODO: make the BCD more of an FSM than anything else atm
    
    logic m_val = b_num;
    
    assign D = b_num % 10;
    assign m_val = m_val / 10;
    assign C = b_num % 10;
    assign m_val = m_val / 10;
    assign B = b_num % 10;
    assign m_val = m_val / 10;
    assign A = b_num % 10;
    
endmodule
