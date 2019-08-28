# MIPS Processor
This is a Hardware Description of a non-pipelined MIPS processor with instructions to perform a 2x2 Matrix Multiplication

## Layout
Please refer to the picture [here](https://github.com/Ram-is-me/MIPSProcessor/blob/master/ProcessorLayout.jpeg) to understand the general layout of the MIPS processor.

## Supported Instructions
* load word (lw)
* store word (sw)
* add 
* sub
* mult
* and
* or
* halt
* branch
* jump

The format and opcode are exactly as present in a MIPS processor.

The register file contains 16 registers, $s0-s7 and $t0-t7.

The file 'instr.txt' contains binary representation of the assembly code to multiply a 2x2 matrix where the data values are stored in the data address location 0-7.

The file 'data.txt' contains the 32 bit data values which represent the matrix.

## Team Members:
* Ram S - IMT2017521 
* Rathin Bhargava - IMT2017522 
* Kaushal Mittal - IMT2017024
