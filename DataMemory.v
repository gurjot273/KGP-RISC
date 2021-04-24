`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:01 10/28/2019 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
    input clk,
    input rst,
    input [31:0] address,
    output [31:0] readData,
    input [31:0] writeData,
    input MemRead,
    input MemWrite
    );
	 
	 integer i;
	 reg [31:0] Mem[7:0];
	 
	 assign readData=MemRead?Mem[address[6:2]]:32'd0;
	 
	 always @(posedge clk or posedge rst) begin
		if(rst) begin
			Mem[0]=32'd7;
			Mem[1]=32'd8;
			Mem[2]=32'd5;
			Mem[3]=32'd4;
			Mem[4]=32'd1;
			Mem[5]=32'd3;
			Mem[6]=32'd2;
			Mem[7]=32'd5;
		end
		else begin
			if(MemWrite)
				Mem[address[4:2]]=writeData;
		end
	 end

endmodule
