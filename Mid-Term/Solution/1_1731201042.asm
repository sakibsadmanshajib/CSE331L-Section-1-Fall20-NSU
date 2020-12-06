.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB ?
    NUM2 DB ?
    RES DB ?
    PROMPT1 DB 10,13,"Enter Integer 1: $"
    PROMPT2 DB 10,13,"Enter Integer 2: $"
    RESULT DB 10,13,"MUL of the Integer: $"

.CODE

MAIN PROC
    MOV AX, DATA
    MOV DS, AX
    
    LEA DX, PROMPT1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    SUB AL,30H
    MOV NUM1, AL
    
    LEA DX, PROMPT2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    SUB AL,30H
    MOV NUM2, AL
    
    MUL NUM1
    MOV RES,AL
    AAM    
    ADD AH,30H
    ADD AL,30H
    MOV BX,AX

    LEA DX, RESULT
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV AH, 4CH
    INT 21H
    
ENDS
END MAIN