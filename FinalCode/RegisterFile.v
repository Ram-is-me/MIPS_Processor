module RegisterFile(reg1, reg2, reg3, wdat, rdat1, rdat2, reg_dest, reg_write);

//INPUT SIGNALS
input [4:0] reg1; //Read Register 1
input [4:0] reg2; //Read Register 2
input [4:0] reg3; //Read Register 3
input [31:0] wdat; //Write Data
input reg_dest; //Register Destination Signal
input reg_write; //Register Write Signal

//OUTPUT SIGNALS
output reg [31:0] rdat1 = 0; //Read Data 1
output reg [31:0] rdat2 = 0; //Read Data 2

//INTERNAL SIGNALS
reg [5:0] wreg; //Write Register

//REGISTERS DECLARATION
reg [31:0] rf [31:0]; //A set of 32 registers. As of now, $s0 - $s7 and $t0 - $t7 are supported, check note below for opcode table

integer init = 0;

always@(*)
begin
    if(init==0) begin
        rf[8] = 0;
        rf[9] = 0;
        rf[10] = 0;
        rf[11] = 0;
        rf[12] = 0;
        rf[13] = 0;
        rf[14] = 0;
        rf[15] = 0;
        rf[16] = 0;
        rf[17] = 0;
        rf[18] = 0;
        rf[19] = 0;
        rf[20] = 0;
        rf[21] = 0;
        rf[22] = 0;
        rf[23] = 0;
        init = 1;
    end
end
//REGISTER INITIALIZATION
// generate
// genvar i;
// for (i=8;i<=23;i=i+1)
//     begin
//         initial rf[i] <= 32'b00000000000000000000000000000000;
//     end
// endgenerate

//Extra Registers
// reg [31:0] data1 = 32'b00000000000000000000000000000000;
// reg [31:0] data2 = 32'b00000000000000000000000000000000;

//Implementation of a MUX for  wreg
always @(reg2,reg3,reg_dest)
    if(reg_dest == 0)
        wreg <= reg2;
    else
        wreg <= reg3;

always @(reg1, reg2, wreg)
begin
    rdat1 = rf[reg1];
    rdat2 = rf[reg2];
    if(reg_write==1)  //Writing to Registers
    begin
        //Delay to be introduced by control unit
        rf[wreg] = wdat;
    end
end

endmodule


//REGISTER CODE TABLE
// $s0 to $s7 map --> registers 16 to 23
// $t0 to $t7 map --> registers 8 to 15