`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Register to hold the current state of the machine :)
//////////////////////////////////////////////////////////////////////////////////


module state_reg(
        input logic clk, 
        input logic reset,
        input logic [3:0] d,
        output logic [3:0] state
    );
    
    always_ff @ (posedge clk, posedge reset) begin
        if(reset) begin
            state <= 4'b0000;
        end
        else begin
            state <= d;
        end
    end
endmodule
