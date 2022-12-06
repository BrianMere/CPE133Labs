`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 7 Segment decoder to use for reading register values to our 7-seg decoder
//////////////////////////////////////////////////////////////////////////////////


module A7seg_decoder(
        input [3:0] binary,
        output logic [6:0] seg
    );
    
    always_comb begin
        case (binary)
            4'b0000: seg <= 7'b0000001; // 0
            4'b0001 : seg <= 7'b1001111; // ...
            4'b0011 : seg <= 7'b0010010;
            4'b0100 : seg <= 7'b0000110;
            4'b0101 : seg <= 7'b1001100;
            4'b0110 : seg <= 7'b0100100;
            4'b0111 : seg <= 7'b0100000;
            4'b1000 : seg <= 7'b0001111;
            4'b1001 : seg <= 7'b0000000;
            4'b1010 : seg <= 7'b0000100; // 9
            default: seg <= 7'b1001111; // Display E for 'error' if there's no correct number value
        endcase
    end
    
endmodule
