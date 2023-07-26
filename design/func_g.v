`timescale 1ns / 1ps


module func_g(
    input [0:31] w,
    input [0:3] i,
    output [0:31] out
 
    );
    
    wire[0:31] shift_w;
    wire[0:31] tmp_out;
    wire[0:7] s_wire;
    reg [0:7] RC;
    
    assign shift_w[0+:8] = w[8+:8];
    assign shift_w[8+:8] = w[16+:8];
    assign shift_w[16+:8] = w[24+:8];
    assign shift_w[24+:8] = w[0+:8];

/*----------------------------------------------*/
    genvar j;
    generate 
    for(j=0;j<32;j=j+8) begin 
        s_box s (shift_w[j+:8],tmp_out[j+:8]);
        end
    endgenerate
/*----------------------------------------------*/

    always@(*) begin
        case(i)
            4'd01: RC= 8'h01;
            4'd02: RC= 8'h02;
            4'd03: RC= 8'h04;
            4'd04: RC= 8'h08;
            4'd05: RC= 8'h10;
            4'd06: RC= 8'h20;
            4'd07: RC= 8'h40;
            4'd08: RC= 8'h80;
            4'd09: RC= 8'h1b;
            4'd10: RC= 8'h36;
            
            default: RC= 8'h01;
        endcase
    end
assign s_wire = tmp_out[0:7] ^ RC;
assign out = {s_wire,tmp_out[8:31]};
endmodule
