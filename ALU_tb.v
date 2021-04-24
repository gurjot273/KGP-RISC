`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:18 10/23/2019
// Design Name:   ALU
// Module Name:   C:/Users/student/Desktop/KGP_RISC/ALU_tb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg signed [31:0] a;
	reg signed [31:0] b;
	reg [5:0] opcode;

	// Outputs
	wire [31:0] result;
	wire [31:0] high;
	wire carryFlag;
	wire zFlag;
	wire signFlag;
	wire overflowFlag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.opcode(opcode), 
		.result(result), 
		.high(high), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.signFlag(signFlag), 
		.overflowFlag(overflowFlag)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100
		a = 32'd4;
		b = 32'b11111111111111111111111111111010;
		opcode = 6'd0;
		
		#10;
		a = 32'b10000000000000000000000000000000;
		b = 32'b00000000000000000000000000000010;
		opcode = 6'b000001;
      
		#10
		a = 32'b10000000000000000000000000000000;
		b = 32'b00000000000000000000000000000010;
		opcode = 6'b000010;
		
		#10
		a = 32'b00000000000000000000000000000000;
		b = 32'b00000000000000000000000000000010;
		opcode = 6'b000011;
		
		#10
		a = 32'd4;
		b = 32'b11111111111111111111111111111010;
		opcode = 6'd4;
		
		#10
		a = 32'b00000000000000000000000000000000;
		b = 32'b00000000000000000000000000000010;
		opcode = 6'd5;
		
		#10
		a = 32'd4;
		b = 32'd8;
		opcode = 6'd6;
		
		#10
		a = 32'd4;
		b = 32'd8;
		opcode = 6'd7;
		
		#10
		a = 32'd4;
		b = 32'd8;
		opcode = 6'd8;
		
		#10
		a = 32'd4;
		b = 32'd8;
		opcode = 6'd9;
		
		#10
		a = 32'd4;
		b = 32'd8;
		opcode = 6'd10;
		
		#10     
		a = 32'b11111111111111111111111111111100;
		b = 32'd1;
		opcode = 6'd11;
		
		#10     
		a = 32'b11111111111111111111111111111100;
		b = 32'd1;
		opcode = 6'd12;
		
		#10     
		a = 32'b11111111111111111111111111111100;
		b = 32'd1;
		opcode = 6'd13;
		
		// Add stimulus here

	end
      
endmodule

