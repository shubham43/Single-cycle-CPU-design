`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:39:05 11/17/2016
// Design Name:   CPU
// Module Name:   C:/Users/student/Desktop/ASJ/CPUSingleCycle/CPU_Test.v
// Project Name:  CPUSingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_Test;

	// Inputs
	reg clk;
	reg rst;
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

	// Outputs
	wire [15:0] r0;
	wire [15:0] r1;
	wire [15:0] r2;
	wire [15:0] r3;
	wire [15:0] r4;
	wire [15:0] r5;
	wire [15:0] r6;
	wire [15:0] r7;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.rst(rst), 
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
		irom_mem0 = 16'b0110000000100100;	//li r0,#36
		irom_mem1 = 16'b0110100100000000;	//lr r1,r0
		irom_mem2 = 16'b0000100100000000;	//addr r1,r0
		irom_mem3 = 16'b0110001100000000;	//li r3,#0
		irom_mem4 = 16'b0111100101100000;	//sw r1,0(r3)
		irom_mem5 = 16'b0111010001100010;	//la r4,2(r3)
		irom_mem6 = 16'b1100111100000100;	//jal r7,label
		irom_mem7 = 16'b1111111111111111;	//block
		irom_mem8 = 16'b1000000000000101;	//j #5
		irom_mem9 = 16'b1000000000000100;	//j #4
		irom_mem10 = 16'b0000010000011001;	//addi r4,#25
		irom_mem11 = 16'b1001111111111101;	//jc #-3
		irom_mem12 = 16'b1010000000000010;	//jnc #2
		irom_mem13 = 16'b1111111111111111;	//block
		irom_mem14 = 16'b1101011100000000;	//jr r7
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

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
        
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule

