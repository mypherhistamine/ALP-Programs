;using LEA in this code example

data segment
    str1 db "Rishabh Mishra $"
    str2 db "19bcexxxx $"     
ends

code segment
start:

mov ax , @data
mov ds , ax

;display first string             
mov dl , offset str1
mov ah , 09H
int 21h

;display second string

mov dl , offset str2
mov ah, 09h
int 21h 

mov ah , 4ch
int 21h

ends
end start
             
