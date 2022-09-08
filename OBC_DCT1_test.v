module OBC_DCT1_test;
parameter N =32;
reg[N-1:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
wire[N-1:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;
reg clk,init;
integer outfile;
OBC_DCT1 DUT(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,clk,init);
initial begin
    init=0;
    clk=0;
    outfile=$fopen("outputs.txt","w");
    DUT.X_0.Co.state=2'b00;
    DUT.X_1.Co.state=2'b00;
    DUT.X_2.Co.state=2'b00;
    DUT.X_3.Co.state=2'b00;
    DUT.X_4.Co.state=2'b00;
    DUT.X_5.Co.state=2'b00;
    DUT.X_6.Co.state=2'b00;
    DUT.X_7.Co.state=2'b00;
    DUT.X_8.Co.state=2'b00;
    DUT.X_9.Co.state=2'b00;
    DUT.X_10.Co.state=2'b00;
    DUT.X_11.Co.state=2'b00;
    DUT.X_12.Co.state=2'b00;
    DUT.X_13.Co.state=2'b00;
    DUT.X_14.Co.state=2'b00;
    DUT.X_15.Co.state=2'b00;
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X0.txt",DUT.X_0.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X1.txt",DUT.X_1.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X2.txt",DUT.X_2.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X3.txt",DUT.X_3.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X4.txt",DUT.X_4.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X5.txt",DUT.X_5.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X6.txt",DUT.X_6.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X7.txt",DUT.X_7.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X8.txt",DUT.X_8.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X9.txt",DUT.X_9.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X10.txt",DUT.X_10.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X11.txt",DUT.X_11.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X12.txt",DUT.X_12.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X13.txt",DUT.X_13.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X14.txt",DUT.X_14.R.Mem);
    $readmemb("/home/tharunsai/Documents/Verilog/DSP_A/X15.txt",DUT.X_15.R.Mem);
    // DUT.X_0.CB.extra=32'b0;
    // DUT.X_1.CB.extra=32'b11010111001100001101100011111111;
    // DUT.X_2.CB.extra=32'b11101011011111110010011000110000;
    // DUT.X_3.CB.extra=32'b00001101110001111001001001011000;
    // DUT.X_4.CB.extra=32'b11110101100011000010100010111000;
    // DUT.X_5.CB.extra=32'b11110111100000111011101101101011;
    // DUT.X_6.CB.extra=32'b00000111001100110010011010111011;
    // DUT.X_7.CB.extra=32'b00000110010011100010010000000010;
    // DUT.X_8.CB.extra=32'b00000000000000000000000000000000;
    // DUT.X_9.CB.extra=32'b11111010110100110100111100011010;
    // DUT.X_10.CB.extra=32'b11101011011111110010011000110000;
    // DUT.X_11.CB.extra=32'b00000100100010010001100111110100;
    // DUT.X_12.CB.extra=32'b11110101100011000010100010111000;
    // DUT.X_13.CB.extra=32'b11111011110100011110110001000000;
    // DUT.X_14.CB.extra=32'b11101011011111110010011000110000;
    // DUT.X_15.CB.extra=32'b00000100000001001111010001100111;
    DUT.X_0.CB.extra=DUT.X_0.R.Mem[0];
    DUT.X_1.CB.extra=DUT.X_1.R.Mem[0];
    DUT.X_2.CB.extra=DUT.X_2.R.Mem[0];
    DUT.X_3.CB.extra=DUT.X_3.R.Mem[0];
    DUT.X_4.CB.extra=DUT.X_4.R.Mem[0];
    DUT.X_5.CB.extra=DUT.X_5.R.Mem[0];
    DUT.X_6.CB.extra=DUT.X_6.R.Mem[0];
    DUT.X_7.CB.extra=DUT.X_7.R.Mem[0];
    DUT.X_8.CB.extra=DUT.X_8.R.Mem[0];
    DUT.X_9.CB.extra=DUT.X_9.R.Mem[0];
    DUT.X_10.CB.extra=DUT.X_10.R.Mem[0];
    DUT.X_11.CB.extra=DUT.X_11.R.Mem[0];
    DUT.X_12.CB.extra=DUT.X_12.R.Mem[0];
    DUT.X_13.CB.extra=DUT.X_13.R.Mem[0];
    DUT.X_14.CB.extra=DUT.X_14.R.Mem[0];
    DUT.X_15.CB.extra=DUT.X_15.R.Mem[0];
//$readmemb("/home/tharunsai/Documents/Verilog/DSP_A/input.txt",{in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15});
in0=32'b00000000010100011110101110000101;
in1=32'b00000000011000100100110111010010;
in2=32'b00000000010100011110101110000101;
in3=32'b00000000011000100100110111010010;
in4=32'b00000000010100011110101110000101;
in5=32'b00000000011000100100110111010010;
in6=32'b00000000010100011110101110000101;
in7=32'b00000000011000100100110111010010;
in8=32'b00000000010100011110101110000101;
in9=32'b00000000011000100100110111010010;
in10=32'b00000000010100011110101110000101;
in11=32'b00000000011000100100110111010010;
in12=32'b00000000010100011110101110000101;
in13=32'b00000000011000100100110111010010;
in14=32'b00000000010100011110101110000101;
in15=32'b00000000011000100100110111010010;
#5 init=1;#10 init=0;
    #500 $finish;
end
always #5 clk=~clk;
initial begin
    $dumpfile("OBC_DCT1_test.vcd");
    $dumpvars(0,OBC_DCT1_test);
end
always @(posedge clk) begin
    if(DUT.X_0.i==31)begin
      $write("out0=%b\n",out0);
      $write("out1=%b\n",out1);
      $write("out2=%b\n",out2);
      $write("out3=%b\n",out3);
      $write("out4=%b\n",out4);
      $write("out5=%b\n",out5);
      $write("out6=%b\n",out6);
      $write("out7=%b\n",out7);
      $write("out8=%b\n",out8);
      $write("out9=%b\n",out9);
      $write("out10=%b\n",out10);
      $write("out11=%b\n",out11);
      $write("out12=%b\n",out12);
      $write("out13=%b\n",out13);
      $write("out14=%b\n",out14);
      $write("out15=%b\n",out15); 
    end
end
 always @(posedge clk) begin
     if(DUT.X_0.i==31)begin
       $fdisplay(outfile,"%b",out0);
       $fdisplay(outfile,"%b",out1);
       $fdisplay(outfile,"%b",out2);
       $fdisplay(outfile,"%b",out3);
       $fdisplay(outfile,"%b",out4);
       $fdisplay(outfile,"%b",out5);
       $fdisplay(outfile,"%b",out6);
       $fdisplay(outfile,"%b",out7);
       $fdisplay(outfile,"%b",out8);
       $fdisplay(outfile,"%b",out9);
       $fdisplay(outfile,"%b",out10);
       $fdisplay(outfile,"%b",out11);
       $fdisplay(outfile,"%b",out12);
       $fdisplay(outfile,"%b",out13);
       $fdisplay(outfile,"%b",out14);
       $fdisplay(outfile,"%b",out15); 
     end
 end
//$fclose(outfile);
endmodule