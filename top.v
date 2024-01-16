module top(instruction,clk,rst,top_out);
input [31:0]instruction;
input clk,rst;
output [31:0]top_out;

wire addi_en_w,ori_en_w,xori_en_w,andi_en_w,slti_en_w,sltiu_en_w,slli_en_w,srli_en_w,srai_en_w;
wire rd_en_w,wr_en_w; 
wire [31:0] rd_data_w;
wire [4:0]rs1_w,rd_w;
wire [31:0] alu_out_w;
wire [11:0] imm_w;

decoder u1(.instruction(instruction),.reset(rst),.clk(clk),.addi_en(addi_en_w),.ori_en(ori_en_w),.xori_en(xori_en_w),.andi_en(andi_en_w),
.slli_en(slli_en_w),.srli_en(srli_en_w),.srai_en(srai_en_w),.rs1(rs1_w),.rd(rd_w)
,.rd_en(rd_en_w),.wr_en(wr_en_w),.imm(imm_w));

memory u2(.clk(clk),.rst(rst),.rd_en(rd_en_w),.wr_en(wr_en_w),.rd_addr(rs1_w),.wr_addr(rd_w),
.wr_data(alu_out_w),.rd_data(rd_data_w));

alu u3(.addi_en(addi_en_w),.ori_en(ori_en_w),.xori_en(xori_en_w),.andi_en(andi_en_w),
.slli_en(slli_en_w),.srli_en(srli_en_w),.srai_en(srai_en_w),.rd_data(rd_data_w),.alu_out(alu_out_w),.imm(imm_w));

endmodule

