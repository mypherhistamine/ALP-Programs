data segment
    
    num_arr db 01h , 02h , 03h 
    sum_var db 2 dup(0)
    avg db 2 dup(0)
    
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
    
    ;stored in sum variabel
    mov sum_var , al
    
    ;divide to get the result the result will be stored in the al register      
    
    
    mov bh , 03h
    div bh ;stored in al
    
    mov avg , al    
    
    
    
    
    code ends
end life