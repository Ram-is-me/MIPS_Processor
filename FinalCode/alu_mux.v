module ALU_mux(alu_src, data2, imm, operand2);

input alu_src;
input [31:0]data2;
input [15:0]imm;
output reg [31:0]operand2;

always@(*)
begin 

case (alu_src)

  0: operand2 = data2;
  1: operand2 = imm;

endcase
end
endmodule // alu_mux