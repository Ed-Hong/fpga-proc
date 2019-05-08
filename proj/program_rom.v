`timescale 1ns / 1ps

module program_rom(
	input [3:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [15:0];
	
	initial begin
		inst_mem[0] 	= 16'b0001_0010_0000_0010;	//addi r1 2
		inst_mem[2] 	= 16'b0000_0010_0000_0000;	//nop
		inst_mem[1] 	= 16'b1111_0010_0000_0000;	//out r1 2
		
		inst_mem[3] 	= 16'b0001_0100_0000_0101;	//addi r2 5
		inst_mem[5] 	= 16'b0000_0100_0000_0000;	//nop
		inst_mem[4] 	= 16'b1111_0100_0000_0000;	//out r2 5
		
		inst_mem[6] 	= 16'b0001_0110_0000_1000;	//addi r3 8
		inst_mem[8] 	= 16'b0000_0110_0000_0000;	//nop
		inst_mem[7] 	= 16'b1111_0110_0000_0000;	//out r3 8
		
		inst_mem[9] 	= 16'b0001_1010_0000_1011;	//addi r5 11
		inst_mem[11] 	= 16'b0000_1010_0000_0000;	//nop
		inst_mem[10] 	= 16'b1111_1010_0000_0000;	//out r5 11
		
		inst_mem[12] 	= 16'b0001_1110_0000_1110;	//addi r7 14
		inst_mem[14] 	= 16'b0000_1110_0000_0000;	//nop
		inst_mem[13] 	= 16'b1111_1110_0000_0000;	//out r7 14
		
		inst_mem[15] 	= 16'b0000_0010_0000_0000;	//nop


	end 
	
	assign instruction = inst_mem[address];

endmodule
