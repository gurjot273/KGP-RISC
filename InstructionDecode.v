`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:14 10/16/2019 
// Design Name: 
// Module Name:    InstructionDecode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstructionDecode(
	 input rst,
    input [31:0] instruction,
    output [5:0] opcode,
    output [4:0] rsAdd,
    output [4:0] rtAdd,
    output [4:0] shift,
    output [20:0] immediate,
    output [25:0] label,
	 output [15:0] offset
    );

	assign opcode=rst?6'b000000:instruction[31:26];
	assign rsAdd=rst?5'b00000:instruction[25:21];
	assign rtAdd=rst?5'b00000:instruction[20:16];
	assign shift=rst?5'b00000:instruction[20:16];
	assign immediate=rst?21'b000000000000000000000:instruction[20:0];
	assign label=rst?26'b00000000000000000000000000:instruction[25:0];
	assign offset=rst?26'b00000000000000000000000000:instruction[15:0];
endmodule














