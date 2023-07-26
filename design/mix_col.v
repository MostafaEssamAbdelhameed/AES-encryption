`timescale 1ns / 1ps

module mix_col(
    input [0:127] in,
    output [0:127] out,
    input clk,
    input rst
    );
   wire [0:7] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
   reg [0:7] b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
   
   assign a0 = in[0+:8];
   assign a1 = in[8+:8];
   assign a2 = in[16+:8];
   assign a3 = in[24+:8];
   assign a4 = in[32+:8];
   assign a5 = in[40+:8];
   assign a6 = in[48+:8];
   assign a7 = in[56+:8];
   assign a8 = in[64+:8];
   assign a9 = in[72+:8];
   assign a10 = in[80+:8];
   assign a11 = in[88+:8];
   assign a12 = in[96+:8];
   assign a13 = in[104+:8];
   assign a14 = in[112+:8];
   assign a15 = in[120+:8];

  
always@(posedge clk , posedge rst) begin 
 if(rst) begin
    b0=8'h00;
    b1=8'h00;
    b2=8'h00;
    b3=8'h00;
    b4=8'h00;
    b5=8'h00;
    b6=8'h00;
    b7=8'h00;
    b8=8'h00;
    b9=8'h00;
    b10=8'h00;
    b11=8'h00;
    b12=8'h00;
    b13=8'h00;
    b14=8'h00; 
    b15=8'h00; 
 end
 else begin
    b0= mult(a0,2) ^ mult(a1,3) ^ mult(a2,1) ^ mult(a3,1);
    b1= mult(a0,1) ^ mult(a1,2) ^ mult(a2,3) ^ mult(a3,1);
    b2= mult(a0,1) ^ mult(a1,1) ^ mult(a2,2) ^ mult(a3,3);
    b3= mult(a0,3) ^ mult(a1,1) ^ mult(a2,1) ^ mult(a3,2);
    
    b4= mult(a4,2) ^ mult(a5,3) ^ mult(a6,1) ^ mult(a7,1);
    b5= mult(a4,1) ^ mult(a5,2) ^ mult(a6,3) ^ mult(a7,1);
    b6= mult(a4,1) ^ mult(a5,1) ^ mult(a6,2) ^ mult(a7,3);
    b7= mult(a4,3) ^ mult(a5,1) ^ mult(a6,1) ^ mult(a7,2);
    
    b8= mult(a8,2) ^ mult(a9,3) ^ mult(a10,1) ^ mult(a11,1);
    b9= mult(a8,1) ^ mult(a9,2) ^ mult(a10,3) ^ mult(a11,1);
    b10= mult(a8,1) ^ mult(a9,1) ^ mult(a10,2) ^ mult(a11,3);
    b11= mult(a8,3) ^ mult(a9,1) ^ mult(a10,1) ^ mult(a11,2);
    
    b12= mult(a12,2) ^ mult(a13,3) ^ mult(a14,1) ^ mult(a15,1);
    b13= mult(a12,1) ^ mult(a13,2) ^ mult(a14,3) ^ mult(a15,1);
    b14= mult(a12,1) ^ mult(a13,1) ^ mult(a14,2) ^ mult(a15,3);
    b15= mult(a12,3) ^ mult(a13,1) ^ mult(a14,1) ^ mult(a15,2);

 end
end

   assign out[0+:8] = b0;
   assign out[8+:8] = b1;
   assign out[16+:8]= b2;
   assign out[24+:8]= b3;
   assign out[32+:8]= b4;
   assign out[40+:8]= b5;
   assign out[48+:8]= b6;
   assign out[56+:8]= b7;
   assign out[64+:8]= b8;
   assign out[72+:8]= b9;
   assign out[80+:8]= b10;
   assign out[88+:8]= b11;
   assign out[96+:8]= b12;
   assign out[104+:8]=b13;
   assign out[112+:8]=b14;
   assign out[120+:8]=b15;
   
/*-------------------------------------------------------------------------*/
    function integer mult (input integer a , input integer b);
        if(b==1) begin
            mult = a;
        end
        else if(b==2) begin
            mult = (a < 8'h80)? (a << 1) : (a << 1) ^ 8'h1b ;
        end
        else if(b==3) begin
            mult = (a < 8'h80)? ((a << 1)^a) : (a << 1) ^ a ^ 8'h1b ;
        end
    endfunction
/*-------------------------------------------------------------------------*/
endmodule
