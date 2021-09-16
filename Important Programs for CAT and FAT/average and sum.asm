data segment
    
    num_arr db 01h , 02h , 03h
    
    data ends


code segment
    assume cs:code , ds:data
    
    life:
    
    mov ax , data 
    mov ds , ax
    
    mov ax , 0000h ;clear ax register to store the sum
    mov cl , 03h
    
    lea si , num_arr ;store offset of num_arr
    
    sum:
        
    add al , [si] ;sum and store result in ax register
    inc si
    loop sum ;loop the sum 
    
    ;divide to get the result the result will be stored in the al register
    
    mov bh , 03h
    div bh
    
    
    
    
    code ends
end life