module pc(in_pc, out_pc);

  input [31:0]in_pc;
  reg [31:0]pc;
  reg clk;
  output reg [31:0]out_pc;

  always@(in_pc)
  begin
    pc = in_pc;
  end

  always@(posedge clk)
  begin
    out_pc = pc;
  end

endmodule