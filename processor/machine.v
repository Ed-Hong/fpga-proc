`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:23:30 04/14/2019 
// Design Name: 
// Module Name:    machine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module machine(
	output out,
	input clk
	);
					
// wire declarations




// module declarations

// 1) processor
processor _processor(
	.clk(clk));
	
// 2) programROM
program_rom _program(
	.clk(clk));



// assign I/O


endmodule
