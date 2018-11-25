module jump_pc(in_pc,jumper,jump_pc,out_pc);

  // This module takes care of the jump statements
  
  input [31:0]in_pc;
  input [25:0]jumper;
  output reg [31:0]jump_pc=0,out_pc=0;

  always@(in_pc)
  begin
    out_pc = in_pc+4;
  end

  always@(out_pc,jumper)
  begin
    jump_pc = {out_pc[31:29],jumper<<2};
  end
endmodule