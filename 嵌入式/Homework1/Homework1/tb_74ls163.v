`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:05:13 06/01/2014
// Design Name:   my74ls165
// Module Name:   C:/Users/lyh/Desktop/Homework/Homework1/tb_74ls163.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: my74ls165
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_74ls163;

	// Inputs
	reg [7:0] in;
	reg clk;
	reg clk_inh;
	reg SER;
	reg shld;
	reg[10:0] count;

	// Outputs
	wire QH;
	wire QH_inv;

	// Instantiate the Unit Under Test (UUT)
	my74ls165 uut (
		.in(in), 
		.clk(clk), 
		.clk_inh(clk_inh), 
		.SER(SER), 
		.shld(shld), 
		.QH(QH), 
		.QH_inv(QH_inv)
	);

	initial begin
		// Initialize Inputs
		in=8'b11001101;
		clk = 0;
		clk_inh = 1;
		SER = 1;
		shld = 1;
		count=0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
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
	end
      
endmodule

