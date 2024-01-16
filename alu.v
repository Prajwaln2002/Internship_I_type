module alu(addi_en,ori_en,xori_en,andi_en,slli_en,srli_en,srai_en,rd_data,imm,alu_out);

input wire addi_en,ori_en,xori_en,andi_en,slli_en,srli_en,srai_en;
input wire [31:0] rd_data;
input wire [11:0] imm;
output reg [31:0] alu_out;

wire [31:0] adddata_out,ordata_out,xordata_out,anddata_out,slldata_out,srldata_out,sradata_out;

alu_add  u1(.rd_data(rd_data),.imm(imm),.adddata_out(adddata_out),.addi_en(addi_en));
alu_or   u2(.rd_data(rd_data),.imm(imm),.ordata_out(ordata_out),.ori_en(ori_en));
alu_xor  u3(.rd_data(rd_data),.imm(imm),.xordata_out(xordata_out),.xori_en(xori_en));
alu_and  u4(.rd_data(rd_data),.imm(imm),.anddata_out(anddata_out),.andi_en(andi_en));
alu_sll  u5(.rd_data(rd_data),.imm(imm),.slldata_out(slldata_out),.slli_en(slli_en));
alu_srl  u6(.rd_data(rd_data),.imm(imm),.srldata_out(srldata_out),.srli_en(srli_en));
alu_sra  u7(.rd_data(rd_data),.imm(imm),.sradata_out(sradata_out),.srai_en(srai_en));

always@(*)
begin
case({addi_en,ori_en,xori_en,andi_en,slli_en,srli_en,srai_en})

7'b1000000 : alu_out<=adddata_out;
7'b0100000 : alu_out<=ordata_out;
7'b0010000 : alu_out<=xordata_out;
7'b0001000 : alu_out<=anddata_out;
7'b0000100 : alu_out<=slldata_out;
7'b0000010 : alu_out<=srldata_out;
7'b0000001 : alu_out<=sradata_out;


default : alu_out<=0;
endcase
end
endmodule

//add
module alu_add(
input [31:0]rd_data,
input [11:0] imm,
output [31:0] adddata_out,
input addi_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign adddata_out= addi_en?(rd_data + imm_data):0;
endmodule

//or
module alu_or(
input [31:0]rd_data,
input [11:0] imm,
output [31:0] ordata_out,

input ori_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign ordata_out = ori_en?(rd_data | imm_data):0;
endmodule

//xor
module alu_xor(
input [31:0]rd_data,
input [11:0] imm,
output [31:0] xordata_out,

input xori_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign xordata_out = xori_en?(rd_data^imm_data):0;
endmodule

//and
module alu_and(
input [31:0]rd_data,
input [11:0] imm,
output[31:0] anddata_out,

input andi_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign anddata_out=andi_en?(rd_data & imm_data):0;
endmodule


//sll.........................................
module alu_sll(
input [31:0]rd_data,
input [11:0] imm,
output [31:0] slldata_out,

input slli_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign slldata_out=slli_en?(rd_data << imm_data):0;
endmodule

//sra.......................................................
module alu_sra(
input [31:0]rd_data,
input [11:0] imm,
output [31:0] sradata_out,

input srai_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign sradata_out=srai_en?(rd_data >>> imm_data):0;
endmodule

//srl......................................................
module alu_srl(
input [31:0]rd_data,
input [11:0] imm,
output [31:0] srldata_out,

input srli_en
);

wire [31:0] imm_data;
assign imm_data = {20'b0,imm};
assign srldata_out=srli_en?(rd_data >> imm_data):0;
endmodule


