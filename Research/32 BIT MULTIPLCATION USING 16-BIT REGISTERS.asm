data segment
    
    data1 dw 1234h , 4321h
    data2 dw 6969h , 7575h 
    
    data ends


code segment 
    assume cs:code , ds:data
    
    start: mov ax , data
            mov ds , ax
         
         mov ax , 0h   
         
         mov ax , data1
         mul data2 
         
         
         
         
         
         
         
         
         
         
         
         ;exit program
       ;  
;         mov ah , 4ch
;         int 21h
;            
            code ends
end start