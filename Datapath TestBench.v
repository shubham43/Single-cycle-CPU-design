`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:19 11/04/2016
// Design Name:   CPU_DataPath
// Module Name:   C:/Users/student/Desktop/ASJ/CPUSingleCycle/CPU_DataPath_Test.v
// Project Name:  CPUSingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_DataPath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_DataPath_Test;

	// Inputs
	reg clk;
	reg rst;
	reg ldPC2;
	reg ldPCz;
	reg ldXr1;
	reg ldXr2;
	reg ldXPC;
	reg ldYr1;
	reg ldYr2;
	reg alu_ld;
	reg ldRPC;
	reg ldRZ;
	reg ldRM;
	reg rdr1;
	reg rdr2;
	reg rdm;
	reg wrm;
	reg ldOff11to16;
	reg ldOff8to16;
	reg ldOff5to16;
	reg [15:0] irom_mem0;
	reg [15:0] irom_mem1;
	reg [15:0] irom_mem2;
	reg [15:0] irom_mem3;
	reg [15:0] irom_mem4;
	reg [15:0] irom_mem5;
	reg [15:0] irom_mem6;
	reg [15:0] irom_mem7;
	reg [15:0] irom_mem8;
	reg [15:0] irom_mem9;
	reg [15:0] irom_mem10;
	reg [15:0] irom_mem11;
	reg [15:0] irom_mem12;
	reg [15:0] irom_mem13;
	reg [15:0] irom_mem14;
	reg [15:0] irom_mem15;
	reg [15:0] irom_mem16;
	reg [15:0] irom_mem17;
	reg [15:0] irom_mem18;
	reg [15:0] irom_mem19;
	reg [15:0] drom_mem0;
	reg [15:0] drom_mem1;
	reg [15:0] drom_mem2;
	reg [15:0] drom_mem3;
	reg [15:0] drom_mem4;
	reg [15:0] drom_mem5;
	reg [15:0] drom_mem6;
	reg [15:0] drom_mem7;
	reg [15:0] drom_mem8;
	reg [15:0] drom_mem9;
	reg [15:0] drom_mem10;
	reg [15:0] drom_mem11;
	reg [15:0] drom_mem12;
	reg [15:0] drom_mem13;
	reg [15:0] drom_mem14;
	reg [15:0] drom_mem15;
	reg [15:0] drom_mem16;
	reg [15:0] drom_mem17;
	reg [15:0] drom_mem18;
	reg [15:0] drom_mem19;
	reg [2:0] fsel;

	// Outputs
	wire [4:0] opcode;
	wire C;
	wire V;
	wire S;
	wire Z_det;
	wire [15:0] r0;
	wire [15:0] r1;
	wire [15:0] r2;
	wire [15:0] r3;
	wire [15:0] r4;
	wire [15:0] r5;
	wire [15:0] r6;
	wire [15:0] r7;

	// Instantiate the Unit Under Test (UUT)
	CPU_DataPath uut (
		.clk(clk), 
		.rst(rst), 
		.ldPC2(ldPC2), 
		.ldPCz(ldPCz), 
		.ldXr1(ldXr1), 
		.ldXr2(ldXr2), 
		.ldXPC(ldXPC), 
		.ldYr1(ldYr1), 
		.ldYr2(ldYr2), 
		.alu_ld(alu_ld), 
		.ldRPC(ldRPC), 
		.ldRZ(ldRZ), 
		.ldRM(ldRM), 
		.rdr1(rdr1), 
		.rdr2(rdr2), 
		.rdm(rdm), 
		.wrm(wrm), 
		.ldOff11to16(ldOff11to16), 
		.ldOff8to16(ldOff8to16), 
		.ldOff5to16(ldOff5to16), 
		.irom_mem0(irom_mem0), 
		.irom_mem1(irom_mem1), 
		.irom_mem2(irom_mem2), 
		.irom_mem3(irom_mem3), 
		.irom_mem4(irom_mem4), 
		.irom_mem5(irom_mem5), 
		.irom_mem6(irom_mem6), 
		.irom_mem7(irom_mem7), 
		.irom_mem8(irom_mem8), 
		.irom_mem9(irom_mem9), 
		.irom_mem10(irom_mem10), 
		.irom_mem11(irom_mem11), 
		.irom_mem12(irom_mem12), 
		.irom_mem13(irom_mem13), 
		.irom_mem14(irom_mem14), 
		.irom_mem15(irom_mem15), 
		.irom_mem16(irom_mem16), 
		.irom_mem17(irom_mem17), 
		.irom_mem18(irom_mem18), 
		.irom_mem19(irom_mem19), 
		.drom_mem0(drom_mem0), 
		.drom_mem1(drom_mem1), 
		.drom_mem2(drom_mem2), 
		.drom_mem3(drom_mem3), 
		.drom_mem4(drom_mem4), 
		.drom_mem5(drom_mem5), 
		.drom_mem6(drom_mem6), 
		.drom_mem7(drom_mem7), 
		.drom_mem8(drom_mem8), 
		.drom_mem9(drom_mem9), 
		.drom_mem10(drom_mem10), 
		.drom_mem11(drom_mem11), 
		.drom_mem12(drom_mem12), 
		.drom_mem13(drom_mem13), 
		.drom_mem14(drom_mem14), 
		.drom_mem15(drom_mem15), 
		.drom_mem16(drom_mem16), 
		.drom_mem17(drom_mem17), 
		.drom_mem18(drom_mem18), 
		.drom_mem19(drom_mem19), 
		.fsel(fsel), 
		.opcode(opcode), 
		.C(C), 
		.V(V), 
		.S(S), 
		.Z_det(Z_det), 
		.r0(r0), 
		.r1(r1), 
		.r2(r2), 
		.r3(r3), 
		.r4(r4), 
		.r5(r5), 
		.r6(r6), 
		.r7(r7)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		ldPC2 = 0;
		ldPCz = 0;
		ldXr1 = 0;
		ldXr2 = 0;
		ldXPC = 0;
		ldYr1 = 0;
		ldYr2 = 0;
		alu_ld = 0;
		ldRPC = 0;
		ldRZ = 0;
		ldRM = 0;
		rdr1 = 0;
		rdr2 = 0;
		rdm = 0;
		wrm = 0;
		ldOff11to16 = 0;
		ldOff8to16 = 0;
		ldOff5to16 = 0;
		irom_mem0 = 16'b0110000000100100;
		irom_mem1 = 16'b0110100100000000;
		irom_mem2 = 16'b0000100100000000;
		irom_mem3 = 16'b0110001100000000;
		irom_mem4 = 16'b0111100101100000;
		irom_mem5 = 16'b0111010001100010;
		irom_mem6 = 16'b1100111100000100;
		irom_mem7 = 16'b1111111111111111;
		irom_mem8 = 0;
		irom_mem9 = 0;
		irom_mem10 = 16'b1101011100000000;
		irom_mem11 = 0;
		irom_mem12 = 0;
		irom_mem13 = 0;
		irom_mem14 = 0;
		irom_mem15 = 0;
		irom_mem16 = 0;
		irom_mem17 = 0;
		irom_mem18 = 0;
		irom_mem19 = 0;
		drom_mem0 = 255;
		drom_mem1 = 322;
		drom_mem2 = 10;
		drom_mem3 = 55;
		drom_mem4 = 216;
		drom_mem5 = 228;
		drom_mem6 = 33;
		drom_mem7 = 2;
		drom_mem8 = 0;
		drom_mem9 = 0;
		drom_mem10 = 0;
		drom_mem11 = 0;
		drom_mem12 = 0;
		drom_mem13 = 0;
		drom_mem14 = 0;
		drom_mem15 = 0;
		drom_mem16 = 0;
		drom_mem17 = 0;
		drom_mem18 = 0;
		drom_mem19 = 0;
		fsel = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		rst=0;
		
//1 li
		#2;
		$display("----------------------");
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

//2 lr
		#2;
		$display("----------------------");
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

//3 addr
		#2;
		$display("----------------------");
		ldPC2 = 1;
		ldPCz = 0;
		ldXr1 = 1;
		ldXr2 = 0;
		ldXPC = 0;
		ldYr1 = 0;
		ldYr2 = 1;
		alu_ld = 1;
		ldRPC = 0;
		ldRZ = 1;
		ldRM = 0;
		rdr1 = 1;
		rdr2 = 1;
		rdm = 0;
		wrm = 0;
		ldOff11to16 = 0;
		ldOff8to16 = 0;
		ldOff5to16 = 0;
		fsel=0;

//4 li
		#2;
		$display("----------------------");
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

//5 sw
		#2;
		$display("----------------------");
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

//6 la
		#2;
		$display("----------------------");
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
		
//7 jal
		#2;
		$display("----------------------");
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

//8 jr
		#2;
		$display("----------------------");
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

//9
		#2;
		$display("----------------------");
//		rst=1;
		ldPC2 = 1;
		ldPCz = 0;
		ldXr1 = 0;
		ldXr2 = 0;
		ldXPC = 0;
		ldYr1 = 0;
		ldYr2 = 0;
		alu_ld = 0;
		ldRPC = 0;
		ldRZ = 0;
		ldRM = 0;
		rdr1 = 0;
		rdr2 = 0;
		rdm = 0;
		wrm = 0;
		ldOff11to16 = 0;
		ldOff8to16 = 0;
		ldOff5to16 = 0;
		fsel=0;
		
		#2;
		rst=1;

	end
	
	always #1 clk=~clk;

      
endmodule
