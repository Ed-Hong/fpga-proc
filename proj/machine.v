`timescale 1ns / 1ps

module machine(
	input clk,
	output reg [3:0] an,
	output reg [7:0] out
	);
	
	reg [31:0] timer;
	
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
		timer = timer + 1;

		//todo 7seg encoding
		
		// manual delay to handle 7seg anode output
		if(timer == 10000000) begin
		
			//out <= result[3:0];
			out <= 8'b10000001;
			an <= 4'b1110;
			
		end
		if(timer == 20000000) begin
		
			//out <= result[7:4];
			out <= 8'b11000001;
			an <= 4'b1101;
			
		end
		if(timer == 30000000) begin
		
			//out <= result[11:8];
			out <= 8'b11100001;
			an <= 4'b1011;
			
		end
		if(timer == 40000000) begin
		
			//out <= result[15:12];
			out <= 8'b11110001;
			an <= 4'b0111;
			
		end
		
	end

endmodule
