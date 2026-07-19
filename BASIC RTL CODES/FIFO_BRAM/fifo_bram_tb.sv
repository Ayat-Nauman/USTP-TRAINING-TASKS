`timescale 1ns/1ps
module fifo_bram_tb;
parameter GLOBAL_N = 8;
fifo_interface #(GLOBAL_N) intf();
fifo_bram dut(
.intf(intf)
);

initial begin intf.clk = 0; end

always begin
	intf.clk = ~intf.clk;
	#5; //time period = 2 x 5 = 10ns
end

initial begin
	intf.rst = 1; #10;
  	intf.rst = 0;
	intf.data_in = 8'd1; intf.push = 1; intf.pop = 0; #10;
	intf.data_in = 8'd2; intf.push = 1; #10;
	intf.data_in = 8'd3; intf.push = 1; #10;
	intf.data_in = 8'd4; intf.push = 1; #10;
	intf.data_in = 8'd5; intf.push = 1; #10;
	intf.data_in = 8'd6; intf.push = 1; #10;
	intf.data_in = 8'd7; intf.push = 1; #10;
	intf.data_in = 8'd8; intf.push = 1; #10;
	intf.data_in = 8'd9; intf.push = 1; intf.pop = 0; #10;
	intf.push = 0; //lower push
	intf.pop = 1; #10; //1
	intf.pop = 1; #10; //2
	intf.pop = 1; #10; //3
	intf.pop = 1; #10; //4
	intf.pop = 1; #10; //5
	intf.pop = 1; #10; //6
	intf.pop = 1; #10; //7
	intf.pop = 1; #10; //8
	intf.pop = 1; #10; //9
	$stop;
end

endmodule
