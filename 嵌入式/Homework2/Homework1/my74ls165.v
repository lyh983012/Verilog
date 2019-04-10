module my74ls165(in,clk,clk_inh,SER,shld,QH,QH_inv);

input[7:0] in;
input clk;
input clk_inh;
input SER;
input shld;
output QH;
output QH_inv;

reg[7:0] regs;
reg[3:0] count;

assign QH = regs[7]; 
assign QH_inv = ~QH;

always@(posedge clk)
begin
	if(~shld)  
	begin
		regs <= in; //Dtrigger,work without clk
	end 
	else if(!clk_inh)  //inh, prepare the data
	begin
		regs <= (regs << 1);
		regs[0] <= SER; //serial 
	end 
end

endmodule