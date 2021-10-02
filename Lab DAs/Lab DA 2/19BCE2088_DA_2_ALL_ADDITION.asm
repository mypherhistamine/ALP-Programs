DATA SEGMENT                     
    
    ;8 BIT DATA
    DATA1 DB 19H , 0BCH , 0E2H , 00H , 88H
    ;16 BIT DATA
    DATA2 DW 19BCH , 0E208H , 0008H  ;19BCE2088 
    
    ;32 BIT DATA  FROM LEFT TO RIGHT
    DATA3 DD C9BCE208H              
    
    ;32 BIT DATA FROM RIGHT TO LEFT
    DATA4 DD 802ECB91H
    
    EIGHT_BIT_RESULT DB ? 
    
    RESULT DW 3 DUP(0)
   
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE , DS:DATA
     
    START:
        MOV AX , DATA
        MOV DS ,AX
        
        ;CLEAR AX REGISTER
        MOV AX , 0000H 
        
        ;ADD INSTRUCTION
        
            ;8-BIT ADDITION
                MOV AL , DATA1  ;LOAD 19H INTO AL
                MOV BL , DATA1+1 
                ADD AL , BL ;ADDITION OF 19H + BCH  = D5H
                MOV EIGHT_BIT_RESULT , AL
                
            ;16-BIT ADDITION
                MOV AX , DATA2   ;LOADS 19BCH INTO AX 
                ADD AX , DATA2 + 2 ;ADDITION OF 19BCH + E208H = FBC4
                MOV RESULT , AX
                ;DIRECT 32-BIT ADDITION IS NOT ALLOWED IN 8086 UP , HOWEVER THERE IS A WORKAROUND
                ;BY LOSER BYTE AND HIGHER BYTE ADDITION
                ;CONSIDERING THE RIGHT MOST DATA BITS TO BE THE LOWER BYTES THEREFORE 
                
                ;LOAD LOWER BYTE OF DATA3 INTO AX 
                MOV AX , DATA3
                
                ;LOAD LOWER BYTE OF DATA4 INTO AX 
                MOV BX , DATA4
                
                ;ADD BOTH LOWER BYTES
                
                ADD AX , BX ;RESU AX 
            
            ;32-BIT ADDITIONLT AX = AX + BX
                
                ;STORE RESULT OF LOWER BYTE ADDITION INTO DX REGISTER 
                MOV DX , AX
                 
                
                ;LOAD HIGHER BYTE OF DATA3 INTO AX 
                MOV AX , DATA3 + 2 
                
                ;LOAD HIGHER BYTE OF DATA4 INTO BX
                MOV BX , DATA4 + 2 
                      
                ;ADD WITH CARRY HIGHER BYTES 
                
                ADC AX , BX
                
                
                ;HANDLING THE CARRY IF GENERATED 
                 
                JNC FINAL_RESULT
                
                ;IF THERE IS A CARRY
                MOV RESULT+4 , 01H 
                
                FINAL_RESULT:  
                    MOV RESULT , DX
                    MOV RESULT+2 , AX
                
         
    
    CODE ENDS

END START