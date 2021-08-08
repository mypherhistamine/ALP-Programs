data segment
    str1 db "Enter a character you like : $"
    newline db 10 , 13 , '$'
ends                        

code segment

start: 
      
mov ax , @data
mov ds , ax
      
mov ah , 09h    ; String display sub-routine
      
     
lea dx , str1
int 21h

lea dx , newline
int 21h             ; DOS interrupt
                 
; by default the character input will be stored in the AL register                 
mov ah , 01h    ; character input with echo
int 21h 

;similarily for character input without echo simply: 

;mov ah, 08h







mov ah , 4ch      ;exit() program
int 21h
end start    
    
ends

              