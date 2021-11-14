;ALP PROGRAM FOR SQUARE AND CUBE OF A GIVEN NUMBER 

DATA SEGMENT
    
    DATA1 DB 19H , 0BCH , 0E2H , 00H , 88H
    DATA2 DW 19BCH , 0E208H , 0008H 
    
    ;THE RESULT OF 8-BIT MULTIPLCATION MAY BE 16-BIT RESULT  
    8_BIT_RES_SQR DW 5 DUP(0)
    
    8_BIT_RES_CUBE  DD 3 DUP(0)
    
    
    DATA ENDS


CODE SEGMENT
    
    ASSUME CS:CODE , DS:DATA
    
    
    START:
        MOV AX , DATA
        MOV DS , AX
        
        MOV CX , 05H
        MOV SI , 0000H 
        MOV DI , 0000H
         
        
        
        ;8-BIT SQUARE              
        EIGHT_SQR:              
            ;SQUARE OF 8-BIT NUMBERS 
            MOV AL , DATA1 + SI
            MUL DATA1 + SI
            ;STORE THE RESULT IN THE 8_BIT VARIABLE
            MOV  8_BIT_RES_SQR + DI , AX
            
            INC DI
            INC DI
            INC SI
            
            LOOP EIGHT_SQR
       
       
        ;8-BIT CUBE
        
        EIGHT_CUBE:              
            ;SQUARE OF 8-BIT NUMBERS 
            MOV AL , DATA1 + SI
            MUL DATA1 + SI
            ;STORE THE RESULT IN THE 8_BIT VARIABLE
            MOV  8_BIT_RES_CUBE + DI , AX
            
            INC DI
            INC DI
            INC SI
            
            LOOP EIGHT_CUBE 
        
        
        
        
        CODE ENDS
END START