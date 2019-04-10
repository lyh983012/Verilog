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
	wire a0,a3,a2,a6,a8;
	reg [7:0] stateWord;
	reg [7:0] PB_reg;
	reg [7:0] PA_reg;
	reg INTR_A;  //pc
	reg INTR_B; //pc
	reg IBF_A;  
	reg OBF_B;
	
	assign a3 = ~SA[3];
	assign a2 = ~SA[2];
	assign a6 = ~SA[6]; 
	assign a8 = ~SA[8];
	assign a0 = ~SA[0];
	assign AEN_inv = ~AEN;
	assign CS_inv = ~CS;
	nand(CS,SA[9],a8,SA[7],a6,SA[5],SA[4],a3,a2,AEN_inv);
	and(CSA,CS_inv,a0,a1);
	and(CSB,CS_inv,a0,SA[1]);
	and(CSW,CS_inv,SA[0],SA[1]);

	
	always@(IOR,IOW)
	begin
		if(CSW)
		begin 
			//stateWord <= SD;
			stateWord <= 8'b10111101;
		end
	end

//the process of A**************8
	always@(negedge STB)
	begin 
		PA_reg <= PA;   //peri send data
	end
	always@(PA_reg,IOR)
	begin 
		IBF_A<=1;			 //buffered
		if (CSA && IOR)
		begin
			IBF_A<=0; 		//buffer flushed
		end
	end
	
	always@(IBF_A,STB,INTE_A,IOR)
	begin
		if(IBF_A && STB &&INTE_A)
		begin 
			INTR_A<=1;	 //enable the connection between PC and 8255(interupt)
							//then PC will change the IOR
		end

		if(CSA && ~IOR) //PC send request
		begin
			INTR_A<=0;	//start I/O and stop at next tick(stop interupt)
		end
	end
	
	
//the process of B **************8
	always@(IOW, ACK)		 //PC change the IOW, data is prepared 
		begin
		if(CSB && ~IOW && ACK )
		begin 
			INTR_B <=0; 		//start task of peri
			OBF_B <=0;  		//buffered
			PB_reg <= SD; 		//CPU data sent to port B tri-regs
		end
		if (~ACK )				//peri send a request
		begin 
			OBF_B <= 1; 		//buffer flushed, can be checked 
		end
		
		if(ACK && OBF_B && INTE_B && IOW)//peri end the task
		begin 
			INTR_B <= 1; 		 //finised task of peri
		end 
	end
	
//tri gate for PA,PB
bufif0(PB[0],PB_reg[0],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[1],PB_reg[1],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[2],PB_reg[2],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[3],PB_reg[3],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[4],PB_reg[4],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[5],PB_reg[5],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[6],PB_reg[6],stateWord[1]); //if stateWord[1]==0, output
bufif0(PB[7],PB_reg[7],stateWord[1]); //if stateWord[1]==0, output
 
bufif1(PA[0],PA_reg[0],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[1],PA_reg[1],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[2],PA_reg[2],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[3],PA_reg[3],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[4],PA_reg[4],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[5],PA_reg[5],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[6],PA_reg[6],stateWord[4]); //if stateWord[4]==1, output
bufif1(PA[7],PA_reg[7],stateWord[4]); //if stateWord[4]==1, output
 

endmodule
