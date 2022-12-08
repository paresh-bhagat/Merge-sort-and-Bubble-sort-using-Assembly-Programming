
# Merge sort and Bubble sort using Assembly Programming

This project contains an implementation of Merge sort and Bubble sort in Assembly Programming using SimpleRISC.

## SimpleRISC

* The assembly language of Simple Risc has just 21 instructions, and captures most of the features of full-scale assembly languages.

* SimpleRisc has 16 registers numbered r0 . . . r15.The first 14 registers are general purpose registers, and can be used for any purpose within the program. Register r14 is known as the stack pointer. We shall also refer to it as sp.

* Each instruction is encoded into a 32-bit value, and it requires 4 bytes of storage in memory.

* Register r15 is known as the return address register, and it will also be referred as ra. Register called flags, which is not visible to the programmer. It contains two field flags E(equal) and flags.GT (greater than). E is set to 1 if the result of a comparison is equality, and GT is set to 1 if a comparison concludes that the first operand is greater than the second operand. The default values of both the fields are 0.

* The cmp instruction is a 2-address instruction that takes two source operands. The first source operand needs to be a register, and the second one can be an immediate or a register. It compares both the operands by subtracting the second from the first. If the operands are equal, or in other words, the result of the subtraction is zero then it sets flags.E to 1. Otherwise flags.E is set to 0. If the first operand is greater than the second operand, then the result of the subtraction will be positive. In this case, the cmp instruction sets flags.GT to 1, otherwise it sets it to 0.

## Instructions in SimpleRISC
```
mov reg, (reg/imm)
add reg, reg, (reg/imm)
sub reg, reg. (reg/imm)
mul reg, reg, (reg/imm) 
div reg. reg. (reg/imm)
mod reg, reg, (reg/imm)
cmp reg. (reg/imm)
and reg, reg, (reg/imm)
reg, reg. (reg/imm)
not reg. (reg/imm)
A bitwise AND, V bitwise OR, ~ logical complement
lsl reg, reg. (reg/imm)     (shift left logical)
lsr reg, reg, (reg/imm)     (shift right logical)
asr reg, reg, (reg/imm)     (arithmetic shift right)
asl reg, reg, (reg/imm)     (arithmetic shift left)
ld reg, imm[reg]            (load)
st reg, imm[reg]            (store)
b label b.foo branch to .foo
beq label (branch to label if flags.E=1)
bgt .foo branch to foo if flags.GT 1
```

