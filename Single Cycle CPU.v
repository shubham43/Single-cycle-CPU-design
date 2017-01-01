`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:43 11/17/2016 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
		clk,rst,
		irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
		irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19,
		drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
		drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19,
		r0,r1,r2,r3,r4,r5,r6,r7
    );


	input clk,rst;
	input[15:0] irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
		irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19,
		drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
		drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19;
	output[15:0] r0,r1,r2,r3,r4,r5,r6,r7;
	
	wire ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,
		C,V,S,Z_det,ldOff11to16,ldOff8to16,ldOff5to16;
	wire[2:0] fsel;
	wire[4:0] opcode;

	CPU_DataPath sdp(
		clk,rst,ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16,
		irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
		irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19,
		drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
		drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19,
		fsel,opcode,C,V,S,Z_det,r0,r1,r2,r3,r4,r5,r6,r7
	);

	CPU_Controller sc(
		ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16,fsel,
		opcode,C,V,S,Z_det,rst
   );

endmodule
