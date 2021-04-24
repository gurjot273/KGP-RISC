`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:10:41 11/06/2019
// Design Name:   Processor
// Module Name:   C:/Users/student/Desktop/final/KGP_RISC_3/Processortb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Processortb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] rOut;

	// Instantiate the Unit Under Test (UUT)
	Processor uut (
		.clk(clk), 
		.rst(rst), 
		.rOut(rOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#50;
		rst=0;
		
		forever #0.5 clk=~clk;
        
	end
      
endmodule

