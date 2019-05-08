`timescale 1ns / 1ps

module alu(
	input clk,
	input [3:0] opcode,
	input signed [15:0] a,
	input signed [15:0] b,
	input signed [15:0] immediate,
	output reg zero,
	output reg signed [15:0] alu_result
   );

	always @ (posedge clk) begin
		zero = 0;

		// alu operation decode
		case (opcode) 
			// add
			4'b0010:begin
						alu_result = a + b; 
					end
			// sub
			4'b0011:begin
						alu_result = a + (-b); 
						if (alu_result == 0) begin
							zero = 1;
						end
					end
			// addi
			4'b1010:begin
						alu_result = a + immediate; 
					end
			// subi
			4'b1011:begin
						alu_result = a + (-immediate); 
						if (alu_result == 0) begin
							zero = 1;
						end
					end
						
		endcase
	end

endmodule
