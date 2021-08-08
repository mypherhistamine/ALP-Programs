; Display this following shape in assembly 

; *
; **
; ***
; ****
; *****
; ******
   
; First approach   
data segment 
     str1 db "*$" 
     str2 db 13,10, "**$"
     str3 db 13,10, "***$"
     str4 db 13,10, "****$"
     str5 db 13,10, "*****$"
     
ends

code segment
    
start:

mov ax , @data
mov ds , ax

;set ah - 09h for printing subroutines 
mov ah , 09h
          
          
lea dx , str1
int 21h

lea dx , str2
int 21h

lea dx , str3
int 21h

lea dx , str4
int 21h

lea dx , str5
int 21h
    

;end the program by calling the sub-routine

mov ah , 4ch 
int 21h
  
ends
end start