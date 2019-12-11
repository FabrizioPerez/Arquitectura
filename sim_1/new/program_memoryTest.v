`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2019 21:46:40
// Design Name: 
// Module Name: program_memoryTest
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


module program_memoryTest;
       
    localparam              B = 16;
    localparam              W = 11;
       
    reg                                    clk;    
    //reg        [B-1:0]                     o_data;   
    reg        [W-1:0]                     i_addr;   
       
    wire       [B-1:0]             salida;     
       
       
       
      program_memory
    #(
        .B                     (B),
        .W                     (W),
        //.FILE                  ("C:/Users/Fabrito/Desktop/Materias/Arquitectura2/2019/Tp3/tp3/tp3.srcs/sim_1/new/program_memory.mem")
        .FILE                   ("C:/program_memory.mem")
     )
    prueba_escritura
    (
       .clk         (clk),
       .addr        (i_addr),
       .data        (salida)
    ); 



    initial
            begin
              i_addr = 0;  
            #1
              i_addr = 1;
            #1 
              i_addr = 2;  
              #1
               i_addr = 3;
              #1 
                i_addr = 4;     
               #1 
               i_addr = 5;  

        
        end







endmodule
