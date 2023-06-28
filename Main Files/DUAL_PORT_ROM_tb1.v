module ROM_tb;
reg clk;
reg en_a;
reg en_b;
reg [3:0]add_a;
reg [3:0]add_b;
wire [7:0]d_ra;
wire [7:0]d_rb;

ROM mp(clk,en_a,en_b,add_a,add_b,d_ra,d_rb);

initial begin
  
$dumpfile("dump.vcd");
$dumpvars(1,ROM_tb); 
clk<=1'b0;
forever #10 clk<=~clk;
end

initial begin
en_a<=1'b0;
en_b<=1'b0;
add_a<=4'd0;
add_b<=4'd0;

#5;
en_a<=1'b1;
en_b<=1'b0;
add_a<=4'd0;
add_b<=4'd2;
  
#20;
en_b<=1'b1;
add_a<=4'd1;
add_b<=4'd3;  
  
#20;
add_a<=4'd5;
add_b<=4'd1;
  
#20;
add_a<=4'd4;
add_b<=4'd6; 
  
#20;
add_a<=4'd10;
add_b<=4'd12;

#300;
$finish;
end
  
initial begin
$monitor($stime,,,"en_a=%b en_b=%b add_a=%d  add_b=%d d_ra=%d d_rb=%d",en_a,en_b,add_a,add_b,d_ra,d_rb);
end
  
endmodule