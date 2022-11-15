`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Main Logic Part for Counting Coins based on states and FSM's. Using nickel count as a state value, we've defined state logic to
// transition between states.
//
//  Inputs: 
//  r: reset (resets coin count to 0 cents)
//  n: nickel (adds one nickel into coin count)
//  d: dime (adds two nickels into coin count)
//  q: quarter (adds five nickels into coin count)
//  clk: CLOCK (used in counter)
//
//  Outputs:
//  V_ok: says whether the vending machine is ready, in terms of state, for purchase to go when the user is ready.
//
//  Notes:
//  - Multiple coins will not be accepted at a time. The highest denomination of coin will be chosen on a multiple-button press. Sucks if you lost some money that way :(
//  - Refund will take highest priority over coin inputs. If both are high at the same time, then reset overrules it, resetting coins back to 0.
//////////////////////////////////////////////////////////////////////////////////


module CoinStateLogic(
        input logic r,
        input logic n,
        input logic d,
        input logic q, 
        input logic clk, 
        output logic V_ok
    );
    
    logic [3:0] nickels; // number of nickels in our bank
    
    always_ff @ (posedge clk) begin
        if(nickels == 4'b0000) begin
            if(r)
                nickels <= 4'b0000;
            if(n & !d & !q)
                nickels <= 4'b0001;
            if(!n & d & !q)
                nickels <= 4'b0010;
            // TODO: ask if this is the right idea first ...
        end
        
    end
endmodule
