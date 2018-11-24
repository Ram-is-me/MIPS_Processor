module control_unit(opcode, alu_op, alu_src, regDest, jump, branch, memRead, memtoReg, memWrite, regWrite);

    input [5:0]opcode;

    output reg [1:0]alu_op;
    output reg alu_src;
    output reg regDest;
    output reg jump;
    output reg branch;
    output reg memRead;
    output reg memtoReg;
    output reg memWrite;
    output reg regWrite;


always @(opcode)
begin

    assign regDst = 0;
    assign jump = 0;
    assign branch = 0;
    assign memRead = 0;
    assign memtoReg = 0;
    assign alu_op = 2'b00;
    assign memWrite = 0;
    assign alu_src = 0;
    assign regWrite = 0;

    case(opcode)
    6'b000000: begin // R format instruction -- includes add,sub,mul,
        assign regDst = 1;
        assign alu_op = 2'b10;
        assign regWrite = 1;
    end

    6'b100011: begin // lw instruction
        assign memRead = 1;
        assign memtoReg = 1;
        assign alu_src = 1;
        assign regWrite = 1;
    end
    
    6'b101011: begin // sw instruction
        assign memWrite = 1;
        assign alu_src = 1;
    end

    6'b000100: begin // BEQ instruction
        assign branch = 1;
        assign alu_op = 2'b01;
    end

    6'b001000: begin // ADD immediate instruction
        // assign alu_op  = 2'b00; same as lw/sw/default
        assign alu_src = 1;
        assign regWrite = 1;
    end

    6'b000010: begin // JUMP instruction
        assign jump = 1;

    endcase()

end
endmodule // control_unit