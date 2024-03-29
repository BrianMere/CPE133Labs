`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// TOP Module for final project
//////////////////////////////////////////////////////////////////////////////////

module proj_top(
        input [3:0] switches,
        input sub, // sub should probably be a switch for future reference
        input mult,
        input go,
        input clk, 
        input reset, // reset signal like the 'clear' signal on a calculator
        output [7:0] LED,
        output [3:0] an,
        output [6:0] seg,
        output dp,
        output zero_flag
    );
    
    logic go_debounce, reset_debounce;
    
    DEBOUNCE_RET go_deb (
        .clk(clk),
        .rst(0),
        .btn(go),
        .z(go_debounce)
    );
    
    DEBOUNCE_RET reset_deb (
        .clk(clk),
        .rst(0),
        .btn(reset),
        .z(reset_debounce)
    );
    
    logic [7:0] to_reg_B;
    logic [7:0] adder_out, from_reg_A, to_reg_A, from_reg_B; 
    logic sub_fsm;
    logic [7:0] fsm_out;
    
    FSM StateLogic(
        .switches(switches),
        .sub(sub),
        .mult(mult),
        .go(go_debounce), //go_debounce. Need to change once I get some FSM logic working.
        .calculator_state(adder_out),
        .reg_A_state(from_reg_A),
        .clk(clk),
        .reset(reset_debounce),
        .current_out_val(fsm_out), // Used instead of LEDs due to segment_control module
        .add_sub(sub_fsm), // input whether to add or subtract towards the compute module
        .reg_A(to_reg_A), // send data to reg_A here ...
        .reg_B(to_reg_B),  // send data to reg_B here ...
        .zero_flag(zero_flag)
    );
    
    assign LED = fsm_out;
    
    register_8bit REG_A(
        .clk(clk),
        .data(to_reg_A),
        .reset(0),
        .q(from_reg_A)
    );
    
    register_8bit REG_B(
        .clk(clk),
        .data(to_reg_B),
        .reset(0),
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
        .reset(0),
        .binary_num(fsm_out),
        .an(an), // anode, for choosing the digit position
        .D(seg), // parts of the seven-segment
        .dp(dp) // decimal point
    );

endmodule
