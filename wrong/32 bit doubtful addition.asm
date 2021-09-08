;32 bit addition

data segment 
    num1 dw 1234h , 4568h 
    num2 dw 6970h , 7048h
    
    result dw 3 dup(0)
    data ends

code segment
    assume cs:code, ds:data
    
    start:
        mov ax , data
        mov ds , ax
        
        
         
        
        mov ax , num1 + 2    ; 1234 store in ax
        mov bx , num2 + 2   ; 6969 store in bx
        
        add ax , bx
        ;store lower result in result
        mov result , ax
              
        
        ;if carry flag is one (carry was there) 
        ;load higher bytes in ax and bx
        mov ax , num1
        mov bx , num2
        adc ax , bx ;add with carry
        
        
        ;ab if there is carry in higher byte
        
        jnc not_carry: 
        
        mov result + 4 , 01h ;give the carry
        
        not_carry: 
        mov result + 2 , ax
        
code ends
end start
                            
        
                                    
        
        