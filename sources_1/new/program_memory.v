`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2019 22:02:17
// Design Name: 
// Module Name: program_memory
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

module program_memory
   #(
    parameter B = 16, // number of bits
              W = 11,  // number of address bits
              FILE=""
   )
   (
    input wire clk,
    input wire [W-1:0] addr,
    output wire [B-1:0] data
   );


   reg [B-1:0] array_reg [2**W-1:0];
   integer i;
   initial
       begin
           if(FILE !="")
               $readmemh(FILE, array_reg,0,2**W-1);
           else
           begin    
               for (i = 0; i < 2**W-1; i = i + 1)
                   array_reg[i] = {B{1'b0}};
           end
       end
   
  
   assign data = array_reg[addr];

endmodule











/*
module data_memory
   #(
    parameter B = 16, // number of bits
              W = 11  // number of address bits
   )
   (
    input wire clk,
    input wire wr_en,
    input wire [W-1:0] addr,
    input wire [B-1:0] w_data,
    output wire [B-1:0] r_data
   );

   // signal declaration
   reg [B-1:0] array_reg [2**W-1:0];

   // body
   // write operation
   always @(negedge clk)
      if (wr_en)
         array_reg[addr] <= w_data;
   // read operation
   assign r_data = array_reg[addr];

endmodule


*/













/*
module program_memory
#(
    parameter B = 16,
              W = 2 
)

 (
 input wire clk, 
 input wire Wr, Rd,
 input wire [10:0] Addr, 
 input wire [B-1:0] In_Data, 
 output wire [B-1:0] Out_Data
 );
    
  reg[B-1:0] arreglo [10:0];
  reg[B-1:0] regSalida;
    
  always @(posedge clk)
  begin 
      if (Wr)
      arreglo [Addr] <= In_Data; 
  end  
  
  
  always@(posedge clk)
  begin
  if(Rd) 
  begin 
    regSalida = arreglo [Addr];
  end
  end
  
    
   assign Out_Data = regSalida ;  
        
endmodule

*/



