`timescale 1ns / 1ps

module data_memoryTest();
    
    localparam              B = 16;
    localparam              W = 11;
       
    reg                                    i_clk;  
    reg        [W-1:0]                     i_Wr;
    reg        [W-1:0]                     i_Rd;   
    reg        [B-1:0]                     i_Addr; 
    reg        [B-1:0]                     In_Data;
    //Outputs                                                   
    wire        [B-1:0]                    Out_Data;
   
    initial begin
        #0
        i_clk       = 1'b1;
        i_Rd        = 1'b0;
        i_Addr      = 11'b00000000010;
        
        #2
        i_Wr        = 1'b1;
        In_Data     = 16'b0000111100001111;
        
        #4
        i_Wr        = 1'b0;
        
        #6
        i_Rd        = 1'b1;
        
        #10
        $finish;
    end

    always begin
        #1
        i_clk = ~i_clk;
    end
    
    data_memory
    #(
        .B                     (B),
        .W                     (W)
     )
    prueba_escritura
    (
        .clk                 (i_clk),
        .Wr                  (i_Wr),
        .Rd                  (i_Rd),         
        .Addr                (i_Addr),
        .In_Data               (In_Data),
        .Out_Data              (Out_Data)
    );
    
endmodule
