module DataMem(alu_res, write_data, mem_write, mem_read, mem_to_reg, out_data);  //Module for Data Memory 

  input [31:0] alu_res,write_data;  
  input mem_read,mem_to_reg,mem_write;

  reg [31:0] data [1023:0];  // The array which contains data memory
  reg [31:0] temp_data;      // Data which is loaded from the memory and sent to the mux which decides writeback
  reg [9:0] alu_temp;        // The truncated address because of shortage of memory 
  integer read = 0;          //  To read from data.txt initially

  output reg [31:0]out_data;

  always@(alu_res,mem_read,mem_to_reg,mem_write)
  begin
    if(read==0)
    begin
      $readmemb("data.txt",data);  // File read 
      read = 1;                    // Don't read it again
    end

    alu_temp = alu_res[9:0];       

    case(mem_write)
      1: data[alu_temp] = write_data;
    endcase

    case(mem_read)
      1: temp_data = data[alu_temp];
    endcase

    // The mux outside the data memory 
    case(mem_to_reg)
      0: out_data = alu_res;
      1: out_data = temp_data;
    endcase
  end

endmodule