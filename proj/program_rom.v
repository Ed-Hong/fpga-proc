`timescale 1ns / 1ps

module program_rom(
	input [2:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [7:0];
	
	initial begin
		inst_mem[0] = 16'b0001_0010_0001_0101;	//addi r1 5
		inst_mem[1] = 16'b0001_0100_0000_1010;	//addi r2 10
		inst_mem[2] = 16'b0000_0000_0000_1111;	//nop
		inst_mem[3] = 16'b0000_0000_0000_1111;	//nop
		inst_mem[4] = 16'b1111_0010_0000_0001;	// out r1
		inst_mem[5] = 16'b1111_0100_0000_0010;	// out r2
		inst_mem[6] = 16'b1111_0010_0000_0011;	// out r1
		inst_mem[7] = 16'b1111_0100_0000_0100;	// out r2
	end 
	
	assign instruction = inst_mem[address];

endmodule
