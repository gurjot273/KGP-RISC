`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:59:38 10/30/2019
// Design Name:   array_multiplier
// Module Name:   C:/Users/student/Desktop/KGP_RISC_2/array_multiplier_tb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: array_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module array_multiplier_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [63:0] y;

	// Instantiate the Unit Under Test (UUT)
	array_multiplier uut (
		.a(a), 
		.b(b), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 32'b11111111111111111111111111111111;
		b = 32'b10000000000000000000000000000000;
        
		// Add stimulus here

	end
      
endmodule

