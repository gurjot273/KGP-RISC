`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:34 10/22/2019 
// Design Name: 
// Module Name:    ALU 
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


module ALU(
    input signed [31:0] a,
    input signed [31:0] b,
    input [5:0] opcode,
    output reg [31:0] result,
	 output reg [31:0] high,
    output reg carryFlag,
    output reg zFlag,
    output reg signFlag,
    output reg overflowFlag
    );
	
	
	initial begin
		result=32'd0;
		high=0;
		carryFlag=0;
		zFlag=1;
		signFlag=0;
		overflowFlag=0;
	end
	
	wire [31:0] sum;
	wire cout;
	wire [63:0] product;
	wire [63:0] signed_product;
	
	
	hybrid_adder fastAdder(a,b,1'b0,sum,cout);
	
	
	array_multiplier multiplier(a,b,product);
	
	
	signed_multiplier m1(a,b,signed_product);
	
	always @(*) begin
		if(opcode==6'd0) begin
			carryFlag = cout;
			result = sum;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=((a[31]^b[31])^result[31])^carryFlag;
		end
		else if(opcode==6'd1) begin
			{high,result} = product;
			carryFlag=0;
			zFlag=({high,result}==0);
			signFlag=0;
			overflowFlag=0;
		end
		else if(opcode==6'd2) begin
			{high,result}=signed_product;
			carryFlag=0;
			zFlag=({high,result}==0);
			signFlag=0;
			overflowFlag=0;
		end
		else if(opcode==6'd3) begin
			result=~b+1;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd4) begin
			carryFlag = cout;
			result = sum;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=((a[31]^b[31])^result[31])^carryFlag;
		end
		else if(opcode==6'd5) begin
			result=~b+1;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd6) begin
			result=a&b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd7) begin
			result=a^b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd8) begin
			result=a<<b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd9) begin
			result=a>>b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd10) begin
			result=a<<b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd11) begin
			result=a>>b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd12) begin
			result=a>>>b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd13) begin
			result=a>>>b;
			carryFlag=0;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=0;
		end
		else if(opcode==6'd16) begin //load word address calculation
			carryFlag = cout;
			result = sum;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=((a[31]^b[31])^result[31])^carryFlag;
		end
		else if(opcode==6'd32) begin //store word address calculation
			carryFlag = cout;
			result = sum;
			zFlag=(result==0);
			signFlag=(result[31]==1);
			overflowFlag=((a[31]^b[31])^result[31])^carryFlag;
		end
		else begin
			result=32'd0;
			high=0;
			carryFlag=0;
			zFlag=1;
			signFlag=0;
			overflowFlag=0;
		end
	end
	
	

endmodule
