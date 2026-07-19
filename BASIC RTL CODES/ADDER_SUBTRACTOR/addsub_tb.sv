`timescale 1ns / 1ps

module addsub_tb();

localparam int n = 8;
	 
logic [n-1:0] a;
logic [n-1:0] b;
logic         cin;
logic         add_sub; // 0 = add, 1 = sub
    
logic [n-1:0] s;
logic         cout;
logic         overflow;

// DUT Instantiation
addsub #(.N(8)) dut (
.a(a),
.b(b),
.cin(cin),
.add_sub(add_sub),
.s(s),
.cout(cout),
.overflow(overflow)
);
    
initial begin
        
		  cin = 1'b0; 

        // Test Case 1: 0x05 + 0x03 = 0x08
        a = 8'h05; b = 8'h03; add_sub = 1'b0; #10;
       
        // Test Case 2: 0x0A - 0x04 = 0x06
        a = 8'h0A; b = 8'h04; add_sub = 1'b1; #10;
      
        // Test Case 3: 0xFF + 0x01 = 0x00, cout = 1
        a = 8'hFF; b = 8'h01; add_sub = 1'b0; #10;
      
        // Test Case 4: 0x80 - 0x01 = 0x7F, overflow = 1
        a = 8'h80; b = 8'h01; add_sub = 1'b1; #10;
      
        $stop;
    end

endmodule
