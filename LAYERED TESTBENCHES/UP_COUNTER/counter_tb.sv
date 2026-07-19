`timescale 1ns/1ps
import counter_classes::*;
module up_counter_tb;
int no_of_inputs = 10;
counter_interface #(GLOBAL_N) intf();
up_counter dut(
.intf(intf)
);

initial begin
    intf.clk = 0;
end
always begin #5; intf.clk = ~intf.clk; 
end

initial begin
	
	mailbox #(trans #(GLOBAL_N)) gen2drv = new();
	mailbox #(trans #(GLOBAL_N)) mon2scb = new();
	// class objects
	generator  #(GLOBAL_N) gen;
	driver 	   #(GLOBAL_N) drv;
	monitor    #(GLOBAL_N) mon;
	scoreboard #(GLOBAL_N) scb;
	gen = new(gen2drv);
	drv = new(gen2drv, intf.driver);
	mon = new(mon2scb, intf.monitor);
	scb = new(mon2scb);
	
	// fork join 
	fork 
		gen.main(no_of_inputs);
		drv.main();
		mon.main();
		scb.main();
	join_none //join_none can be used as well
	wait(scb.pass_count + scb.fail_count == no_of_inputs);
	#1;
	scb.display();

	$stop;
end
endmodule



