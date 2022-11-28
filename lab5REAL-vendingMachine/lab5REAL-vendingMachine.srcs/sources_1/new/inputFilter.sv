`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Filters our inputs into allowable combinations
//////////////////////////////////////////////////////////////////////////////////


module inputFilter(
        input  R,
        input  N, 
        input  D,
        input  Q,
        output reg R_out,
        output reg N_out,
        output reg D_out,
        output reg Q_out
    );
    
    always_comb begin
    if(R || (N && D) || (N && Q) || (D && Q)) begin
             R_out <= 1'b1;
             N_out <= 1'b0;
             D_out <= 1'b0;
             Q_out <= 1'b0;
        end
	else begin
		 R_out = R;
		 N_out = N;
		 D_out = D;
		 Q_out = Q;
	end
    end
endmodule
