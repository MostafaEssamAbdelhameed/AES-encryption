`timescale 1ns / 1ps

module round(
    input [127:0] in,
    input [127:0] key,
    output [127:0] out,
    input clk,
    input rst
    );

wire [127:0] afterSubBytes;
wire [127:0] afterShiftRows;
wire [127:0] afterMixColumns;
wire [127:0] afterAddroundKey;

sub_bytes a1(in,afterSubBytes,clk,rst);
shift_rows a2(afterSubBytes,afterShiftRows,clk,rst);
mix_col a3(afterShiftRows,afterMixColumns,clk,rst);
AddRoundKey a4(afterMixColumns,key,out,clk,rst);
endmodule
