module instr_mem(pc, inst);

    input [31:0]pc;
    reg [15:0] temp_pc;
    output reg [31:0]inst;

    reg [7:0]inst_mem_reg[65535:0];

    reg [31:0]inst_read;
    integer file_inputs;
    integer temp;

    always@(pc)
    begin

        file_inputs = $fopen("instr.txt", "r"); 
        temp_pc =0;
        while (! $feof(file_inputs)) begin
            temp = $fscanf(file_inputs, "%b\n", inst_read);
            inst_mem_reg[temp_pc+3] = inst_read[7:0];
            inst_mem_reg[temp_pc+2] = inst_read[15:8];
            inst_mem_reg[temp_pc+1] = inst_read[23:16];
            inst_mem_reg[temp_pc] = inst_read[31:24];

        inst = {inst_mem_reg[temp_pc],inst_mem_reg[temp_pc+1],inst_mem_reg[temp_pc+2],inst_mem_reg[temp_pc+3]};
        #1;
        $display("%b - location %d", inst, temp_pc);
        temp_pc = temp_pc + 4;
        end

        temp_pc = pc[15:0];
        inst = {inst_mem_reg[temp_pc],inst_mem_reg[temp_pc+1],inst_mem_reg[temp_pc+2],inst_mem_reg[temp_pc+3]};
    end
endmodule // instr_mem