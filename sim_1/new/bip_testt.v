`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2019 21:42:06
// Design Name: 
// Module Name: bip_testt
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


module bip_testt();

wire salidaPC; 
reg clkk;
reg resett;


bip bipTest(
.PC (salidaPC),
.clk   (clkk),
.reset  (resett)

);

initial
       begin
       #1 clkk = 1; resett = 1;
       #1 resett=0;
       
       #10 $finish;
       
       
       
       end




 always 
#1 clkk = ~clkk;   






endmodule
