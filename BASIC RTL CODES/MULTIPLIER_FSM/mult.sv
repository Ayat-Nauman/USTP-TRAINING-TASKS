mult_fsm #(parameter N = 4)(
input logic clk,
input logic rst,
input logic  [N-1:0] multiplier,
input logic  [N-1:0] multiplicand,
output logic [(2*N)-1:0] product,
output logic done
);

// shift register Q 
logic [(2*N)-1:0] q;

//if LSB of multiplicand is 0 = means even
// only shifting is needed 
//if LSB of multiplicand is 1 = means odd
// then we have to shift and add
bit lsb;
assign lsb = multiplicand[0];


//Counter
logic [N-1:0] count;
//states
typedef enum logic [2:0]{
	LOAD_INPUTS, // idle state
	//CHECK_LSB,
	ADD,
	SHIFT,
	DONE
} states;

states cs, ns;

//Input combinational circuit - next state logic
always_comb begin
		ns = ns;
		case(cs) 
			LOAD_INPUT: 	(lsb)? ns = ADD : ns = SHIFT; 		
			ADD:				(count == multiplicand)? ns = DONE : ns = ADD;
			SHIFT:			ns = DONE;
			DONE:				ns = LOAD_INPUT;
			default:			ns = LOAD_INPUT;
		endcase
end

always_ff @(poesdge clk) begin
	if (rst) begin
		count <= '0;
		q		<= '0;
		done	<= '0;
		cs		<= LOAD_INPUTS;
	end else begin
		case (ns)
			LOAD_INPUT:	begin
				q 			<= multilpicand;
				product 	<= '0;
			end
			ADD:	begin
				q <= multiplicand + multiplicand;
				count = count + 1;
			end
			SHIFT: begin
				q <= q << multiplicand
			end
			
	end
	
end

assign product = q;