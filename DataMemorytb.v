`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:10:53 10/28/2019
// Design Name:   DataMemory
// Module Name:   C:/Users/student/Desktop/KGP_RISC/DataMemorytb.v
// Project Name:  blk_mem_gen_v7_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemorytb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] address;
	reg [31:0] writeData;
	reg MemRead;
	reg MemWrite;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.rst(rst), 
		.address(address), 
		.readData(readData), 
		.writeData(writeData), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		address = 0;
		writeData = 0;
		MemRead = 0;
		MemWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst=0;
		MemRead=1;
		address=32'd5;
		#5 clk=~clk;
		#5 clk=~clk;
		MemRead=0;
		MemWrite=1;
		address=32'd6;
		writeData=32'd14;
		#5 clk=~clk;
		#5 clk=~clk;
		MemRead=1;
		MemWrite=0;
		forever #5 clk=~clk;
		// Add stimulus here

	end
      
endmodule

