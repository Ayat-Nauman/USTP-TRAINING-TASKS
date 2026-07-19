module alu #( 
parameter N = 4, 
parameter M = 4)(

input logic [N-1:0]a, 
input logic [N-1:0]b,
input logic [$clog2(M)-1:0]operation,
output logic [N-1:0]y,
output logic zero
);

typedef enum logic [$clog2(M)-1:0]{
ADD, 
SUB, 
AND, 
OR
} Aluop;

Aluop op;

always_comb begin

// This is the SystemVerilog cast operator. It tells the compiler: "Take 
// whatever is inside these parentheses and treat it exactly like an
// Aluop data type."

	op = Aluop'(operation);
	zero = (y == '0);
	case(op)
		ADD: y = a+b;
		SUB: y = a-b;
		AND: y = a&b; 		// Bitwise AND
		OR:  y = a|b; 		// Bitwise OR
		default: y = '0;	// All bits zero
	endcase
		
end
 
endmodule
