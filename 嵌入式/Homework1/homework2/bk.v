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
module bk(
    input [9:0] SA,
    input [7:0] SD,
    input IOR,
    input IOW,
    input AEN,
    input GND,
    output [7:0] PA
    );
	wire CS;
	wire andAS;
	wire a3,a2,a6,a8;
	
	assign a3 = ~SA[3];
	assign a2 = ~SA[2];
	assign a6 = ~SA[6]; 
	assign a8 = ~SA[8];
	assign AEN_inv = ~AEN;
	nand(CS,a3,a2,a6,a8,SA[4],SA[5],SA[7],SA[9],AEN_inv);
	if(~IOR && ~SA[0] && ~SA[1] && ~CS)
	begin
		assign PA =SD;
	end
endmodule
