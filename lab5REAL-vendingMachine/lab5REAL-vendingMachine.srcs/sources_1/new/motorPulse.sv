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
    
    logic [26:0] count; // clk is 100MHz so 10^8 so for 1 second we need to count to 10^8 which is equal to 0x5F5E100
    
    always_ff @ (posedge !clk) begin  //maybe change m_signal
    if (m_signal) begin
        m_pulse <= 1;
    end
    if (m_pulse) begin
	   count <= count + 1;
	end
	if (count[26] ==1) begin
	   count <= 7'h5F5E100;
	   m_pulse <= 0;
	end
    end
    
endmodule
