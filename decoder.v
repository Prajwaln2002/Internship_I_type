module decoder(
  input [31:0]instruction,
  input clk,
  input reset,

  output reg addi_en   ,
  output reg slli_en   ,
  output reg xori_en   ,
  output reg srli_en   ,
  output reg srai_en   ,
  output reg ori_en    ,
  output reg andi_en   ,

  output reg [4:0]rs1  , 
  output reg [4:0]rd   ,

  output reg rd_en     ,
  output reg wr_en     ,
  output reg [11:0] imm
);


	wire [6:0]opcode ;                        
	wire [2:0]func3  ;
	//wire [11:0]imm;

assign opcode = instruction[6:0]  ;
//assign imm = instruction [31:20];
assign func3 = instruction [14:12];

always@(*)
begin
case(opcode)
7'b0010011:
	if( func3==3'b000)
		begin
				addi_en  = 1'b1;
   				slli_en  = 1'b0;

   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];

				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end

	 else if(func3==3'b001)
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b1;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];

				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end
   
      else if(func3==3'b100)
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b1;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];

				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end
   else if(imm==7'b0000000 && func3==3'b101)
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b1;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];

				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end
    else if(imm==7'b0100000 && func3==3'b101)
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b1;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];
				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end
    else if(func3==3'b110)
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b1;
   				andi_en  = 1'b0;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];

				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end
     else if(func3==3'b111)
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b1;

				rs1 = instruction[19:15];
				imm = instruction [31:20];
				rd = instruction[11:7];

				rd_en  = 1'b1; 
				wr_en  = 1'b1;

		end
	
        else 
		begin
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rd_en  = 1'b0; 
				wr_en  = 1'b0;
         end

			default:
				begin
				
		
				addi_en  = 1'b0;
   				
   				slli_en  = 1'b0;
   				
   				xori_en  = 1'b0;
   				srli_en  = 1'b0;
   				srai_en  = 1'b0;
   				ori_en   = 1'b0;
   				andi_en  = 1'b0;

				rd_en  = 1'b0; 
				wr_en  = 1'b0;
				end
			endcase
		end
endmodule
