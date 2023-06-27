/*************single bit comparator or Sense amplifier
Where A=Bit line 
	  B=~Bit line 
	  F1=A>B-->Read 1 operation
	  F2=A<B-->Read 0 operation
	  F3=A=B-->Both bit & ~bit line have same value which is invalid 
******************/
module sense_amp(A,B,F1,F2,F3);
input A,B;
output F1,F2,F3;
assign F1=A&~B; //read 1 operation
assign F2=~A&B; //read 0 operation
assign F3=A~^B;
endmodule 
