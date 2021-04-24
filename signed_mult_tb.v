`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:58:45 11/06/2019
// Design Name:   signed_multiplier
// Module Name:   C:/Users/gurjot273/Desktop/final/KGP_RISC_3/signed_mult_tb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signed_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module signed_mult_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [63:0] product;

	// Instantiate the Unit Under Test (UUT)
	signed_multiplier uut (
		.a(a), 
		.b(b), 
		.product(product)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 32'b11111111111111111111111111111011;
		b = 32'b00000000000000000000000000000100;
		
		// Add stimulus here

	end
      
endmodule

