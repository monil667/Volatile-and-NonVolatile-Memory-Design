module memory_tb;
reg clk;
reg cs;
reg w_en;
reg r_en;
reg [7:0]d_in;
reg [17:0]addr;
wire [7:0]d_out;

memory mp(clk,cs,addr,d_in,w_en,r_en,d_out);

initial begin 
  $dumpfile("dump.vcd");
  $dumpvars(1,memory_tb);
  
clk<=1'b0;
forever #10 clk<=~clk;
end

initial begin
 
cs=1'b0;
w_en=1'b0;
r_en=1'b0;
addr=18'd0;
d_in=8'd0;
  
#20;
cs=1'b1;
w_en=1'b1;
addr=18'd0;
d_in=8'd7; 

#20;
addr=18'd1;
d_in=8'd10;

#20;
addr=18'd2;
d_in=8'd2;

#20;
addr=18'd3;
d_in=8'd5;

#40;
addr=18'd4;
d_in=8'd12;

#20;
w_en=1'b0;
r_en=1'b1;
addr=18'd0;

#20;
addr=18'd1;

#20;
addr=18'd2;
 
#20;
addr=18'd3;

#20;
addr=18'd4;

#20;
cs=1'b0;

end
  
initial begin
  
  $monitor($stime,,,"cs=%b w_en=%b r_en=%b addr=%d d_in=%d d_out=%d",cs,w_en,r_en,addr,d_in,d_out);
  
end
initial begin
#300 $stop;
end 
endmodule