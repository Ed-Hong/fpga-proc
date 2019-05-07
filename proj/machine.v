//`timescale 1ns / 1ps
`timescale 1ms / 1ns

module machine(
	input clk,
	input wire [4:0] btn,
	output reg [7:0] out
	);
	
	// wire declarations
	wire [7:0] instruction;
	wire [1:0] address;
	wire [7:0] result;
	
	wire step = btn[0];
	
	// module declarations
	
	// 1) processor
	processor _processor(
		.step(step),
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
