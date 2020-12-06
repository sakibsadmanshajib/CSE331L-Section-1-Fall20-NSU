.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB ?
    NUM2 DB ?
    PROMPT1 DB 10,13,"Enter a Number1: $"
    PROMPT2 DB 10,13,"Enter a Number2: $"
    RESULT DB 10,13,"Smallest One: $"

.CODE

MAIN PROC
    MOV AX, DATA
    MOV DS, AX
    
    LEA DX, PROMPT1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV NUM1, AL
    
    LEA DX, PROMPT2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV NUM2, AL
    
    LEA DX, RESULT
    MOV AH, 9
    INT 21H
    
    MOV AL, NUM1
    CMP AL, NUM2
    JG SECOND
    
    FIRST PROC
        MOV AH, 2
        MOV DL, NUM1
        INT 21H
        JMP EXIT
    SECOND PROC
        MOV AH, 2
        MOV DL, NUM2
        INT 21H
    EXIT PROC
        MOV AH, 4CH
        INT 21H
    
ENDS
END MAIN