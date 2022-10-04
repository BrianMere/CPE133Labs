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
        
        w2 = 0; w1 = 0; w0 = 1;
        #10
       
      //add more test cases     
        w2 = 0; w1 = 1; w0 = 1;
        #10

        w2 = 1; w1 = 1; w0 = 0;
        #10

        w2 = 1; w1 = 0; w0 = 1;
        #10
         
        $display("Finished");  
      end                                 
    
endmodule

