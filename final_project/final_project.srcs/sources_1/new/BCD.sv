`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Takes an 8-bit binary number and outputs 4, 4-bit buses that represent the digits of the decimal number
//
// A should be the MSB, while D is the LSB
//////////////////////////////////////////////////////////////////////////////////


module BCD(
        input [7:0] b_num,
        input clk,
        output logic [4:0] A,
        output logic [4:0] B,
        output logic [4:0] C,
        output logic [4:0] D
    );
    
    logic [7:0] m_val = 8'b00000000; // by default we'll make m_val just be 0 ...
    logic [1:0] counter = 2'b00;
    const logic [4:0] BASE = 4'b1010; // BASE is the base we wanna convert to from binary. For decimal use 10.
    
    always_ff @ (posedge clk) begin
        
        if(counter == 2'b00) begin
            m_val <= b_num / BASE; // 3
            D <= b_num % BASE; // 1
        end
        else if (counter == 2'b01) begin
            m_val <= m_val / BASE; // 0
            C <= m_val % BASE; // 3
        end
        else if (counter == 2'b10) begin
            m_val <= m_val / BASE;
            B <= m_val % BASE;
        end
        else if (counter == 2'b11) begin
            m_val <= m_val / BASE;
            A <= m_val % BASE;
            counter <= 2'b00;
        end
        
        counter <= counter + 1;
    end
    
endmodule
