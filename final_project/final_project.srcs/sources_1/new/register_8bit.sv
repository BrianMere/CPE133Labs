`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8 bit register
//////////////////////////////////////////////////////////////////////////////////


module register_8bit(
        input clk, 
        input [7:0] data,
        input reset,
        output logic [7:0] q
    );
    
    always_ff @ (posedge clk, posedge reset) begin
        if(reset)
            q <= 8'b00000000;
        else
            q <= data;
    end
    
endmodule
