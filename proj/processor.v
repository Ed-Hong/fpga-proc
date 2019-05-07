`timescale 1ns / 1ps

module processor(
	input clk,
	input [31:0] instruction,
	output reg [2:0] address,
	output reg [31:0] result
	);

	reg [31:0] timer;
	initial begin
		address = 0;
		timer = 0;
	end

	// wires
	wire [3:0] opcode = instruction[31:28];
	wire [3:0] reg_a = instruction[27:24];
	wire [3:0] reg_b = instruction[23:20];
	wire [15:0] immediate = instruction[15:0];
	reg write_enable;
	reg [31:0] write_data;
	wire [31:0] data_a;
	wire [31:0] data_b;


	// modules
	regfile _regfile(
		.clk(clk),
		.address_a(reg_a),
		.address_b(reg_b),
		.write_enable(write_enable),
		.write_data(write_data),
		.data_a(data_a),
		.data_b(data_b)
	);
	
	//todo
//	alu _alu(
//		
//	);
	
	always @ (posedge clk) begin
		timer = timer + 1;

		// manually scale clock frequency for debugging
		if (timer % 50000000 == 0) begin
			address = address + 1;
			if (address >= 8) begin
				address = 0;
			end

			// instruction decode
			case (opcode) 
				// addi
				4'b0001:begin
							write_data[15:0] <= immediate;
							write_enable <= 1;
							
							//debug
							result[15:0] <= immediate;
						end
				// add
				4'b0010:begin
							//todo - move this to ALU
							write_data <= (data_a + data_b); 
							write_enable <= 1;
							
							//debug
							result <= write_data;
						end
				// out
				4'b1111:begin
							result <= data_a;
							
							//debug
							//result <= 32'b0111_0111_0000_0000_0000_0000_0000_0000;
						end
				// default NOP
				default: result <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;  
			endcase
			
			write_enable <= 0;
			
			//debug
			//result <= instruction;
			
		end
	end

//---wire declarations---
//wire [31:0] instruction;
//wire [5:0] inst_31to26 = instruction[31:26];
//wire [4:0] inst_25to21 = instruction[25:21];
//wire [4:0] inst_20to16 = instruction[20:16];
//wire [4:0] inst_15to11 = instruction[15:11];
//wire [15:0] inst_15to0 = instruction[15:0];
//wire [5:0] inst_5to0 = instruction[5:0];
//
//wire ctrl_regdest;
//wire ctrl_jump;
//wire ctrl_branch;
//wire ctrl_memread;
//wire ctrl_memtoreg;
//wire ctrl_alu;
//wire ctrl_memwrite;
//wire ctrl_alusrc;
//wire ctrl_regwrite;
//
//wire [4:0] regdest_mux_out;
//wire [31:0] reg_data1;
//wire [31:0] reg_data2;
//wire [31:0] bus_b_mux_out;
//wire [31:0] bus_w;
//
//wire [31:0] next_pc;
//wire [31:0] program_counter;
//wire [31:0] pc_4;
//wire [31:0] branch_target_addr;
//wire [31:0] bta_or_pc4;
//wire pc_src;
//wire [31:0] pc_shift;
//
//wire [31:0] alu_result;
//wire [31:0] mem_data;
//wire [31:0] offset_se;
//wire [31:0] offset_shifted;
//wire equal_zero;
//
////---module declarations---
//regfile _regfile(.clk(clk),
//				 .read_reg1(inst_25to21),
//				 .read_reg2(inst_20to16),
//				 .write_reg(regdest_mux_out),
//				 .write_data(bus_w),
//				 .enable(ctrl_regwrite),
//				 .data1(reg_data1),
//				 .data2(reg_data2));
//
//pc_counter _pc(.clk(clk),
//			   .reset(rst),
//			   .pc_in(next_pc),
//			   .pc_out(program_counter));
//
//inst_ram _instram(.clk(clk),
//				  .reset(rst),
//				  .read_addr(program_counter),
//				  .inst_out(instruction));
//
//data_ram _datram(.clk(clk),
//				 .reset(rst),
//				 .in_addr(alu_result),
//				 .wr_data(reg_data2),
//				 .mem_read(ctrl_memread),
//				 .mem_write(ctrl_memwrite),
//				 .rd_data(mem_data));
//
//control _ctrl(.inst_top(inst_31to26),
//			  .inst_bot(inst_5to0),
//			  .reg_dest(ctrl_regdest),
//			  .jump(ctrl_jump),
//			  .branch(ctrl_branch),
//			  .mem_read(ctrl_memread),
//			  .mem_to_reg(ctrl_memtoreg),
//			  .alu_control(ctrl_alu),
//			  .mem_write(ctrl_memwrite),
//			  .alu_src(ctrl_alusrc),
//			  .reg_write(ctrl_regwrite));
//
//mux2_1_by5 _mux2to1_by5(.a(inst_20to16),
//						.b(inst_15to11),
//						.sel(ctrl_regdest),
//						.mux_out(regdest_mux_out));
//
//alu _alu(.alu_ctrl(ctrl_alu),
//		 .bus_a(reg_data1),
//		 .bus_b(bus_b_mux_out),
//		 .eq_zero(equal_zero),
//		 .alu_out(alu_result));
//
//mux2_1_by32 _32mux1(.a(pc_4),
//					.b(branch_target_addr),
//					.sel(pc_src),
//					.mux_out(bta_or_pc4));
//
//mux2_1_by32 _32mux2(.a(pc_shift),
//					.b(bta_or_pc4),
//					.sel(ctrl_jump),
//					.mux_out(next_pc));
//
//mux2_1_by32 _32mux3(.a(reg_data2),
//					.b(offset_se),
//					.sel(ctrl_alusrc),
//					.mux_out(bus_b_mux_out));
//
//mux2_1_by32 _32mux4(.a(mem_data),
//					.b(alu_result),
//					.sel(ctrl_memtoreg),
//					.mux_out(bus_w));
//
//shifter _shft1 (.shift_in(instruction),
//				.shift_out(pc_shift));
//
//shifter _shft2 (.shift_in(offset_se),
//				.shift_out(offset_shifted));
//
//sign_extend _signext(.ext_in(inst_15to0),
//					 .ext_out(offset_se));
//
//adder _adder1(.add_a(program_counter),
//			  .add_b(32'd4),
//			  .sum(pc_4));
//
//adder _adder2(.add_a(pc_4),
//			  .add_b(offset_shifted),
//			  .sum(branch_target_addr));
//
//and _andgate(pc_src, ctrl_branch, equal_zero);


endmodule





//module definitions
//----------------------------------------
//module regfile ( input clk, 
//				  input [4:0] read_reg1,
//				  input [4:0] read_reg2,
//				  input [4:0] write_reg,
//				  input [31:0] write_data,
//				  input enable,
//				  output reg [31:0] data1,
//				  output reg [31:0] data2);
//endmodule
////----------------------------------------
//module pc_counter ( input clk,
//					input reset,
//				 	input [31:0] pc_in,
//					output [31:0] pc_out);
//endmodule
////----------------------------------------
//module inst_ram ( input clk,
//				  input reset,
//		  		  input [31:0] read_addr,
//				  output [31:0] inst_out);
//endmodule
////----------------------------------------
//module data_ram ( input clk,
//				  input reset,
//				  input [31:0] in_addr,
//				  input [31:0] wr_data,
//				  input mem_read,
//				  input mem_write,
//				  output [31:0] rd_data);
//endmodule
////----------------------------------------
//module control ( input [5:0] inst_top, 
//				 input [5:0] inst_bot,
//				 output reg_dest,
//				 output jump,
//				 output branch,
//				 output mem_read,
//				 output mem_to_reg,
//				 output alu_control,
//				 output mem_write,
//				 output alu_src,
//				 output reg_write);
//endmodule
////----------------------------------------
//module mux2_1_by5 ( input [4:0] a,
//					input [4:0] b,
//					input sel,
//					output [4:0] mux_out);
//endmodule
////----------------------------------------
//module alu ( input alu_ctrl,
//			 input [31:0] bus_a,
//			 input [31:0] bus_b,
//			 output eq_zero,
//			 output [31:0] alu_out);
//endmodule
////----------------------------------------
//module mux2_1_by32 ( input [31:0] a,
//					input [31:0] b,
//					input sel,
//					output [31:0] mux_out);
//endmodule
////----------------------------------------
//module shifter ( input [31:0] shift_in,
//				 output [31:0] shift_out);
//endmodule
////----------------------------------------
//module sign_extend ( input [15:0] ext_in,
//				 	 output [31:0] ext_out);
//endmodule
////----------------------------------------
//module adder ( input [31:0] add_a,
//			   input [31:0] add_b,
//			   output [31:0] sum);
//endmodule