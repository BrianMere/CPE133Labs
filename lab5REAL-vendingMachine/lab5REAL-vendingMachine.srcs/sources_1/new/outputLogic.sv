`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Turns the state logic into our outputs
//////////////////////////////////////////////////////////////////////////////////


module outputLogic(
        input logic [3:0] state,
        output logic V_ok,
        output logic m_signal //NOT THE ACTUAL M!
    );
    
    always_comb begin
        if(state == 4'b1000) begin
            V_ok <= 1;
        end
        else if(state == 4'b1001) begin
            V_ok <= 0;
            m_signal <= 1;
        end
        else
            V_ok <= 0;
            m_signal <= 0; //m_signal stops through the state logic making this happen :)
    end
    
endmodule
