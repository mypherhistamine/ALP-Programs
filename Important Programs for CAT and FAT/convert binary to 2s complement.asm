Data Segment
  num db 00000010B
  ans db ?
  
Data Ends
Code Segment
  Assume cs:code, ds:data
  Begin:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov ah, 0000h
    mov al, num
    NOT al
    mov bl, al
    adc al, 00000001B
    mov bl, al
    
    mov ans , bl   
    
  Exit:
    mov ax, 4c00h
    int 21h
Code Ends
End Begin

; Example
; Approach 
; not and then +1
