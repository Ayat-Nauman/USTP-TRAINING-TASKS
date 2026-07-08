
module mux(
mux_interface.dut intf
);

assign intf.out = intf.in[intf.ctrl];

endmodule
