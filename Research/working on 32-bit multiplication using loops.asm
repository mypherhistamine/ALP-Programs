;32-bit multiplication of two numbers
;for this we will be using an outer and inner loop




;how to make inner loop

mov ax , 0710h
mov ds , ax


mov ch , 0ffh ;outer loop
mov cl , 0ffh ;inner loop
mov bh , 00h ;for outer loop
mov bl , 00h ;for inner loop


mov ax , 0000h
mov ah , 00h


o_loop:
    
    
    inc bh    
    mov cl , 0ffh

i_loop:
  
   inc bl  
   add ax , 0ffh
   mov [500h] , ax
   
   jnc not_carry:
    
   inc [502h] 
   ;if carry generates
   
   
   
    
   not_carry: dec cl
   jnz i_loop

   
   
   
   dec ch 
   jnz o_loop
   



      
  
    

     
   
        
        