`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 03:43:52 PM
// Design Name: 
// Module Name: motorPulse
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


module motorPulse(
        input m_signal,
        input clk,
        output logic m_pulse
    );
    
    logic [24:0] count;
    
    always_ff @ (posedge !clk) begin  //maybe change m_signal
    if (m_signal) begin
        m_pulse <= 1;
    end
    if (m_pulse) begin
	   count <= count + 1;
	end
	if (count[24] ==1) begin
	   count <= 25'b0;
	   m_pulse <= 0;
	end
    end
    
endmodule
