`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:08 10/21/2019 
// Design Name: 
// Module Name:    RegisterBank32 
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
module RegisterBank32(
    input rst,
    input clk,
    input [4:0] readAddA,
    output [31:0] readDataA,
    input [4:0] readAddB,
    output [31:0] readDataB,
    input [1:0] RegWrite,
    input [4:0] writeAdd,
    input [31:0] writeData, // result else low for mult,multu
	 input [31:0] highData, //for multu and mult high value
	 input [31:0] raDataIn,
	 output [31:0] raDataOut,
	 output [31:0] rOut
    );

	reg [31:0] R[31:0];
	
	assign readDataA=rst?32'd0:R[readAddA];
	assign readDataB=rst?32'd0:R[readAddB];
	assign raDataOut=rst?32'd0:R[31];  // $ra
	assign rOut=rst?32'd0:R[9]; // $t1
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			R[0]=32'd0;R[1]=32'd0;R[2]=32'd0;R[3]=32'd0;R[4]=32'd0;R[5]=32'd0;R[6]=32'd0;R[7]=32'd0;
			R[8]=32'd0;R[9]=32'd0;R[10]=32'd0;R[11]=32'd0;R[12]=32'd0;R[13]=32'd0;R[14]=32'd0;R[15]=32'd0;
			R[16]=32'd0;R[17]=32'd0;R[18]=32'd0;R[19]=32'd0;R[20]=32'd0;R[21]=32'd0;R[22]=32'd0;R[23]=32'd0;
			R[24]=32'd0;R[25]=32'd0;R[26]=32'd0;R[27]=32'd0;R[28]=32'd0;R[29]=32'd0;R[30]=32'd0;R[31]=32'd0;
		end
		else begin
			if(RegWrite==2'b01)
				R[writeAdd]=writeData;
			else if(RegWrite==2'b10) begin //for mult and multu
				R[19]=highData; //high
				R[20]=writeData; //low
			end
			else if(RegWrite==2'b11) begin
				R[31]=raDataIn;
			end
		end
	end	
	

endmodule
