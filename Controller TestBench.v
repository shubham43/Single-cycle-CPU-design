`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:29 11/11/2016
// Design Name:   CPU_Controller
// Module Name:   C:/Users/student/Desktop/ASJ/CPUSingleCycle/CPU_Controller_Test.v
// Project Name:  CPUSingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_Controller_Test;

	// Inputs
	reg [4:0] opcode;
	reg C;
	reg V;
	reg S;
	reg Z_det;

	// Outputs
	wire ldPC2;
	wire ldPCz;
	wire ldXr1;
	wire ldXr2;
	wire ldXPC;
	wire ldYr1;
	wire ldYr2;
	wire alu_ld;
	wire ldRPC;
	wire ldRZ;
	wire ldRM;
	wire rdr1;
	wire rdr2;
	wire rdm;
	wire wrm;
	wire ldOff11to16;
	wire ldOff8to16;
	wire ldOff5to16;
	wire [2:0] fsel;

	// Instantiate the Unit Under Test (UUT)
	CPU_Controller uut (
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
		.fsel(fsel), 
		.opcode(opcode), 
		.C(C), 
		.V(V), 
		.S(S), 
		.Z_det(Z_det)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		#1;
		opcode = 5'b00000;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00001;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00010;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00011;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00100;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00101;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00110;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b00111;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01000;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01001;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01010;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01011;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01100;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01101;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01110;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b01111;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10000;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10001;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10001;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 1;
		
		#1;
		opcode = 5'b10010;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10010;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 1;
		
		#1;
		opcode = 5'b10011;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10011;
		C = 1;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10100;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10100;
		C = 1;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10101;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10101;
		C = 0;
		V = 1;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10110;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10110;
		C = 0;
		V = 1;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10111;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b10111;
		C = 0;
		V = 0;
		S = 1;
		Z_det = 0;
		
		#1;
		opcode = 5'b11000;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b11000;
		C = 0;
		V = 0;
		S = 1;
		Z_det = 0;
		
		#1;
		opcode = 5'b11001;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
		
		#1;
		opcode = 5'b11010;
		C = 0;
		V = 0;
		S = 0;
		Z_det = 0;
        
		// Add stimulus here

	end
      
endmodule

