module instr_mem(pc, instr);

input [31:0]pc;
output reg [31:0]instr;

reg [7:0]instr_mem_reg[65535:0];

always@(*)
begin
    instr_mem_reg[1]=0;

end
endmodule // instr_mem