`timescale 1ns / 1ps



module key_exp_tb();
parameter clk_period = 10;
reg clk_tb=0;
always#(clk_period/2) clk_tb = ~clk_tb;

reg [127:0] key_tb;
reg rst_tb;
wire [127:0] key_r_tb,key_r0_tb,key_r1_tb,key_r2_tb,key_r3_tb,key_r4_tb,key_r5_tb,key_r6_tb,key_r7_tb,key_r8_tb,key_r9_tb;

key_exp DUT     (.key(key_tb),
                 .clk(clk_tb),
                 .rst(rst_tb),
                 .key_r(key_r_tb),
                 .key_r0(key_r0_tb),
                 .key_r1(key_r1_tb),
                 .key_r2(key_r2_tb),
                 .key_r3(key_r3_tb),
                 .key_r4(key_r4_tb),
                 .key_r5(key_r5_tb),
                 .key_r6(key_r6_tb),
                 .key_r7(key_r7_tb),
                 .key_r8(key_r8_tb),
                 .key_r9(key_r9_tb)
                  );

initial begin
    $monitor("input= %H, output0= %h,output1= %h,output2= %h", key_tb, key_r0_tb,key_r1_tb,key_r2_tb);
end

initial begin
	key_tb = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
end              
endmodule
