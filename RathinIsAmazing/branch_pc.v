module branch_pc(in_pc,imm,branch_pc);

  input [31:0]in_pc;
  input [15:0]imm;
  output reg [31:0] branch_pc;

  reg [31:0] temp_pc;

  always@(imm)
  begin
    temp_pc = imm;
    temp_pc = temp_pc<<2;
  end

  always@(in_pc,temp_pc)
  begin
    branch_pc = temp_pc + in_pc;
  end

endmodule