module alu_mux(alu_src, data2, imm, operand2);

input data2;
input imm;
input alu_src
output reg operand2;

always@(*)
begin 

case (alu_src)

  0: assign operand2 = data2;
  1: assign operand2 = imm;

endcase

endmodule // alu_mux