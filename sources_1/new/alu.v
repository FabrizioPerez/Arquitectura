`timescale 1ns / 1ps









module alu #(parameter N_BITS = 16)
				(
					output reg signed [N_BITS-1:0] resultado ,
					input signed [N_BITS-1:0] a,
					input signed [N_BITS-1:0] b,
					input operador
				);
				always@(*)
				begin
					case(operador)
						0: resultado = a+b;
						1: resultado = a-b;
					endcase
				end
endmodule