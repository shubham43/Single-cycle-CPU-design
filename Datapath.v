`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:53 11/03/2016 
// Design Name: 
// Module Name:    CPU_DataPath 
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

module CPU_DataPath(
		clk,rst,ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16,
		irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
		irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19,
		drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
		drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19,
		fsel,opcode,C,V,S,Z_det,r0,r1,r2,r3,r4,r5,r6,r7
	 );

	wire null1,null2,ldPC,ldXr,nldX,ldYr,nldY,ldRPCZ,wrr,nwrr,ldOff,ldYOff,nldYOff;
	wire[15:0] PC,PC2,PCin,X,Y,Z,dout,wpd,rpd1,rpd2,Offset16bit;
	wire[1:0] selX,selY,selR,selOff;
	wire[4:0] offset5bit;
	wire[2:0] ropd1,ropd2;
	
	input clk,rst;
	input ldPC2,ldPCz,ldXr1,ldXr2,ldXPC,ldYr1,ldYr2,alu_ld,ldRPC,ldRZ,ldRM,rdr1,rdr2,rdm,wrm,ldOff11to16,ldOff8to16,ldOff5to16;
	input[15:0] irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
		irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19;
	input[15:0] drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
		drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19;
	input[2:0] fsel;
	output[4:0] opcode;
	output C,V,S,Z_det;
	output[15:0] r0,r1,r2,r3,r4,r5,r6,r7;
//	reg[15:0] r0,r1,r2,r3,r4,r5,r6,r7;
	
  add PCplus2(PC,16'b0000000000000001,PC2,null1,null2);
	or oPC(ldPC,ldPCz,ldPC2);
	mux2to1 PCmux(PCin,ldPCz,ldPC,PC2,Z);
	Register regPC(PCin,clk,PC,ldPC,rst);

  InstrMemory instructionLoading(PC,clk,{opcode[4:0],ropd1[2:0],ropd2[2:0],offset5bit[4:0]},rst,
		irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
		irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19);

	mux3to1 Xmux(X,selX,rpd1,rpd2,PC);
	or oX1(ldXr,ldXr1,ldXr2);
	nor oX2(nldX,ldXr,ldXPC);
	encoder4to2 e42X(selX,{ldXPC,ldXr2,ldXr1,nldX});

	mux3to1 Ymux(Y,selY,rpd1,rpd2,Offset16bit);
	or oY1(ldYr,ldYr1,ldYr2);
	nor oY2(nldY,ldYr,ldYOff);
	encoder4to2 e42Y(selY,{ldYOff,ldYr2,ldYr1,nldY});
	
	ALU _alu(X,Y,Z,fsel,C,V,S,Z_det,alu_ld);
	
	mux3to1 Rmux(wpd,selR,PC,Z,dout);
	or oR1(ldRPCZ,ldRPC,ldRZ);
	or oR2(wrr,ldRPCZ,ldRM);
	not nR(nwrr,wrr);
	encoder4to2 e42R(selR,{ldRM,ldRZ,ldRPC,nwrr});
	reg_bank Registers(wpd,ropd1,ropd1,ropd2,wrr,rdr1,rdr2,rpd1,rpd2,clk,rst,r0,r1,r2,r3,r4,r5,r6,r7);
	
	DataMemory dataLoading(Z,rdm,wrm,clk,rpd1,dout,rst,
		drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
		drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19);
	
	mux3to1 OffsetMux(Offset16bit,selOff,
		{offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4],offset5bit[4:0]},
                      {ropd2[2],ropd2[2],ropd2[2],ropd2[2],ropd2[2],ropd2[2],ropd2[2],ropd2[2],ropd2[2:0],offset5bit[4:0]},
                      {ropd1[2],ropd1[2],ropd1[2],ropd1[2],ropd1[2],ropd1[2:0],ropd2[2:0],offset5bit[4:0]});
	or oappending1(ldOff,ldOff8to16,ldOff5to16);
	or oappending2(ldYOff,ldOff11to16,ldOff);
	not oappending0(nldYOff,ldYOff);
	encoder4to2 e42Off(selOff,{ldOff11to16,ldOff8to16,ldOff5to16,nldYOff});
	always@(PC)$display("PC=%h",PC);

endmodule

module InstrMemory(ia,clk,iout,reset,
	irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9,
	irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19);

	input[15:0] ia;
	input clk,reset;
	input[15:0] irom_mem0,irom_mem1,irom_mem2,irom_mem3,irom_mem4,irom_mem5,irom_mem6,irom_mem7,irom_mem8,irom_mem9;
	input[15:0] irom_mem10,irom_mem11,irom_mem12,irom_mem13,irom_mem14,irom_mem15,irom_mem16,irom_mem17,irom_mem18,irom_mem19;
	output[15:0] iout;

	reg[15:0] imem[65535:0];
	reg[15:0] iout;

  always@(reset or negedge clk)begin
		if(reset)begin
			imem[0]=irom_mem0[15:0];
			imem[1]=irom_mem1[15:0];
			imem[2]=irom_mem2[15:0];
			imem[3]=irom_mem3[15:0];
			imem[4]=irom_mem4[15:0];
			imem[5]=irom_mem5[15:0];
			imem[6]=irom_mem6[15:0];
			imem[7]=irom_mem7[15:0];
			imem[8]=irom_mem8[15:0];
			imem[9]=irom_mem9[15:0];
			imem[10]=irom_mem10[15:0];
			imem[11]=irom_mem11[15:0];
			imem[12]=irom_mem12[15:0];
			imem[13]=irom_mem13[15:0];
			imem[14]=irom_mem14[15:0];
			imem[15]=irom_mem15[15:0];
			imem[16]=irom_mem16[15:0];
			imem[17]=irom_mem17[15:0];
			imem[18]=irom_mem18[15:0];
			imem[19]=irom_mem19[15:0];
		end
		else iout=imem[ia];
	end
endmodule


module DataMemory(da,dr,dw,clk,din,dout,reset,
	drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9,
	drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19);

	input[15:0]da;
	input dr,dw,clk,reset;
	input[15:0] din;
	input[15:0] drom_mem0,drom_mem1,drom_mem2,drom_mem3,drom_mem4,drom_mem5,drom_mem6,drom_mem7,drom_mem8,drom_mem9;
	input[15:0] drom_mem10,drom_mem11,drom_mem12,drom_mem13,drom_mem14,drom_mem15,drom_mem16,drom_mem17,drom_mem18,drom_mem19;
	output[15:0] dout;
	reg[7:0] dmemory[65535:0];
	reg[15:0] dout;
	always@(posedge clk or reset or dr or da)
	begin
		if(reset)begin
			dmemory[0]=drom_mem0[15:8];
			dmemory[1]=drom_mem0[7:0];
			dmemory[2]=drom_mem1[15:8];
			dmemory[3]=drom_mem1[7:0];
			dmemory[4]=drom_mem2[15:8];
			dmemory[5]=drom_mem2[7:0];
			dmemory[6]=drom_mem3[15:8];
			dmemory[7]=drom_mem3[7:0];
			dmemory[8]=drom_mem4[15:8];
			dmemory[9]=drom_mem4[7:0];
			dmemory[10]=drom_mem5[15:8];
			dmemory[11]=drom_mem5[7:0];
			dmemory[12]=drom_mem6[15:8];
			dmemory[13]=drom_mem6[7:0];
			dmemory[14]=drom_mem7[15:8];
			dmemory[15]=drom_mem7[7:0];
			dmemory[16]=drom_mem8[15:8];
			dmemory[17]=drom_mem8[7:0];
			dmemory[18]=drom_mem9[15:8];
			dmemory[19]=drom_mem9[7:0];
			dmemory[20]=drom_mem10[15:8];
			dmemory[21]=drom_mem10[7:0];
			dmemory[22]=drom_mem11[15:8];
			dmemory[23]=drom_mem11[7:0];
			dmemory[24]=drom_mem12[15:8];
			dmemory[25]=drom_mem12[7:0];
			dmemory[26]=drom_mem13[15:8];
			dmemory[27]=drom_mem13[7:0];
			dmemory[28]=drom_mem14[15:8];
			dmemory[29]=drom_mem14[7:0];
			dmemory[30]=drom_mem15[15:8];
			dmemory[31]=drom_mem15[7:0];
			dmemory[32]=drom_mem16[15:8];
			dmemory[33]=drom_mem16[7:0];
			dmemory[34]=drom_mem17[15:8];
			dmemory[35]=drom_mem17[7:0];
			dmemory[36]=drom_mem18[15:8];
			dmemory[37]=drom_mem18[7:0];
			dmemory[38]=drom_mem19[15:8];
			dmemory[39]=drom_mem19[7:0];
		end
		if(dr)begin
			dout={dmemory[da],dmemory[{da[15:1],1'b1}]};
//			$display("dmemory[%h]=%h dout=%h",da,{dmemory[da],dmemory[{da[15:1],1'b1}]},dout);
		end
		if(dw)begin
			dmemory[da]=din[15:8];
			dmemory[{da[15:1],1'b1}]=din[7:0];
//			$display("dmemory[%h]=%h din=%h",da,{dmemory[da],dmemory[{da[15:1],1'b1}]},din);
		end
	end
endmodule


module reg_bank(wpd,wpa,rpa1,rpa2,wrr,rdr1,rdr2,rpd1,rpd2,clk,rst,r0,r1,r2,r3,r4,r5,r6,r7);
	input[15:0] wpd;
	input[2:0] wpa,rpa1,rpa2;
	input wrr,rdr1,rdr2;
	input clk,rst;
	output[15:0] rpd1,rpd2;
  
  //reg[15:0] rpd1,rpd2;
  
	wire[7:0] wr;
	output[15:0] r0,r1,r2,r3,r4,r5,r6,r7;
	
	decoder3to8 write(wpa,wr,wrr);
	
	Register load0(wpd,clk,r0,wr[0],rst);
	Register load1(wpd,clk,r1,wr[1],rst);
	Register load2(wpd,clk,r2,wr[2],rst);
	Register load3(wpd,clk,r3,wr[3],rst);
	Register load4(wpd,clk,r4,wr[4],rst);
	Register load5(wpd,clk,r5,wr[5],rst);
	Register load6(wpd,clk,r6,wr[6],rst);
	Register load7(wpd,clk,r7,wr[7],rst);
	
	mux8to1 read1(rpd1,rpa1,rdr1,r0,r1,r2,r3,r4,r5,r6,r7);
	mux8to1 read2(rpd2,rpa2,rdr2,r0,r1,r2,r3,r4,r5,r6,r7);
	
endmodule


module ALU(X,Y,Z,fsel,C,V,S,Z_det,alu_ld);
	input[15:0] X,Y;
	input[2:0]fsel;
	input alu_ld;
	output[15:0] Z;
	output C,V,S,Z_det;
	wire[15:0] w0,w1,w2,w3,w4;
	wire[14:0] w5;
	wire wca,wcs,wca0,wcs0,wva,wvs;

	add add_0(X,Y,w0,wca,wca0);
	sub sub_0(X,Y,w1,wcs,wcs0);
	and_op and_0(X,Y,w2);
	or_op or_0(X,Y,w3);
	cmp complement0(X,w4);
	
	genvar i;
	or o0(w5[0],Z[0],Z[1]); 
	generate
		for(i=2;i<16;i=i+1)begin:asj0
			or o1(w5[i-1],Z[i],w5[i-2]);
		end
	endgenerate
	not n0(Z_det,w5[14]);
	xor x1(wva,wca,wca0); 
	xor x2(wvs,wcs,wcs0); 
	and a0(S,Z[15],1'b1);
	
	mux8to1_1bit carrysel(C,fsel,alu_ld,wca0,wcs0,1'b0,1'b0,1'b0,wcs0,1'b0,1'b0);
	mux8to1_1bit ovflosel(V,fsel,alu_ld,wva,wvs,1'b0,1'b0,1'b0,wvs,1'b0,1'b0);
	mux8to1 feedZ(Z,fsel,alu_ld,w0,w1,w2,w3,w4,w1,X,Y);

endmodule


module Register(in,clk,out,ld,rst);
	input[15:0] in;
	input clk,ld,rst;
	output[15:0] out;
	reg[15:0] out;
	always@(posedge clk or posedge rst)
	begin
		if(rst)out=16'b0;
		else begin
			$display("################");
			if(ld)begin
				out=in;
			end
			else out=out;
		end
	end
endmodule


module decoder3to8(in,out,ld);
	input[2:0] in;
	input ld;
	output[7:0] out;
	reg[7:0] out;
	always@(in or ld)
	begin
		if(ld)
		begin
			casex(in)
				3'b000:out=8'b00000001;
				3'b001:out=8'b00000010;
				3'b010:out=8'b00000100;
				3'b011:out=8'b00001000;
				3'b100:out=8'b00010000;
				3'b101:out=8'b00100000;
				3'b110:out=8'b01000000;
				3'b111:out=8'b10000000;
			endcase
		end
		else out=8'b00000000;
	end
endmodule


module mux8to1(out,sel,ld,r0,r1,r2,r3,r4,r5,r6,r7);
	output[15:0] out;
	input[2:0] sel;
	input ld;
	input[15:0] r0,r1,r2,r3,r4,r5,r6,r7;
	reg[15:0] out;
	always@(sel or ld or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7)
	begin
		if(ld)begin
			casex(sel)
				3'b000:out=r0;
				3'b001:out=r1;
				3'b010:out=r2;
				3'b011:out=r3;
				3'b100:out=r4;
				3'b101:out=r5;
				3'b110:out=r6;
				3'b111:out=r7;
			endcase
		end
		else out=out;
	end
endmodule


module mux8to1_1bit(out,sel,ld,r0,r1,r2,r3,r4,r5,r6,r7);
	output out;
	input[2:0] sel;
	input ld;
	input r0,r1,r2,r3,r4,r5,r6,r7;
	reg out;
	always@(sel or ld or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7)
	begin
		if(ld)begin
			casex(sel)
				3'b000:out=r0;
				3'b001:out=r1;
				3'b010:out=r2;
				3'b011:out=r3;
				3'b100:out=r4;
				3'b101:out=r5;
				3'b110:out=r6;
				3'b111:out=r7;
			endcase
		end
		else out=out;
	end
endmodule


module encoder4to2(out,in);
	input[3:0] in;
	output[1:0] out;
	reg[1:0] out;
	always@(in)begin
		casex(in)
			4'b0001:out=2'b00;
			4'b0010:out=2'b01;
			4'b0100:out=2'b10;
			4'b1000:out=2'b11;
			default:out=out;
		endcase
	end
endmodule


module mux3to1(out,sel,r1,r2,r3);
	output[15:0] out;
	input[1:0] sel;
	input[15:0] r1,r2,r3;
	reg[15:0] out;
	always@(sel or r1 or r2 or r3)
	begin
		casex(sel)
			2'b00:out=out;
			2'b01:out=r1;
			2'b10:out=r2;
			2'b11:out=r3;
		endcase
	end
endmodule


module mux2to1(out,sel,ld,r0,r1);
	output[15:0] out;
	input sel;
	input ld;
	input[15:0] r0,r1;
	reg[15:0] out;
	always@(sel or ld or r0 or r1)
	begin
		if(ld)begin
			if(sel)out=r1;
			else out=r0;
		end
		else out=out;
	end
endmodule


module add( a ,b ,sum ,carryls ,carryl );

	input [15:0] a ;
	input [15:0] b ; 

	output [15:0] sum;
	output carryl,carryls ;

	wire [13:0]s;

	full_adder u100 (a[0],b[0],1'b0,sum[0],s[0]);
	full_adder u101 (a[1],b[1],s[0],sum[1],s[1]);
	full_adder u102 (a[2],b[2],s[1],sum[2],s[2]);
	full_adder u103 (a[3],b[3],s[2],sum[3],s[3]);
	full_adder u104 (a[4],b[4],s[3],sum[4],s[4]);
	full_adder u105 (a[5],b[5],s[4],sum[5],s[5]);
	full_adder u106 (a[6],b[6],s[5],sum[6],s[6]);
	full_adder u107 (a[7],b[7],s[6],sum[7],s[7]);
	full_adder u108 (a[8],b[8],s[7],sum[8],s[8]);
	full_adder u109 (a[9],b[9],s[8],sum[9],s[9]);
	full_adder u110 (a[10],b[10],s[9],sum[10],s[10]);
	full_adder u111 (a[11],b[11],s[10],sum[11],s[11]);
	full_adder u112 (a[12],b[12],s[11],sum[12],s[12]);
	full_adder u113 (a[13],b[13],s[12],sum[13],s[13]);
	full_adder u114 (a[14],b[14],s[13],sum[14],carryls);
	full_adder u115 (a[15],b[15],carryls,sum[15],carryl);

endmodule


module sub( a ,b ,diff ,borrowls,borrowl);

	input [15:0] a ;
	input [15:0] b ; 

	output [15:0] diff ;
	output borrowl,borrowls ;

	wire [15:0] l;
	wire [13:0] s;
	
	assign l =( 16'b1111111111111111 ^ b);

	full_adder u00 (a[0],l[0],1'b1,diff[0],s[0]);
	full_adder u01 (a[1],l[1],s[0],diff[1],s[1]);
	full_adder u02 (a[2],l[2],s[1],diff[2],s[2]);
	full_adder u03 (a[3],l[3],s[2],diff[3],s[3]);
	full_adder u04 (a[4],l[4],s[3],diff[4],s[4]);
	full_adder u05 (a[5],l[5],s[4],diff[5],s[5]);
	full_adder u06 (a[6],l[6],s[5],diff[6],s[6]);
	full_adder u07 (a[7],l[7],s[6],diff[7],s[7]);
	full_adder u08 (a[8],l[8],s[7],diff[8],s[8]);
	full_adder u09 (a[9],l[9],s[8],diff[9],s[9]);
	full_adder u10 (a[10],l[10],s[9],diff[10],s[10]);
	full_adder u11 (a[11],l[11],s[10],diff[11],s[11]);
	full_adder u12 (a[12],l[12],s[11],diff[12],s[12]);
	full_adder u13 (a[13],l[13],s[12],diff[13],s[13]);
	full_adder u14 (a[14],l[14],s[13],diff[14],borrowls);
	full_adder u15 (a[15],l[15],borrowls,diff[15],borrowl);

endmodule


module full_adder ( a ,b ,c ,sum ,carry );

	input a ; 
	input b ;
	input c ;
   
	output sum ;
	output carry ;

	assign sum = ((a ^ b) ^ c);  
	assign carry = (((a&b) | (b&c)) | (c&a));

endmodule  


module and_op(X,Y,out);
	input[15:0] X,Y;
	output[15:0] out;
	and and_fn0(out[0],X[0],Y[0]);
	and and_fn1(out[1],X[1],Y[1]);
	and and_fn2(out[2],X[2],Y[2]);
	and and_fn3(out[3],X[3],Y[3]);
	and and_fn4(out[4],X[4],Y[4]);
	and and_fn5(out[5],X[5],Y[5]);
	and and_fn6(out[6],X[6],Y[6]);
	and and_fn7(out[7],X[7],Y[7]);
	and and_fn8(out[8],X[8],Y[8]);
	and and_fn9(out[9],X[9],Y[9]);
	and and_fn10(out[10],X[10],Y[10]);
	and and_fn11(out[11],X[11],Y[11]);
	and and_fn12(out[12],X[12],Y[12]);
	and and_fn13(out[13],X[13],Y[13]);
	and and_fn14(out[14],X[14],Y[14]);
	and and_fn15(out[15],X[15],Y[15]);
endmodule


module or_op(X,Y,out);
	input[15:0] X,Y;
	output[15:0] out;
	or or_fn0(out[0],X[0],Y[0]);
	or or_fn1(out[1],X[1],Y[1]);
	or or_fn2(out[2],X[2],Y[2]);
	or or_fn3(out[3],X[3],Y[3]);
	or or_fn4(out[4],X[4],Y[4]);
	or or_fn5(out[5],X[5],Y[5]);
	or or_fn6(out[6],X[6],Y[6]);
	or or_fn7(out[7],X[7],Y[7]);
	or or_fn8(out[8],X[8],Y[8]);
	or or_fn9(out[9],X[9],Y[9]);
	or or_fn10(out[10],X[10],Y[10]);
	or or_fn11(out[11],X[11],Y[11]);
	or or_fn12(out[12],X[12],Y[12]);
	or or_fn13(out[13],X[13],Y[13]);
	or or_fn14(out[14],X[14],Y[14]);
	or or_fn15(out[15],X[15],Y[15]);
endmodule


module cmp(x,y);
	input[15:0] x;
	output[15:0] y;
	wire w0,w1;
	sub twoscmp(16'b0000000000000000,x,y,w0,w1);
endmodule
