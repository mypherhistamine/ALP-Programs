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

## Table of Contents

1. [Rules for storing data](#1-rules-for-storing-data)
2. [Data types in 8086 assembly language](#2-data-types-in-8086-assembly-language)
3. [Variable declaration and it's initialization](#3-variable-declaration-and-its-initialization)
4. [Instruction Set of 8086](#4-instruction-set)
5. [Instruction template of 8086](#5-instruction-template-of-8086)
6. [Some important instructions](#6-some-important-instructions)
7. [Rules for data transfer instructions](#7-rules-for-data-transfer-instructions)
8. [Microprocessor Interrupts](#8-microprocessor-interrupts)
---
### 1) Rules for Storing data 

We can store data in : 
- [Decimal](#decimal)
- [Hexadecimal](#hexadecimal-numbers)
- [Binary](#binary-number)
- [Character](#characters) 
- [String](#string) 


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

1. [Data transfer instructions](#1-data-transfer-instructions)
2. [Arithmetic instructions](#2-arithmetic-instructions)
3. [Bit manipulation instructions](#3-bit-manipulation-instructions) 
4. [String instructions](#4-string-instructions)
5. [Program execution transfer instructions (branch and loop instructions )](#5-program-execution-transfer-instructions-branch-and-loop-instructions)
6. [Processor control instructions](#6-processor-control-instructions) 
7. [Iteration control instructions](#7-iteration-control-instructions) 
8. [Interrupt instructions](#8-interrupt-instructions) 

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
    - `SHR` - Shift Logical Right - shifts **unsigned** number bits towards right. Shifts by dividing with 2^n.
    - `SAR` - Shift Arithmetic Right - shifts **signed** number bits towards right by dividing with 2^n.

3. Instructions to perform rotate operations 
    - `ROL` - Rotate left - rotates bits of byte/word towards left i.e - MSB to LSB and to carry flag [CF]
    - `ROR` - Rotate right - rotate bits of byte/word towards right , LSB to MSB and to Carry Flag [CF].
    - `RCR` - Rotate right with carry - rotates bits of byte/word towards right , LSB to CF and CF to MSB
    - `RCL` - Rotate left with carry - rotates byte/word towards the left , MSB to CF and CF to LSB. 

#### 4. String Instructions 
`Strings` - A group of bytes/words and their memory is always allocated in a sequential order.

Following are the list of few instructions under this group

- `MOVS` / `MOVSB` / `MOVSW` - move byte/word from one string to another
- `COMS` / `COMPSB` / `COMPSW` - COMPARE TWO STRING BYTES/WORDS. 
- many more 


#### 5. Program execution Transfer Instructions (Branch and loop instructions)

- used to transfer/branch the instructions during an execution.
- Includes the following instructions 

1. Instructions to transfer the instruction during an execution without any condition
    - `CALL` - CALL A PROCEDURE AND SAVE THEIR RETURN ADDRESS TO THE STACK
    - `RET` - RETURN FROM THE PROCEDURE TO THE MAIN PROGRAM/PROCEDURE
    - `JMP` - JUMP TO THE PROVIDED ADDRESS TO PROCEED TO THE NEXT INSTRUCTION

2. Conditional Branch

Conditional Jumps for **signed** numbers 

| Instruction  | Jump Condition           | Test                       |
|--------------|--------------------------|----------------------------|
| JE           | JUMP IF EQUAL            | ZF = 1                     |
| JNE          | JUMP IF NOT EQUAL        | ZF = 0                     |
| JG           | JUMP IF GREATER          | ZF = 0 AND SF = OF         |
| JGE          | JUMP OF GREATER OR EQUAL | SF = OF                    |
| JL           | JUMP IF LESS             | SF NOT EQUAL TO OF         |
| JLE          | JUMP IF LESS OR EQUAL    | ZF = 1 OR SF NOT EQUAL OF  |

Conditional Jumps for **unsigned** numbers 

| Instruction  | Jump Condition         | Test              |
|--------------|------------------------|-------------------|
| JA           | JUMP IF ABOVE          | CF = 0 AND ZF = 0 |
| JAE          | JUMP IF ABOVE OR EQUAL | CF = 0            |
| JB           | JUMP IF BELOW          | CF = 1            |
| JBE          | JUMP IF BELOW OR EQUAL | CF =1 OR ZF = 1   |


Conditional Jumps for Overflow , Carry , Signed and Zero

| Instruction  | Jump Condition               | Test    |
|--------------|------------------------------|---------|
| JO           | JUMP ON OVERFLOW             | OF = 1  |
| JNO          | JUMP ON NO OVERFLOW          | OF = 0  |
| JC           | JUMP ON CARRY                | CF  = 1 |
| JNC          | JUMP ON NO CARRY             | CF = 0  |
| JS           | JUMP ON SIGN(NEGATIVE)       | SF = 1  |
| JNS          | JUMP ON NO SIGN ( POSITIVE)  | SF = 0  |
| JZ           | JUMP IF ZERO (SAME AS JE)    | ZF = 1  |
| JNZ          | JUMP IF NOT ZERO             | ZF = 0  |




#### 6. Processor Control instructions 
CONTROLS PROCESSOR ACTION BY SETTING/RESETTING THE FALG VALUES. 

Following are some instructions under this group: 

- `STC` - SET CARRY FLAG TO 1 (CF = 1) 
- `CLC` - CLEAR/RESET CARRY FLAG CF TO 0 (CF = 0)
- `STD` - SET DIRECTION FLAG TO 1 (DF = 1)
- `CLD` - CLEAR/RESET DIRECTION FLAG DF TO 0 ( DF = 0 )


#### 7. Iteration Control Instructions
EXECUTE GIVEN INSTRUCTIONS FOR **NUMBER OF TIMES** 

Following are some instructions under this group: 

- `LOOP` - LOOP A GROUP OF INSTRUCTIONS UNTIL CONDITION SATISFIES , i.e  CX  = 0


#### 8. Interrupt Instructions 
CALL THE INTERRUPT DURING PROGRAM EXECUTION

- `INT` - INTERRUPT THE PROGRAM DURING EXECUTION AND CALLING SERVICE SPECIFIED




### 5) Instruction Template of 8086

Templates of 8086 contains

- `Opcode` - operational code 
- `Operand` - on which we apply operation

There are 3 types of instructions templates supported by 8086 assembly language

- Zero operand instruction
- One operand instruction
- Two operand instruction


#### Zero operand instruction 

- ONLY CONTAINS OPCODE
Examples

    - AAA
    - RET
    - STC
    - STD 
    - etc

#### One operand instruction
- ONE OPERAND AND ONE OPCODE 

Examples

    - MUL register/Mem variable
    - INC register/Mem variable
    - DIV register/Mem variable
    - IDIV register/Mem variable

#### Two operand instruction
- ONE OPCODE AND TWO OPERANDS 

Examples
    - add destination, source 
    - sub destination, source 
    - mov destination, source 
    - cmp destination, source 


### 6) Some important instructions 

Some of the most used instructions of 8086 ALP
1. [MOV](#mov-instruction)
2. [XCHG](#xchg-intrustion)
3. [INC](#inc-instruction)
4. [DEC](#dec-instruction)
5. [NEG](#neg-instruction)
6. [ADD](#add-instruction)
7. [SUB](#sub-instruction)


#### `MOV` Instruction
- TRANSFER DATA BETWEEN REGISTERS ,  A REGISTER AND A MEMORY LOCATION 
- COPY A NUMBER DIRECTLY INTO A REGISTER OR A MEMORY LOCATION 

Syntax :
```asm 
mov destination , source 
```
destination ===> operand1
source  ====> operand2


#### `XCHG` Intrustion
EXCHANGE DATA BETWEEN TWO REGISTERS OR A REGISTER AND A MEMORY LOCATION

Syntax: 
```assembly
xchg destinaion , source
```

#### `INC` Instruction 
INCREMENT BYTE/WORD BY 1

Syntax: 

```assembly
INC register/variable
```

#### `DEC` Instruction
DECREMENT BYTE/WORD BY 1

Syntax: 

```assembly
DEC register/variable
```

#### `NEG` Instruction
Negate each bit of provided byte/word and then add 1 for 2's complement

Syntax: 

```assembly
NEG register/variable 
```
For example: 

if we have to find 2's complement of -235

Binary Value                   DEC       HEX 

1111 1111 0001 0101 ------>   -235      FF15

Applying 2's complement
0000 0000 1110 1011   ----->   235       00EB

#### `ADD` Instruction
ADD PROVIDED BYTE TO BYTE/WORD (Two operand based)


Syntax: 

```assembly
ADD destinaion , source
```


#### `SUB` Instruction
SUBTRACT PROVIDED BYTE TO BYTE/WORD (Two operand based)


Syntax: 

```assembly
SUB destinaion , source
```


### 7) Rules for data transfer instructions

#### For `Mov` Instruction

1) Register to Register


Register to register data movement of same size is allowed. 

For example
```asm
mov ax,bx
mov ch,dl

mov ch,dx ; not allowed as size of both the register is not same
```

2) Segment register to register


segment Register to register data movement of same size is allowed

For example
```asm
mov ax,cs ; cs - code segment
mov dx,es ; es - extra segment
mov bx , ds ; ds - data segment
mov al , es ; this is invalid as al - 8 bit and es - 16-bit
```

3) Variable to Register


**Variable is a memory location.**

Variable to register data transfer is allowed of same size

For example
```asm
mov al , age ;depends on age variable data type. Allowed if age is also 8 bit as al is a 8-bit register

mov bl , num1 ;allowed if num1 8-bit

mov ax , no ;allowed if no is 16-bit value 
```

4) Constant to register


Constant to register data transfer is allowed , if constant is in the given data range

For example: 
```asm
mov ax , 5
mov bh , 101
mov al , 55
```

5) Register to segment register


Allowed if same size

For example: 
```asm
    mov es , dx   ;valid
    mov ds , cx   ;valid
    mov 
```

6) Variable to Variable

Memory location to memory location data movement is not allowed in assembly

**We can not access two memory locations simultaneously in 8086 register**

Examples 

```asm
mov num1, num2  ;invalid as var to var data mov is happening
mov num1,ax     ;valid if num1 16-bit and ax is also 16-bit 
```

7) Register to constant \
Register to constant data movement is not allowed in assembly 

Example

```asm
mov 7 , ax ;invalid
```

8) Segment register to Segment register

Segment to segment data movement is **not allowed** in assembly 

Example 

```asm
mov es , ds ;invalid segment to segment data movement is not allowed
```

9) Constant to segment register 

Constant to segment data movement is not allowed 

```asm
mov es , 7 ;invalid as we can't move constant value to segment register
```

10) Segment register to constant 
Invalid 

```asm
mov 15 , es ;invalid destinaion can't be a constant
```


11) Can't access IP

- In program we can't access IP.
- We can't read/write from IP

```asm
mov IP , ax ;invalid 
mov bx , IP ; invalid 
````

12) Segment register to variable 
Allowed if same size

Example: 

```asm
mov num1 , es ;num1 must be 16 bit variable 
```


### 8) Microprocessor Interrupts


Two types of interrupts 

1. [Hardware Interrupts](#hardware-interrupts) 
    - Maskable and Non maskable interrupts 
2. [Software Interrupts](#software-interrupts)
    - 256 interrupts 

**Interrupt**
- Breaks the sequence of operation and control is trasferred 
- While the `µp` is executing a program , an *interrupt* breaks the normal sequence of execution to some other program called `Interrupt Service Routine`(ISR).
- After execution , control is returned back again to the main program
- The `µp` keeps on moving until interrupted by the processor


The processor can be interrupted in the following ways 

i) By an external signal generated by peripheral devices 
ii) BY an internal signal generated due to an exceptional condition which occurs while executing an instruction

#### Hardware Interrupts

- The interrupts initiated by external hardware by sending an appropriate signal to the interrupt pin of the processor is called a hardware interrupt
- The 8086 processor has two interrupt pins `INTR` and `NMI`. 
- The interrupts initiated by applying appropriate signal to these pins are called hardware interrupts of 8086. 

![pin diagram of 8086 ](https://i.pinimg.com/originals/2f/c1/b8/2fc1b88c97c3b8e20d4f4d59e652227e.png)

- For the maskable interrupt `INTR` pin is used as in the diagram that's pin number 18 
- For the non-maskable interrupt `NMI` pin is used as in the diagram that's pin number 17
- Hardware inputs - Used to handle external hardware peripherals , such as keyboards, mouse , hard disks , floppy dics , DVD drivers and printers 

More about Maskable and Non-maskable interrupts 

- The processor has the facility for accepting or rejecting hardware interrupts
- Programming the processor to reject an interrupt is referred to as masking.
- Programming the processor to accept an interrupt is unmasking or enabling. 
- The interrupts whose request can be either accepted or rejected by the procerros are called `maskable interrupts`.
- The interrupts whose request has to be **definitely**  accepted (or can't be rejected) by the processor are called `non-maskable interrupts`. 


#### Software interrupts

- The software interrupts are program instructios which we can control by making such programs
- While running a program , of software interrupt instruction is encountered then the processor initiates an interrupt for that it will refer the ISR (Interrupt Service Routine).

- 8086 has 256 types of software interrupts
- The software interrupt instruction is INT n , where n is the type number in the range 0 to 255.
- All software interrupts are `non-maskable`


Use case 

- If you want the user to type a string , or get some value from the user , then you will have to give an interrupt so that the processor will wait for the user to enter the value and will then proceed. 

##### DOS Interrupts (INT 21h)

- INT 21H , Function 09H - Display the string on the screen
- INT 21H , Function 01H - Get character input with Echo
- INT 21H , Function 08H - Get character input without echo
- INT 21H , Function 02H - Display a number or character on the screen
- INT 21H , Function 04CH - Terminate the code properly and return to the DOS Prompt

> Note for calling a sub-routine we will need that n value in the Ah register 

> To display some string the memory address of that string should be in the dl or dx register 

### 9) Offset and LEA Instruction 


Offset - an assembler directive which holds the beginning address of a variable 

Syntax 
```asm
mov register/variable , offset memory variable
```

LEA - Load Effective Address loads the specified register with the offset of a memory location.

```asm
LEA register , memory variable 
```

- They are used for string display 
- AH register is used for calling sub-routines

---

Difference of LEA and Offset Instruction 

| Offset              | LEA  |
|----------------|----------|
| Holds the beginning address of a variable                                                                                                                     | It's an indirect instruction in which register points to  a memory location and holds the address of that memory location |
| MOV instruction can't be indexed because OFFSET is an assembler directive , not an instruction (we can't simply go to some index of that string after that )  | LEA instruction can be indexed we can access the part of string by indexing                                               |

![lea vs offset image](https://github.com/mypherhistamine/ALP-Programs/blob/main/images/offset_vs_lea.png)

---




