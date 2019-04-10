module c8255mode1(DATA, AB, RD_n, WR_n, PA, PB, STB_n_A, IBF_A,
INTR_A, INTE_A, OBF_n_B, ACK_n_B, INTR_B, INTE_B); 
input RD_n;
input WR_n;
input[9:0] AB;
input STB_n_A; output IBF_A; output INTR_A;
input INTE_A; output OBF_n_B; input ACK_n_B; output INTR_B; input INTE_B; inout[7:0] DATA; input[7:0] PA; output[7:0] PB;
reg[7:0] PA_reg;
reg[7:0] PB_reg; reg mode_reg; reg IBF_A;
reg INTR_A;
reg OBF_n_B;
 reg INTR_B;
//mode select (mode 1)
wire cs_mode;
wire cs_PB;
wire cs_PA;
assign cs_PA = ((AB[1] == 0)&&(AB[0] == 0)) ? 1:0; assign cs_PB = ((AB[1] == 0)&&(AB[0] == 1)) ? 1:0; assign cs_mode = ((AB[1] == 1)&&(AB[0] == 1)) ? 1:0;
initial begin INTR_A <= 0;
 INTR_B <= 1; OBF_n_B <= 1; IBF_A <= 0; mode_reg <= 0; end
always@(posedge WR_n) begin
if(cs_mode && AB[9:2] == 8'h88) mode_reg <= DATA[3];
end
//output from CPU to Peripherals via PB
always@(posedge WR_n) begin
if (cs_PB == 1 && AB[9:2] == 8'h88)
 begin
INTR_B <= 0;
PB_reg <= DATA;//CPU data--> PB_reg OBF_n_B <= 0;
end end
always@(negedge ACK_n_B) begin
OBF_n_B <= 1; end
 always@(ACK_n_B or OBF_n_B or INTE_B) begin
if (ACK_n_B && OBF_n_B && INTE_B) INTR_B <= 1;
end
bufif0(PB[0], PB_reg[0], mode_reg);//if mode_reg == 0 PB = PB_reg bufif0(PB[1], PB_reg[1], mode_reg);
bufif0(PB[2], PB_reg[2], mode_reg);
bufif0(PB[3], PB_reg[3], bufif0(PB[4], PB_reg[4], bufif0(PB[5], PB_reg[5], bufif0(PB[6], PB_reg[6], bufif0(PB[7], PB_reg[7],
//input from Peripherals
always@(negedge STB_n_A) begin
mode_reg); mode_reg); mode_reg); mode_reg); mode_reg);
to CPU via PA
PA_reg <= PA;//Peripherals data--> PA_reg
end always@(PA_reg) begin
IBF_A <= 1; end
always@(STB_n_A or IBF_A or INTE_A) begin
if (STB_n_A && IBF_A && INTE_A) INTR_A <= 1;
end
always@(negedge RD_n) begin
if (AB[9:2] == 8'h88) INTR_A <= 0;
end
always@(posedge RD_n)
begin
if (AB[9:2] == 8'h88)
IBF_A <=0; end
bufif1(DATA[0], PA_reg[0], mode_reg);//if mode_reg == 1 DATA = PA_reg bufif1(DATA[1], PA_reg[1], mode_reg);
bufif1(DATA[2], PA_reg[2], mode_reg);
bufif1(DATA[3], PA_reg[3], mode_reg);
bufif1(DATA[4], PA_reg[4], mode_reg); bufif1(DATA[5], PA_reg[5], mode_reg);
bufif1(DATA[6], PA_reg[6], mode_reg); bufif1(DATA[7], PA_reg[7], mode_reg); endmodule