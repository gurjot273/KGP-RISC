`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:12 10/30/2019 
// Design Name: 
// Module Name:    array_multiplier 
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
module array_multiplier(a, b, y);

	parameter width = 32;
	input [width-1:0] a, b;
	output [2*width-1:0] y;

	wire [2*width*width-1:0] partials;

	genvar i;
	assign partials[2*width-1 : 0] = a[0] ? b : 0;
	generate for (i = 1; i < width; i = i+1) begin:gen
		 assign partials[2*width*(i+1)-1 : 2*width*i] = (a[i] ? b << i : 0) +
												  partials[2*width*i-1 : 2*width*(i-1)];
	end endgenerate

	assign y = partials[2*width*width-1 : 2*width*(width-1)];

endmodule
