`timescale 1ns/1ps
module encoder_tb;

  logic [7:0] tb_data_in;
  logic [2:0] tb_data_out;

  // Instantiate the flawed standard encoder
  encoder dut (
    .data_in (tb_data_in),
    .data_out(tb_data_out)
  );

  initial begin
    tb_data_in = 8'b0000_0100; #10; // Expect 3'b010 (Decimal 2)
    
    tb_data_in = 8'b1000_0000; #10; // Expect 3'b111 (Decimal 7)

    tb_data_in = 8'b1000_0100; #10; // Expect 3'bzzz

    $stop;
  end

endmodule
