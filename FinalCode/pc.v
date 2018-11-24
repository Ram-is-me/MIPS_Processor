module pc(in_pc, out_pc);

  input [31:0]in_pc;
  reg clk = 1;
  output reg [31:0]out_pc = 0;

  always
  begin
    #5;
    clk=~clk;
    // $display("%b\n",clk);
  end

  // always begin
  //   $display("time: %t out_pc: %d in_pc: %d",$time,out_pc,in_pc);
  //   #1;
  // end

  always@(posedge clk)
  begin
    // $display("%d\n",in_pc);
    out_pc = in_pc;
  end
endmodule
