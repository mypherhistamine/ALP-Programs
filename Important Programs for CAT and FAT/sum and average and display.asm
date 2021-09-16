data segment 
    message db 13 , 10 , "The average of the numbers are - " ,24h
    sum_show db 13 , 10 , "The sum of the numbers are" , 24h                                                  
    num_arr db 52h , 13h , 12h , 23h , 1Ah , 2bh     
data ends
code segment
    assume cs:code , ds:data    
    life:
    mov ax , data 
    mov ds , ax
    mov ax , 0000h ;clear ax register to store the sum
    mov cl , 06h
    lea si , num_arr ;store offset of num_arr
    sum:
        add al , [si] ;sum and store result in ax register
        inc si
    loop sum ;loop the sum 
    ;divide to get the result the result will be stored in the al register    
    mov bh , 06h
    div bh  ; al / bl => al - qo , ah - remainder           
    mov cl , 0ffh
    mov bl , al
    
    tens:
         inc cl 
         sub bl , 0ah;
         jnc tens     
     add bl , 0ah       
     lea dx , message 
     mov ah , 09h
     int 21h
     add cl , 48
     add bl , 48 
     mov [500h] , cl
     mov [501h] , bl
     mov [502h] , 24h ;terminate string     
     lea dx , [500h]
     mov ah , 09h
     int 21h  
    code ends
end life