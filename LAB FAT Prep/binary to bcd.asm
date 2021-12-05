DATA SEGMENT

    BIN DW  19BCH , 0E201H , 0003H    ;Binary -> Hexadecimal 
    BCD DW 6 DUP(0)                   ;BCD -> Decimal
    
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE , DS:DATA
    
    START:
    
    MOV AX , DATA
    MOV DS , AX
    
    MOV CL , 03H
    

         
    LEA SI , BIN     
    LEA DI , BCD  
    
                  
    AGAIN:                  
    
        MOV AX , [SI]
        MOV DX , 0FFFFH
        
        MOV BX , 0FFFFH
        
        
        TENTHOUSAND:
                INC DH 
                SUB AX , 2710H
                JNB TENTHOUSAND
                ADD AX , 2710H  
                                                                        
        
        THOUSAND: 
                INC DL 
                SUB AX , 3E8H
                JNB THOUSAND
                               
                ADD AX , 3E8H                                                                    
        
        HUNDRED:
                INC BH 
                SUB AX , 64H
                JNB HUNDRED
                
                ADD AX , 64H  
        

             
        TENS:
                INC BL 
                SUB AX , 000AH
                JNB TENS
                
                ADD AX , 000AH 
    
        
        ROR DL , 04H
        ROR BL , 04H 
         
        ADD BL , AL
        ADD DL , BH
        
         
        MOV [DI] , BL
        MOV [DI+1] , DL
        MOV [DI+2] , DH
 
        INC DI
        INC DI
        INC DI
        INC DI

        INC SI
        INC SI

    LOOP AGAIN
 
    MOV AH , 04CH
    INT 21H
    
    CODE ENDS
END START