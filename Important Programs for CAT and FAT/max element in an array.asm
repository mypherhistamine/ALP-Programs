data segment
    
    num_arr db 01h , 02h , 03h  , 02h , 04h
    
    max db ?
    
    data ends


code segment
    assume cs:code , ds:data
    
    life:
    
    mov ax , data 
    mov ds , ax
    
    mov ax , 0000h ;clear ax register to store the sum
    mov cl , 05h
    
    lea si , num_arr ;store offset of num_arr
    
    mov dh , 00h ;assume this is max element
    
    
    loop_elements:
        
    mov bh , [si] ;store arr[i]
    
    sub dh , bh ; do the subtraction so if 2-3 - negative so carry generated
    
    jnc not_carry  
    
    ;swap the elements as a[i] > max
    mov dh , bh
    
    not_carry:
    
        inc si
    
    
    
    
    
    
    
    
    loop loop_elements ;traverse array
    
    ;max element will be in dh register
    
    
    
    
    
    
    
    code ends
end life