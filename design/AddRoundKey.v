`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 04:47:02 PM
// Design Name: 
// Module Name: AddRoundKey
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


module AddRoundKey(
    input [127:0] data,
    input [127:0] key,
    output reg [127:0] out,
    input clk,
    input rst
    );
    
    always@(posedge clk , posedge rst) begin 
        if(rst) begin
            out<=0;
        end
        else begin
            out<= data ^ key ;
        end
    end
endmodule
