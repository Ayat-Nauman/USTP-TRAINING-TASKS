`timescale 1ns / 1ps

module rot_letters_tb;

    // Inputs to the Unit Under Test (UUT)
    reg [1:0] count;

    // Outputs from the Unit Under Test (UUT)
    wire [6:0] seg0;
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire [6:0] seg3;

    // Instantiate the Unit Under Test (UUT)
    rot_letters uut (
        .count(count),
        .seg0(seg0),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3)
    );

    // Stimulus process
    initial begin
        // Initialize Inputs
        count = 2'b00;
        #10; // Wait 10 ns
        
        // Cycle through all states
        count = 2'b01;
        #10;
        
        count = 2'b10;
        #10;
        
        count = 2'b11;
        #10;
        
        // End simulation
        $finish;
    end
      
endmodule