`timescale 1ns/1ps

module alu_tb;

    parameter N = 4;
    parameter M = 4;
	 
    logic [N-1:0] a;
    logic [N-1:0] b;
    logic [$clog2(M)-1:0] operation;
    logic [N-1:0] y;
    logic zero;

 // DUT INstantiation
    alu #(
        .N(N),
        .M(M)
    ) dut (
        .a(a),
        .b(b),
        .operation(operation),
        .y(y),
        .zero(zero)
    );


    initial begin
        // 5 + 3 = 8
        a = 4'd5;   b = 4'd3;   operation = 2'd0;
        #10;

        // 10 - 4 = 6
        a = 4'd10;  b = 4'd4;   operation = 2'd1;
        #10;

        // Zero -> 7 - 7 = 0
        a = 4'd7;   b = 4'd7;   operation = 2'd1;
        #10;

        // 1100 & 1010 = 1000
        a = 4'b1100; b = 4'b1010; operation = 2'd2;
        #10;

        //  1100 | 1010 = 1110
        a = 4'b1100; b = 4'b1010; operation = 2'd3;
        #10;
		  
        $stop; 
    end

endmodule
