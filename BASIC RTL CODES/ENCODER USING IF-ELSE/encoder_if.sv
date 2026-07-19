module encoder_if(
input [7:0] data_in,
output [2:0] data_out
);

always_comb begin
	if(data_in == 8'b00000000)
		data_out = 3'b000;
	else if (data_in == 8'b00000001)
		data_out = 3'b000;
	else if (data_in == 8'b00000010)
		data_out = 3'b001;
	else if (data_in == 8'b00000100)
		data_out = 3'b010;
	else if (data_in == 8'b00001000)
		data_out = 3'b011;
	else if (data_in == 8'b00010000)
		data_out = 3'b100;
	else if (data_in == 8'b00100000)
		data_out = 3'b101;
	else if (data_in == 8'b01000000)
		data_out = 3'b110;
	else if (data_in == 8'b10000000)
		data_out = 3'b111;
	else 
		data_out = 3'bzzz;
end

endmodule
