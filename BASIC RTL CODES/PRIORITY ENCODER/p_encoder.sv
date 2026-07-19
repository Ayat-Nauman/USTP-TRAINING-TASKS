module p_encoder (
input logic 	[7:0]data_in,
output logic 	[2:0]data_out
);

always_comb begin
casez(data_in)
8'b1???????: data_out = 3'b111;
8'b01??????: data_out = 3'b110;
8'b001?????: data_out = 3'b101;
8'b0001????: data_out = 3'b100;
8'b00001???: data_out = 3'b011;
8'b000001??: data_out = 3'b010;
8'b0000001?: data_out = 3'b001;
8'b00000001: data_out = 3'b000;
default:		 data_out = 3'b000;
endcase
end

endmodule

