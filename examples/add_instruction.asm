;Write an assembly program to add numbers using registers. 
; Suppose ax = 44 and bx = 12

mov ax,44h
mov bx,12h

add ax,bx
;result will be stored in dx:ax register that is dx:ax = ax + bx       

;Write a program to add two numbers using registers and store the final 
;result in dx register 
;let ax = 44 and bx = 12

mov ax,44h
mov bx,12h
add ax,bx ;add both registers
mov dx,ax ;store result of ax into dx register     


;Write a program to add two numbers using registers and store the final 
;result in res variable
;let ax = 44 and bx = 12

;we are using a 16-bit register that's why using word and not byte

res dw ?
mov res , dx   
hlt