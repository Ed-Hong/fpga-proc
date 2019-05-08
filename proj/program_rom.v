`timescale 1ns / 1ps

module program_rom(
	input [3:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [15:0];
	
	initial begin
		inst_mem[0] 	= 16'b0001_0000_0000_0000;	//addi r0 0
		inst_mem[1] 	= 16'b0001_0000_0000_0000;	//addi r0 0
		
		inst_mem[2] 	= 16'b0001_0010_0000_0001;	//addi r1 1
		inst_mem[3] 	= 16'b0001_0010_0000_0001;	//addi r1 1
		
		inst_mem[4] 	= 16'b0001_0100_0000_0010;	//addi r2 2
		inst_mem[5] 	= 16'b0001_0100_0000_0010;	//addi r2 2
		
		inst_mem[6] 	= 16'b0001_0110_0000_0011;	//addi r3 3
		inst_mem[7] 	= 16'b0001_0110_0000_0011;	//addi r3 3
		
		inst_mem[8] 	= 16'b0001_1000_0000_0100;	//addi r4 4
		inst_mem[9] 	= 16'b0001_1000_0000_0100;	//addi r4 4
		
		inst_mem[10] 	= 16'b0001_1010_0000_0101;	//addi r5 5
		inst_mem[11] 	= 16'b0001_1010_0000_0101;	//addi r5 5
		
		inst_mem[12] 	= 16'b0001_1100_0000_0110;	//addi r6 6
		inst_mem[13] 	= 16'b0001_1100_0000_0110;	//addi r6 6
		
		inst_mem[14] 	= 16'b0001_1110_0000_0111;	//addi r7 7
		inst_mem[15] 	= 16'b0001_1110_0000_0111;	//addi r7 7

	end 
	
	assign instruction = inst_mem[address];

endmodule
