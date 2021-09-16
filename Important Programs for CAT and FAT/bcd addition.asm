data segment
    
    num1 dw 10a3h
    num2 dw 0932h
data ends
;result 19d5

code segment
    
    assume cs:code , ds:data
    
    life:
    
    mov ax , data
    mov ds , ax
   
    
    mov ax , num1
    add ax , num2
    
    mov [500h] , ax
    
    
    ;19 , d5
    
    mov ch , 0ffh
    mov bx , ax
    mov ax , 0000h
    
    
    
    t_sand:
        inc ch 
        sub bx , 3e8h 
        jnc t_sand     
    add bx , 3e8h
    
     
    mov ah , 0ffh
     
     hundred:
       
        inc ah 
        sub bx , 64h 
        jnc hundred          
     add bx , 64h
     
     
     mov dh , 0ffh
     
     tens:
       
        inc dh 
        sub bx , 0Ah 
        jnc tens          
     add bx , 0Ah
     
     ;bx me unit's place bachega
     
     mov cl , 04h
     ror dh , cl 
     
     add dh , bl
     
     mov cl , 04h
     ror ch , cl
     
     add ch , ah 
        
    
    
    code ends
end life
    
    
