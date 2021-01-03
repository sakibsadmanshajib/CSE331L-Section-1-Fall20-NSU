ORG 100H

.MODEL SMALL
.DATA

PROMPT DB 10, 13,"Enter the Range: $"
NXTLN DB 10, 13, "$"
FIB DB 20 DUP("$")
  
.CODE

MAIN PROC
;LOAD DS
MOV AX, @DATA
MOV DS, AX
LEA SI, FIB 
MOV DX,OFFSET PROMPT
MOV AH, 09H 
INT 21H   
MOV AH,01H
INT 21H
SUB AL, 30H
MOV CL, AL
MOV AL, 30H
MOV BL, 31H
MOV [SI], AL 
INC SI
MOV [SI], BL
INC SI
SUB CL, 02H 
L1: 
ADD AL, BL 
SUB AL, 30H   
MOV [SI], AL
MOV AL,BL 
MOV BL, [SI] 
INC SI 
LOOP L1 
MOV DX,OFFSET NXTLN
MOV AH, 09H 
INT 21H
MOV DX,OFFSET FIB
MOV AH, 09H 
INT 21H
MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN

RET