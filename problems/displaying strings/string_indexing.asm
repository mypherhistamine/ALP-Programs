data segment
st db "Hello World $" 
newline db 13,10,'$' ;to display new line
    
ends                    

stack segment
    dw 128 dup(0) 
ends

code segment

start:

mov ax , @data
mov ds , ax
                                                
mov dl , offset  st + 2
mov ah , 09h ;printing sub-routine
int 21h

;show a new line
lea dx , newline
int 21h

;show the new string using lea and indexing
lea dx , st + 2
int 21h



;exit program                                  
mov ah , 4ch
int 21h
             
             
end start        
ends

