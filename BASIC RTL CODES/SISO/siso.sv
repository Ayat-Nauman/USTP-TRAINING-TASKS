// 4-BIT ASYNCHRONOUS RESET SISO SHIFT REGISTER CODE:

module siso(
    input  logic clk, 
    input  logic rst,
    input  logic serial_in,
    input  logic selection, // selection = 1 means right shift, and 0 means left shift
    output logic serial_out // Changed to output
);

    logic [3:0] q;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            q <= 4'b0000;
        else if (selection == 1'b0) // Left shift
            q <= {q[2:0], serial_in}; // MSB(q3) is removed, input is placed at LSB.
        else if (selection == 1'b1) // Right shift
            q <= {serial_in, q[3:1]}; // LSB(q0) is removed, input is placed at MSB.
    end

    // For right shift output is q0 (Removed bit)
    // For left shift output is q3 (Removed bit)
    assign serial_out = (selection) ? q[0] : q[3];

endmodule
