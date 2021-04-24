`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:02 10/27/2019 
// Design Name: 
// Module Name:    Control 
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
module Control(
    input [5:0] opcode,
    output reg [1:0] RegWrite, //1 for writing to writeAddress, 2 for high and low, else no write
    output reg MemRead, // 1 is for lw
    output reg MemWrite, // 1 is for sw
    output reg MemtoReg, // 1 is for lw for writing from mem to reg
    output reg [1:0] ALUSrc, // 0 means second ALU operand is rtData,1 means sh,2 means immediate for addi,compi, 3 offset for lw,sw
    output reg RegDst //  1 is for lw because rt else 0 and rs 
	);
	
	always @(*) begin
		if(opcode[5:4]==2'b00) begin
			MemRead=0;
			MemWrite=0;
			MemtoReg=0;
			RegDst=0;
			
			if(opcode[3:0]==4'b0001) begin
				RegWrite=2'b10;
				ALUSrc=2'b00;	
			end
			else if(opcode[3:0]==4'b0010) begin
				RegWrite=2'b10;
				ALUSrc=2'b00;
			end
			else if(opcode[3:0]==4'b0100) begin
				RegWrite=2'b01;
				ALUSrc=2'b10;
			end
			else if(opcode[3:0]==4'b0101) begin
				RegWrite=2'b01;
				ALUSrc=2'b10;
			end
			else if(opcode[3:0]==4'b1000) begin
				RegWrite=2'b01;
				ALUSrc=2'b01;
			end
			else if(opcode[3:0]==4'b1001) begin
				RegWrite=2'b01;
				ALUSrc=2'b01;
			end
			else if(opcode[3:0]==4'b1100) begin
				RegWrite=2'b01;
				ALUSrc=2'b01;
			end
			else begin
				RegWrite=2'b01;
				ALUSrc=2'b00;			
			end
		end
		else if(opcode[5:4]==2'b01) begin
			RegWrite=2'b01;
			MemRead=1;
			MemWrite=0;
			MemtoReg=1;
			ALUSrc=2'b11;
			RegDst=1;
		end
		else if(opcode[5:4]==2'b10) begin
			RegWrite=0;
			MemRead=0;
			MemWrite=1;
			MemtoReg=0;
			ALUSrc=2'b11;
			RegDst=0;
		end
		else if(opcode[5:4]==2'b11) begin
			RegWrite=0;
			MemRead=0;
			MemWrite=0;
			MemtoReg=0;
			ALUSrc=0;
			RegDst=0;
			if(opcode[3:0]==4'b1010) begin
				RegWrite=2'b11;
			end
		end
		else begin
			RegWrite=0;
			MemRead=0;
			MemWrite=0;
			MemtoReg=0;
			ALUSrc=0;
			RegDst=0;
		end
	end
	
endmodule
