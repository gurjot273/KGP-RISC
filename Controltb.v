`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:20:45 10/28/2019
// Design Name:   Control
// Module Name:   C:/Users/student/Desktop/KGP_RISC/Controltb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Controltb;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire [1:0] RegWrite;
	wire MemRead;
	wire MemWrite;
	wire MemtoReg;
	wire [1:0] ALUSrc;
	wire RegDst;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.opcode(opcode), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.RegDst(RegDst)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		opcode=6'd0;
		#10
		opcode=6'd2;
		#10
		opcode=6'd8;
		#10
		opcode=6'd16;
		#10
		opcode=6'd32;
		#10
		opcode=6'd48;
		// Add stimulus here

	end
      
endmodule

