module sense_amp_tb;
reg a,b;
wire f1,f2,f3;
sense_amp s(a,b,f1,f2,f3);
initial begin
a=1'b0;
b=1'b0;
#10 a=1'b1;
#10 b=1'b0;
#30 a=1'b0;
#30 b=1'b1;
#50 $stop;
end
initial begin
$monitor($stime,,,"a=%b b=%b f1=%b f2=%b f3=%b",a,b,f1,f2,f3);
end
endmodule

