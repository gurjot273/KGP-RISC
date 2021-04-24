`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:31 11/06/2019
// Design Name:   RegisterBank32
// Module Name:   C:/Users/student/Desktop/final_copy/KGP_RISC_3/RegisterBanktb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterBank32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterBanktb;

	// Inputs
	reg rst;
	reg clk;
	reg [4:0] readAddA;
	reg [4:0] readAddB;
	reg [1:0] RegWrite;
	reg [4:0] writeAdd;
	reg [31:0] writeData;
	reg [31:0] highData;
	reg [31:0] raDataIn;

	// Outputs
	wire [31:0] readDataA;
	wire [31:0] readDataB;
	wire [31:0] raDataOut;
	wire [31:0] rOut;

	// Instantiate the Unit Under Test (UUT)
	RegisterBank32 uut (
		.rst(rst), 
		.clk(clk), 
		.readAddA(readAddA), 
		.readDataA(readDataA), 
		.readAddB(readAddB), 
		.readDataB(readDataB), 
		.RegWrite(RegWrite), 
		.writeAdd(writeAdd), 
		.writeData(writeData), 
		.highData(highData), 
		.raDataIn(raDataIn), 
		.raDataOut(raDataOut), 
		.rOut(rOut)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		readAddA = 0;
		readAddB = 0;
		RegWrite = 0;
		writeAdd = 0;
		writeData = 0;
		highData = 0;
		raDataIn = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		rst=0;
		RegWrite=2'd1;
		writeData=32'd18;
		writeAdd=5'd8;
		#5 clk=~clk;
		
		#5 clk=~clk;
		RegWrite=0;
		readAddA=5'd8;
		forever #5 clk=~clk;
		// Add stimulus here

	end      
endmodule

