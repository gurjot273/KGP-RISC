`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:16:58 10/21/2019 
// Design Name: 
// Module Name:    PC_change 
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
module PC_change(
    input clk,
    input rst,
    input isBranch,
    input [25:0] label,
    output reg [11:0] pc
    );

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			pc=12'd0;
		end
		else begin
			if(isBranch)
				pc=label[11:0]; //direct addressing, label will be a multiple of 4
			else
				pc=pc+12'd4; //increment
		end
	end

endmodule
