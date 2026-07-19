// SYNCHRONOUS FIFO

module fifo_bram(
fifo_interface.dut intf
);

localparam ROWS = 8;
localparam N = 8;
//read and write pointers
bit [$clog2(N):0] wptr;
bit [$clog2(N):0] rptr;

//memory buffer
(*ramstyle = "M10" *)
logic [N-1:0]mem[ROWS-1:0];

// Writing
always_ff @(posedge intf.clk) begin
	if(intf.rst) begin
		wptr <= '0;
		for(int i = 0; i<= ROWS-1; i++) begin
			mem[i] <= '0; //Memory Initialization
		end
	end else if (intf.push && ~intf.full) begin
		mem[wptr[$clog2(N)-1:0]]  <= intf.data_in;
		wptr			  <= wptr + 1;
	end
end
	
// Reading
always_ff @(posedge intf.clk) begin
	if(intf.rst) begin
		rptr <= '0;
		intf.data_out <= '0;
	end else if (intf.pop && ~intf.empty) begin
		intf.data_out 	<= mem[wptr[$clog2(N)-1:0]];
		rptr		<= rptr + 1;
	end
end

//Flags Handling
assign intf.full  = (wptr == ROWS); 
assign intf.empty = (rptr == wptr);


endmodule




