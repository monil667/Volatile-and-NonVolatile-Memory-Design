module memory(clk,cs,addr,d_in,w_en,r_en,d_out);
  input clk;
  input cs;
  input [17:0] addr;
  input [7:0] d_in;
  input w_en;
  input r_en;
  output  reg [7:0] d_out ;

  reg [7:0] mem [0:262143];

  always @ (negedge clk)
    begin 
      if (w_en && cs)
        mem[addr] <= d_in;
      else if(r_en && cs)
        d_out <= mem[addr];
      else 
        d_out <= 8'dz;
    end
endmodule