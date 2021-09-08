;16-bit addition

data segment
    num dw 1234h , 4234h
    sum dw 2 dup(0) 
data ends

code segment
    assume cs:code , ds:data
    
    start:
        mov ax , data
        mov ds , ax
           
          
        lea bx , num   
        mov ax , num
        add ax , num + 2
        
        
         
        ;if carry is there cf = 1
        jnc not_carry
        ;carry statement
        mov sum+2 , 01h
        
        
        not_carry: 
        mov sum , ax
        
        lea bx , sum  
        
        code ends
end start