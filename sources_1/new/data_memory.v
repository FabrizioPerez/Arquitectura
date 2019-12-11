`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2019 19:59:33
// Design Name: 
// Module Name: data_memory
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

module data_memory
   #(
    parameter B = 16, // number of bits
              W = 11  // number of address bits
   )
   (
    input wire clk,
    input wire wr_en,
    input wire rd_en,
    input wire [W-1:0] addr,
    input wire [B-1:0] w_data,
    output reg [B-1:0] r_data
   );

   // signal declaration
   reg [B-1:0] array_reg [2**W-1:0];

   // body
   // write operation
   always @(negedge clk)
      if (wr_en)
         array_reg[addr] <= w_data;
   // read operation
   
   always @(*)
   begin
   if (rd_en)
    r_data = array_reg[addr];
    else
    r_data = {16{1'bz}};
   end
    

endmodule












