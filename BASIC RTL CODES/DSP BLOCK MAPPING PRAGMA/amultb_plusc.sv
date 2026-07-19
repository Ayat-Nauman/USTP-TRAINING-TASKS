module amultb_plusc(
input logic clk,
input logic [7:0]a,
input logic [7:0]b,
input logic [7:0]c,
output logic [2*7:0] product
);

always_ff @(posedge clk) begin
	product <= a*b + c;
end
	
endmodule

