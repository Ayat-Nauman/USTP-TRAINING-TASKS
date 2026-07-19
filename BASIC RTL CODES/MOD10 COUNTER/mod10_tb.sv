`timescale 1ns/1ps

module mod10_tb;

    // 1. Interface Signals
    logic       clk;
    logic       rst;
    logic [9:0] count;

    // 2. Instantiate the Device Under Test (DUT)
    mod10 dut (
        .clk   (clk),
        .rst   (rst),
        .count (count)
    );

    // 3. Clock Generation (50MHz Clock -> 20ns period)
    always begin
        clk = 0;
        #10;
        clk = 1;
        #10;
    end

    // 4. Stimulus Block
    initial begin
        // Initialize inputs
        rst = 0;
        
        // Apply Asynchronous Reset
        $display("[TB] Applying asynchronous reset...");
        #5; 
        rst = 1; // Assert reset out of sync with clock edge
        #15;
        rst = 0; // De-assert reset
        $display("[TB] Reset released. Starting count monitoring.");

        // Monitor the outputs in the simulation console
        $monitor("Time = %0t | rst = %b | count = %d", $time, rst, count);

        // Let it run for 300ns to see multiple wrap-arounds (0 to 9)
        #300;

        // Test another mid-cycle asynchronous reset behavior
        $display("[TB] Testing mid-cycle reset...");
        #2;
        rst = 1;
        #10;
        rst = 0;

        // Run a bit longer to see it recover and count again
        #80;

        $display("[TB] Simulation completed.");
        $finish;
    end

endmodule