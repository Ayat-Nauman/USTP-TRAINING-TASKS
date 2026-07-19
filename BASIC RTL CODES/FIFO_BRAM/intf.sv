
interface fifo_interface #(parameter N = 8);
 
logic clk; 
logic rst;
logic push;
logic pop;
logic [N-1:0] data_in;
logic [N-1:0] data_out;
logic full;
logic	empty;

// modport dut
modport dut(
input clk, rst, push, pop, data_in,
output data_out, full, empty
);

endinterface
