`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:10 10/21/2019
// Design Name:   PC_change
// Module Name:   C:/Users/student/Desktop/KGP_RISC/PC_change_tb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_change
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_change_tb;

	// Inputs
	reg clk;
	reg rst;
	reg isBranch;
	reg [25:0] label;

	// Outputs
	wire [11:0] pc;

	// Instantiate the Unit Under Test (UUT)
	PC_change uut (
		.clk(clk), 
		.rst(rst), 
		.isBranch(isBranch), 
		.label(label), 
		.pc(pc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		isBranch = 0;
		label = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		rst=0;
		#5 clk=~clk; //increment by 1
		#5 clk=~clk; 
		isBranch=1;
		label=26'd24;
		forever #5 clk=~clk; //branch
		// Add stimulus here

	end
      
endmodule

