`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:17:13 06/02/2014
// Design Name:   my8255A
// Module Name:   C:/Users/lyh/Desktop/Homework/homework3/tb.v
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

module tb;

	// Inputs
	reg [9:0] SA;
	reg RST;
	reg IOR;
	reg IOW;
	reg AEN;
	reg GND;
	reg [7:0] PA;
	reg INTE_A;
	reg INTE_B;
	reg STB;
	reg ACK;

	// Outputs
	wire [7:0] PB;
	wire INTR_A;
	wire INTR_B;
	wire IBF_A;
	wire OBF_B;

	// Bidirs
	wire [7:0] SD;

	// Instantiate the Unit Under Test (UUT)
	my8255A uut (
		.SA(SA), 
		.SD(SD), 
		.RST(RST), 
		.IOR(IOR), 
		.IOW(IOW), 
		.AEN(AEN), 
		.GND(GND), 
		.PA(PA), 
		.PB(PB), 
		.INTR_A(INTR_A), 
		.INTE_A(INTE_A), 
		.INTR_B(INTR_B), 
		.INTE_B(INTE_B), 
		.IBF_A(IBF_A), 
		.OBF_B(OBF_B), 
		.STB(STB), 
		.ACK(ACK)
	);

	initial begin
		// Initialize Inputs
		SA = 0;
		RST = 0;
		IOR = 0;
		IOW = 0;
		AEN = 0;
		GND = 0;
		PA = 0;
		INTE_A = 0;
		INTE_B = 0;
		STB = 0;
		ACK = 0;

		// Wait 100 ns for global reset to finish
		#100;
      forever 
		begin
		#5
		clk = !clk; 
		count<= count+1;
		if(count==2)
			shld=~shld;
		if(count==3)
			shld=~shld;
		if(count==5)
			clk_inh=0;
		end
		// Add stimulus here

	end
      
endmodule

