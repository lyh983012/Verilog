module my74ls165(in,clk,clk_inh,SER,shld,QH,QH_inv);
input[7:0] in;
input clk;
input clk_int;
input SER;
input shld;
output QH;
output QH_inv;


reg[7:0] regs;
reg[3:0] count;

if(~shld)  
begin
	regs=in; //Dtrigger,work without clk
	assign QH<=regs[0]; 
	assign QH_inv= ~regs[0];
end

always@(posedge clk)
begin
	assign QH<=regs[0]; 
	assign QH_inv= ~regs[0];
	if(shld && (~clk_inh))  //inh, prepare the data
	begin
		regs>>1;
		regs[7]=SER; //serial 
	end else 
end

end module