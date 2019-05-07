`timescale 1ns / 1ps

module machine(
	input clk,
	output reg [3:0] an,
	output reg [7:0] out
	);
	
	// wire declarations
	wire [2:0] address;
	wire [15:0] instruction;
	wire [15:0] result;
	
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
		//todo 7seg encoding
		
		//out <= result[3:0];
		//test 7seg display
		out <= 8'b00000001;
		an <= 4'b1110;
		
		#1000000000
		
		//out <= result[7:4];
		out <= 8'b00000011;
		an <= 4'b1101;
		
		#1000000000
		
		//out <= result[11:8];
		out <= 8'b00000111;
		an <= 4'b1011;
		
		#1000000000
		
		//out <= result[15:12];
		out <= 8'b00001111;
		an <= 4'b0111;
	end

endmodule
