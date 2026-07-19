// right shift means clock wise rotation

module rc(
	input logic 		clk, 
	input logic 		rst,
	input logic[3:0] 	ori, //overriding input
	output logic[3:0]	  q
	

);
	
	logic serial_in;
	assign serial_in = q[0];
	
	always_ff @(posedge clk or posedge rst) begin
		
		if(rst) 
			q <= 4'b0000;
			
		else if(ori)
			q <= 4'b1000; //q3 = 1
			
		else
			q <= {serial_in,q[3:1]}; // In next clk cycle, q3 is shifted to q2, and q0 is placed instead of q3
	end
	
endmodule

// Left shift means anti clock wise rotation

//module rc(
//	input clk, 
//	input rst,
//	output logic[3:0]q
//
//);
//	logic serial_in;
//	serial_in = q[3];
//	
//	always_ff @(posedge clk or posedge rst) begin
//		
//		if(rst) 
//			q<= 4'b0001; //q0 = 1
//			
//		else
//			q <= {q[3:1],serial_in}; // In next clk cycle, q3 is shifted to q2, and q0 is placed instead of q3
//		end
//	end
//	
//endmodule
