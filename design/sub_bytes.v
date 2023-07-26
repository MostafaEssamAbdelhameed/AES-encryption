`timescale 1ns / 1ps

module sub_bytes(
    input [127:0] in,
    output reg [127:0] out,
    input clk,
    input rst
    );
    wire [127:0] tmp_out;
    
/*----------------------------------------------*/
    genvar i;
    generate 
    for(i=0;i<128;i=i+8) begin 
        s_box s (in[i+:8],tmp_out[i+:8]);
        end
    endgenerate
/*----------------------------------------------*/

always@(posedge clk,posedge rst) begin
    if (rst) begin
        out<=0;
    end
    else begin 
        out<= tmp_out;
    end
end  
endmodule
