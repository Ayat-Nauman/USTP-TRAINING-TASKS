module addsub #( 
	parameter int N = 8
)(
	input logic  [N-1:0]a,
	input logic  [N-1:0]b,
	input logic  cin,
	input logic  add_sub,		// 0 = add, 1 = sub 
	output logic [N-1:0]s,
	output logic cout,
	output logic overflow
);

logic [N-1:0] b_new;
logic cin_new;

//since add_sub is a single bit value, we must duplicate 
//it N times for bitwise xor operation

assign 	 b_new = {N{add_sub}} ^ b;

// If we are doing subtraction, we have set the cin = 1

assign  cin_new = (add_sub)? 1 : cin;

// Result
assign {s,cout} = a + b_new + cin_new;

// assign overflow = (cin[7] ^ cout)? 1 : 0; <-- This won't work because 
// we don't have any cin[7]. This would be possible if i make separate FA 
// blocks and instantiate for 8 bits addition or subtraction.
// So we'll detect overflow using the strategy mentioned below:
// If the sign bits of inputs and outputs are different then its Overflow.

assign overflow = ((a[N-1] == b_new[N-1]) && (s[N-1] != a[N-1]))? 1 : 0;

endmodule
