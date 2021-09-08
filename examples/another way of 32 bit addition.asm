DATA SEGMENT
    NUM1 DW 12345678H
    NUM2 DW 12345678H
    
    SUM DW 3 DUP(0)
    
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE , DS:DATA
    
    START:
    MOV AX , DATA
    MOV DS , AX
    
    LEA SI , NUM1 ;SI POINTS TO LSB OF NUM1 
    LEA DI , NUM2 ;DI POINTS TO LSB OF NUM2
    
    MOV AX , [SI]
    ADD AX , [DI]
    
    MOV CX , [SI+2]
    ADC CX , [DI+2] 
         
    JNC DOWN ;CHECK FOR CARRY
    MOV SUM + 4 , 01H
    ;IT WILL CHECK THE CARRY FLAG        
    
    DOWN:
    
    MOV SUM   , AX ;STORE LSB RESULT IN SUM+0 
    MOV SUM+2 , CX ;STORE MSB RESULT IN SUM+2         
    
    MOV AH , 4CH
    INT 21H
    
    
         
         
    
    CODE ENDS
END START