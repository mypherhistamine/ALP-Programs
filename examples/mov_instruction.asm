mov ax,30; here we are storing 30 as a decimal value but it will be stored as a hexadecimal value in the register

mov bx,30h; storing in hexadecimal format itself

;mov ax,F1ACh - this will generate an error as we have to start with a digit
mov ax,0F1ACh;

mov ax,-123
mov bh , 01000b ;putting b at end is necessary for binary values
mov bx , 4c00h

;put value on some address 
;this will store value of bx on the address 1234h
mov 1234h,bx;
      
;put character data 
mov cx,'B' ;B has ASCII value 66  or 44h
mov dx ,66 ;same 66 decimal value of B
mov bx, 'AB' ;will be stored as A - hex and B - hex (on higher and lower ) 

;suppose moving value at cl move to al
mov al,cl;


;use ctrl + q to comment a block of code

hlt;



    