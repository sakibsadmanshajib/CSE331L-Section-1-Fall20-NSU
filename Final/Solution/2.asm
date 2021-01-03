.MODEL SMALL
.STACK 100H

.DATA
    NWLN DB 10, 13, "$"
    PROMPT_1 DB "Number in HEX: $"
    PROMPT_2 DB "Number in Binary: $"

.CODE
    MOV AX, @DATA
    MOV DS, AX

    XOR BX, BX
    MOV CL, 4

    MOV AH, 1
    INT 21H

    INPUT1:
          CMP AL,0DH   
          JE LINE1    
         
          CMP AL,39h  
          JG LETTER1
          
          AND AL,0FH   
          JMP SHIFT1
          
      LETTER1:         
          SUB AL,37H
       
      SHIFT1:
          SHL BX,CL   
          OR  BL,AL
          
          INT 21h
          JMP INPUT1
      LINE1:
          LEA DX, NWLN
          MOV AH,9
          INT 21h
          
          XOR DX,DX
          
          MOV AH,1
          INT 21h


MOV BL, AL
MOV CX, 8
PRINT: 
MOV AH, 2 
       MOV DL, '0'
       TEST BL, 10000000B 
       JZ ZERO
       MOV DL, '1'
ZERO:  
INT 21H
       SHL BL, 1
LOOP PRINT

MOV DL, 'B'
INT 21H



MOV AH, 0
INT 16H

RET