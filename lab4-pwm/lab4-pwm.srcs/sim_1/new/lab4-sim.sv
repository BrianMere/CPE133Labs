`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2022 02:33:29 PM
// Design Name: 
// Module Name: lab4-sim
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


module lab4_sim(
    );
    
    logic clk, led;
    counter COUNT(.clk(clk), .led(led));
    
    initial begin 
        forever begin
            clk = 0;
            #10 clk = ~clk;
            $display("LED: %b \n", led);
        end 
    end
    
    
endmodule
