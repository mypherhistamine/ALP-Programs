DATA SEGMENT                     
    ;32 BIT DATA  FROM LEFT TO RIGHT
    DATA3 DD 19BCE208H
    ;32 BIT DATA FROM RIGHT TO LEFT
    DATA4 DD 802ECB91H
    RESULT DW 4 DUP(0)
    RESULT2 DW 4 DUP(0)
    LOWER_CARRY DW 0000H
    HIGHER_CARRY DW 0000H
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE , DS:DATA
    START:
        MOV AX , DATA
        MOV DS ,AX
        MOV AX , DATA3 ;LOADS LOWER 16 BITS  OF DATA3 - THAT IS E208H
        MOV BX , DATA4 ; LOADS LOWER 16 BITS OF DATA4 - THAT IS CB91H
        MUL BX
        ;STORE LOWER 16-BIT RESULT 
        MOV RESULT , AX
        LEA SI , LOWER_CARRY
        MOV [SI] , DX
        MOV AX , DATA3 + 2
        MUL BX
        ;ADD LOWER CARRY WITH THE RESULT IN AX
        ADD AX , LOWER_CARRY
        JNC NOT_CARRY:
        INC DX ;IF THERE IS ANY CARRY
        NOT_CARRY:
        MOV RESULT+2 , AX
        MOV RESULT+4 , DX
        MOV AX , DATA3 ;LOADS E208H
        MOV BX , DATA4+2 ;LOADS 802E
        MUL BX
        MOV RESULT2 , AX 
        MOV HIGHER_CARRY , DX
        MOV AX , DATA3+2
        MUL BX
        ADD AX , HIGHER_CARRY
        JNC NOT_CARRY_TWO:
        INC DX     
        NOT_CARRY_TWO:
        MOV RESULT2+2 , AX
        MOV RESULT2+4 , DX
        ;SUM UP THE RESULTS
        MOV AX , RESULT+2; LOADS 5B38H
        MOV BX , RESULT2 ;LOADS 9270H
        ADD AX , BX
        JNC NO_CARRY3:
        INC RESULT+4 ;IF THERE IS ANY CARRY
        NO_CARRY3:
        MOV RESULT+2 , AX 
        MOV AX , RESULT+4    ;LOADS 1477H
        MOV BX , RESULT2+2   ;LOADS 10F4H
        ADD AX , BX
        JNC NO_CARRY4:
        INC RESULT+6 ;IF THERE IS A CARRY
        NO_CARRY4:
        MOV RESULT+4 , AX 
        MOV AX , RESULT2+4
        ADD RESULT+6 , AX                
    CODE ENDS
END START