`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:25:52 06/02/2014
// Design Name:   my8255A
// Module Name:   C:/Users/lyh/Desktop/Homework/homework3/testbench.v
// Project Name:  homework3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: my8255A
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [9:0] SA;
	reg [7:0] PA;
	reg INTE_A;
	reg STB;
	reg INTE_B;
	reg ACK;
	reg RST;
	reg IOR;
	reg IOW;
	reg AEN;
	reg GND;

	// Outputs
	wire INTR_A;
	wire IBF_A;
	wire [7:0] PB;
	wire INTR_B;
	wire OBF_B;

	// Bidirs
	wire [7:0] SD;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	my8255A uut (
		.SA(SA), 
		.SD(SD), 
		.PA(PA), 
		.INTR_A(INTR_A), 
		.INTE_A(INTE_A), 
		.STB(STB), 
		.IBF_A(IBF_A), 
		.PB(PB), 
		.INTR_B(INTR_B), 
		.INTE_B(INTE_B), 
		.OBF_B(OBF_B), 
		.ACK(ACK), 
		.RST(RST), 
		.IOR(IOR), 
		.IOW(IOW), 
		.AEN(AEN), 
		.GND(GND)
	);
	
	reg[20:0] count;
	reg[7:0] data1;
	assign SD = 8'b10111101;
	
	
	wire _CS,_CSA,_CSB,_CSW;
	wire _a0,_a3,_a2,_a6,_a8;
	reg [7:0] _stateWord;
	reg [7:0] _PB_reg;
	reg [7:0] _PA_reg;
	reg _INTR_A;  //pc
	reg _INTR_B; //pc
	reg _IBF_A;  
	reg _OBF_B;
	
	assign _a3 = ~SA[3];
	assign _a2 = ~SA[2];
	assign _a6 = ~SA[6]; 
	assign _a8 = ~SA[8];
	assign _a0 = ~SA[0];
	assign _AEN_inv = ~AEN;
	assign _CS_inv = ~_CS;
	nand(_CS,SA[9],_a8,SA[7],_a6,SA[5],SA[4],_a3,_a2,_AEN_inv);
	and(_CSA,_CS_inv,_a0,_a1);
	and(_CSB,_CS_inv,_a0,SA[1]);
	and(_CSW,_CS_inv,SA[0],SA[1]);
	
	initial begin
		// Initialize Inputs
		PA = 0;
		INTE_A = 0;
		STB = 1;
		INTE_B = 0;
		data1 = 8'b10111001; 
		clk = 0;
		count =0;
		ACK = 1;
		RST = 1;
		IOR = 1;
		IOW = 0;
		AEN = 0;
		GND = 0;
		// Wait 100 ns for global reset to finish
		#10;
      forever 
		begin
		#2
		clk = !clk; 
		count = count+1;
		if (count==1)
			SA = 10'b1010110011;
		if (count==5)
			SA = 10'b1010110000;
		if(count==12)
			STB =0;
		if(count==14)
			STB =1;
		if(count==18)
			IOR =0;
		if(count==20)
			IOR =1;
		end  
		// Add stimulus here

	end
      
endmodule

