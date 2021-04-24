`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:17 10/28/2019 
// Design Name: 
// Module Name:    Processor 
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
module Processor(
    input clk,
    input rst,
    output [31:0] rOut
);
	
	wire [11:0] pc;
	reg [11:0] curPc;
	wire isBranch;
	wire [25:0] pcLabel;
	wire [31:0] instruction;
	wire [5:0] opcode;
	wire [4:0] rsAdd;
	wire [4:0] rtAdd;
	wire [4:0] shift;
	wire [20:0] immediate;
	wire [25:0] label;
	wire [15:0] offset;
	wire [4:0] writeAddReg; // to be assigned with the help of RegDst
	wire [31:0] writeDataReg; // to be assigned with the help of RegDst
	wire [31:0] highData;
	wire [31:0] raDataIn;
	wire [31:0] raDataOut;
	wire [31:0] rsData;
	wire [31:0] rtData;
	wire [1:0] RegWrite; //1 for writing to writeAddress, 2 for high and low, 3 for writing to ra else no write
	wire MemRead; // 1 is for lw
	wire MemWrite; // 1 is for sw
	wire MemtoReg; // 1 is for lw for writing from mem to reg
	wire [1:0] ALUSrc; // 0 means second ALU operand is rtData,1 means sh,2 means immediate for addi,compi, 3 offset for lw,sw
	wire RegDst; // 1 means writeAddress of register is rtAdd else 0 means rsAdd
	wire carryFlag;
	wire zFlag;
	wire signFlag;
	wire overflowFlag;
	reg carryFlagPrev;
	reg zFlagPrev;
	reg signFlagPrev;
	reg overflowFlagPrev;
	wire [31:0] aluSecond;
	wire [31:0] aluResult;
	wire [31:0] memReadData;
	
	always @(negedge clk or posedge rst) begin
		if(rst) begin
			overflowFlagPrev=0;
			carryFlagPrev=0;
			zFlagPrev=0;
			signFlagPrev=0;
		end
		else begin
			overflowFlagPrev=overflowFlag;
			carryFlagPrev=carryFlag;
			zFlagPrev=zFlag;
			signFlagPrev=signFlag;
		end
	end
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			curPc=0;
		else
			curPc=pc;
	end
	
	PC_change  pc_assign(
		.clk(~clk), 
		.rst(rst), 
		.isBranch(isBranch), 
		.label(pcLabel), 
		.pc(pc)
	);
	
	
	InstructionFetch instrFetch (
		.clk(clk), 
		.rst(rst), 
		.pc(pc), 
		.instruction(instruction)
	);

	
	
	InstructionDecode instrDecode (
		.rst(rst), 
		.instruction(instruction), 
		.opcode(opcode), 
		.rsAdd(rsAdd), 
		.rtAdd(rtAdd), 
		.shift(shift), 
		.immediate(immediate), 
		.label(label),
		.offset(offset)
	);
	
	Control ctrl (
		.opcode(opcode), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.RegDst(RegDst)
	);
	
	branch brnch (
		.opcode(opcode), 
		.label(label), 
		.rsVal(rsData), 
		.carryFlag(carryFlagPrev), 
		.zFlag(zFlagPrev), 
		.overflowFlag(overflowFlagPrev), 
		.signFlag(signFlagPrev), 
		.pc(curPc), 
		.raDataOld(raDataOut), 
		.raDataNew(raDataIn), 
		.pcLabel(pcLabel), 
		.isBranch(isBranch), 
		.rst(rst)
	);
	
	assign writeDataReg=MemtoReg?memReadData:aluResult;
	assign writeAddReg=RegDst?rtAdd:rsAdd;
	
	RegisterBank32 regBank (
		.rst(rst), 
		.clk(clk), 
		.readAddA(rsAdd), 
		.readDataA(rsData), 
		.readAddB(rtAdd), 
		.readDataB(rtData), 
		.RegWrite(RegWrite), 
		.writeAdd(writeAddReg), 
		.writeData(writeDataReg),
		.highData(highData),
		.raDataIn(raDataIn),
		.raDataOut(raDataOut),
		.rOut(rOut)
	);
	
	
	
	mux4to1 alu_mux(rtData,{{27{shift[4]}},shift},{{11{immediate[20]}},immediate},{{16{offset[15]}},offset},ALUSrc,aluSecond);
	
	ALU alu (
		.a(rsData), 
		.b(aluSecond), 
		.opcode(opcode), 
		.result(aluResult), 
		.high(highData), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.signFlag(signFlag), 
		.overflowFlag(overflowFlag)
	);
	
	DataMemory dataMem (
		.clk(~clk), 
		.rst(rst), 
		.address(aluResult), 
		.readData(memReadData), 
		.writeData(rtData), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite)
	);
	
	
endmodule
