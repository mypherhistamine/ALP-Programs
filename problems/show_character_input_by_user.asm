data segment
     mssg db "Enter a character to display$"  
     stringInputted db "You entered $"
     newline db 13,10,'$'
     
     CR EQU 13 ;constant variable of carriage return cr - moves cursor to beginning     
     LF EQU 10 ;LF - line feed
ends                     

code segment

start: 
mov ax , @data
mov ds , ax


lea dx , mssg
mov ah , 09h ; show input string message 
int 21h      

;show new_line
lea dx , newline
int 21h


mov ah , 01h ;take input without echo , stored in al by-default
int 21h
;whenever calling a dos interrupt the al value changes
mov bh , al ;so store the value input by user in another register


mov ah , 09h  ;display strings

lea dx , newline
int 21h

lea dx , stringInputted
int 21h 



;display the required string
;first move the value to the data register 
;as the 09h sub-routine will display the data present in dx register
mov dl , bh
mov ah , 02h    ; character display
int 21h
                                                           
;end program       
mov ah , 4ch
int 21h 

end start     
ends