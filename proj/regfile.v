`timescale 1ns / 1ps

module regfile(
	input clk,
	input [2:0] address_a,
	input [2:0] address_b,
	input wire write_enable,
	input [15:0] write_data,
	output reg [15:0] data_a,
	output reg [15:0] data_b
	);

	// width x height
	reg [15:0] regs [2:0];
	
	always @ (posedge clk) begin
		if (write_enable == 1) begin
			regs[address_a] = write_data;
		end
		data_a <= regs[address_a];
		data_b <= regs[address_b];
	end

endmodule
