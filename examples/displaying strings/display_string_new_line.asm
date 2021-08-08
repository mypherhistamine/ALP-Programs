; First print the first string
; then move the cursor to the next line using 0ah or 10
; then move cursor to beginning using 0dh or 13

               
data segment
    str1 db "Name : Rishabh Mishra " , 13 , 10 , '$' ;this will move the cursor and concatenate with string terminator 
;the ascii val for $ is 24h that can also be used to terminate strings 
    regNo db "19BCEXXXX$"
    regNo2 db "19BCExxxx" , 24h ; this is also valid 
    
ends

;13 -----> move cursor to the beginning
;10 -----> move cursor to next row
        
;for example in C++
; cout<<"Rishabh Mishra$";
; cout<<endl<<"REg No$";
code segment
    
start: 

mov ax , @data
mov ds , ax

lea dx , str1   ;move begginning address of var name and it also points at that memory location
mov ah , 09h    ; string display sub-routine                                                                                
int 21h         ; dos interrupt
                               
lea dx , regNo       
int 21h                                       
    

mov ah , 4ch
int 21h ;sub-routine to end the program execution and return from DOS
   
    
ends
end start