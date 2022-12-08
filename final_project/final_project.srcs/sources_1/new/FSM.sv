`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// FSM Module unique to our final project. Similar to the one from lab 5.
//////////////////////////////////////////////////////////////////////////////////


module FSM(
        input [3:0] switches, // value (in binary) to add/sub
        input sub, // indicates if one wants to add or subtract to the calculator
        input mult, // indicates if one wants to multiply reg_A by switches. Takes precedence over sub. 
        input go, // like the enter button on a calculator
        input [7:0] calculator_state, // input from calculator (add_sub module)
        input [7:0] reg_A_state, // get input from the current value in reg_A
        input clk, // change state one at a time based on the computer's clock 
        input reset, // reset the value to 0 in reg_A if pressed ... 
        output logic [7:0] current_out_val, // Used instead of LEDs due to segment_control module
        output logic add_sub, // input whether to add or subtract towards the compute module
        output logic [7:0] reg_A, // send data to reg_A here ...
        output logic [7:0] reg_B,  // send data to reg_B here ...
        output logic zero_flag
    );
    
//     we are using a counter as the current state
    logic [2:0] currentState = 3'b111;
    
    // Overview of the states:
    // 0: Standby | Wait for 'go'
    // 1: Update Add/Sub | Output add_sub based on 
    // 2: Load B, then 3 bit count for compute gate
    // 3: Get adder output
    // 4: Load into A
    
    logic [2:0] counter = 0;
    logic [7:0] adderOut;
    logic [3:0] COUNT_MAX;
    logic [7:0] logic_switches; // normally adder uses the switches but for mult we need to use reg_A
    logic logic_go;
    logic [3:0] mult_count;
    logic logic_sub;
    
    always_ff @ (posedge clk) begin
        if (reset) begin
            reg_A <= 8'b00000000;
        end
        
        if (currentState == 3'b111) begin //Standby
            if(go && logic_go == 0) begin
                logic_go <= 1;
                if (mult)
                    mult_count <= 4'b0001;
                else
                    mult_count <= 4'b0000;
                currentState <= 3'b000;
                logic_switches <= reg_A_state;
            end
        end
        
        // adder logic ... 
        else if(currentState == 3'b000) begin // loop central
        
            if (mult) begin // mult stuff
                if (switches == 0)
                    reg_A <= 8'b00000000;
                COUNT_MAX <= switches;
                //logic_switches <= reg_A_state;
                logic_sub <= 0; // DONT USE THE SUB WITH MULT HAHA
            end
            else begin // add/sub stuff
                COUNT_MAX <= 1;
                if (switches[3] == 0)
                    logic_switches <= switches;
                else
                    logic_switches <= 8'b11111000 + switches[2:0]; // uh... 
                
                logic_sub <= sub;
            end
            
            if(logic_go && mult_count < COUNT_MAX)
                currentState <= 3'b001;
            else begin
                logic_go <= 0;
                currentState <= 3'b111;
            end
            // else, remain in currentState
        end
        else if(currentState == 3'b001) begin // Update Add/Sub
            mult_count <= mult_count + 1;
            add_sub <= logic_sub;
            currentState <= 3'b010;
        end
        else if(currentState == 3'b010) begin // Load B
            if(counter == 3'b000) // always just send the B data as early as possible, but you don't need to keep updating it ...
                reg_B <= logic_switches;
            else if(counter == 3'b111) begin
                currentState <= 3'b011;
                counter <= 3'b000;
            end
            counter <= counter + 1;
            
        end
        else if(currentState == 3'b011) begin // Get adder output 
            adderOut <= calculator_state;
            currentState <= 3'b101;
        end
        else if(currentState == 3'b101) begin // Load A
            reg_A <= adderOut;
            currentState <= 3'b000;
        end
        else begin // Default state: send to Standby
            currentState <= 3'b111;
        end
        
        // Do the following for EACH state regardless ...
        current_out_val <= reg_A_state; // Reg A is the value we always wanna do operations with (A + B OR A - B, not the other way around)
        if(current_out_val == 0)
            zero_flag <= 1;
        else
            zero_flag <= 0;
        end
    
endmodule
