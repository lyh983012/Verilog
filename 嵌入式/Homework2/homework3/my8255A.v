`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:39:55 06/01/2014 
// Design Name: 
// Module Name:    bk 
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
module my8255A(
    input [9:0] SA,
    inout [7:0] SD,
	 input [7:0] PA,
	 output INTR_A,
	 input  INTE_A,
	 input  STB,
	 output IBF_A,
	 output [7:0] PB,
	 output INTR_B,
	 input INTE_B,
	 output OBF_B,
	 input ACK,
	 
	 input RST,
    input IOR,
    input IOW,
    input AEN,
    input GND
    );
	
	wire CS,CSA,CSB,CSW;
	wire a0,a3,a2,a6,a8,a1;
	reg [7:0] stateWord;
	reg [7:0] PB_reg;
	reg [7:0] PA_reg;
	wire [7:0] PA;
	wire [7:0] PB;
	reg INTR_A;  //to_PC
	reg IBF_A;
	wire STB;
	wire INTE_A;
	reg INTR_B; //to_peri
	wire INTE_B;
	wire ACK;
	reg OBF_B;

	assign a0 = ~SA[0];
	assign a1 = ~SA[1];
	assign a2 = ~SA[2];
	assign a3 = ~SA[3];
	assign a6 = ~SA[6]; 
	assign a8 = ~SA[8];
	assign AEN_inv = ~AEN;
	assign CS_inv = ~CS;
	
	nand(CS,SA[9],a8,SA[7],a6,SA[5],SA[4],a3,a2,AEN_inv);
	and(CSA,CS_inv,a0,a1);
	and(CSB,CS_inv,a0,SA[1]);
	and(CSW,CS_inv,SA[0],SA[1]);
	
//tri gate for PA,PB
	bufif0(PB[0],PB_reg[0],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[1],PB_reg[1],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[2],PB_reg[2],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[3],PB_reg[3],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[4],PB_reg[4],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[5],PB_reg[5],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[6],PB_reg[6],stateWord[1]); //if stateWord[1]==0, output
	bufif0(PB[7],PB_reg[7],stateWord[1]); //if stateWord[1]==0, output
	bufif1(SD[0],PA_reg[0],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[1],PA_reg[1],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[2],PA_reg[2],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[3],PA_reg[3],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[4],PA_reg[4],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[5],PA_reg[5],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[6],PA_reg[6],stateWord[4]); //if stateWord[4]==1, output
	bufif1(SD[7],PA_reg[7],stateWord[4]); //if stateWord[4]==1, output
	 
// defaut: choose mode_1
	always@(CSW)
	begin
		stateWord = 8'b11111111;
		stateWord[4] =1;
		stateWord[1] =0;
	end
//the process of A**************
	always@(negedge STB or posedge IOR or posedge RST)
	begin 
		if (RST)
		begin
			PA_reg <= 8'b00000000;   //peri send data
			IBF_A<=0;
			$display("RSTA");
		end
		else if (~STB)
		begin
			PA_reg <= PA;   //peri send data
			IBF_A<=1;		//buffered
			$display("step1,store data",IBF_A);
		end
		else if (IOR)
		begin
			if(CSA)
				IBF_A<=0;		//buffered
			$display("step 4,INF= ",IBF_A);
		end
	end
	
	always@(posedge STB or negedge IOR or posedge RST)
	begin 
		if (RST)
		begin
			$display("RSTA");
			INTR_A<=0;
		end else if (~IOR)
		begin
			if(CSA)
				INTR_A<=0;		//buffered
			$display("step 3,INTR= ",INTR_A);
		end
		else if (STB)
		begin
			if(IBF_A && INTE_A && IOR)
				INTR_A<=1;		//buffered
			$display("step2 en-inter ",INTR_A);
			$display("reg=",PA_reg,"  SD=",SD);
		end
	end

//the process of B **************8
	always@(negedge IOW or posedge ACK or posedge RST)
	begin
	if (RST)
		begin
			$display("RSTB");
			INTR_B<=1;
			PB_reg<=0; 
		end		
	else if (~IOW)
		begin
			$display("step1= ", PB_reg);
			INTR_B <=0; 		//start task of peri
			PB_reg <= SD; 		//CPU data sent to port B tri-regs
		end
	else
		begin
			INTR_B <=1;
			$display("step4");
		end
	end
	
	always@(posedge IOW or negedge ACK or posedge RST)
	begin
	if (RST)
	begin
		$display("RSTB");
		OBF_B <=1;
	end 
	else if (ACK)
		begin
			OBF_B <=0;  	
			$display("step2 reg=", PB_reg);
		end
	else if(~ACK)
		begin
			OBF_B <=1;		
			$display("step3 ");
		end
	end

	

endmodule
