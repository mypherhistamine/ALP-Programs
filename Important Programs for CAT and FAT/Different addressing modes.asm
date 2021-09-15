data segment
    start db 69h
data ends

code segment 
    assume cs:code , ds:data
    
    start:

    mov ax , [0700h] ;direct addressing mode 
    mov al ,ds:start ;direct addressing mode



    mov ax , bx ; register mode
    
    mov ax , [bx] ;register indirect



code ends
end start