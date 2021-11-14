Data Segment
  str1 db 'MADAM','$'  
  strlen1 dw $-str1
  strrev db 20 dup(' ')
  str_palin db 'String is Palindrome.','$'
  str_not_palin db 'String is not Palindrome.','$'
Data Ends

Code Segment
  Assume cs:code, ds:data

  Begin:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov cx, strlen1
    add cx, -2

    lea si, str1
    lea di, strrev

    add si, strlen1
    add si, -2
    L1:
       mov al, [si]
       mov [di], al
       dec si
       inc di
       loop L1
       mov al, [si]
       mov [di], al
       inc di
       mov dl, '$'
       mov [di], dl
       mov cx, strlen1

    Palin_Check:
       lea si, str1
       lea di, strrev
       repe cmpsb
       jne Not_Palin

    Palin:
       mov ah, 09h
       lea dx, str_palin
       int 21h
       jmp Exit

    Not_Palin:
       mov ah, 09h
       lea dx, str_not_palin
       int 21h

    Exit:
       mov ax, 4c00h
       int 21h
Code Ends
End Begin