module pc(in_pc, out_pc);

  input [31:0]in_pc;
  reg [31:0]pc = 0;
  reg clk = 0;
  output [31:0]out_pc;

  always
  begin
    #10;
    clk=~clk;
  end

  always@(in_pc)
  begin
    pc = in_pc;
  end

  always@(posedge clk)
  begin
    out_pc = pc;
  end

endmodule