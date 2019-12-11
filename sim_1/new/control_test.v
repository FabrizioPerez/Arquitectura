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


module control_test();
    
     // localparam              B = 16;
     // localparam              W = 11;
   
   
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
    reg [15:0] Instructionn;
    
    
    control prueba_ctrl(
            .SelA  (SelAa), 
           .SelB (SelBb),
            .WrAcc (WrAccc),
            .Op (Opp),
             .WrRam  (WrRamm),
             .Addr (Addrr),
             .clk  (clkk),
             .reset (resett),
             .Instruction (Instructionn)
    );
     initial
       begin
       #1 clkk = 1; resett = 1;
       #1 resett=0;
       
        Instructionn =0;        
        #1
           Instructionn = 16'h1810;  
           
        #1
           Instructionn = 16'h0801;  
        #1
           Instructionn = 16'h1808;  
        
     
       
       end  
         
      always 
      #1 clkk = ~clkk;   
    
    
endmodule





