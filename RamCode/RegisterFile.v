module RegisterFile(reg1, reg2, reg3, wdat, rdat1, rdat2, reg_dest, reg_write);

//INPUT SIGNALS
input [5:0] reg1; //Read Register 1
input [5:0] reg2; //Read Register 2
input [5:0] reg3; //Read Register 3
input [31:0] wdat; //Write Data
input reg_dest; //Register Destination Signal
input reg_write; //Register Write Signal

//OUTPUT SIGNALS
output [31:0] rdat1; //Read Data 1
output [31:0] rdat2; //Read Data 2

//INTERNAL SIGNALS
reg [5:0] wreg; //Write Register

//REGISTERS DECLARATION
reg [31:0] rf [31:0]; //A set of 32 registers. As of now, $s0 - $s7 and $t0 - $t7 are supported, check note below for opcode table

//REGISTER INITIALIZATION
generate
genvar i;
for (i=8;i<=23;i=i+1)
    begin
        initial rf[i] <= 32'b00000000000000000000000000000000;
    end
endgenerate

//Extra Registers
reg [31:0] data1 = 32'b00000000000000000000000000000000;
reg [31:0] data2 = 32'b00000000000000000000000000000000;

//Implementation of a MUX for  wreg
always @(*)
    if(reg_dest == 0)
        wreg <= reg2;
    else
        wreg <= reg3;

always @(*)
begin
    data1 = rf[reg1];
    data2 = rf[wreg];
    if(reg_write==1)  //Writing to Registers
    begin
        rf[wreg] = wdat;
    end
end

endmodule


//REGISTER CODE TABLE
// $s0 to $s7 map --> registers 16 to 23
// $t0 to $t7 map --> registers 8 to 15