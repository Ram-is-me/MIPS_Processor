module jump_pc(in_pc,jumper,pc_jump,out_pc);

  input [31:0]in_pc;
  input [25:0]jumper;
  output reg [31:0]pc_jump,out_pc;

  always@(in_pc)
  begin
    out_pc = in_pc+4;
  end

  always@(out_pc,jumper)
  begin
    pc_jump = {out_pc[31:29],jumper<<2};
  end
endmodule