`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:59:34 10/21/2019 
// Design Name: 
// Module Name:    InstructionFetch 
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
module InstructionFetch(
    input clk,
    input rst,
    input [11:0] pc,
    output [31:0] instruction
    );
	 
	 blk_mem_gen_v7_3 ime (.clka(clk),.wea(1'b0),.addra(pc[11:2]),.dina(32'd0),.douta(instruction));
	 
endmodule
