`timescale 1ns / 1ps

module program_rom(
	input [2:0] address,
	output [7:0] instruction
	);

	// width x height
	reg [7:0] inst_mem [7:0];
	
	initial begin
//		inst_mem[0] = 8'b11110000;
//		inst_mem[1] = 8'b11100001;
//		inst_mem[2] = 8'b11000011;
//		inst_mem[3] = 8'b10000111;
//		
//		inst_mem[4] = 8'b00001111;
//		inst_mem[5] = 8'b00011110;
//		inst_mem[6] = 8'b00111100;
//		inst_mem[7] = 8'b01111000;

		inst_mem[0] = 8'b11000000;
		inst_mem[1] = 8'b11000001;
		inst_mem[2] = 8'b11000010;
		inst_mem[3] = 8'b11000011;
		
		inst_mem[4] = 8'b00001100;
		inst_mem[5] = 8'b00001101;
		inst_mem[6] = 8'b00001110;
		inst_mem[7] = 8'b00001111;
	end 
	
	assign instruction = inst_mem[address];

endmodule
