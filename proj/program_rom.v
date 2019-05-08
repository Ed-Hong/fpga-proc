`timescale 1ns / 1ps

module program_rom(
	input [3:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [15:0];
	
	initial begin
//		// compute the 8th Fibonacci number
//		inst_mem[0] 	= 16'b0001_1110_0000_1001;	//load r7 9
//		inst_mem[1] 	= 16'b0001_0010_0000_0001;	//load r1 1
//		inst_mem[2] 	= 16'b1011_0100_0000_0001;	//subi r2 1 (r2 = -1) 
//		
//		inst_mem[3] 	= 16'b1011_1110_0000_0001;	//subi r7 1
//		inst_mem[4] 	= 16'b1100_1010_0000_0000;	//br 10
//		inst_mem[5] 	= 16'b0010_0010_1000_0000;	//add r1 r2
//		inst_mem[6] 	= 16'b0010_0110_0100_0000;	//add r3 r1
//		inst_mem[7] 	= 16'b0011_0110_1000_0000;	//sub r3 r2
//		inst_mem[8] 	= 16'b1110_0101_1100_0000;	//mov r2 r3
//		inst_mem[9] 	= 16'b1000_0011_0000_0000;	//jmp 3
//
//		inst_mem[10] 	= 16'b0000_0010_0000_0000;	//out r1
//		inst_mem[11] 	= 16'b1000_1010_0000_0000;	//jmp 10
//		
//		// unused program rom space
//		inst_mem[12] 	= 0;	//nop
//		inst_mem[13] 	= 0;	//nop
//		inst_mem[14] 	= 0;	//nop
//		inst_mem[15] 	= 0;	//nop

		// loop 9 times
		inst_mem[0] 	= 16'b0001_0010_0000_1010;	//load r1 10
		
		inst_mem[1] 	= 16'b0001_1110_0000_1111;	//load r7 15
		inst_mem[2] 	= 16'b1111_1110_0000_0000;	//out r7
		inst_mem[3] 	= 16'b1011_1110_0000_0001;	//subi r7 1
		inst_mem[4] 	= 16'b1100_1010_0000_0000;	//br 10
		inst_mem[5] 	= 16'b1000_0011_0000_0000;	//jmp 2

		inst_mem[10] 	= 16'b0000_0010_0000_0000;	//out r1
		inst_mem[11] 	= 16'b1000_1010_0000_0000;	//jmp 10
		
		// unused program rom space
		inst_mem[12] 	= 0;	//nop
		inst_mem[13] 	= 0;	//nop
		inst_mem[14] 	= 0;	//nop
		inst_mem[15] 	= 0;	//nop

	end 
	
	assign instruction = inst_mem[address];

endmodule
