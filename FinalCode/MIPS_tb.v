module processor();

    wire [31:0] pc; //Address of the instruction location from PC to INSTRUCTION MEMORY
    wire [31:0] instruction; //Instruction wire (contains instruction)
    wire [5:0] opcode;
    wire [5:0] func;
    wire [4:0] rs, rt, rd;
    wire [15:0] immediate;
    wire [25:0] jumper;
    wire [31:0] write_data, read_data1, read_data2;
    wire [31:0] new_pc,temp_pc,inst,jump_pc,branch_pc,pc;
    wire [1:0] alu_op;
    wire [3:0] alu_control;
    wire alu_src;
    wire regDest;
    wire jump;
    wire branch;
    wire memRead;
    wire memtoReg;
    wire memWrite;
    wire regWrite;

    //Instruction Memory Module
    instr_mem instruction_memory(
      .pc(pc),
      .inst(instruction)
    );

    breakdown brkdown(
      .inst(instruction),
      .op(opcode),
      .func(func),
      .rs(rs),
      .rt(rt),
      .rd(rd),
      .imm(immediate),
      .jumper(jumper)
    );

    control_unit cntrl_unit(
      .opcode(opcode),
      .alu_op(alu_op),
      .alu_src(alu_src),
      .regDest(regDest),
      .jump(jump),

    );

    RegisterFile registerfile(
      .reg1(rs),
      .reg2(rt),
      .reg3(rd),
      .wdat(write_data),
      .rdat1(read_data1),
      .rdat2(read_data2),
      .reg_dest(reg_dest),
      .reg_write(reg_write)
    );

    ALU_mux alu_mux(
      .alu_src(alu_src),
      .data2(read_data2),
      .imm(se_imm),  //wire from sign extender to alu_mux
      .operand2(alu_operand2)  //wire from alu_mux to alu
    );

    ALU alu(
      .operand1(read_data1),
      .operand2(alu_operand2),
      .alu_ctrl(alu_control),
      .res(alu_output)  //wire from alu to data memory
      .flag_zero(flag_zero) //wire from alu to and gate (for BRANCH instruction)
    );

    ALU_control alu_ctrl(
      .func(func),
      .alu_op(alu_op),
      .alu_ctrl(alu_control)
    );

    DataMem datamemory(
      .alu_res(alu_output),
      .write_data(read_data2), //wire from register file to data memory
      .mem_write(memWrite),
      .mem_read(memRead),
      .mem_to_reg(memtoReg),
      .out_data(write_data) //wire from data memory back to registerfile as write_data
    );

    pc pc(
      .in_pc(new_pc),
      .out_pc(pc)
    );

  jump_pc jump_pc(
      .in_pc(pc),
      .jumper(jumper),
      .jump_pc(jump_pc),
      .out_pc(temp_pc)
    );

  branch_pc branch_pc(
    .in_pc(temp_pc),
    .imm(immediate),
    .branch_pc(branch_pc)
  );

  new_pc new_pc(
    .in_pc(temp_pc),
    .jump_pc(jump_pc),
    .branch_pc(branch_pc),
    .jump(jump),
    .branch(branch),
    .new_pc(new_pc)
  );

endmodule
