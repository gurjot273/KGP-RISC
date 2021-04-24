`timescale 1ns / 1ps
/*
Assignment Number 6
Problem Number 2
Semester 5 (Autumn - 2019)
Group - 18
Kumar Abhishek - 17CS10022
Gurjot Singh Suri - 17CS10058
*/
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:54 08/14/2019 
// Design Name: 
// Module Name:    hybrid_adder 
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
module hybrid_adder(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
    );
	 
	wire c1,c2,c3,c4,c5,c6,c7;
	carry_lookahead_adder a1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(c1)); //cascading two 4 bit carry look ahead adders for 8 bit hybrid adder
	carry_lookahead_adder a2(.a(a[7:4]),.b(b[7:4]),.cin(c1),.sum(sum[7:4]),.cout(c2));
	carry_lookahead_adder a3(.a(a[11:8]),.b(b[11:8]),.cin(c2),.sum(sum[11:8]),.cout(c3));
	carry_lookahead_adder a4(.a(a[15:12]),.b(b[15:12]),.cin(c3),.sum(sum[15:12]),.cout(c4));
	carry_lookahead_adder a5(.a(a[19:16]),.b(b[19:16]),.cin(c4),.sum(sum[19:16]),.cout(c5));
	carry_lookahead_adder a6(.a(a[23:20]),.b(b[23:20]),.cin(c5),.sum(sum[23:20]),.cout(c6));
	carry_lookahead_adder a7(.a(a[27:24]),.b(b[27:24]),.cin(c6),.sum(sum[27:24]),.cout(c7));
	carry_lookahead_adder a8(.a(a[31:28]),.b(b[31:28]),.cin(c7),.sum(sum[31:28]),.cout(cout));
endmodule
