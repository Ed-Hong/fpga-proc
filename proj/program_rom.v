`timescale 1ns / 1ps

module program_rom(
	input [3:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [15:0];
	
	initial begin
		inst_mem[0] 	= 16'b0001_0010_0000_0011;	//addi r1 3
		inst_mem[1] 	= 16'b1111_0010_0000_0000;	//out r1 0
		inst_mem[2] 	= 16'b1111_0010_0000_0000;	//out r1 0
		inst_mem[3] 	= 16'b1111_0010_0000_0000;	//out r1 3
		
		inst_mem[4] 	= 16'b0001_0100_0000_0111;	//addi r2 7
		inst_mem[5] 	= 16'b1111_0100_0000_0000;	//out r2 3
		inst_mem[6] 	= 16'b1111_0100_0000_0000;	//out r2 3
		inst_mem[7] 	= 16'b1111_0100_0000_0000;	//out r2 7
		
		inst_mem[8] 	= 16'b0001_0110_0000_1011;	//addi r3 11
		inst_mem[9] 	= 16'b1111_0110_0000_0000;	//out r3 7
		inst_mem[10] 	= 16'b1111_0110_0000_0000;	//out r3 7
		inst_mem[11] 	= 16'b1111_0110_0000_0000;	//out r3 11
		
		inst_mem[12] 	= 16'b0001_1000_0000_1111;	//addi r4 15
		inst_mem[13] 	= 16'b1111_1000_0000_0000;	//out r4 11
		inst_mem[14] 	= 16'b1111_1000_0000_0000;	//out r4 11
		inst_mem[15] 	= 16'b1111_1000_0000_0000;	//out r4 15

	end 
	
	assign instruction = inst_mem[address];

endmodule
