`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2023 04:54:19 PM
// Design Name: 
// Module Name: mix_col_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mix_col_tb();

parameter clk_period = 10;
reg clk_tb=0;
always#(clk_period/2) clk_tb = ~clk_tb;

reg rst_tb;
reg [127:0] in_tb;
wire [127:0] out_tb;

mix_col DUT (.in(in_tb),
               .out(out_tb),
               .rst(rst_tb),
               .clk(clk_tb)
                );

initial begin
    $monitor("input= %H, output= %h", in_tb, out_tb);
end

initial begin
    in_tb = 128'h_49db873b_45395389_7f02d2f1_77de961a;
end

endmodule
