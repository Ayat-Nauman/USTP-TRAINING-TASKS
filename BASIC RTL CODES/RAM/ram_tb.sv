`timescale 1ns/1ps

module ram_tb;

    logic [4:0] addr;
    logic [3:0] data_in;
    logic write;
    logic clk;
    logic [3:0] data_out;

    // DUT
    ram uut (
        .addr(addr),
        .data_in(data_in),
        .write(write),
        .clk(clk),
        .data_out(data_out)
    );

    // Clock Generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize
        addr    = 0;
        data_in = 0;
        write   = 0;
		  
        @(posedge clk);
        write   = 1;
        addr    = 5'd0;
        data_in = 4'hA;

        @(posedge clk);
        addr    = 5'd5;
        data_in = 4'h3;

        @(posedge clk);
        addr    = 5'd10;
        data_in = 4'hF;

        // Stop writing
        @(posedge clk);
        write = 0;

        addr = 5'd0;
        @(posedge clk);

        addr = 5'd5;
        @(posedge clk);
       
        addr = 5'd10;
        @(posedge clk);

        #10;
        $stop;
    end

endmodule
