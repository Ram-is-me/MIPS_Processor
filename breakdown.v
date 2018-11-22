module breakdown(inst,op,func,rs,rt,rd,imm,jumper);

  input [31:0] inst;
  output reg [5:0]op, func;
  output reg [4:0] rs,rt,rd;
  output reg [15:0] imm;
  output reg [25:0] jumper;

  always@(inst)
    begin
      op = inst[31:26];
      rs = inst[25:21];
      rt = inst[20:16];
      rd = inst[15:11];
      func = inst[5:0];
      imm = inst[15:0];
      jumper = inst[25:0];
    end
endmodule
