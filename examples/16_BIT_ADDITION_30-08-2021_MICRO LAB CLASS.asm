data segment
    num dw 1234h , 0e231h
    sum dw 2 dup(0) ;there are 4 mem locations
data ends

code segment
    assume cs:code , ds:data
    start:                  
    mov ax , data
    mov ds , ax
    
    mov ax , num
    mov bx , 0h
    
    add ax , num+2 ;result may generate a carry
    
    jnc down ;branch to the loop if there is no any carry
    ;it checks the flag register  
    inc bx ;if carry is generated  
    ;if there is a carry then jnc will not be called and bx will be incremented 
    
    
down:             
    mov sum , ax ;storing the sum value
    
    mov sum+2 , bx ;storing the carry value
    mov ah , 4ch
    int 21h
                                  
code ends
end start
