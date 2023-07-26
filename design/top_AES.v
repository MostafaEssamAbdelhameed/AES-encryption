`timescale 1ns / 1ps

module top_AES(
    input [127:0] data,key,
    output [127:0] cipher,
    input start,
    output done,
    input clk,
    input rst
    );
wire[127:0] data_reg , key_reg;
wire[127:0] key_r,key_r0,key_r1,key_r2,key_r3,key_r4,key_r5,key_r6,key_r7,key_r8,key_r9;
wire[127:0] out,out_r0,out_r1,out_r2,out_r3,out_r4,out_r5,out_r6,out_r7,out_r8,out_r9;

register f1 (key,key_reg,start,clk,rst);
key_exp a1     ( .key(key_reg),
                 .clk(clk),
                 .rst(rst),
                 .key_r(key_r),
                 .key_r0(key_r0),
                 .key_r1(key_r1),
                 .key_r2(key_r2),
                 .key_r3(key_r3),
                 .key_r4(key_r4),
                 .key_r5(key_r5),
                 .key_r6(key_r6),
                 .key_r7(key_r7),
                 .key_r8(key_r8),
                 .key_r9(key_r9)
                  );
                  
register f0 (data ,data_reg,start,clk,rst);
AddRoundKey a0(data_reg,key_r,out,clk,rst);
                  

round r0 (out,key_r0,out_r0,clk,rst);
round r1 (out_r0,key_r1,out_r1,clk,rst);
round r2 (out_r1,key_r2,out_r2,clk,rst);
round r3 (out_r2,key_r3,out_r3,clk,rst);
round r4 (out_r3,key_r4,out_r4,clk,rst);
round r5 (out_r4,key_r5,out_r5,clk,rst);
round r6 (out_r5,key_r6,out_r6,clk,rst);
round r7 (out_r6,key_r7,out_r7,clk,rst);
round r8 (out_r7,key_r8,out_r8,clk,rst);
last_round r9 (out_r8,key_r9,out_r9,done,clk,rst);
register f3 (out_r9,cipher,done,clk,rst);
//assign cipher = out_r9;

endmodule
