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
// Create Date:    15:44:09 08/14/2019 
// Design Name: 
// Module Name:    carry_lookahead_adder 
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
module carry_lookahead_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
	wire [3:0] t;
	wire [3:0] d;
	wire [3:0] c;
	
	assign t[0]=a[0]&b[0],t[1]=a[1]&b[1],t[2]=a[2]&b[2],t[3]=a[3]&b[3];//ti=ai&bi
	assign d[0]=a[0]^b[0],d[1]=a[1]^b[1],d[2]=a[2]^b[2],d[3]=a[3]^b[3];//di=ai^bi
	assign c[0]=cin,c[1]=t[0]|(d[0]&cin),c[2]=t[1]|(d[1]&t[0])|(d[1]&d[0]&cin),c[3]=t[2]|(d[2]&t[1])|(d[2]&d[1]&t[0])|(d[2]&d[1]&d[0]&cin),
	cout=t[3]|(d[3]&t[2])|(d[3]&d[2]&t[1])|(d[3]&d[2]&d[1]&t[0])|(d[3]&d[2]&d[1]&d[0]&cin); //ci+1=ai&bi+ci&(ai^bi)=ti+di&ci in expanded form for carry_look_ahead
	assign sum[0]=d[0]^c[0],sum[1]=d[1]^c[1],sum[2]=d[2]^c[2],sum[3]=d[3]^c[3]; //sumi=ai^bi^ci=di^ci
endmodule
