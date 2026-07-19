// mod 10 counter
module mod10(
	input logic clk, 
	input logic rst, 	  // Assynchronous Reset 
	output logic [9:0] count
	);
	
	always_ff @(posedge clk or posedge rst) begin
    if (rst) 
        count <= 10'b0000000000;
    else if (count >= 10'd9) // Wrap around when hitting 9
        count <= 10'b0000000000;
    else 
        count <= count + 1'b1;    
	end
	
	endmodule
	
