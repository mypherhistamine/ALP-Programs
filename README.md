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

1. [Rules for storing data](https://github.com/mypherhistamine/ALP-Programs/new/main?readme=1#1-rules-for-storing-data)
2. Data types in 8086 assembly language 
3. Variable declaration and it's initialization

### 1) Rules for Storing data 

We can store data in : 
- [Decimal](https://github.com/mypherhistamine/ALP-Programs/new/main?readme=1#decimal)
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




### 2) Variable declaration and it's initialization 

Syntax: 
```assembly [variable_name] [data_type] [value]```

For example 

```assembly 
Age db 15
FirstNm db "Rishabh $"
Subject db 'Assembly $'
Section db 'V' 
```



