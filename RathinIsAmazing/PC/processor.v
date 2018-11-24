module processor();

  wire [31:0] new_pc,temp_pc,inst,jump_pc,branch_pc,pc;
  reg [25:0] jumper;
  reg [15:0] imm;
  reg jump,branch;
  

  pc PC(
    .in_pc(new_pc),
    .out_pc(pc)
  );

  jump_pc Jump_pc(
    .in_pc(pc),
    .jumper(jumper),
    .jump_pc(jump_pc),
    .out_pc(temp_pc)
  );

  branch_pc Branch_pc(
    .in_pc(temp_pc),
    .imm(imm),
    .branch_pc(branch_pc) 
  );

  new_pc New_pc(
    .in_pc(temp_pc),
    .jump_pc(jump_pc),
    .branch_pc(branch_pc),
    .jump(jump), // I'm giving
    .branch(branch),
    .new_pc(new_pc)
  );

  initial begin
    $dumpfile("processor.vcd");
    $dumpvars(0,processor);
    $display("new pc: %b\n",new_pc);

    jump = 0; jumper = 0;
    branch = 0; imm = 0;
    #50;
    jump = 1;
    branch = 0;
    jumper = 10;

    #10;
    jump = 0;
    branch = 0;

    #10;
    branch = 1;
    imm = 12;

    #10;
    branch = 0;
    #10;
    $finish;
  end

endmodule