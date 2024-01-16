module decoder_tb;

  reg [31:0] instruction;
  reg clk; 
  reg reset;
  wire addi_en;
  wire andi_en,ori_en;
  wire slli_en,xori_en,srli_en,srai_en;
  wire [4:0] rs1,rd;
  wire rd_en, wr_en;
  wire [11:0]imm;
 

decoder dut(
    .instruction(instruction),
    .clk(clk),
    .reset(reset),
    .addi_en(addi_en),
    .andi_en(andi_en),
    .ori_en(ori_en),
    .slli_en(slli_en),
    .xori_en(xori_en),
    .srli_en(srli_en),
    .srai_en(srai_en),
    .rs1(rs1),
    .rd(rd),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .imm(imm)
  );


initial 
begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end

  
  initial begin
    forever #5 clk = ~clk;
  end

  initial begin
  clk = 0;
  reset = 1;
 
 
  instruction = 32'h0000_0000;
   
    #10 reset = 0;

    // addi_en;

    instruction = 32'b0011000_00100_00111_000_01001_0010011; 
    #10
    
    instruction = 32'b0100100_01010_00101_000_01101_0010011; 
    #10
    
    //slli_en;
    instruction = 32'b0100010_01101_00101_001_10011_0010011; 
    #10
    
    instruction = 32'b0100100_01000_00001_001_11011_0010011; 
    #10

    //xori_en;
    instruction = 32'b0000011_00100_00111_100_01001_0010011; 
    #10
	    
    instruction = 32'b0100100_01010_00101_100_01101_0010011; 
    #10

     //srli_en;
    instruction = 32'b0000000_00000_00111_101_01001_0010011; 
    #10
	    
    instruction = 32'b0000000_00000_00101_101_01101_0010011; 
    #10

    //srai_en;
    instruction = 32'b0000001_00000_00111_101_01001_0010011; 
    #10
	    
    instruction = 32'b0000001_00000_00101_101_01101_0010011; 
    #10

    // ori_en;
    instruction = 32'b0000100_00100_00111_110_01001_0010011; 
    #10
	    
    instruction = 32'b0100000_01010_00101_110_01101_0010011; 
    #10

    // andi_en;
    instruction = 32'b1001000_00100_00111_111_01001_0010011; 
    #10
    
    instruction = 32'b1000100_01010_00101_111_01101_0010011; 
    #10

    //Default case
    instruction = 32'h1234_5678; 

    #30 $finish;
  end
endmodule
