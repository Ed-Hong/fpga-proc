`timescale 1ns / 1ps

module machine(
	input clk,
	output reg [3:0] an,
	output reg [7:0] out
	);
	
	reg [31:0] timer;
	
	//7seg encoding
	reg [7:0] disp [15:0];
	initial begin
		disp[0] = 8'b11000000;
		disp[1] = 8'b11111001;
		disp[2] = 8'b10100100;
		disp[3] = 8'b10110000;
		disp[4] = 8'b10011001;
		disp[5] = 8'b10010010;
		disp[6] = 8'b10000010;
		disp[7] = 8'b11111000;
		disp[8] = 8'b10000000;
		disp[9] = 8'b10010000;
		disp[10] = 8'b10001000;
		disp[11] = 8'b10000011;
		disp[12] = 8'b11000110;
		disp[13] = 8'b10100001;
		disp[14] = 8'b10000110;
		disp[15] = 8'b10001110;
	end
	
	// wire declarations
	wire [3:0] address;
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
		if (timer >= 500000) begin
			timer = 0;
		end
				
		// manual delay to handle 7seg anode output
		if(timer == 100000) begin
			out <= disp[result[3:0]];
			an <= 4'b1110;
		end
		if(timer == 200000) begin
			out <= disp[result[7:4]];
			an <= 4'b1101;
		end
		if(timer == 300000) begin
			out <= disp[result[11:8]];
			an <= 4'b1011;
		end
		if(timer == 400000) begin
			out <= disp[result[15:12]];
			an <= 4'b0111;
		end
		
	end

endmodule
