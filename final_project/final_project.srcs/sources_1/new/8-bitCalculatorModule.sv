`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Calculator module that combines the adder module with the limit_val module
//////////////////////////////////////////////////////////////////////////////////


module An8bitCalculatorModule(
        input [7:0] A,
        input [7:0] B,
        input sub,
        output [7:0] out,
        output neg
    );
    
    logic [7:0] ASS_out;
    logic neg_internal;
    
    add_sub_struct ASS(
        .A(A),
        .B(B),
        .sub(sub),
        .out(ASS_out),
        .neg(neg_internal)
        );
        
    limit_val LM(
        .S(ASS_out),
	    .neg(neg_internal),
	    .out(out)
        );
        
endmodule
