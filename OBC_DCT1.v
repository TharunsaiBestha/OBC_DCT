module ROM2(Adress,Data,clr);
parameter N = 32;
parameter M = 1;
reg[N-1:0] Mem[0:2**M-1];
input clr;
input[M-1:0] Adress;
output reg[N-1:0] Data;
always @(*) begin
    if(clr)Data<=0;
   else Data<=Mem[Adress];
end
endmodule
module ROM7(Adress,Data,clr);
parameter N = 32;
parameter M = 7;
reg[N-1:0] Mem[0:2**M-1];
input clr;
input[M-1:0] Adress;
output reg[N-1:0] Data;
always @(*) begin
    if(clr)Data<=0;
   else Data<=Mem[Adress];
end
endmodule
module ROM3(Adress,Data,clr);
parameter N = 32;
parameter M = 3;
reg[N-1:0] Mem[0:2**M-1];
input clr;
input[M-1:0] Adress;
output reg[N-1:0] Data;
always @(*) begin
    if(clr)Data<=0;
   else Data<=Mem[Adress];
end
endmodule
module mux2to1(A,B,out,sel);
parameter N=32;
input[N-1:0] A,B;
output[N-1:0] out;
input sel;
assign out=sel?A:B;
endmodule
module Adder(A,B,out);
parameter N=32;
input[N-1:0] A,B;
output[N-1:0] out;
assign out=A+B;
endmodule
module delay(A,out,clk,clr);
parameter N =32;
input[N-1:0] A;
input clk,clr;
output reg[N-1:0] out;
always @(posedge clk) begin
if(clr)out<=0;
else out<=A;
end
endmodule
module counter(out,clk,clr);
parameter N = 32;
parameter val = 32;
input clk,clr;
output reg[N-1:0] out;
always @(posedge clk) begin
    if(clr)out<=0;
    else if(out==val)out<=0;
    else out<=out+1;
end
endmodule
module C_Block(in,out,s1,s2,clk,clr);
parameter N=32;
input[N-1:0] in;
output[N-1:0] out;
input clk,s1,s2,clr;
reg [N-1:0] extra;
wire[N-1:0] mux_out,adder_out,delay_out,mux2_out;
mux2to1 M1(-in,in,mux_out,s1);
Adder A(mux_out,mux2_out,adder_out);
mux2to1 M2(extra,delay_out,mux2_out,s2);
delay D({adder_out[N-1],adder_out[N-1:1]},delay_out,clk,clr);
assign out=adder_out;
endmodule
module controller(init,i,x3,s1,s2,outen,clrm,clrc,clk);
parameter N=32;
input[N-1:0] i;
input init,clk,x3;
wire s;
output reg s2,clrm,clrc,outen;
output s1;
parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
reg[1:0] state;
assign s=(i==N-1);
assign s1=x3^s;
always @(posedge clk) begin
    case(state)
    S0:state<=init?S1:S0;
    S1:state<=S2;
    S2:state<=i<N?S2:S3;
    S3:state<=S0;
    endcase
end
always @(state) begin
    case(state)
    S0:begin clrc<=1;clrm<=1;s2<=0;outen<=0;end
    S1:begin clrm<=0;clrc<=0;s2<=1; end
    S2:begin clrc<=0;s2<=0; clrc<=0;end
    S3:outen<=1;
    endcase
end
endmodule
module X2_DA(in,out,clk,init);
parameter N=32;
input[N-1:0] in;
output[N-1:0] out;
input clk,init;
wire[N-1:0] ROM_out,i;
wire clrm,clrc,s1,s2,outen;
counter C(i,clk,clrc);
controller Co(init,i,1'b0,s1,s2,outen,clrm,clrc,clk);
ROM2 R(in[i],ROM_out,clrm);
C_Block CB(ROM_out,out,s1,s2,clk,clrm);
endmodule
module X2(in1,in2,out,clk,init);
parameter N=32;
input[N-1:0] in1,in2;
output[N-1:0] out;
input clk,init;
wire[N-1:0] ROM_out,i;
wire clrm,clrc,s1,s2,outen;
counter C(i,clk,clrc);
controller Co(init,i,in2[i],s1,s2,outen,clrm,clrc,clk);
ROM2 R(in2[i]^in1[i],ROM_out,clrm);
C_Block CB(ROM_out,out,s1,s2,clk,clrm);
endmodule
module X8(in0,in1,in2,in3,in4,in5,in6,in7,out,clk,init);
parameter N=32;
input[N-1:0] in0,in1,in2,in3,in4,in5,in6,in7;
output[N-1:0] out;
input clk,init;
wire[N-1:0] ROM_out,i;
wire clrm,clrc,s1,s2,outen;
counter C(i,clk,clrc);
controller Co(init,i,in7[i],s1,s2,outen,clrm,clrc,clk);
ROM7 R({in7[i]^in6[i],in7[i]^in5[i],in7[i]^in4[i],in7[i]^in3[i],in7[i]^in2[i],in7[i]^in1[i],in7[i]^in0[i]},ROM_out,clrm);
C_Block CB(ROM_out,out,s1,s2,clk,clrm);
endmodule
module X4(in0,in1,in2,in3,out,clk,init);
parameter N=32;
input[N-1:0] in0,in1,in2,in3;
output[N-1:0] out;
input clk,init;
wire[N-1:0] ROM_out,i;
wire clrm,clrc,s1,s2,outen;
counter C(i,clk,clrc);
controller Co(init,i,in3[i],s1,s2,outen,clrm,clrc,clk);
ROM3 R({in3[i]^in2[i],in3[i]^in1[i],in3[i]^in0[i]},ROM_out,clrm);
C_Block CB(ROM_out,out,s1,s2,clk,clrm);
endmodule
module OBC_DCT1(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,clk,init);
parameter N =32;
input[N-1:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
output[N-1:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;
input clk,init;
wire[N-1:0] M0,M1,M2,M3,M4,M5,M6,M7,M07,M16,M25,M34;
wire[N-1:0] P0,P1,P2,P3,P4,P5,P6,P7;
assign M0=in0-in15;
assign M1=in1-in14;
assign M2=in2-in13;
assign M3=in3-in12;
assign M4=in4-in11;
assign M5=in5-in10;
assign M6=in6-in9;
assign M7=in7-in8;
assign P0=in0+in15;
assign P1=in1+in14;
assign P2=in2+in13;
assign P3=in3+in12;
assign P4=in4+in11;
assign P5=in5+in10;
assign P6=in6+in9;
assign P7=in7+in8;
assign M07=P0-P7;
assign M16=P1-P6;
assign M25=P2-P5;
assign M34=P3-P4;
X2_DA X_0(P0+P1+P2+P3+P4+P5+P6+P7,out0,clk,init);
X8 X_1(M0,M1,M2,M3,M4,M5,M6,M7,out1,clk,init);
X4 X_2(M07,M16,M25,M34,out2,clk,init);
X8 X_3(M5,M0,M4,M6,M1,M3,M7,M2,out3,clk,init);
X2 X_4(P0+P7-P3-P4,P1+P6-P2-P5,out4,clk,init);
X8 X_5(M6,M3,M0,M2,M5,M7,M4,M1,out5,clk,init);
X4 X_6(M25,M07,M34,M16,out6,clk,init);
X8 X_7(M4,M2,M6,M0,M7,M1,M5,M3,out7,clk,init);
X2_DA X_8(P0-P1-P2+P3+P4-P5-P6+P7,out8,clk,init);
X8 X_9(M3,M5,M1,M7,M0,M6,M2,M4,out9,clk,init);
X4 X_10(P6-P1,P3-P7,P0-P7,P2-P5,out10,clk,init);
X8 X_11(M1,M4,M7,M5,M2,M0,M3,M6,out11,clk,init);
X2 X_12(P2+P5-P1-P6,P0+P7-P3-P4,out12,clk,init);
X8 X_13(M2,M7,M3,M1,M6,M4,M0,M5,out13,clk,init);
X4 X_14(P4-P3,P2-P5,P6-P1,P0-P7,out14,clk,init);
X8 X_15(M7,M6,M5,M4,M3,M2,M1,M0,out15,clk,init);
endmodule
