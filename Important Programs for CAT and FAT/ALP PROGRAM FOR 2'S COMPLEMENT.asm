;ALP PROGRAM TO FIND 2'S COMPLEMENT OF A NUMBER 

DATA SEGMENT
    
    DATA1 DB 19H , 0BCH , 0E2H , 00H , 88H    ;8 -BIT DATA
    DATA2 DW 19BCH , 0E208H , 0008H ;16-BIT DATA
    
    8_BIT_RESULT DB 5 DUP(0) 
    16_BIT_RESULT DW 3 DUP(0) 
    
    
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE , DS:DATA
    
    START:
        MOV AX , DATA
        MOV DS , AX
        
        MOV CX , 05H
        MOV SI , 0000H
        EIGHT:
            MOV AH , DATA1 + SI
            ;FIRST TAKE 1'S COMPLEMENT
            NOT AH
            ;THEN ADD 1 IN IT 
            INC AH  
            
            MOV 8_BIT_RESULT + SI , AH
            INC SI
            LOOP EIGHT
        
        
        ;RESET SI REGISTER
        MOV SI , 0000H
        MOV CX , 05H
        
        SIXTEEN:
            MOV AX , DATA2+SI 
            NOT AX
            ;THEN ADD 1 IN IT 
            INC AX  
            
            MOV 16_BIT_RESULT + SI , AX
            INC SI
            
            LOOP SIXTEEN
            
            
        CODE ENDS
END START