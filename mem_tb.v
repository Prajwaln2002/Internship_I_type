module memory_tb;
reg clk;
reg rst;
reg wr_en;
reg [4:0]wr_addr;
reg [31:0]wr_data;

reg rd_en;
reg [4:0] rd_addr;
wire [31:0]rd_data;

memory uut1(.clk(clk),.rst(rst),
.wr_en(wr_en),.wr_addr(wr_addr),.wr_data(wr_data),
.rd_en(rd_en),.rd_addr(rd_addr),.rd_data(rd_data));

initial 
begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end


initial
begin 
clk=0;
rst =1;
#10 rst=0;
end

initial
begin 
forever #5 clk=~clk;
end

initial begin

wr_en=0;
#10

wr_en=1;
rd_en=0;
wr_addr=8;
wr_data=6;
#10

wr_en=1;
rd_en=0;
wr_addr=11;
wr_data=9;
#10

wr_en=1;
rd_en=0;
wr_addr=15;
wr_data=13;
#10

wr_en=0;
rd_en=1;
rd_addr=8;
#10

wr_en=0;
rd_en=1;
rd_addr=10;
#10

wr_en=0;
rd_en=1;
rd_addr=15;
#10

wr_en=0;
rd_en=1;
rd_addr=12;

#40 $finish;
end
endmodule
