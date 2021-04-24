`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:41:26 11/06/2019
// Design Name:   InstructionDecode
// Module Name:   C:/Users/gurjot273/Desktop/final/KGP_RISC_3/InstructionDecode_tb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionDecode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionDecode_tb;

	// Inputs
	reg rst;
	reg [31:0] instruction;

	// Outputs
	wire [5:0] opcode;
	wire [4:0] rsAdd;
	wire [4:0] rtAdd;
	wire [4:0] shift;
	wire [20:0] immediate;
	wire [25:0] label;
	wire [15:0] offset;

	// Instantiate the Unit Under Test (UUT)
	InstructionDecode uut (
		.rst(rst), 
		.instruction(instruction), 
		.opcode(opcode), 
		.rsAdd(rsAdd), 
		.rtAdd(rtAdd), 
		.shift(shift), 
		.immediate(immediate), 
		.label(label), 
		.offset(offset)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		instruction=32'b00000001000010010000000000000000; //Add registers t0 and t1
		// Add stimulus here

	end
      
endmodule

