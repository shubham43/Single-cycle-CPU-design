`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:51 11/11/2016 
// Design Name: 
// Module Name:    CPU_Controller 
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
module CPU_Controller(
		ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16,fsel,
		opcode,C,V,S,Z_det
    );
	
	input[4:0] opcode;
	input C,V,S,Z_det;
	output ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16;
	output[2:0] fsel;
	reg ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16;
	reg[2:0] fsel;

	always@(opcode)begin
		if(opcode[4])begin	//Jump
			if(opcode[3:0]==4'b1001||opcode[3:0]==4'b1010)begin
				if(opcode[0])begin
					ldPC2 = 0;
					ldPCz = 1;
					ldXr1 = 0;
					ldXr2 = 0;
					ldXPC = 1;
					ldYr1 = 0;
					ldYr2 = 0;
					alu_ld = 1;
					ldRPC = 1;
					ldRZ = 0;
					ldRM = 0;
					rdr1 = 0;
					rdr2 = 0;
					rdm = 0;
					wrm = 0;
					ldOff11to16 = 0;
					ldOff8to16 = 1;
					ldOff5to16 = 0;
					fsel=0;
				end
				else begin
					ldPC2 = 0;
					ldPCz = 1;
					ldXr1 = 1;
					ldXr2 = 0;
					ldXPC = 0;
					ldYr1 = 0;
					ldYr2 = 0;
					alu_ld = 1;
					ldRPC = 0;
					ldRZ = 0;
					ldRM = 0;
					rdr1 = 1;
					rdr2 = 0;
					rdm = 0;
					wrm = 0;
					ldOff11to16 = 0;
					ldOff8to16 = 0;
					ldOff5to16 = 0;
					fsel=6;
				end
			end
			else begin
				ldXr1 = 0;
				ldXr2 = 0;
				ldYr1 = 0;
				ldYr2 = 0;
				ldRPC = 0;
				ldRZ = 0;
				ldRM = 0;
				rdr1 = 0;
				rdr2 = 0;
				rdm = 0;
				wrm = 0;
				ldOff8to16 = 0;
				ldOff5to16 = 0;
				fsel=0;
				if((opcode[3:0]==4'b0000)||
					((opcode[3:0]==4'b0001)&&(Z_det))||((opcode[3:0]==4'b0010)&&(Z_det==0))||
					((opcode[3:0]==4'b0011)&&(C))||((opcode[3:0]==4'b0100)&&(C==0))||
					((opcode[3:0]==4'b0101)&&(V))||((opcode[3:0]==4'b0110)&&(V==0))||
					((opcode[3:0]==4'b0111)&&(S))||((opcode[3:0]==4'b1000)&&(S==0))
						)begin
					ldPC2 = 0;
					ldPCz = 1;
					ldXPC = 1;
					alu_ld = 1;
					ldOff11to16 = 1;
				end
				else begin
					ldPC2 = 1;
					ldPCz = 0;
					ldXPC = 0;
					alu_ld = 0;
					ldOff11to16 = 0;
				end
			end
		end
		else begin
			if(opcode[3:1]==3'b110||opcode[3:1]==3'b111)begin	//Load/Store
				casex(opcode[1:0])
					2'b00:begin
						ldPC2 = 1;
						ldPCz = 0;
						ldXr1 = 0;
						ldXr2 = 0;
						ldXPC = 0;
						ldYr1 = 0;
						ldYr2 = 0;
						alu_ld = 1;
						ldRPC = 0;
						ldRZ = 1;
						ldRM = 0;
						rdr1 = 0;
						rdr2 = 0;
						rdm = 0;
						wrm = 0;
						ldOff11to16 = 0;
						ldOff8to16 = 1;
						ldOff5to16 = 0;
						fsel=7;
					end
					2'b01:begin
						ldPC2 = 1;
						ldPCz = 0;
						ldXr1 = 0;
						ldXr2 = 1;
						ldXPC = 0;
						ldYr1 = 0;
						ldYr2 = 0;
						alu_ld = 1;
						ldRPC = 0;
						ldRZ = 1;
						ldRM = 0;
						rdr1 = 0;
						rdr2 = 1;
						rdm = 0;
						wrm = 0;
						ldOff11to16 = 0;
						ldOff8to16 = 0;
						ldOff5to16 = 0;
						fsel=6;
					end
					2'b10:begin
						ldPC2 = 1;
						ldPCz = 0;
						ldXr1 = 0;
						ldXr2 = 1;
						ldXPC = 0;
						ldYr1 = 0;
						ldYr2 = 0;
						alu_ld = 1;
						ldRPC = 0;
						ldRZ = 0;
						ldRM = 1;
						rdr1 = 0;
						rdr2 = 1;
						rdm = 1;
						wrm = 0;
						ldOff11to16 = 0;
						ldOff8to16 = 0;
						ldOff5to16 = 1;
						fsel=0;
					end
					2'b11:begin
						ldPC2 = 1;
						ldPCz = 0;
						ldXr1 = 0;
						ldXr2 = 1;
						ldXPC = 0;
						ldYr1 = 0;
						ldYr2 = 0;
						alu_ld = 1;
						ldRPC = 0;
						ldRZ = 0;
						ldRM = 0;
						rdr1 = 1;
						rdr2 = 1;
						rdm = 0;
						wrm = 1;
						ldOff11to16 = 0;
						ldOff8to16 = 0;
						ldOff5to16 = 1;
						fsel=0;
					end
				endcase
				
			end
			else begin												//ALU
				ldPC2 = 1;
				ldPCz = 0;
				ldXr1 = 1;
				ldXr2 = 0;
				ldXPC = 0;
				ldYr1 = 0;
				alu_ld = 1;
				ldRPC = 0;
				ldRZ = 1;
				ldRM = 0;
				rdr1 = 1;
				rdm = 0;
				wrm = 0;
				ldOff11to16 = 0;
				ldOff5to16 = 0;
				fsel=opcode[3:1];
				if(opcode[3:1]==3'b100||opcode[0])begin	//ALU_R
					ldYr2 = 1;
					rdr2 = 1;
					ldOff8to16 = 0;
				end
				else begin											//ALU_I
					ldYr2 = 0;
					rdr2 = 0;
					ldOff8to16 = 1;
				end
			end
		end
	end
endmodule
