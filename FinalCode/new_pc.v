module new_pc(in_pc,jump_pc,branch_pc,jump,branch,new_pc);

  input [31:0]in_pc,jump_pc,branch_pc;
  input jump,branch;

  reg [31:0]temp_pc;

  output reg[31:0] new_pc;

  always@(*)
  begin
    case(branch)
      0: temp_pc = in_pc;
      1: temp_pc = branch_pc;
    endcase

    case(jump)
      0: new_pc = jump_pc;
      1: new_pc = temp_pc;
    endcase
  end

endmodule