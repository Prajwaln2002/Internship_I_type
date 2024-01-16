module memory(
input clk,
input rst,
input wr_en,
input [4:0]wr_addr,
input [31:0]wr_data,

input rd_en, 
input [4:0]rd_addr,
output reg [31:0]rd_data
);

reg [31:0]mem[0:31];

initial
begin
$readmemh("mem.hex",mem);
end

initial
begin
if(rst)
rd_data<=0;
end

always@(posedge clk or negedge clk)
begin
	
  		if(wr_en)

     		mem[wr_addr]<=wr_data;
     
  		//else
    		//mem[wr_addr]<=0;
  		
end

always@(posedge clk)
begin
  	
      		if (rd_en)
      
        	rd_data<=mem[rd_addr];
      
      		//else
        
        	//rd_data<=8'bzzzzzzzz;
        
       	
end
endmodule

