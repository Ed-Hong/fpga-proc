`timescale 1ns / 1ps

module machine(
	input clk,
	output reg [7:0] out
	);
	
	// wire declarations
	wire [31:0] instruction;
	wire [2:0] address;
	wire [31:0] result;
	
	// module declarations
	
	// 1) processor
	processor _processor(
		.clk(clk),
		.instruction(instruction),
		.address(address),
		.result(result)
	);
	
	// 2) programROM
	program_rom _program(
		.address(address),
		.instruction(instruction)
	);
	
	// assign I/O
	always @ (posedge clk) begin
		//todo 32bit output
		out <= result[7:0];
	end

endmodule
