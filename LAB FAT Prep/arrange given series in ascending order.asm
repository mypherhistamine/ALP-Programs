DATA SEGMENT
  ARR1 DB 8,2,7,4,3    
  TEMP DW 2 DUP(0)
  
DATA ENDS
CODE SEGMENT
  ASSUME CS:CODE, DS:DATA
  START:
    MOV AX, DATA
    MOV DS, AX  
    
    SORT: 
        
 




FIND_MAX:
    ;AX -> REMAINING ARRAY OFFSET
    ;BX -> MAX VALUE MEMORY OFFSET TO BE RETURNED 
    ;CX -> ARRAY SIZE
    ;DX -> REMAINING LOOPING 
    
    MOV DX , CX  ; 5 STORED
    MOV BX , AX  ; CURR OFFSET
    MOV SI , AX  ; 
    
     
    FINDER:
    
    
    
    
    
    
    
    
    
    
    DEC DX
    JNZ 
        
    
    
    
                                                   
                                                   


       
       
    EXIT:
       MOV AX, 4C00H
       INT 21H
CODE ENDS
END START
