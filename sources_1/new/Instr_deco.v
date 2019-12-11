    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 05.12.2019 17:23:11
    // Design Name: 
    // Module Name: Instr_deco
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
    
    
    module Instr_deco
       #(
        parameter B = 16, // number of bits
                  W = 5  // number of address bits
       )
       (
        input wire clk,
        input wire [W-1:0] Opcode,
        output wire [1:0] SelA,
        output wire SelB,
        output wire WrAcc,
        output wire Op,
        output wire WrPC,
        output wire WrRam,
        output wire RdRam     
       );
    
        reg WrPCc; 
        reg [1:0]SelAa;
        reg SelBb;
        reg WrRamm;
        reg WrAccc;
        reg Opp;
        reg RdRamm;
        
        
           always @(*)
              begin
                    case(Opcode)
                    5'b00000 :
                    begin
                    WrPCc = 0;
                    SelAa  = 2'b00; 
                    SelBb = 0;  
                    WrAccc = 0;  
                    Opp = 0;
                    WrRamm = 0;
                    RdRamm = 0;
                    end 
                    5'b00001 :      //store variable
                    begin
                    WrPCc = 1;
                    SelAa  = 2'b00; 
                    SelBb = 0;  
                    WrAccc = 0;  
                    Opp = 0;
                    WrRamm = 1;
                    RdRamm = 0;
                    
                    
                    end
                    5'b00010 :    //load variable
                    begin
                              WrPCc = 1;
                              SelAa  = 2'b00; 
                              SelBb = 0;  
                              WrAccc = 1;  
                              Opp = 0;
                              WrRamm = 0;
                              RdRamm = 1;
                    
                    
                    end
                    5'b00011 :           //load inmediate
                          begin
                              WrPCc = 1;
                              SelAa  = 2'b01; 
                              SelBb = 0;  
                              WrAccc = 1;  
                              Opp = 0;
                              WrRamm = 0;
                              RdRamm = 0;
                            end 
                    5'b00100 :      //add variable
                    begin
                         WrPCc = 1;
                         SelAa  = 2'b10; 
                         SelBb = 0;  
                         WrAccc = 1;  
                         Opp = 0;
                         WrRamm = 0;
                         RdRamm = 1;
                    
                    
                    end
                    5'b00101 :    //add inmediate
                      begin
                                            WrPCc = 1;
                                            SelAa  = 2'b10; 
                                            SelBb = 1;  
                                            WrAccc = 1;  
                                            Opp = 0;
                                            WrRamm = 0;
                                            RdRamm = 0;
                         
                        
                        end                                        
                    5'b00110 :  //substract variable
                    begin
                        WrPCc = 1;
                        SelAa  = 2'b10; 
                        SelBb = 0;  
                        WrAccc = 1;  
                        Opp = 1;
                        WrRamm = 0;
                        RdRamm = 1;
                      end                                                      
                   5'b00111 :     //substract inmediate
                          begin
                          WrPCc = 1;
                          SelAa  = 2'b10; 
                          SelBb = 1;  
                          WrAccc = 1;  
                          Opp = 1;
                          WrRamm = 0;
                          RdRamm = 0;
                          end 
                    default: begin
                            WrPCc = 0;
                            SelAa  = 2'b00; 
                            SelBb = 0;  
                            WrAccc = 0;  
                            Opp = 0;
                            WrRamm = 0;
                            RdRamm = 0;    
                            end                
                endcase
             end
         
         assign WrPC = WrPCc;
         assign SelA = SelAa;
         assign SelB = SelBb;
         assign WrAcc = WrAccc;
         assign Op = Opp;
         assign WrRam = WrRamm;
         assign RdRam = RdRamm;
         
         
    endmodule
