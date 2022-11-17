`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// TOP Module for Vending Machine.
// 
//////////////////////////////////////////////////////////////////////////////////


module l5_top(
        input logic N,
        input logic D,
        input logic Q,
        input logic R,
        input logic B,
        input logic clk,
        output logic [1:0] LED
    );
    
    logic n_db, d_db, q_db, r_db, b_db;
    
    DEBOUCE_RET sw_n ( .clk(clk), .rst(R), .btn(N), .z(d_db) );
    DEBOUCE_RET sw_d ( .clk(clk), .rst(R), .btn(D), .z(d_db) );
    DEBOUCE_RET sw_q ( .clk(clk), .rst(R), .btn(Q), .z(d_db) );
    DEBOUCE_RET sw_r ( .clk(clk), .rst(R), .btn(R), .z(d_db) );
    DEBOUCE_RET sw_b ( .clk(clk), .rst(R), .btn(B), .z(d_db) );
    
    logic n_filtered, d_filtered, q_filtered, r_filtered; // no need to filter b
    
    inputFilter filter (.R(r_db), .N(n_db), .D(d_db), .Q(q_db), 
    .R_out(r_fitered), .N_out(n_filtered), .D_out(d_filtered), .Q_out(q_filtered));
    
    logic [3:0] currentState;
    logic [3:0] nextState;
    
    coin_state_logic csl (.r(r_filtered), .n(n_filtered), .d(d_filtered), .q(q_filtered), 
    .b(b_db), .currentState(currentState), .nextState(nextState));
    
    //TODO: make sure reset is correct to use here in this way :)
    state_reg register (.clk(clk), .reset(0), .d(nextState), .state(currentState));
    
    logic m_signal;
    
    outputLogic outputLog (.state(currentState), .V_ok(LED[0]), .m_signal(m_signal));
    
    motorPulse motorPulse (.m_signal(m_signal), .clk(clk), .m_pulse(LED[1]));
    
endmodule
