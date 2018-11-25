# MIPS Processor
This is a Hardware Description of a non-pipelined MIPS processor with instructions to perform a 2x2 Matrix Multiplication

##Layout
Please refer to the picture [here](https://github.com/Ram-is-me/MIPSProcessor/blob/master/ProcessorLayout.jpeg) to understand the general layout of the MIPS processor.

##Supported Instructions
1. load word (lw)
2. store word (sw)
3. add 
4. sub
5. mult
6. and
7. or
8. halt
9. branch
10. jump

The format and opcode are exactly as present in a MIPS processor.

The register file contains 16 registers, $s0-s7 and $t0-t7.

The file 'instr.txt' contains binar representation of the assembly code to multiply a 2x2 matrix where the data values are stored in the data address location 0-7.

The file 'data.txt' contains the 32 bit data values which represent the matrix.

Team Members:
Ram S - IMT2017521 
Rathin Bhargava - IMT2017522 
Kaushal Mittal - IMT2017024
