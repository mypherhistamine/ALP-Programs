# ALP-Programs
These are all the ALP Programs that I have written for the 8086 Processor

> Note : I am assuming that you know very well about the 8086 architecture, or about all the registers that 8086 has


Basic Structure of an ALP Program 

```assembly
data segment    ;start of data segment
    
    
      ;declare variables , array , struct etc
      
      
ends            ;end of data segment

stack segment   ; start of stack segment
    
    
      ;stack part of alp code
      
      
ends            ;end of stack segment


main proc       ;start of main procedure/function   
    
      ;logic / instructions    
    
main endp       ;end of main procedure

end main        ;end of program 
```

## Intro 

1. [Rules for storing data](1)
2. Data types in 8086 assembly language 
3. Variable declaration and it's initialization

### 1) Rules for Storing data 

We can store data in : 
- [Decimal](####-decimal)
- Hexadecimal
- Binary 
- Character 
- String 


#### Decimal 
In assembly a decimal number will start from a digit or it ends on `d` or `D`.

Examples

| Number  | Valid/Invalid |
|---------|---------------|
| 245     | Valid         |
| 23458d  | Valid         |
| A12454  | Invalid       |
| 0012    | Valid         |


#### Hexadecimal Numbers
In assembly a hexadecimal number will start from a digit and it should end on `h` or `H`.

Examples 

| Number  | Valid/Invalid | Reason                             |
|---------|---------------|------------------------------------|
| 0ABCD   | Invalid       | The number doesn't end with `H` or `h` |
| 1EFCh   | Valid         | Number ends with `h` or `H`            |
| 2DDDH   | Valid         | Number ends with `h` or `H`            |


#### Binary Number 
In assembly a binary number will either start with 0 or 1 and it **should** end on `b` or `B`. 

Examples 


| Number  | Valid/Invalid | Reason                                           |
|---------|---------------|--------------------------------------------------|
| 000100b | Valid         | Number is binary and ends with `b` or `B`            |
| 10001   | Invalid       | Number is binary **but** doesn't end with `b` or `B` |
| 211001b | Invalid       | Not a valid binary number !!                     |


#### Characters 
In assembly a character will be enclosed in single `''` quotes or double `""` quotes

Examples

| Character | Valid/Invalid | Reason                                   |
|-----------|---------------|------------------------------------------|
| 'A'       | Valid         | starts and ends with single `''` quotes  |
| 'D'       | Valid         | starts and ends with single `''` quotes  |
| "U'       | Invalid       | Quotes are not matching !!               |
| "U"       | Invalid       | Doesn't start or end with `''` quotes    |


#### String

In assembly a character will be enclosed in single `''` quotes or double `""` quotes
A string will end on string terminator $.

Examples 

| String       | Valid/Invalid | Reason                    |
|--------------|---------------|---------------------------|
| "Rishabh $"  | Valid         | Valid String              |
| 'Assembly $' | Valid         | Valid String              |
| 'Assembly'   | Invalid       | Doesn't end with `$` sign |
|  Assembly    | Invalid       | Doesn't end with `$` sign |


### 2) Data types in 8086 Assembly Language 

| Data type / Pseudo operation | Meaning      | type      | Size    | range                                     |
|------------------------------|--------------|-----------|---------|-------------------------------------------|
| DB                           | Define byte  | signed    | 1 byte  | (-2^7 to +2^7 -1) or ( -128 to +127)      |
| DB                           | Define byte  | unsigned  | 1 byte  | (0 to 2^8 -1 ) or (0 to 255)              |
| DW                           | Define word  | signed    | 2 byte  | (-2^15 to 2^15 -1 ) to (-32768 to 32767)  |
| DW                           | Define word  | unsiged   | 2 byte  | (-2^15 to +2^16 - 1) or (0 to 65,535)     |
| DQ                           | Define quad  | signed    | 8 byte  | -2^63 to + 2^63 -1                        |
| DQ                           | Define quad  | unsigned  | 8 byte  | 0 to 2^64                                 |
| DT                           | Define tera  | signed    | 10 byte | -2^127 to +2 ^ 127  - 1                   |
| DT                           | Define tera  | unsiged   | 10 byte | 0 to 2^128 - 1                            |




### 3) Variable declaration and it's initialization 

Syntax: 
```assembly [variable_name] [data_type] [value]```

For example 

```assembly 
Age db 15
FirstNm db "Rishabh $"
Subject db 'Assembly $'
Section db 'V' 
```


### 4) Instruction Set
 
An instruction is a command given to the processor by the computer program. A group of instructions that a microprocessor supports is known as the **`Intsruction Set`**

The 8086 microprocessor supports 8 types of instructions: 

1. Data transfer instructions
2. Arithmetic instructions
3. Bit manipulation instructions 
4. String instructions
5. Program execution transfer instructions (branch and loop instructions )
6. Processor control instructions 
7. Iteration control instructions 
8. Interrupt instructions 

#### 1. Data Transfer Instructions 
- Operations used to transfer the data from the source operand to the destination operand.
- Following are the list of instructions under this group
    - **MOV** instruction
    - **XCHG** instruction
    - and many more
- Instructions to transfer the address for example: 
- load effective address etc(LEA) .

#### 2. Arithmetic Instructions
- Used to perform arithmetic operations like addition , multiplication , division etc
- Following are the list of few instructions under this group

1. Instructions to perform addition
    - `ADD` - used to add the provided byte/word to word.
    - `ADC` - (add with carry) - used to add with carry
    - `INC` - (increment) - increment the provided byte/word by 1
    - `AAA` - (ASCII Adjust After Addition) - used to adjust ASCII after addition 
    - and many more

2. Instructions to perform subtraction
    - `SUB` - (subtraction) subtract the byte from byte/word from word.
    - `SBB` - (subtract with borrow) - perform subtraction with borrow
    - `DEC` - (decrement) - used to decrement the provided byte/word by 1
    - `NEG` - (negate) - negate each bit of the provided byte/word and add 1 or 2's complement
    - `CMP` - (compare) - compare two provided byte/word
    - `AAS` - Adjust ASCII codes after subtraction 
    - and many more...

3. Instructions to perform multiplication
    - `MUL` - (multiplication) - multiply **unsigned** byte by byte/word by word.
    - `IMUL` - multipled **signed** byte by byte/word by word
    - `AAM` - ASCII adjust after multiplication. Used to adjust `ASCII` codes after multiplication
 
4. Instructions to perform division
    - `DIV` - (division) - divide **unsigned** word by byte or **unsigned** word by word
    - `IDIV` - (signed division) - divide **signed** word by byte or **signed** word by word
    - `AAD` - Adjust ASCII codes after division 
    - `CBW` - Convert byte to word , fills the upper byte word with the copies of sign bit of the lower byte
    - `CWD` - Convert word to double , fill the upper word of the double word with the sign bit of the lower word

#### 3. Bit Manipulation Instructions 

- Perform operations where data bits are involved. i.e , operations like logical shift etc.
Following are the list of few instructions under this group

1. Instructions to perform logical Operation
    - `NOT` - invert each bit of a byte/word. Inverts bits by taking 1's complement
    - `AND` - and each bit in a byte/word
    - `XOR` - perform exclusive-OR operation
    - `TEST` - update flags,without affecting operands.

2. Instructions to perform shift operations
    - `SHL` - Shift logical left. Shifts the **unsigned** bits towards left by multiplying with 2^n where n is the number of bits
    - `SAL` - Shift arithmetic left - shifts **signed** bits towards the left. by multiplying with 2^n. 

3. Instructions to perform rotate operations 
    - `SHL` - Shift logical left. Shifts the **unsigned** bits towards left by multiplying with 2^n where n is the number of bits
    - `SAL` - Shift arithmetic left - shifts **signed** bits towards the left. by multiplying with 2^n. 



