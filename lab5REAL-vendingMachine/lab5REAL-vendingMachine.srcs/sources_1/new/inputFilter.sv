`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Filters our inputs into allowable combinations
//////////////////////////////////////////////////////////////////////////////////


module inputFilter(
        input logic R,
        input logic N, 
        input logic D,
        input logic Q,
        output logic R_out,
        output logic N_out,
        output logic D_out,
        output logic Q_out
    );
    
    always_comb begin
    if(R || (N && D) || (N && Q) || (D && Q)) begin
            R_out <= 1;
            N_out <= 0;
            D_out <= 0;
        end
	else begin
		R_out <= R;
		N_out <= N;
		D_out <= D;
		Q_out <= Q;
	end
end
endmodule
