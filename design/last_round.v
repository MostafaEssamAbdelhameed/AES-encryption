`timescale 1ns / 1ps

module last_round(
    input [127:0] in,
    input [127:0] key,
    output [127:0] out_last,
    output done,
    input clk,
    input rst
    );

wire [127:0] afterSubBytes;
wire [127:0] afterShiftRows;
wire [127:0] afterAddroundKey;

sub_bytes s1(in,afterSubBytes,clk,rst);
shift_rows s2(afterSubBytes,afterShiftRows,clk,rst);
AddRoundKey s3(afterShiftRows,key,out_last,clk,rst);
assign done = (out_last==0)? 0:1;
endmodule
