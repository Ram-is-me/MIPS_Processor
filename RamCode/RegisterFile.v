module RegisterFile(readr1, readr2, writer, writedata, readd1, readd2, regwrite, clk);

input [5:0] readr1; //Read Register 1
input [5:0] readr2; //Read Register 2
input [5:0] writer; //Write Register
input [31:0] writedata; //Write Data
input regwrite; //Register Write Signal
input clk;  //Clock


output [31:0] readd1; //Read Data 1
output [31:0] readd2; //Read Data 2



reg [31:0] s0;
reg [31:0] s1;
reg [31:0] s2;
reg [31:0] s3;
reg [31:0] s4;
reg [31:0] s5;
reg [31:0] s6;
reg [31:0] s7;

reg [31:0] t0;
reg [31:0] t1;
reg [31:0] t2;
reg [31:0] t3;
reg [31:0] t4;
reg [31:0] t5;
reg [31:0] t6;
reg [31:0] t7;


endmodule;