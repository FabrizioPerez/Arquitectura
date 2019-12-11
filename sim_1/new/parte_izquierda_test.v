`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2019 22:01:09
// Design Name: 
// Module Name: control_test
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


module parte_izquierda_test;
    
   localparam              B = 16;
   localparam              W = 11;
               
   
    //registros
    wire [1:0] SelAa;
    wire SelBb;
    wire WrAccc;
    wire Opp;
    wire WrRamm;
    wire RdRamm;
    wire [10:0] Operandd;
    wire [10:0] Addrr;
    reg resett;
    reg clkk;
   // reg [15:0] Instructionn;
       
    wire       [W-1:0]                      i_addr;   
    wire       [B-1:0]                      salida;     
          
    
    
    
         program_memory
   #(
       .B                     (B),
       .W                     (W),
       //.FILE                  ("C:/Users/Fabrito/Desktop/Materias/Arquitectura2/2019/Tp3/tp3/tp3.srcs/sim_1/new/program_memory.mem")
       .FILE                   ("D:/program_memory.mem")
    )
   prueba_escritura
   (
      .clk         (clkk),
      .addr        (i_addr),
      .data        (salida)
   ); 

    
    
    control prueba_ctrl(
            .SelA  (SelAa), 
           .SelB (SelBb),
            .WrAcc (WrAccc),
            .Op (Opp),
             .WrRam  (WrRamm),
             .Addr (i_addr),
             .clk  (clkk),
             .reset (resett),
             .Instruction (salida)
    );
     initial
       begin
       #1 clkk = 1; resett = 1;
       #1 resett=0;
       
     
       
       end  
         
      always 
      #1 clkk = ~clkk;   
    
    
endmodule





