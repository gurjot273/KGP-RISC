`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:47:11 10/21/2019
// Design Name:   InstructionFetch
// Module Name:   C:/Users/student/Desktop/KGP_RISC/InstructionFetch_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionFetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionFetch_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] pc;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	InstructionFetch uut (
		.clk(clk), 
		.rst(rst), 
		.pc(pc), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		pc=12'd8;
		rst=0;
		
		forever #5 clk=~clk;
		// Add stimulus here

	end
      
endmodule

