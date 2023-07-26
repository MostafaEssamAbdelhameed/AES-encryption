`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 07:07:25 PM
// Design Name: 
// Module Name: shift_rows_tb
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


module shift_rows_tb();

parameter clk_period = 10;
reg clk_tb=0;
always#(clk_period/2) clk_tb = ~clk_tb;

reg rst_tb;
reg [127:0] in_tb;
wire [127:0] out_tb;

shift_rows DUT (.in(in_tb),
                .out(out_tb),
                .clk(clk_tb),
                .rst(rst_tb)
                    );
initial begin
    $monitor("input= %H, output= %h", in_tb, out_tb);
end

initial begin
    in_tb = 128'h_49ded289_45db96f1_7f39871a_7702533b;
    rst_tb=1;
    #(100);
    rst_tb=0;
end
endmodule
