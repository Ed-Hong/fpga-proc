`timescale 1ns / 1ps

module machine(
	input clk,
	output reg [7:0] out
	);
	
	// wire declarations
	wire [7:0] instruction;
	wire [1:0] address;
	wire [7:0] result;
	
	
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
		.clk(clk),
		.address(address),
		.instruction(instruction)
	);
	
	// assign I/O
	always @ (posedge clk) begin
	
		// test
		//out <= 8'b10100101;
		
		out <= result;
	
	end

endmodule