module fa (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic cout
);

    // Internal wires to connect the two half adders
    logic s1, c1, c2;

    // Instantiate First Half Adder
    ha ha1 (
        .a(a),
        .b(b),
        .sum(s1),
        .cout(c1)
    );

    // Instantiate Second Half Adder
    ha ha2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .cout(c2)
    );

    // Combine carries to form the final Carry-Out
    assign cout = c1 | c2;

endmodule
