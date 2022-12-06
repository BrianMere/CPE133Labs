`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 4 bit mux selector of 4 potential values
//////////////////////////////////////////////////////////////////////////////////


module Mux4bit4sel(
        input [1:0] sel,
        input [3:0] A,
        input [3:0] B,
        input [3:0] C,
        input [3:0] D,
        output [3:0] out
    );
    
    always_comb begin
        case(sel)
            2'b00: out = A;
            2'b01: out = B;
            2'b10: out = C;
            2'b11: out = D;
        endcase
    end
    
endmodule
