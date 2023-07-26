`timescale 1ns / 1ps



module sub_bytes_tb();

parameter clk_period = 10;
reg clk_tb=0;
always#(clk_period/2) clk_tb = ~clk_tb;

reg rst_tb;
reg [127:0] in_tb;
wire [127:0] out_tb;

sub_bytes DUT (.in(in_tb),
               .out(out_tb),
               .rst(rst_tb),
               .clk(clk_tb)
                );
                
initial begin
    $monitor("input= %H, output= %h", in_tb, out_tb);
end

initial begin
    in_tb = 128'h_a49c7ff2_689f352b_6b5bea43_026a5049;
end
endmodule
