`timescale 1ns / 1ps


module register(
    input [127:0] d,
    output reg [127:0] q,
    input load,
    input clk,
    input rst
    );
    
    always@(posedge clk , posedge rst) begin
        if(rst) begin
            q<=0;
        end
        else begin
            if (load) begin
                q<=d;
            end
            else begin
                q<=q;
            end
        end
    end
endmodule
