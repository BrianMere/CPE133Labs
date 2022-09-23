`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Description: This is a simulation my bro.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab0Sim(
    
    );
    
    logic X, Y, Z;
    logic Q;
    
    lab0 lab0_inst (.A(X), .B(Y), .C(Z), .Q(Q));
    
    initial
        begin
        X = 0; Y = 0; Z = 0;
        #10
        if(Q !== 1) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 0; Y = 0; Z = 1;
        #10
        if(Q !== 1) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 0; Y = 1; Z = 0;
        #10
        if(Q !== 0) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 0; Y = 1; Z = 1;
        #10
        if(Q !== 1) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 1; Y = 0; Z = 0;
        #10
        if(Q !== 0) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 1; Y = 0; Z = 1;
        #10
        if(Q !== 0) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 1; Y = 1; Z = 0;
        #10
        if(Q !== 0) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
         X = 1; Y = 1; Z = 1;
        #10
        if(Q !== 1) $display("Error X:%b Y:%b Z:%b", X,Y,Z);
        
        $display("Finished Test! :)");
        end
    
    
endmodule
