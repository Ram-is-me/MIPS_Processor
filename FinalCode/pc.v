module pc(in_pc, out_pc);

  // This is the initial pc register
  // in_pc is the changed/incremented pc
  // out_pc is the pc given to fetch the next instruction
  // This is also the only synchronous module in the entire processor

  input [31:0]in_pc;
  reg clk = 1;
  output reg [31:0]out_pc = 0;

  always
  begin
    #5;
    clk=~clk;
  end

  always@(posedge clk)
  begin
    out_pc = in_pc;
  end
endmodule
