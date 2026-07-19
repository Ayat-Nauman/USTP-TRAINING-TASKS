`timescale 1ns / 1ps

module gates_tb;

    // Testbench signals (Inputs as logic, Outputs as logic)
    logic t_a;
    logic t_b;
    logic t_y1;
    logic t_y2;
    logic t_y3;

    // Instantiate the Device Under Test (DUT)
    // Using named port mapping for clarity
    gates dut (
        .a(t_a),
        .b(t_b),
        .y1(t_y1),
        .y2(t_y2),
        .y3(t_y3)
    );

    initial begin
        // Test Case 1: Both inputs 0 (00)
        t_a = 1'b0; t_b = 1'b0;
        #10; // Wait 10ns
        
        // Test Case 2: a = 0, b = 1 (01)
        t_a = 1'b0; t_b = 1'b1;
        #10;
        
        // Test Case 3: a = 1, b = 0 (10)
        t_a = 1'b1; t_b = 1'b0;
        #10;
        
        // Test Case 4: Both inputs 1 (11)
        t_a = 1'b1; t_b = 1'b1;
        #10;
        
        $stop; // Pause simulation here so you can view the waveforms
    end

endmodule