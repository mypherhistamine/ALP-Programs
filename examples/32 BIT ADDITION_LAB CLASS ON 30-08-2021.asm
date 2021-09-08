data segment
    num1 dw 0ffffh , 0ffffh
    num2 dw 1111h , 1111h
    sum dw 4 dup(0)
data ends
            
;what is happening is 

;sum0 - 8 bits
;sum1 - 8 bits
;sum2 - 8 bits
;sum3 - 8 bits
;Total 32 bits

;then to store the carry 
;sum+4             
            
code segment
    assume cs:code , ds:data
    start:
    mov ax , data
    mov ds , ax
    
    mov ax , num1 ;move lsb of num1 to ax [al = sum0 and ah = sum1 ]
    
    add ax , num2 ;add lsb of num2 to ax
    
    mov sum , ax ; store the lsb in sum
    
    mov ax , num1+2 ;move msb of num1 to ax
    adc ax , num2 +2 ; add with carry  msb of num2 to ax
    ;adc will check if there was any carry generated 
    
    
    jnc down ;check for carry
    mov sum+4 , 01h ;store the carry of msb bits if there is any carry
    
   
    
    down:
    
    mov sum+2 , ax
    
    
    
    mov ah , 4ch
    int 21h
    
    
    
    


code ends
end start