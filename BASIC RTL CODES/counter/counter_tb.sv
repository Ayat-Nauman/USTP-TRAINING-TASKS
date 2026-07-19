// timescale
`timescale 1ns/1ps

module counter_tb;
logic clk;
logic rst;
logic select;
logic [3:0]count;

// dut instantiation
counter dut(
.clk(clk),
.rst(rst),
.select(select),
.count(count)
);

// Clock Generation
initial clk = 1'b0;
always #5 clk = ~clk;
	

//Test cases
initial begin
			// Initialize inputs
        rst = 1; 
        select = 1;
        #15; // Hold reset 
        
        // Release reset 
        rst = 0; 	
        #10;
        
        // Test Up-Counting
        select = 1; 
        #170; 
        
        // Test Down-Counting
        select = 0; 
        #170;

        // Test Mid-operation Asynchronous Reset
        #20;
        rst = 1; // Counter should reset immediately without waiting for clk edge
        #10;
        rst = 0;
        #30;



$stop;
end

endmodule
