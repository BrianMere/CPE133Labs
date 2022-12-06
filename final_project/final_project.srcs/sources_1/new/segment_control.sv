`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Controller of all digits on the basys 3 board. Handles holding many digits at once. 
//////////////////////////////////////////////////////////////////////////////////


module segment_control(
        input clk,
        input reset,
        input [7:0] binary_num,
        output logic [3:0] an, // anode, for choosing the digit position
        output logic [6:0] D, // parts of the seven-segment
        output logic dp // decimal point
    );
    
    assign dp = 1; // we won't use our dp for our purposes. Again active low is 1.
    
    
    logic [19:0] refresh_counter = 0; // counter for crating 2.6ms digit period as to allow distinct dark/light segments
    
    always_ff @ (posedge clk, posedge reset) begin
        if(reset) 
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    logic [1:0] digit_counter = refresh_counter[19:18]; // selector digit counter. Goes left to right (Left LED is always first)
    // assign the digit we are looking at based on the largest two MSB's of the refresh_counter, thus counting up slower
    
    logic [4:0] LED0, LED1, LED2, LED3;
    
    BCD bcd(
        .b_num(binary_num),
        .A(LED0),
        .B(LED1),
        .C(LED2),
        .D(LED3),
        .clk(clk)
    );
    
    logic [3:0] display_bin;
    
    Mux4bit4sel M4(
        .sel(digit_counter),
        .A(LED0),
        .B(LED1),
        .C(LED2),
        .D(LED3),
        .out(display_bin)
    );
    
    always_comb @(*) begin
        case(digit_counter) // logic for anode control
            2'b00: an = 4'b0111; // remember, the anodes are active low for our cases 
            2'b01: an = 4'b1011;
            2'b10: an = 4'b1101;
            2'b11: an = 4'b1110;
        endcase
           
    end
    
    // turn the binary_num into 4 binary numbers representing their digits
    
    A7seg_decoder SEG(
            .binary(display_bin),
            .seg(D)
        );
    
    
endmodule
