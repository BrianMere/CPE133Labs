`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// TOP Module for Vending Machine.
// 
//////////////////////////////////////////////////////////////////////////////////


module l5_top(
        input N,
        input D,
        input Q,
        input R,
        input B,
        input clk,
        output [1:0] LED,
        output [3:0] C_LED
    );
    
    logic n_db, d_db, q_db, r_db, b_db;
    
    DEBOUCE_RET sw_n ( .clk(clk), .rst(0), .btn(N), .z(n_db) );
    DEBOUCE_RET sw_d ( .clk(clk), .rst(0), .btn(D), .z(d_db) );
    DEBOUCE_RET sw_q ( .clk(clk), .rst(0), .btn(Q), .z(q_db) );
    DEBOUCE_RET sw_r ( .clk(clk), .rst(0), .btn(R), .z(r_db) );
    DEBOUCE_RET sw_b ( .clk(clk), .rst(0), .btn(B), .z(b_db) );
    
    logic n_filtered, d_filtered, q_filtered, r_filtered; // no need to filter b
    
    inputFilter filter (.R(r_db), .N(n_db), .D(d_db), .Q(q_db), 
    .R_out(r_filtered), .N_out(n_filtered), .D_out(d_filtered), .Q_out(q_filtered));
    
    logic [3:0] currentState;
    logic [3:0] nextState;
    
    coin_state_logic csl (.r(r_filtered), .n(n_filtered), .d(d_filtered), .q(q_filtered), 
    .b(b_db), .currentState(currentState), .nextState(nextState));
    
    assign C_LED = currentState;
    
    //TODO: make sure reset is correct to use here in this way :)
    state_reg register (.clk(clk), .reset(r_filtered), .d(nextState), .state(currentState));
    
    logic m_signal;
    
    outputLogic outputLog (.state(nextState), .V_ok(LED[0]), .m_signal(m_signal));
    
    motorPulse motorPulse (.m_signal(m_signal), .clk(clk), .m_pulse(LED[1]));
    
endmodule
