`timescale 1ns / 1ps

module program_rom(
	input [2:0] address,
	output [31:0] instruction
	);

	// width x height
	reg [31:0] inst_mem [7:0];
	
	initial begin
		inst_mem[0] = 8'h11000014;	//addi r1 20
		inst_mem[1] = 8'h12000020;	//addi r2 32
		inst_mem[2] = 8'h21200000;	//add r1 r2
		inst_mem[3] = 8'hF1000000;	//out r1
		inst_mem[4] = 8'hF1000000;	//out r1
		inst_mem[5] = 8'hF1000000;	//out r1
		inst_mem[6] = 8'hF1000000;	//out r1
		inst_mem[7] = 8'hF1000000;	//out r1
	end 
	
	assign instruction = inst_mem[address];

endmodule
