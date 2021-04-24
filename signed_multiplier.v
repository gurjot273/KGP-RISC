`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:21 10/30/2019 
// Design Name: 
// Module Name:    signed_multiplier 
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
module signed_multiplier(
    input [31:0] a,
    input [31:0] b,
    output [63:0] product
    );

	wire [63:0] P1;
	wire [63:0] P2;
	wire [63:0] P3;
	wire [63:0] P4;
	wire [63:0] P5;
	wire [63:0] P6;
	assign P1=((a[31]&b[31])<<62);
	assign P2 = (a[31]?((b[30:0]<<31)):64'd0);
	assign P3 = (b[31]?((a[30:0]<<31)):64'd0);
	array_multiplier m1({1'b0,a[30:0]},{1'b0,b[30:0]},P4);
	wire c1,c2,c3;
	hybrid_adder_64 h1(P2,P3,1'b0,P5,c1);
	hybrid_adder_64 h2(P1,((~P5)+1),1'b0,P6,c2);
	hybrid_adder_64 h3(P4,P6,1'b0,product,c3);

endmodule
