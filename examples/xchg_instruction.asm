;Problem
;Write an assembly level program to swap two numbers ? 
;Suppose before swap
; al = 10100101 and bl = 11111010 

;then after swap
    ;al = 11111010
    ;bl = 10100101

;Solving by the xchg instruction
mov al , 10100101b
mov bl , 11111010b              

;swap the values from both the registers    

;xchg al , bl 
                           
;Write an assembly level program to swap two numbers without xchg ?
;Solving by the mov instruction by using a third variable
    
;store the value of bl in  register cl    
mov cl,bl;
;store al value in bl register
mov bl,al

;store cl's value in al register
mov al,cl;
hlt; 

