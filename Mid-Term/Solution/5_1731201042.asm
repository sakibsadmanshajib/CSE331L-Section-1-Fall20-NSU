.MODEL SMALL
.STACK 100H

.DATA
    A DW 1,1,2,2,3,3
    B DW 6 DUP(?)
.CODE
MAIN PROC
    MOV BX, OFFSET B
    MOV [BX], A[0]
    MOV [BX+1], A[1]
    MOV [BX+2], A[2]
    MOV [BX+3], A[3]
    MOV [BX+4], A[4]
    MOV [BX+5], A[5]

CODE ENDS
END MAIN