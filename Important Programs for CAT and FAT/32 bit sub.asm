;32 bit subtraction 

data segment
    num1 dw 1024h , 2048h  ; 2048 1024
    num2 dw 6969h , 0ffffh ; ffff 6969
    result dw 2 dup(200h)
    data ends


code segment 
    
    assume cs:code , ds:data
    
    start:
       mov ax , data
       mov ds , ax
       
       lea si , num1
       lea di , num2
       
       mov ax , [si]
       mov bx , [di]
       
       sub ax , bx
       mov result , ax
       
       mov ax , [si+2]
       mov bx , [di+2]
       
       sbb ax , bx
       
       mov result+2 , ax
       
       mov ah , 4ch 
       int 21h
       
       
       
        code ends
end start