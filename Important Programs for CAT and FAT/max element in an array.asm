data segment
    ;num_arr db 19h , 0BCh , 0E2h  , 08h , 08h
    num_arr db 19h , 0EAh , 00h  , 08h , 08h
    max db ? 
    ans db ?   
    
    message db "The largest number from the array is" ,10 , 13 , 10 , "$"
        
data ends

code segment
    assume cs:code , ds:data
    start:
    mov ax , data 
    mov ds , ax
    mov ax , 0000h ;clear ax register to store the sum
    mov cl , 05h   
    lea si , num_arr ;store offset of num_arr
    mov dh , 00h ;assume this is max element
    loop_elements:
    mov bh , [si] ;store arr[i]
    mov ah , dh
    sub ah , bh ; do the subtraction so if 2-3 - negative so carry generated
    jnc not_carry  
    ;swap the elements as a[i] > max
    mov dh , bh
    not_carry: 
        inc si
    loop loop_elements ;traverse array
    ;max element will be in dh register
            
;store max in bh as we will need dx register             
mov bh , dh 
    
lea dx , message 
mov ah , 09h 
int 21h

;If value comes like E2 then splitting it like this -> 0E and 02      
mov dx , 0000h
mov dl , bh
and dl , 0Fh

mov dh , bh 
and dh , 0F0h
;rotate 
ror dh , 04h

;check if alphabet or numeric

mov bh , dh 
sub bh , 0Ah

jnc alphabet

add dh , 07h


alphabet:

    add dl , 30h
    add dl , 30h

mov ans , dh
mov ans + 1 , dl
mov ans + 2 , 24h

lea dx , ans
mov ah , 09h
int 21h



    
    code ends
end start