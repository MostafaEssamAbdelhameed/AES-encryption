`timescale 1ns / 1ps

module shift_rows(
    input [0:127] in,
    output reg [0:127] out,
    input clk,
    input rst
    );
    always@(posedge clk , posedge rst) begin
    if(rst) begin
    out<=0;
    end
    else begin
    //first row no shift
        out[0+:8]<=in[0+:8];
        out[32+:8]<=in[32+:8];
        out[64+:8]<=in[64+:8];
        out[96+:8]<=in[96+:8];
        
    //second row 1 byte circulary shift left  
        out[8+:8]<=in[40+:8];
        out[40+:8]<=in[72+:8];
        out[72+:8]<=in[104+:8];
        out[104+:8]<=in[8+:8];
        
    //third row 2 bytes circulary shift left  
        out[16+:8]<=in[80+:8];
        out[48+:8]<=in[112+:8];
        out[80+:8]<=in[16+:8];
        out[112+:8]<=in[48+:8];
        
    //fourth row 3 bytes circulary shift left  
        out[24+:8]<=in[120+:8];
        out[56+:8]<=in[24+:8];
        out[88+:8]<=in[56+:8];
        out[120+:8]<=in[88+:8];
        
     end
    end   
endmodule
