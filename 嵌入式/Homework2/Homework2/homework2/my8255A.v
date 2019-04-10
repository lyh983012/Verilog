`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:02 06/01/2014 
// Design Name: 
// Module Name:    my8255A 
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
    input [7:0] D,
    input RD,
    input WR,
    input CS,
    input A1,
    input A0,
    input GND,
    output [7:0] PA
    );
	if(!WR && !A1 && !A2 && !CS)
		assign PA = D;
	
	
endmodule
