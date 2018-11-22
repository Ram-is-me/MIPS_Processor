module alu(operand1, operand2, alu_ctrl, res, flag_zero);

    input [31:0]operand1;
    input [31:0]operand2;
    input [3:0]alu_ctrl;

    output reg [31:0]res;
    output reg flag_zero =0;

always @(operand1, operand2, alu_ctrl) begin

    case (alu_ctrl)
      4'b0000:  assign res= operand1 & operand2;
      4'b0001:  assign res= operand1 | operand2;
      4'b0010:  assign res= operand1 + operand2;
      4'b0011:  assign res= operand1 - operand2;
      4'b0100:  assign res= operand1 * operand2;
    endcase

    assign flag_zero = (res == 0)? 1 : 0;

end
endmodule // alu