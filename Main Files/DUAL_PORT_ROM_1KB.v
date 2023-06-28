module ROM(clk,en_a,en_b,add_a,add_b,d_ra,d_rb);
input clk;
input en_a;
input en_b;
input [3:0] add_a,add_b;
output reg [7:0] d_ra,d_rb;

reg [7:0] mem [15:0] ;
  
always @ (add_a)
begin 
case (add_a)
  
         4'd0:
            mem[add_a]=8'd3;
            
         4'd1:
           mem[add_a]=8'd25;
            
         4'd2:
           mem[add_a]=8'd65;
            
         4'd3:
           mem[add_a]=8'd8;
            
         4'd4:
           mem[add_a]=8'd33;
            
         4'd5:
           mem[add_a]=8'd8;
            
         4'd6:
           mem[add_a]=8'd90;
            
         4'd7:
           mem[add_a]=8'd215;
            
         4'd8:
           mem[add_a]=8'd120;
            
         4'd9:
           mem[add_a]=8'd45;
            
         4'd10:
           mem[add_a]=8'd135;
            
         4'd11:
           mem[add_a]=8'd200;
            
         4'd12:
           mem[add_a]=8'd155;
            
         4'd13:
           mem[add_a]=8'd99;
            
         4'd14:
           mem[add_a]=8'd98;
            
         4'd15:
           mem[add_a]=8'd12;

        default:
          mem[add_a]=8'd0;
endcase 
end
      
always @ (add_b)   
begin 
case (add_b)
    
         4'd0:
            mem[add_b]=8'd47;
            
         4'd1:
           mem[add_b]=8'd2;
            
         4'd2:
           mem[add_b]=8'd50;
            
         4'd3:
           mem[add_b]=8'd80;
            
         4'd4:
           mem[add_b]=8'd37;
            
         4'd5:
           mem[add_b]=8'd88;
            
         4'd6:
           mem[add_b]=8'd91;
            
         4'd7:
           mem[add_b]=8'd199;
            
         4'd8:
           mem[add_b]=8'd1;
            
         4'd9:
           mem[add_b]=8'd5;
            
         4'd10:
           mem[add_b]=8'd100;
            
         4'd11:
           mem[add_b]=8'd21;
            
         4'd12:
           mem[add_b]=8'd4;
            
         4'd13:
           mem[add_b]=8'd19;
            
         4'd14:
           mem[add_b]=8'd68;
            
         4'd15:
           mem[add_b]=8'd52;
         
		default:
           mem[add_b]=8'd0;
endcase 
end 
  
always @ (posedge clk)
begin  
  if(en_a && en_b)
  begin
  d_ra=mem[add_a];
  d_rb=mem[add_b];
  end
  else if(en_a && ~en_b)
  begin
  d_ra=mem[add_a];
  d_rb=8'dz;
  end  
  else if(~en_a && en_b)
  begin
  d_ra=8'dz;
  d_rb=mem[add_b];
  end      
  else
  begin
  d_ra=8'dz;
  d_rb=8'dz;
  end  
end    
endmodule