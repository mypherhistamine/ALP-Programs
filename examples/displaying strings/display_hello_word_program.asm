;Using offset to print Hello 

DATA SEGMENT
    STR1 DB "HELLO WORLD $"
ENDS                     

; $ - STRING TERMINATOR
CODE SEGMENT
START: 

;TO PROPERLY LOAD VARIABLES FROM DATA SEGMENT TO CODE SEGMENT
MOV AX , @DATA
MOV DS , AX  ;WILL LOAD VARIABLES FROM DATA SEGMENT TO CODE SEGMENT 
            
      
MOV DL, OFFSET STR1 ;MOVE BEGINNING ADDRESS OF STR1 THE ADDRESS OF `H` WHERE IT'S STORED WILL BE STORED IN D1

;call the interrupt for printing the string 
MOV AH , 09H   ;STRING DISPLAY SUB-ROUTINE(09H) 
INT 21H        ; INT -----> INTERRUPT
               ; 21H -----> DOS INTERRUPT


;AH = 4C is the interrupt to exit the DOS program properly
MOV AH, 4CH ;EXIT. IT'S USED TO TERIMATE THE PROGRAM AND IT RETURN THE CONTROL TO DOS
INT 21H
;4C GOES IN AH AND 00 GOES IN AL


ENDS
END START


   
   
   

