`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2019 20:35:14
// Design Name: 
// Module Name: bip
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


module bip(
input  clk,
input  reset,
output reg PC
);
     
    localparam              B = 16;
    localparam              W = 11; 

    wire [1:0] SelAa;
    wire SelBb;
    wire WrAccc;
    wire Opp;
    wire WrRamm;
    wire RdRamm;
    wire [10:0] Operandd;
    wire [10:0] Addrr;

    reg [15:0] Instructionn;
    
    wire        [W-1:0]                     i_Wr;
    wire        [W-1:0]                     i_Rd;   
    wire        [B-1:0]                     i_Addr; 
    wire        [B-1:0]                     In_Data;
    //Outputs                                                   
    wire        [B-1:0]                    Out_Data;

   
     wire       [B-1:0]                       salida_mem_prog;     
        
        
        
    
    

    control ctrl(
            .SelA  (SelAa), 
            .SelB (SelBb),
            .WrAcc (WrAccc),
            .Op (Opp),
             .WrRam  (WrRamm),
             .RdRam (RdRamm),
             .Addr (Addrr),
             .clk  (clk),
             .reset (reset),
             .Operand (Operandd),
             
             
             .Instruction (salida_mem_prog)
    );

 
 
      program_memory
    #(
        .B                     (B),
        .W                     (W),
        //.FILE                  ("C:/Users/Fabrito/Desktop/Materias/Arquitectura2/2019/Tp3/tp3/tp3.srcs/sim_1/new/program_memory.mem")
        .FILE                   ("D:/program_memory.mem")
     )
    prog_mem
    (
       .clk         (clk),
       .addr        (Addrr),
       .data        (salida_mem_prog)
    ); 

  
        

        data_memory
        #(
            .B                     (B),
            .W                     (W)
         )
        dat_mem
        (

             .clk (clk),
              .wr_en (WrRamm),
               .rd_en (RdRamm),
               .addr   (Operandd),
               .w_data (In_Data),
               .r_data   (Out_Data) 
        );
    

       
    
    
        data_path dat_p (
        .Address (Operandd),
        .In_Data (In_Data),
        .SelA  (SelAa),
        .SelB  (SelBb),
        .WrAcc   (WrAccc),
        .Op  (Opp),
        .Operand (Operandd),
        .Out_Data  (Out_Data),
        .clk  (clk),
        .reset (reset)
        
        
        );


























endmodule
