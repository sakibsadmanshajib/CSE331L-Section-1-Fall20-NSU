org 100h

A DW 5 DUP(?)

MOV AX, OFFSET A
MOV [AX], 3
MOV [AX+1], 2
MOV [AX+2], 3
MOV [AX+3], 2
MOV [AX=4], 3

ret