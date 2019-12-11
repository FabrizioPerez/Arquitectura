`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:45 12/09/2018 
// Design Name: 
// Module Name:    control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control
	(
        output  [1:0] SelA,
        output  SelB,
        output  WrAcc,
        output  Op,
        output  WrRam,
        output  RdRam,
        output [10:0] Operand,
        output [10:0] Addr,
		input clk,
		input reset,
		input [15:0] Instruction
   );
   
    wire WrPc2EnablePC;
    wire [4:0] Opcode = Instruction[15:11];
    assign Operand = Instruction[10:0];
    
    univ_bin_counter #(.N(11)) program_counter
    (
        .clk(clk),
		.reset(reset),
		.syn_clr(1'b0),
		.load(1'b0),
		.en(WrPc2EnablePC),
		.up(1'b1),
		.d(0),
		.q(Addr)	
	 );
	  
    Instr_deco u_instruction_decoder
	(
		.WrPC(WrPc2EnablePC),
		.SelA(SelA),
		.SelB(SelB),
		.WrAcc(WrAcc),
		.Op(Op),
		.WrRam(WrRam),
		.RdRam(RdRam),
		.Opcode(Opcode)
	);
	
endmodule

/*
reg_file #(.B(16),.W(11),.FILE("instrucciones.mem")) program_memory
	(
		.clk(clk),
		.wr_en(0),
		.w_addr(0),
		.r_addr(direccion),
		.w_data(0),
		.r_data(instruccion)
	);
*/