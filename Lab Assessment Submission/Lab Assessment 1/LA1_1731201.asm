; ADD 3 integers using only AX register and save the value in AX register

org 100h

MOV AX, 00
ADD AX, 05
ADD AX, 09
ADD AX, 03

ret