`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2019 20:19:02
// Design Name: 
// Module Name: datapath
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


module data_path(
        output [10:0] Address,
        output [15:0] In_Data,
        input [1:0] SelA,
        input SelB,
        input WrAcc,
        input Op,
        input [10:0] Operand,
        input [15:0] Out_Data,
        input clk,
        input reset
    );
    wire [15:0] signal_extended;
    wire [15:0] result;
    assign signal_extended = {5'b00000,Operand};
    reg [15:0] output_SelA;
    wire [15:0] output_selB;
    reg [15:0] ACC;
    always @*
        begin
            case (SelA)
                2'b00:output_SelA=Out_Data;
                2'b01:output_SelA=signal_extended;
                2'b10:output_SelA=result;
                default:output_SelA=0;
            endcase
        end
    assign output_selB = SelB ? signal_extended : Out_Data;
    
    always @(negedge clk)
        if(reset)
            ACC<=0;
         else
            begin
            if(WrAcc)
                ACC<=output_SelA;
            end
    alu basic_alu
    (
        .resultado(result),
        .a(ACC),
        .b(output_selB),
        .operador(Op)
    );
    assign In_Data=ACC;
    assign Address=Operand;
endmodule