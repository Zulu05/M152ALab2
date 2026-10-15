`timescale 1ns / 1ps
module tb;
  // declare inputs (reg) and outputs (wire)
  reg [11:0] D_in;
  wire S_out;
  wire [2:0] E_out;
  wire [3:0] F_out;

  FPCVT uut ( .D(D_in), .S(S_out), .E(E_out), .F(F_out) );

  initial begin
    $display("Time\t D_in\t\t S_out\t E_out\t F_out");
    $display("----------------------------------------");

    // significand overflow
    D_in = 12'b000001111101; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // rounding down example 1
    D_in = 12'b000000101100; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // rounding down example 2
    D_in = 12'b000000101101; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // rounding up example 1
    D_in = 12'b000000101110; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // rounding up example 2
    D_in = 12'b000000101111; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // negative number (-422)
    D_in = 12'b111001011010; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // negative edge case (-2048)
    D_in = 12'b100000000000; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // exponent overflow from large linear encoding (2047)
    D_in = 12'b011111111111; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    // zero
    D_in = 12'b000000000000; #10;
    $display("%d\t %b\t %b\t %b\t %b\t", $time, D_in, S_out, E_out, F_out);

    $stop; 
  end
endmodule
