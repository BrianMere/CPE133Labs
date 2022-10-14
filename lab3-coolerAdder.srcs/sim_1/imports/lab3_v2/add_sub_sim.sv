`timescale 1ns / 1ps

////////////////////////
// This file was automatically generated by CATE
// Comments and Notes: 
////////////////////////

module add_sub_display_sim; //no ports to test module

    // declare inputs and outputs for your module
    // can be the same names as the ports of the module under test
    logic [3:0] A;
    logic [3:0] B;
    logic sub;
    logic [6:0] numSeg;
    logic [6:0] negSeg;
    
    //Instantiate your module undertest
    lab3_top TOP(  .A(A), .B(B), .sub(sub), .numSeg(numSeg), .negSeg(negSeg)  );

    //list your test cases
    initial 
        begin
        
        $display("Begin Testing...");
        
        A = 4'b0000; B = 4'b0001; sub = 1'b0; // 0 - 1 = -1
        #10
        
        
        A = 4'b1111; B = 4'b0001;
        #10

        A = 4'b0011; B = 4'b0001;
        #10

       $display("Finished");  
      end  
      
//      function test(reg [3:0] A, reg [3:0] B, reg sub) 
//      begin
//        if(numSeg 
//      end                          
    
endmodule

