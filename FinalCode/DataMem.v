module DataMem(alu_res, write_data, mem_write, mem_read, mem_to_reg, out_data);

  input [31:0] alu_res,write_data;
  input mem_read,mem_to_reg,mem_write;

  reg [31:0] data [1023:0];
  reg [31:0] temp_data;
  reg [9:0] alu_temp; 

  output reg [31:0]out_data;

  always@(alu_res,write_data,mem_read,mem_to_reg,mem_write)
  begin
    alu_temp = alu_res[9:0];
    case(mem_write)
      1: data[alu_temp] = write_data;
    endcase

    case(mem_read)
      1: temp_data = data[alu_temp];
    endcase

    case(mem_to_reg)
      0: out_data = alu_res;
      1: out_data = temp_data;
    endcase
  end

endmodule