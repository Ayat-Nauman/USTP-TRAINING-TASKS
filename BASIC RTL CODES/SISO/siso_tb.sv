`timescale 1ns / 1ps

module siso_tb;

    // Testbench signals
    logic clk;
    logic rst;
    logic serial_in;
    logic selection;
    logic serial_out;

    // Instantiate the Device Under Test (DUT)
    siso dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .selection(selection),
        .serial_out(serial_out)
    );

    // Clock Generation: 10ns period (50MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        serial_in = 0;
        selection = 1; // Start with Right Shift

        // 1. Assert Asynchronous Reset
        #2 rst = 1;
        #10 rst = 0; 
        @(posedge clk);

        //Right Shift (selection = 1)
        selection = 1'b1;
        
        // Feed sequence: 1 -> 1 -> 0 -> 0
        serial_in = 1'b1; @(posedge clk);
        serial_in = 1'b1; @(posedge clk);
        serial_in = 1'b0; @(posedge clk);
        serial_in = 1'b0; @(posedge clk);

        // Reset the register state for the next test
        #5 rst = 1; #5 rst = 0;
        @(posedge clk);

        // Left Shift (selection = 0)
        selection = 1'b0;
        
        // Feed same sequence: 1 -> 1 -> 0 -> 0
        serial_in = 1'b1; @(posedge clk);
        serial_in = 1'b1; @(posedge clk);
        serial_in = 1'b0; @(posedge clk);
        serial_in = 1'b0; @(posedge clk);

        #10;
        $stop; // Pause simulation here so you can inspect the waveform
    end

endmodule