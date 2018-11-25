module breakdown(inst,op,func,rs,rt,rd,imm,jumper);

  input [31:0] inst;
  output [5:0]op, func;
  output [4:0] rs,rt,rd;
  output [15:0] imm;
  output [25:0] jump
  
  assign op = inst[31:26];
  assign rs = inst[25:21];
  assign rt = inst[20:16];
  assign rd = inst[15:11];
  assign func = inst[5:0];
  assign imm = inst[15:0];
  assign jumper = inst[25:0];
endmodule
