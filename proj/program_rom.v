`timescale 1ns / 1ps

module program_rom(
	input [2:0] address,
	output [31:0] instruction
	);

	// width x height
	reg [31:0] inst_mem [7:0];
	
	initial begin
		inst_mem[0] = 32'b0001_0001_0000_0000_0000_0000_0000_0101;	//addi r1 5
		inst_mem[1] = 32'b0001_0010_0000_0000_0000_0000_0000_1010;	//addi r2 10
		//inst_mem[2] = 32'b0010_0001_0010_0000_0000_0000_0000_0000;	//add r1 r2
		inst_mem[2] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		inst_mem[3] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		inst_mem[4] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		inst_mem[5] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		inst_mem[6] = 32'b1111_0001_0000_0000_0000_0000_0000_0000;	// out r1
		inst_mem[7] = 32'b1111_0010_0000_0000_0000_0000_0000_0000;	// out r2
	end 
	
	assign instruction = inst_mem[address];

endmodule
