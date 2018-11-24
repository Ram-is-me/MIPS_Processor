module processor();

  // reg [31:0]new_pc = 0;
  wire [31:0]new_pc,in_pc,out_pc,temp1_pc,inst,jumper_pc,temp2_pc;
  wire [25:0] jumper;
  

  pc pc(
    .in_pc(new_pc),
    .out_pc(pc)
  );

  jump_pc jump_pc(
    .in_pc(pc),
    .jumper(jumper),
    .jump_pc(jump_pc),
    .out_pc(temp1_pc)
  );

  branch_pc branch_pc(
    .in_pc(temp1_pc),
    .imm(imm),
    .branch_pc(branch_pc)
  );

  new_pc new_pc(
    .in_pc(temp1_pc),
    .jump_pc(jump_pc),
    .branch_pc(branch_pc),
    .jump(jump),
    .branch(branch),
    .new_pc(new_pc)
  );

endmodule