org 100h

Arr DB 10

MOV BX,OFFSET Arr
MOV [BX],1H
MOV [BX+1],1H   

MOV DI,2
MOV SI,0H
MOV CX,8   

L1:  

    MOV DX,[BX+SI]
    INC SI
    ADD DX,[BX+SI]  
    MOV [BX+DI],DX 
    INC DI
LOOP L1


ret