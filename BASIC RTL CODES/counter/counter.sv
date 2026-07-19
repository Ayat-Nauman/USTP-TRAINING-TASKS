// 4-bit Assynchronous Reset Counter

module counter(
	input logic clk, 
	input logic rst, 	  // Assynchronous Reset 
	input logic select, // 1 = up, 0 = down
	output logic [3:0] count
	);
	
	always_ff @(posedge clk or posedge rst) begin
		if (rst) 
			count <= (select)? 4'b0000:4'b1111;
		else 
			count <= (select)? count + 1'b1 : count - 1'b1;	
	end
	
	endmodule
	