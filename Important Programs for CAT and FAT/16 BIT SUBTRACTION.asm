;16 bit subtraction 

data segment 
    
    num1 dw 1234h
    num2 dw 0F234h 
    
    data ends


code segment 
    
    assume cs:code , ds:data
    
    start:
        mov ax , data
        mov ds , ax
        
        
        mov ax , 1234h
        mov bx , f234h
        
           
        
        ;adc           
        
        sub ax , bx
        
        
        
        
        
        code ends 
end start


