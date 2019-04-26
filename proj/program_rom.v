`timescale 1ns / 1ps

module program_rom(
	input clk,
	input [1:0] address,
	output [7:0] instruction
	);

	reg [7:0] inst_mem [3:0];
	
	initial begin
		inst_mem[0] = 8'b10110000;
		inst_mem[1] = 8'b10110001;
		inst_mem[2] = 8'b10110010;
		inst_mem[3] = 8'b10110011;
	end 
	
	assign instruction = inst_mem[address];

endmodule
