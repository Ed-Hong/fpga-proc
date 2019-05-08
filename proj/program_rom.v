`timescale 1ns / 1ps

module program_rom(
	input [3:0] address,
	output [15:0] instruction
	);

	// width x height
	reg [15:0] inst_mem [15:0];
	
	initial begin
//		inst_mem[0] 	= 16'b0001_1110_0000_1000;	//load r7 9
//		inst_mem[0] 	= 16'b0001_0010_0000_0001;	//load r1 1
//		inst_mem[0] 	= 16'b0011_0100_0100_1000;	//subi r2 1 (r2 = -1) 
//		
//		inst_mem[3] 	= 16'b1011_1110_0000_0000;	//subi r7 1
//		inst_mem[3] 	= 16'b1100_1111_0000_0000;	//br addr15
//		inst_mem[4] 	= 16'b0010_0100_1000_1111;	//add r1 r2
//		inst_mem[4] 	= 16'b0010_0100_1000_1111;	//add r3 r1
//
//		inst_mem[5] 	= 16'b1111_0100_0000_0000;	//sub r3 r2
//		
//		
//		inst_mem[6] 	= 16'b0001_0110_0000_1000;	//load r3 8
//		inst_mem[7] 	= 16'b0010_0110_1100_0000;	//add r3 r3
//		inst_mem[8] 	= 16'b1111_0110_0000_0000;	//out r3
//
//		
//		inst_mem[9] 	= 16'b0001_1010_0000_1011;	//load r5 11
//		inst_mem[10] 	= 16'b0010_1011_0100_0000;	//add r5 r5
//		inst_mem[11] 	= 16'b1111_1010_0000_0000;	//out r5 22
//		
//		
//		inst_mem[12] 	= 16'b0001_1110_0000_1110;	//load r7 14
//		inst_mem[13] 	= 16'b0010_1111_1100_0000;	//add r7 r7
//		inst_mem[14] 	= 16'b1111_1110_0000_0000;	//out r7 14
//
//		
//		inst_mem[15] 	= 16'b0000_0010_0000_0000;	//nop

		inst_mem[0] 	= 16'b0001_1110_0000_1000;	//load r7 9
		inst_mem[1] 	= 16'b0001_0000_0000_1010;	//load r0 10
		inst_mem[2] 	= 16'b1111_0000_0000_0000;	//out r0
		inst_mem[3] 	= 16'b1110_0001_1100_0000;	//mov r0 r7
		inst_mem[4] 	= 16'b1111_0000_0000_0000;	//out r0
		inst_mem[5] 	= 16'b1111_0000_0000_0000;	//out r0
		inst_mem[6] 	= 16'b1000_0000_0000_0000;	//jmp 0





	end 
	
	assign instruction = inst_mem[address];

endmodule
