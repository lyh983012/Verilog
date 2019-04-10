`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:01 03/26/2019
// Design Name:   my8255A
// Module Name:   C:/Users/lyh/Desktop/Homework/homework3/new_test.v
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

module new_test;

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
	reg[7:0] count;
	reg[7:0] data1;
	reg[7:0] data2;
	reg clk;
	wire _CS,_CSA,_CSB,_CSW;
	wire _a0,_a3,_a2,_a6,_a8,_a1;
	
	assign SD = data1;
	assign _a3 = ~SA[3];
	assign _a2 = ~SA[2];
	assign _a6 = ~SA[6]; 
	assign _a8 = ~SA[8];
	assign _a0 = ~SA[0];
	assign _a1 = ~SA[1];
	assign _AEN_inv = ~AEN;
	assign _CS_inv = ~_CS;
	nand(_CS,SA[9],_a8,SA[7],_a6,SA[5],SA[4],_a3,_a2,_AEN_inv);
	and(_CSA,_CS_inv,_a0,_a1);
	and(_CSB,_CS_inv,_a0,SA[1]);
	and(_CSW,_CS_inv,SA[0],SA[1]);

	initial begin
		// Initialize Inputs
		data1 = 8'b10111001; 
		data2 = 8'b10101010; 
		PA = 	  8'b00000000;
		clk=0;
		count=0;
		INTE_A = 1;
		STB = 1;
		INTE_B = 1;
		ACK = 1;
		RST = 0;
		IOR = 1;
		IOW = 1;
		AEN = 0;
		GND = 0;

		// Wait 100 ns for global reset to finish
		#10;
		forever 
			begin
				#2
				clk = ~clk; 
				count = count+1;
				if (count==2)
					RST=1;
				if (count==3)
					RST=0;
				if (count==6)
					SA = 10'b1010110011;//choose state
				if (count==8)
					SA = 10'b1010110000;// choose PA
				if(count==12)
					STB =0;
				if(count==15)
					STB =1;
				if(count==18)
					IOR =0;
				if(count==21)
					IOR =1;
				if (count==24)
					SA = 10'b1010110010;///choose PB
				if (count==25)
					data2 = data1;
				if(count==29)
					IOW =0;
				if(count==33)
					IOW =1;
				if(count==37)
					ACK =0;
				if(count==41)
					ACK =1;
			end  
        
		// Add stimulus here

	end
      
endmodule

