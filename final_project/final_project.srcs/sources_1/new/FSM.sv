`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// FSM Module unique to our final project. Similar to the one from lab 5.
//////////////////////////////////////////////////////////////////////////////////


module FSM(
        input [3:0] switches, // value (in binary) to add/sub
        input sub, // indicates if one wants to add or subtract to the calculator
        input go, // like the enter button on a calculator
        input [7:0] calculator_state, // input from calculator (add_sub module)
        input [7:0] reg_A_state, // get input from the current value in reg_A
        input clk, // change state one at a time based on the computer's clock 
        output logic [7:0] current_out_val, // Used instead of LEDs due to segment_control module
        output logic add_sub, // input whether to add or subtract towards the compute module
        output logic [7:0] reg_A, // send data to reg_A here ...
        output logic [4:0] reg_B,  // send data to reg_B here ...
        output logic zero_flag,
        output logic [2:0] currentState
    );
    
    // we are using a counter as the current state
//    logic [2:0] currentState = 3'b000;
    
    // Overview of the states:
    // 0: Standby | Wait for 'go'
    // 1: Update Add/Sub | Output add_sub based on 
    // 2: Load B, then 3 bit count for compute gate
    // 3: Get adder output
    // 4: Load into A
    
    logic [2:0] counter = 0;
    logic [7:0] adderOut;
    
    always_comb begin
        if(currentState == 3'b000) begin // Standby
            if(go)
                currentState <= 3'b001;
            // else, remain in currentState
        end
        else if(currentState == 3'b001) begin // Update Add/Sub
            add_sub <= sub;
            currentState <= 3'b010;
        end
        else if(currentState == 3'b010) begin // Load B
            if(counter == 3'b000) // always just send the B data as early as possible, but you don't need to keep updating it ...
                reg_B <= switches;
            else if(counter == 3'b111) begin
                currentState <= 3'b011;
                counter <= 3'b000;
            end
            counter <= counter + 1;
            
        end
        else if(currentState == 3'b011) begin // Get adder output 
            adderOut <= current_out_val;
            currentState <= 3'b101;
        end
        else if(currentState == 3'b101) begin // Load A
            reg_A <= adderOut;
            currentState <= 3'b000;
        end
        else begin // Default state: send to Standby
            currentState <= 3'b000;
        end
        
        // Do the following for EACH state regardless ...
        current_out_val <= reg_A; // Reg A is the value we always wanna do operations with (A + B OR A - B, not the other way around)
        if(current_out_val == 0)
            zero_flag <= 1;
        else
            zero_flag <= 0;
             
    end
    
endmodule
