.MODEL SMALL
.STACK 100H

.DATA
    PROMPT1 DB 10,13,"Digits: $"
    PROMPT2 DB 10,13,"Sum: $"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, PROMPT1
    MOV AH, 9
    INT 21H
    
    MOV CX, 10
    
    MOV AH, 2
    MOV DL, 48

    MOV BL, 0
    
@LOOP:
    ADD BL, DL
    SUB BL, 48
    INT 21H
    INC DL
    DEC CX
    
JNZ @LOOP

    LEA DX, PROMPT2
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN