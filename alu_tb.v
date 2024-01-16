module top_tb;
reg [31:0] rd_data;
reg [11:0] imm;
reg addi_en,ori_en,xori_en,andi_en,slli_en,srli_en,srai_en;
wire [31:0] alu_out;


alu uut(addi_en,ori_en,xori_en,andi_en,slli_en,srli_en,srai_en,rd_data,imm,alu_out);
initial 
begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end

initial
begin
addi_en=0;
ori_en=0;xori_en=0;andi_en=0;slli_en=0;srli_en=0;srai_en=0;
rd_data=10;
imm=2;
end

initial
begin 
#10
addi_en=1;
ori_en=0;xori_en=0;andi_en=0;slli_en=0;srli_en=0;srai_en=0;

#10
addi_en=0;
ori_en=1;xori_en=0;andi_en=0;slli_en=0;srli_en=0;srai_en=0;

#10
addi_en=0;
ori_en=0;xori_en=1;andi_en=0;slli_en=0;srli_en=0;srai_en=0;

#10
addi_en=0;
ori_en=0;xori_en=0;andi_en=1;slli_en=0;srli_en=0;srai_en=0;

#10
addi_en=0;
ori_en=0;xori_en=0;andi_en=0;slli_en=1;srli_en=0;srai_en=0;

#10
addi_en=0;
ori_en=0;xori_en=0;andi_en=0;slli_en=0;srli_en=1;srai_en=0;

#10
addi_en=0;
ori_en=0;xori_en=0;andi_en=0;slli_en=0;srli_en=0;srai_en=1;

#20 $finish;
end
endmodule
