;Write a program to add 1-5 numbers using registers and store the final result 
;in di register



data segment
ends


code segment
start:

mov ax,1h
mov bx,2h
mov cx,3h
mov dx,4h
mov di,5h

add ax,bx ;ax = ax+bx
add ax,cx ; ax = ax + cx
add ax,dx ; ax = ax + dx
add ax,di ; ax = di 

hlt             
;;this is just for an example             
;add bx,ax ; bx = bx + ax
;hlt

    