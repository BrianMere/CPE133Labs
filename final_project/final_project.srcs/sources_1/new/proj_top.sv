`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// TOP Module for final project
//////////////////////////////////////////////////////////////////////////////////

module proj_top(
        input [3:0] switches,
        input sub, // sub should probably be a switch for future reference
        input go,
        input clk, 
//        output [7:0] LED,
        output [3:0] an,
        output [6:0] seg,
        output dp,
        output zero_flag
    );
    
    logic sub_debounce, go_debounce;
    
    logic reset; // local reset signal to use on boot with initial jk
    
    DEBOUNCE_RET sub_deb (
        .clk(clk),
        .reset(reset),
        .btn(sub),
        .z(sub_debounce)
    );
    
    DEBOUNCE_RET go_deb (
        .clk(clk),
        .reset(reset),
        .btn(go),
        .z(go_debounce)
    );
    
    logic [3:0] to_reg_B;
    logic [7:0] adder_out, from_reg_A, to_reg_A, from_reg_B; 
    logic sub_fsm;
    logic [7:0] fsm_out;
    
    FSM StateLogic(
        .switches(switches),
        .sub(sub_debounce),
        .go(go_debounce),
        .calculator_state(adder_out),
        .reg_A_state(from_reg_A),
        .clk(clk),
        .current_out_val(fsm_out), // Used instead of LEDs due to segment_control module
        .add_sub(sub_fsm), // input whether to add or subtract towards the compute module
        .reg_A(to_reg_A), // send data to reg_A here ...
        .reg_B(to_reg_B)  // send data to reg_B here ...
    );
    
    register_8bit REG_A(
        .clk(clk),
        .data(to_reg_A),
        .reset(reset),
        .q(from_reg_A)
    );
    
    register_8bit REG_B(
        .clk(clk),
        .data(to_reg_B),
        .reset(reset),
        .q(from_reg_B)
    );
    
    An8bitCalculatorModule CALC(
        .A(from_reg_A),
        .B(from_reg_B),
        .sub(sub_fsm),
        .out(adder_out),
        .neg() //TODO: see if we want to use the neg flag from the adder and how we'll use it
    );
    
    // 7-segment control follows. Feel free to omit it from the final version. Can be used to help with debugging.
    segment_control SEG_CTL(
        .clk(clk),
        .reset(reset),
        .binary_num(fsm_out),
        .an(an), // anode, for choosing the digit position
        .D(seg), // parts of the seven-segment
        .dp(dp) // decimal point
    );

endmodule
