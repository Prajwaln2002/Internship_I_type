module top_tb;
reg [31:0]instruction;
reg clk,rst;
wire [31:0]top_out;

top u4(instruction,clk,rst,top_out);

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

initial
begin
 
    instruction = 32'h0000_0000;
    #10

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
    
    #10 $finish;
end
endmodule
