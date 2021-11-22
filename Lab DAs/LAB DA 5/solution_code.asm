;initializing the 8255 ic
mov al , 80h 
mov 0ffh , al

mov al , 33h  ;0011 0011 -> initial value

clockwise:
    out 0fch , al
    ;call delay 
    ror al , 01h
    cmp al , 33h ;compare value in al with 33h , 33h is the initial winding value  
    je anti_clockwise    
    jmp clockwise        
    
anti_clockwise:
    out 0fch , al 
    ;call delay 
    rol al , 01h
    cmp al , 33h
    je clockwise
    jmp anti_clockwise    
       
delay:
    ;delay subroutine 
                

    ret
    