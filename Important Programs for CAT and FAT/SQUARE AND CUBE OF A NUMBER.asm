;ALP PROGRAM FOR SQUARE AND CUBE OF A GIVEN NUMBER 

DATA SEGMENT
    
    DATA1 DB 19H , 0BCH , 0E2H , 00H , 88H
    DATA2 DW 19BCH , 0E208H , 0008H 
    
    
    DATA ENDS


CODE SEGMENT
    
    ASSUME CS:CODE , DS:DATA
    
    
    START:
        MOV AX , DATA
        MOV DS , AX
        
        
        
        
        
        CODE ENDS
END START