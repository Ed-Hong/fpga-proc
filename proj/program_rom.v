`timescale 1ns / 1ps

module program_rom(
	input [2:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [7:0];
	
	initial begin
		inst_mem[0] = 16'b0001_1100_0000_1010;	//addi r6 10
		inst_mem[1] = 16'b1111_1100_0000_0000;	//out r6
		inst_mem[2] = 16'b1111_1100_0000_0000;	//out r6
		inst_mem[3] = 16'b1111_1100_0000_0000;	//out r6
		inst_mem[4] = 16'b1111_1100_0000_0000;	//out r6
		inst_mem[5] = 16'b1111_1100_0000_0000;	//out r6
		inst_mem[6] = 16'b1111_1100_0000_0000;	//out r6
		inst_mem[7] = 16'b1111_1100_0000_0000;	//out r6
	end 
	
	assign instruction = inst_mem[address];

endmodule
