org 100h

A DW 1,1,2,2,3,3

B DW 6 DUP(?)

MOV AX, OFFSET A
MOV BX, OFFSET B
MOV [BX], [AX]
MOV [BX+1], [AX+1]
MOV [BX+2], [AX+2]
MOV [BX+3], [AX+3]
MOV [BX+4], [AX+4]
MOV [BX+5], [AX+5]

ret