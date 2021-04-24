`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:16 10/30/2019 
// Design Name: 
// Module Name:    hybrid_adder_64 
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
module hybrid_adder_64(
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] sum,
    output cout
    );
	 
	 wire c1;
	 
	 hybrid_adder f1(a[31:0],b[31:0],cin,sum[31:0],c1);
	 hybrid_adder f2(a[63:32],b[63:32],c1,sum[63:32],cout);


endmodule
