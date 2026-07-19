module ram(
input reg [4:0]addr,
input reg [7:0]data_in,
input reg write,
input logic clk,
output logic [7:0]data_out
);

(*ramstyle = "M10K" *)
logic [7:0]ram [31:0];
always_ff @(posedge clk) begin
	if(write)
		ram[addr] <= data_in;
	//else
		//data_out = ram[addr];
end

assign data_out = ram[addr];
endmodule
