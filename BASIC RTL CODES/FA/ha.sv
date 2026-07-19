module ha (
    input  logic a,
    input  logic b,
    output logic sum,
    output logic cout
);

    // Continuous assignment using bitwise operators
    assign sum  = a ^ b; // XOR gate
    assign cout = a & b; // AND gate

endmodule
