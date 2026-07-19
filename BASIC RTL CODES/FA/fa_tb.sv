`timescale 1ns / 1ps

module fa_tb;

    logic t_a, t_b, t_cin;
    logic t_sum, t_cout;

    // Instantiation
    fa dut (
        .a(t_a),
        .b(t_b),
        .cin(t_cin),
        .sum(t_sum),
        .cout(t_cout)
    );

    initial begin
        
        t_a = 0; t_b = 0; t_cin = 0; #10; // 0 + 0 + 0 = 0
        t_a = 0; t_b = 0; t_cin = 1; #10; // 0 + 0 + 1 = 1
        t_a = 0; t_b = 1; t_cin = 0; #10; // 0 + 1 + 0 = 1
        t_a = 0; t_b = 1; t_cin = 1; #10; // 0 + 1 + 1 = 2 (Sum=0, Cout=1)
        
        t_a = 1; t_b = 0; t_cin = 0; #10; // 1 + 0 + 0 = 1
        t_a = 1; t_b = 0; t_cin = 1; #10; // 1 + 0 + 1 = 2 (Sum=0, Cout=1)
        t_a = 1; t_b = 1; t_cin = 0; #10; // 1 + 1 + 0 = 2 (Sum=0, Cout=1)
        t_a = 1; t_b = 1; t_cin = 1; #10; // 1 + 1 + 1 = 3 (Sum=1, Cout=1)

        $stop; 
    end

endmodule
