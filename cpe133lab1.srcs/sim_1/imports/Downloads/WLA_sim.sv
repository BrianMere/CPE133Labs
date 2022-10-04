`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2022 12:51:32 PM
// Design Name: 
// Module Name: WLA_sim
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




module WLA_sim; //no ports to test module

    //declare inputs and outputs to give to your module
    //can be the same names as the ports of the module under test
    logic w2, w1, w0; 
    logic wHIGH, wLOW;
    
    //Instantiate your module undertest
    WLA_top wla0 (  .w2(w2), .w1(w1), .w0(w0), .wHIGH(wHIGH), .wLOW(wLOW)  );

    //list your test cases
    initial 
        begin
        w2 = 0; w1 = 0; w0 = 0;
        #10
        if (wHIGH != 0 | wLOW != 1) $display("Test case 1 failed!");
        
        w2 = 0; w1 = 0; w0 = 1;
        #10
        if (wHIGH != 0 | wLOW != 1) $display("Test case 2 failed!");
        
        w2 = 0; w1 = 1; w0 = 0;
        #10
        if (wHIGH != 0 | wLOW != 1) $display("Test case 3 failed!");
        
        w2 = 0; w1 = 1; w0 = 1;
        #10
        if (wHIGH != 0 | wLOW != 0) $display("Test case 4 failed!");
        
        w2 = 1; w1 = 0; w0 = 0;
        #10
        if (wHIGH != 0 | wLOW != 0) $display("Test case 5 failed!");
        
        w2 = 1; w1 = 0; w0 = 1;
        #10
        if (wHIGH != 0 | wLOW != 0) $display("Test case 6 failed!");
        
        w2 = 1; w1 = 1; w0 = 0;
        #10
        if (wHIGH != 1 | wLOW != 0) $display("Test case 7 failed!");
        
        w2 = 1; w1 = 1; w0 = 1;
        #10
        if (wHIGH != 1 | wLOW != 0) $display("Test case 8 failed!");
         
        $display("Finished testing!");  
      end                                 
    
endmodule

