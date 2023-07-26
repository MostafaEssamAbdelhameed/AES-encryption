`timescale 1ns / 1ps



module AddRoundKey_tb();
parameter clk_period = 10;
reg clk_tb=0;
always#(clk_period/2) clk_tb = ~clk_tb;

reg [127:0] data_tb;
reg [127:0] key_tb;
reg rst_tb;
wire [127:0] out_tb;

AddRoundKey DUT (.data(data_tb),
                 .key(key_tb),
                 .clk(clk_tb),
                 .rst(rst_tb),
                 .out(out_tb)
                  );
                  
initial begin
    $monitor("input= %H, output= %h, key = %h", data_tb, out_tb, key_tb);
end

initial begin
    data_tb = 128'h_046681e5_e0cb199a_48f8d37a_2806264c;
	key_tb = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
end
endmodule
