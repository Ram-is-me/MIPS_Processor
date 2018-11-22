module jump_pc(in_pc,jumper,pc_jump,out_pc);

  input [31:0]in_pc;
  input [25:0]jumper;
  output reg [31:0]pc_jump,out_pc;

endmodule