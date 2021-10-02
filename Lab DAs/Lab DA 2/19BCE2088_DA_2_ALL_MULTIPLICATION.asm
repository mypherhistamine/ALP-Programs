DATA SEGMENT                     
    
    ;8 BIT DATA
    DATA1 DB 19H , 0BCH , 0E2H , 00H , 88H
    ;16 BIT DATA
    DATA2 DW 19BCH , 0E208H , 0008H  ;19BCE2088 
    
    ;32 BIT DATA  FROM LEFT TO RIGHT
    DATA3 DD C9BCE208H              
    
    ;32 BIT DATA FROM RIGHT TO LEFT
    DATA4 DD 802ECB91H
    
    RESULT DW 3 DUP(0)
   
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE , DS:DATA
     
    START:
        MOV AX , DATA
        MOV DS ,AX
        
        MOV AX , 0000H ;CLEAR AX REGISTER
        
        ;8-BIT MULTIPLICATION
        MOV AL , DATA1
        MUL DATA1+1  ;19H * 0BCH = 125CH
        
        ;16-BIT MULTIPLICATION
        MOV AX , DATA2
        MUL DATA2+2 ; 19BCH * E208H = 16B8 C5E0H 
        
        
        ;32-BIT MULTIPLCATION 
        
    CODE ENDS
END START