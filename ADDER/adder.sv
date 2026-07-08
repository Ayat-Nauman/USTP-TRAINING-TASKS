// ADD DUT INTERFACE FROM THE INTERFACE FILE
module adder(
add_interface.dut intf
);

assign {intf.cout, intf.s} = intf.a + intf.b;

endmodule
