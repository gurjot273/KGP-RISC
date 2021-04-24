`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:55:55 11/06/2019
// Design Name:   branch
// Module Name:   C:/Users/gurjot273/Desktop/final/KGP_RISC_3/branch_tb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_tb;

	// Inputs
	reg [5:0] opcode;
	reg [25:0] label;
	reg [31:0] rsVal;
	reg carryFlag;
	reg zFlag;
	reg overflowFlag;
	reg signFlag;
	reg [11:0] pc;
	reg [31:0] raDataOld;
	reg rst;

	// Outputs
	wire [31:0] raDataNew;
	wire [25:0] pcLabel;
	wire isBranch;

	// Instantiate the Unit Under Test (UUT)
	branch uut (
		.opcode(opcode), 
		.label(label), 
		.rsVal(rsVal), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.overflowFlag(overflowFlag), 
		.signFlag(signFlag), 
		.pc(pc), 
		.raDataOld(raDataOld), 
		.raDataNew(raDataNew), 
		.pcLabel(pcLabel), 
		.isBranch(isBranch), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		label = 0;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 0;
		rst = 0;
		raDataOld=0;

		// Wait 100 ns for global reset to finish
		#100;
      opcode = 32'd48;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd49;
		label = 26'd36;
		rsVal = 32'd36;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd50;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 1;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd51;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd52;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 1;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd53;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd54;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 1;
		pc = 12'd4;
		
		#10
		opcode = 32'd55;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd56;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 1;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd57;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd58;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		
		#10
		opcode = 32'd59;
		label = 26'd36;
		rsVal = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		pc = 12'd4;
		raDataOld=32'd4;

		// Add stimulus here

	end
      
endmodule

