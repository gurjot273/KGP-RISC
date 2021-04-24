`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:00 10/28/2019 
// Design Name: 
// Module Name:    mux4to1 
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
module mux4to1(
    input [31:0] d0,
    input [31:0] d1,
    input [31:0] d2,
    input [31:0] d3,
    input [1:0] select,
    output reg [31:0] out
    );

	always @(*) begin
		if(select==2'b00)
			out=d0;
		else if(select==2'b01)
			out=d1;
		else if(select==2'b10)
			out=d2;
		else
			out=d3;
	end

endmodule
