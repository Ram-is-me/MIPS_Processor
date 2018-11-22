module alu_mux(alu_src, data2, imm, operand2);

input alu_src;
input data2;
input imm;
output reg operand2;

always@(alu_src, data2, imm)
begin 

case (alu_src)

  0: assign operand2 = data2;
  1: assign operand2 = imm;

endcase
end
endmodule // alu_mux