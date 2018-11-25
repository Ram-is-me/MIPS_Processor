module instr_mem(pc, inst);

    input [31:0]pc;
    reg [15:0] temp_pc;
    output reg [31:0]inst;

    reg [7:0]inst_mem_reg[115:0];

    reg [31:0]inst_read;
    integer file_inputs;
    integer temp;
    integer opener = 0;

    // initial
    // begin
    //     $readmemb("instr.txt", inst_mem_reg);
    // end

    always@(pc)
    begin

        if(opener==0)
        begin
            $readmemb("instr.txt", inst_mem_reg);
            opener = 1;
        end

        temp_pc = pc[15:0];
        inst = {inst_mem_reg[temp_pc],inst_mem_reg[temp_pc+1],inst_mem_reg[temp_pc+2],inst_mem_reg[temp_pc+3]};
    end

    
endmodule // instr_mem