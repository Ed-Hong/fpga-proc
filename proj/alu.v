`timescale 1ns / 1ps

module alu(
	input clk,
	input [3:0] opcode,
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] alu_result
   );

	always @ (posedge clk) begin
		// alu operation decode
		case (opcode) 
			// add
			4'b0010:begin
						alu_result <= a + b; 
					end
			//
		endcase
	end

endmodule
