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


module coin_state_logic(
        input logic r,
        input logic n,
        input logic d,
        input logic q,
        input logic b,
        input logic [3:0] currentState, 
        output logic [3:0] nextState
    );

    // nextState should be output as the "number of nickels" :) lmao
    
    always_comb begin
        if(currentState == 4'b0000) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0001;
            end
            else if(d) begin
                nextState <= 4'b0010;
            end
            else if(q) begin
                nextState <= 4'b0101;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b0001) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0010;
            end
            else if(d) begin
                nextState <= 4'b0011;
            end
            else if(q) begin
                nextState <= 4'b0110;
            end
            else begin
                nextState <= currentState;
            end
        end
       
       else if(currentState == 4'b0010) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0011;
            end
            else if(d) begin
                nextState <= 4'b0100;
            end
            else if(q) begin
                nextState <= 4'b0111;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b0011) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0100;
            end
            else if(d) begin
                nextState <= 4'b0101;
            end
            else if(q) begin
                nextState <= 4'b1000;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b0100) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0101;
            end
            else if(d) begin
                nextState <= 4'b0110;
            end
            else if(q) begin
                nextState <= 4'b0000;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b0101) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0110;
            end
            else if(d) begin
                nextState <= 4'b0111;
            end
            else if(q) begin
                nextState <= 4'b0000;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b0110) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b0111;
            end
            else if(d) begin
                nextState <= 4'b1000;
            end
            else if(q) begin
                nextState <= 4'b0000;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b0111) begin
            if(r) begin
                nextState <= 4'b0000;
            end
            else if(n) begin
                nextState <= 4'b1000;
            end
            else if(d) begin
                nextState <= 4'b0000;
            end
            else if(q) begin
                nextState <= 4'b0000;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b1000) begin
            if(b) begin
                nextState <= 4'b1001;
            end
            else if (r || n || d || q) begin
                nextState <= 4'b0000;
            end
            else begin
                nextState <= currentState;
            end
        end
        
        else if(currentState == 4'b1001) begin
            nextState <= 4'b0000;
        end
        
        else begin
            nextState <= 4'b0000;
        end
    end
endmodule
