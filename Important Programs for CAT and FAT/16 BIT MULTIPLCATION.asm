;16-bit unsigned numbers multiplcation 
; result = 014B5A90
data segment
    
    num dw 1234h , 1234h 
    prod dw 2 dup(0h)
    
    
    data ends
        
    
    
code segment
    
    assume cs:code , ds:data
    
    start:
        mov ax , data
        mov ds , ax
        
        lea si , num                           
        
        mov ax , [si]
        mov bx , [si+2]
        
        mul bx  ;perform the multiplcation
        
        
        mov prod  , ax ;32 bit product stored in DX-AX register 
        
        mov prod+2 , dx
        
        mov ah , 4ch ; exit program ke liye 
        int 21h         
        
code ends
end start