`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:39 10/23/2019 
// Design Name: 
// Module Name:    branch 
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
module branch(
    input [5:0] opcode,
    input [25:0] label,
	 input [31:0] rsVal,
    input carryFlag,
    input zFlag,
    input overflowFlag,
    input signFlag,
    input [11:0] pc,
	 input [31:0] raDataOld,
	 output reg [31:0] raDataNew,
    output reg [25:0] pcLabel,
    output reg isBranch,
    input rst
    );

	always @(*) begin
		if(rst) begin
			pcLabel=0;
			isBranch=0;
			raDataNew=0;
		end
		else begin
			if(opcode==6'd48) begin
				pcLabel=label[11:0];
				isBranch=1;
				raDataNew=raDataOld;
			end
			else if(opcode==6'd49) begin
				pcLabel=rsVal[11:0];
				isBranch=1;
				raDataNew=raDataOld;
			end
			else if(opcode==6'd50) begin
				pcLabel=(zFlag==1)?label[11:0]:0;
				isBranch=(zFlag==1);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd51) begin
				pcLabel=(zFlag==0)?label[11:0]:0;
				isBranch=(zFlag==0);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd52) begin
				pcLabel=(carryFlag==1)?label[11:0]:0;
				isBranch=(carryFlag==1);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd53) begin
				pcLabel=(carryFlag==0)?label[11:0]:0;
				isBranch=(carryFlag==0);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd54) begin
				pcLabel=(signFlag==1)?label[11:0]:0;
				isBranch=(signFlag==1);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd55) begin
				pcLabel=(signFlag==0)?label[11:0]:0;
				isBranch=(signFlag==0);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd56) begin
				pcLabel=(overflowFlag==1)?label[11:0]:0;
				isBranch=(overflowFlag==1);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd57) begin
				pcLabel=(overflowFlag==0)?label[11:0]:0;
				isBranch=(overflowFlag==0);
				raDataNew=raDataOld;
			end
			else if(opcode==6'd58) begin
				pcLabel=label[11:0];
				isBranch=1;
				raDataNew={20'd0,(pc+12'd4)};
			end
			else if(opcode==6'd59) begin
				pcLabel=raDataOld[11:0];
				isBranch=1;
				raDataNew=raDataOld;
			end
			else begin
				pcLabel=0;
				isBranch=0;
				raDataNew=raDataOld;
			end
		end
	end

endmodule
