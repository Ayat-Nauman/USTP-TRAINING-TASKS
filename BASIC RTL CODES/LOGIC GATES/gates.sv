module gates(
input logic a,
input logic b, 
output logic y1,
output logic y2,
output logic y3
);

and gate1(y1, a, b);
or  gate2(y2, a, b);
xor gate3(y3, a, b);

endmodule
