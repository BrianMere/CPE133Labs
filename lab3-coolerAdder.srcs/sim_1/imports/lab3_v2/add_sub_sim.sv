`timescale 1ns / 1ps

////////////////////////
// This file was automatically generated by CATE
// Comments and Notes: 
////////////////////////

module add_sub_display_sim; //no ports to test module

    // declare inputs and outputs for your module
    // can be the same names as the ports of the module under test
    logic [3:0] A, B, S;
    // logic Cout, Cin;
    logic sub, neg;
//    logic [6:0] numSeg;
//    logic [6:0] negSeg;
    
    //Instantiate your module undertest
//    lab3-top TOP(.clk(
    add_sub_struct ASStruct(.A(A), .B(B), .subtract(sub), .S(S), .neg(neg));

    //list your test cases
    initial 
        begin
        
        $display("Begin Testing...");
        
        test(4'b0001, 4'b1111, 1'b1); // 1 - 15 = -14
        #1
        test(4'b0000, 4'b0101, 1'b1); // 0 - 5 = -5
        #1
        test(4'b1001, 4'b1001, 1'b0);
        #1
        test(4'b1111, 4'b1111, 1'b1);
        #1
        test(4'b1111, 4'b1110, 1'b0);
        #1
        test(4'b0001, 4'b0000, 1'b0);
        #1
        test(4'b0000, 4'b0000, 1'b1);
        

       $display("Finished");  
      end  
      
      function void test(reg[3:0] X, reg [3:0] Y, reg Z);
      A = X;
      B = Y;
      sub = Z;
        if(Z & S != X - Y | ~Z & S != X + Y)
            $display("Issue");
        if(Z & X > Y & ~neg | Z & X < Y & neg)
            $display("Neg issue");
      endfunction
      
      // function void test(reg [3:0] A, reg [3:0] B, reg sub);
      
      //Adder Tests
//      if(sub & S != A - B)
//        begin
//            printFailedTest("Failed Test on Adder_4bit");
//        end  
//      else if (~sub & S != A + B)
//        begin
//            printFailedTest("Failed Test on Adder_4bit");
//        end 
        
      //Display Tests
      
//      if(neg)
//        begin
//            if(numSeg != )
//        end
      // endfunction
      
//      function void printFailedTest(string message);
//        $display("Test Failed: \n"); 
//        $display("\tInputs: A = %b, B = %b, sub = %b", A, B, sub);
//        $display("\tOutputs: S = %b, neg = %b, numSeg = %b, negSeg = %b", S, neg, numSeg, negSeg);
//      endfunction   
      
//      function bit get7SegFromNum(reg [3:0] S, reg neg);
//      begin
//        int S_local;
//        if(S > 9)
//        begin
//            S_local = 9;
//        end
//        case(S)
//            4'b0000: return 7'b0000001;
//            4'b0001: return 
//      end                     
    
endmodule
