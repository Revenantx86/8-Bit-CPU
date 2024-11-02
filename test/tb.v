`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  /// Init registers 
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
  
  tt_um_control_block uut(
     // Include power ports for the Gate Level test:
      `ifdef GL_TEST
            .VPWR(1'b1),
            .VGND(1'b0),
      `endif
     
    .clk(clk), 
    .rst_n(rst_n),
    .ui_in(ui_in),
    .uo_out(uo_out),
    .uio_out(uio_out),
    .uio_oe(uio_oe),
    .ena(ena),
    .uio_in(uio_in)
  );

endmodule
